#ifndef __PUBLISHER_H_
#define __PUBLISHER_H_

#include "transport_udp.h"
#include <string>
#include <map>
#include <vector>

#include <chrono>
#include <thread>

namespace pcs{

struct SubscribersInfo{
	std::string ipAddr;
	int port;
};
typedef SubscribersInfo Subscribersinfo;

template<typename T>
class Publisher{
public:
	Publisher();
	~Publisher()
	{
		delete[] sendBuff;
	}
	
	Publisher( const Publisher &obj ): addr_( obj.addr_ ),
					port_( obj.port_ ),
					transport( obj.transport )
	{
		memcpy( recvBuff, obj.recvBuff, 8 );
		memcpy( sendBuff, obj.sendBuff, sizeof( T ) + 1 );
	}

	Publisher& operator=( const Publisher &other )
	{
		if( this == &other )	return *this;
		
		addr_ = other.addr_;
		port_ = other.port_;
		transport = other.transport;
		memcpy( recvBuff, other.recvBuff, 8 );
                memcpy( sendBuff, other.sendBuff, sizeof( T ) + 1 );
	}

	void setSocketInfo( std::string addr, int port );
	
	void createAPublisher(  );

	void addSubscribersInfo();

	void publish( T &data );

	int getPublisherFd() const
	{
		return transport->getServerFd();
	}	

	void timerCircle();

private:
	void printSubscribersInfo();

private:
	Transport *transport;	

	std::string addr_;
	int port_;
	
	unsigned char recvBuff[8];
	unsigned char *sendBuff;

	int subscribersCount;
	int size;

private:
	static int fd;
	static std::vector<SubscribersInfo> destInfoMap;
	static std::vector<bool> recvEnable;
	static int recvNum;
	static std::vector<int> recvCount;

};

template<typename T>
int Publisher<T>::fd = -1;

template<typename T>
std::vector<SubscribersInfo> Publisher<T>::destInfoMap;

template<typename T>
std::vector<bool> Publisher<T>::recvEnable;

template<typename T>
int Publisher<T>::recvNum = 0;

template<typename T>
std::vector<int> Publisher<T>::recvCount;

template<typename T>
Publisher<T>::Publisher(): subscribersCount( 0 ), size( 0 )
{
	transport = new TransportUDP;
	size  = sizeof( T ) + 1;
	sendBuff = new unsigned char[ size ];
	memset( sendBuff, 0, size );

}

template<typename T>
void Publisher<T>::setSocketInfo( std::string addr, int port )
{
        addr_ = addr;
        port_ = port;
}

template<typename T>
void Publisher<T>::createAPublisher(  )
{
	
	if( !transport->initSocketServer( port_ ) ){
		exit(-1);
	}
	std::cout<<"------------------- Init A Publsher ---------------------"<<std::endl;
	
	fd = transport->getServerFd();
	while( 1 ){
		addSubscribersInfo();
	}
}

template<typename T>
void Publisher<T>::publish( T &data )
{
	//std::cout<<"publish ..."<<std::endl;
	memset( sendBuff, 0, size );
	memcpy( sendBuff, &data, sizeof( data ) ) ;
	for( auto it = destInfoMap.begin(); it != destInfoMap.end(); it ++ ){
		struct sockaddr_in destAddr;
		destAddr.sin_family = AF_INET;
		destAddr.sin_addr.s_addr = inet_addr( it->ipAddr.c_str() );
		destAddr.sin_port = htons( it->port );
	
		int ret = transport->write( transport->getServerFd(), sendBuff, sizeof( data ), destAddr );
		if( ret < 0 ){
			std::cerr<<"publish failed ..."<<ret<<std::endl;
		}
		else {
			std::cerr<<"published ..."<<ret<<std::endl;
			for( size_t i = 0; i < recvEnable.size() ; i ++ ){
				recvEnable[i] = true;
			}
		}
	}
	
}

template<typename T>
void Publisher<T>::addSubscribersInfo()
{
	//std::cout<<" fd =  "<<transport->getServerFd()<<std::endl;
	//int fd = transport->getServerFd();
	
	struct sockaddr_in addr;
        socklen_t addr_len;
	memset( &addr, 0, sizeof( addr ) );

        int ret = recvfrom( fd, recvBuff, sizeof(recvBuff), 0, ( struct sockaddr* )&addr, &addr_len );
        if( ret > 0 ){
	//	std::cout <<"recvfrom "<< inet_ntoa(addr.sin_addr) <<": "<< ntohs( addr.sin_port )<< recvBuff << std::endl;

		if( recvBuff[0] == 'a' && recvBuff[1] == 'b' && recvBuff[2] == 'c' && recvBuff[3] == 'd' ){

			std::string addr_ip = inet_ntoa( addr.sin_addr );
                        int addr_port = ntohs( addr.sin_port );
                        std::cout<<"subscribers["<<recvNum<<"] addr ip: "<<addr_ip<<std::endl;
                        std::cout<<"subscribers["<<recvNum<<"] addr port: "<<addr_port<<std::endl;
	
			SubscribersInfo sI;
			sI.ipAddr = addr_ip;
			sI.port = addr_port;
			destInfoMap.push_back( sI );
	
			recvNum ++; // subscribers number ++
                        recvEnable.resize( recvNum );
			recvCount.resize( recvNum );

			printSubscribersInfo();
		}
		// received response from the clients	
		if( recvBuff[0] == 'a' && recvBuff[1] == 'a' && recvBuff[2] == 'a' && recvBuff[3] == 'a' ){
			
			std::string addr_ip = inet_ntoa( addr.sin_addr );
                        int addr_port = ntohs( addr.sin_port );

			for( size_t i = 0; i < destInfoMap.size(); i ++ ){
				if( addr_port == destInfoMap[i].port && !addr_ip.compare( destInfoMap[i].ipAddr ) ){
					recvEnable[i] = false;
				}
			}
		}
        }
	else std::cout<<"receive failed ..."<<std::endl;
       
		
}

template<typename T>
void Publisher<T>::timerCircle()
{
	while( 1 ){
		std::this_thread::sleep_for( std::chrono::milliseconds( 1000  ) ) ;
		for( size_t i = 0; i < recvEnable.size(); i ++ ){
			if( recvEnable[i] == true ){
				recvCount[i] ++;
			}
			else recvCount[i] = 0;

			if( recvCount[i] > 3 ) {
				recvEnable.erase( recvEnable.begin() + i );
				recvCount.erase( recvCount.begin() + i );
				destInfoMap.erase( destInfoMap.begin() + i );
				recvNum --;
	
				printSubscribersInfo();
			}
		}
	}
}

template<typename T>
void Publisher<T>::printSubscribersInfo()
{
	std::cout<<"-------------Subscribers Information ---------------"<<std::endl;
	std::cout<<"recvNum = "<<recvNum<<std::endl;
	if( !destInfoMap.empty() ){
		for( size_t i = 0; i < destInfoMap.size(); i ++ ){
			std::cout<<"ip address["<<i<<"] = "<<destInfoMap[i].ipAddr<<std::endl;
			std::cout<<"ip port["<<i<<"] = "<<destInfoMap[i].port<<std::endl; 
			std::cout<<"------------------------------"<<std::endl;
		}
	}
	else {
		std::cout<<"There is not any subscribers now "<<std::endl;
	}
	std::cout<<"------------- End ------------- End ---------------"<<std::endl;
}


}

#endif










