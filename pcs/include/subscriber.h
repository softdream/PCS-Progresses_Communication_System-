#ifndef __SUBSCRIBER_H_
#define __SUBSCRIBER_H_

#include "transport_udp.h"
#include "IEvent.h"
#include "EpollEvent.h"
#include <unistd.h>
#include <functional>
#include <chrono>
#include <thread>

#define UDP_MAX_LENGHT 60000

namespace pcs{

template<typename T>
using CallBack = std::function<void( T )>;

template<typename T>
using CallBackRef = std::function<void( T& )>;

template<typename T>
using CallBackConst = std::function<void( const T)>;

template<typename T>
using CallBackConstRef = std::function<void( const T& )>;

template<typename T>
class Subscriber{

//using CallBack = std::function<void( T )>;
//using CallBackRef = std::function<void( T& )>;

public:
	Subscriber();

	Subscriber( const Subscriber &obj ):transport( obj.transport ),	
					    cb_( obj.cb_),
					    size( obj.size ),
					    fd( obj.fd ),
					    ipPort( obj.ipPort ),
					    ipAddr( obj.ipAddr )
	{
		std::cout<<"Subscriber Copy Constructor ..."<<std::endl;
		memcpy( recvBuff, obj.recvBuff, sizeof(T) + 1 );
	}

	Subscriber& operator=( const Subscriber &other )
	{
		std::cout<<"Subscriber Agin Constructor ..."<<std::endl;
		if( this == &other ) return *this;
		
		transport = other.transport;
		cb_ = other.cb_;
		size = other.size;

		fd = other.fd;
		ipPort = other.ipPort;
		ipAddr = other.ipAddr;
		memcpy( recvBuff, other.recvBuff, sizeof(T) + 1 );
	}

	~Subscriber()
	{
		delete[] recvBuff;
		
		delete[] buffer;
	}

	void createASubscriber( std::string addr, int port );
	
	void circleReceive();

	void registerCallback( CallBack<T> cb );
	void registerCallback( CallBackRef<T> cb );

	void timerCircle();

private:
	void heartBeatsResponse();

	void sendSubscriberInfo();

private: 
	Transport *transport;

	CallBack<T> cb_;

	int size;
	unsigned char *recvBuff;


	bool recvEnable;
	int recvCount;

	int fd;
	int ipPort;
	std::string ipAddr;

	// added for huge message
	bool needCutPieces = false;
	int pieces = 0;
	int remainLength = 0;
	int piecesCount = 0;
	unsigned char *buffer;
};


//static int fd = -1;
//static int ipPort = -1;
//static std::string ipAddr = "";

template<typename T>
Subscriber<T>::Subscriber(): size( 0 ), 
			recvEnable( false ), 
			recvCount( 0 ),
			fd( -1 ),
			ipPort( 0 ),
			ipAddr( "" )
{
	transport = new TransportUDP;	
	size = sizeof( T );
	//recvBuff = new unsigned char[ size ];
	//memset( recvBuff, 0, size );

	if( size > UDP_MAX_LENGHT ){
                needCutPieces = true;
                pieces = size / UDP_MAX_LENGHT;
                remainLength = size - pieces * UDP_MAX_LENGHT;

		buffer = new unsigned char[size];
		recvBuff = new unsigned char[UDP_MAX_LENGHT];
        }
	else {
		recvBuff = new unsigned char[ size ];
	        memset( recvBuff, 0, size );
	}
}

template<typename T>
void Subscriber<T>::sendSubscriberInfo()
{
	struct sockaddr_in destAddr;
        destAddr.sin_family = AF_INET;
        destAddr.sin_addr.s_addr = inet_addr( ipAddr.c_str() );
        destAddr.sin_port = htons( ipPort );
        unsigned char identify[4] = { 'a', 'b', 'c', 'd' };

        fd = transport->getClientFd();

        while( transport->write( transport->getClientFd(), identify, 4, destAddr ) <= 0 ){
                sleep(1);
        }

}

template<typename T>
void Subscriber<T>::createASubscriber( std::string addr, int port )
{
	ipPort = port;
	ipAddr = addr;

	if( !transport->initSocketClient() ){
		exit(-1);
	}
	std::cout<<"------------------- Initialized A Subscriber ------------------"<<std::endl;
	
	struct sockaddr_in destAddr;
	destAddr.sin_family = AF_INET;
	destAddr.sin_addr.s_addr = inet_addr( addr.c_str() );
	destAddr.sin_port = htons( port );
	unsigned char identify[4] = { 'a', 'b', 'c', 'd' };

	fd = transport->getClientFd();

	while( transport->write( transport->getClientFd(), identify, 4, destAddr ) <= 0 ){
		sleep(1);
	}
}

template<typename T>
void Subscriber<T>::circleReceive()
{
	while(1){
		if( !needCutPieces ){ // need cut
			memset( recvBuff, 0, size );
			if( transport->read( transport->getClientFd(), recvBuff, size ) > 0){
				if( recvBuff[0] == 'a' && recvBuff[1] == 'a' && recvBuff[2] == 'a' && recvBuff[3] == 'a' ){
					recvEnable = false;
					heartBeatsResponse();
				}
				else {
					T data;
					memcpy( &data, recvBuff, sizeof( data ) );

					cb_( data );
				}
			}
		}
		else {
			int recvLen = transport->read( transport->getClientFd(), recvBuff, UDP_MAX_LENGHT );
			if( recvLen > 0 ){
        	                if( recvBuff[0] == 'a' && recvBuff[1] == 'a' && recvBuff[2] == 'a' && recvBuff[3] == 'a' ){
                	                recvEnable = false;
                        	        heartBeatsResponse();
                        	}
	                        else {
					memcpy( &buffer[piecesCount * UDP_MAX_LENGHT], recvBuff, recvLen );	
					piecesCount ++;
	
					if( piecesCount == pieces + 1 ){
						piecesCount = 0;
					
						T data;
						memcpy( &data, buffer, size );
					
						cb_( data );
					}
                        	}
                	}
		}
	
	}// end of while	
}

template<typename T>
void Subscriber<T>::heartBeatsResponse()
{
	struct sockaddr_in destAddr;
        destAddr.sin_family = AF_INET;
     	destAddr.sin_addr.s_addr = inet_addr( ipAddr.c_str() );
      	destAddr.sin_port = htons( ipPort );
      	
	unsigned char identify[4] = { 'a', 'a', 'a', 'a' };
                                
	int ret = sendto( fd, identify, 4, 0, ( struct sockaddr*)&destAddr, sizeof( destAddr ) );
        if( ret > 0 ){

#ifdef LOGON
		std::cout<<"send Response ..."<<std::endl;
#endif
		//recvEnable = true;
	}

}

template<typename T>
void Subscriber<T>::registerCallback( CallBack<T> cb )
{
	cb_ = cb;
}

template<typename T>
void Subscriber<T>::timerCircle()
{
	while(1){
		std::this_thread::sleep_for( std::chrono::milliseconds( 1000 ) );
		if( recvEnable == true ){
			recvCount ++;
		}
		else recvCount = 0;

		if( recvCount > 3 ){
			std::cout<<"the publisher is offline ..."<<std::endl;
	
			sendSubscriberInfo();		
		}
	
		recvEnable = true;
	}
}


}


#endif
