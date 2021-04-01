#ifndef __SUBSCRIBER_H_
#define __SUBSCRIBER_H_

#include "transport_udp.h"
#include "IEvent.h"
#include "EpollEvent.h"
#include <unistd.h>
#include <functional>

namespace pcs{

template<typename T>
using CallBack = std::function<void( T )>;

template<typename T>
using CallBackRef = std::function<void( T& )>;


template<typename T>
class Subscriber{

//using CallBack = std::function<void( T )>;
//using CallBackRef = std::function<void( T& )>;

public:
	Subscriber();

	Subscriber( const Subscriber &obj ):transport( obj.transport ),	
					    cb_( obj.cb_),
					    size( obj.size )
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
		memcpy( recvBuff, other.recvBuff, sizeof(T) + 1 );
	}

	~Subscriber()
	{
		delete[] recvBuff;
	}

	void createASubscriber( std::string addr, int port );
	
	void circleReceive();

	void registerCallback( CallBack<T> cb );
	void registerCallback( CallBackRef<T> cb );

private: 
	Transport *transport;

	CallBack<T> cb_;

	int size;
	unsigned char *recvBuff;
};

template<typename T>
Subscriber<T>::Subscriber(): size( 0 )
{
	transport = new TransportUDP;	
	size = sizeof( T ) + 1;
	recvBuff = new unsigned char[ size ];
	memset( recvBuff, 0, size );
}

template<typename T>
void Subscriber<T>::createASubscriber( std::string addr, int port )
{

	if( !transport->initSocketClient() ){
		exit(-1);
	}
	std::cout<<"------------------- Initialized A Subscriber ------------------"<<std::endl;
	
	struct sockaddr_in destAddr;
	destAddr.sin_family = AF_INET;
	destAddr.sin_addr.s_addr = inet_addr( addr.c_str() );
	destAddr.sin_port = htons( port );
	unsigned char identify[4] = { 'a', 'b', 'c', 'd' };

	while( transport->write( transport->getClientFd(), identify, 4, destAddr ) <= 0 ){
		sleep(1);
	}
}

template<typename T>
void Subscriber<T>::circleReceive()
{
	while(1){
		memset( recvBuff, 0, size );
		if( transport->read( transport->getClientFd(), recvBuff, size ) > 0){
			T data;
			memcpy( &data, recvBuff, sizeof( data ) );

			cb_( data );
		}
	}
}

template<typename T>
void Subscriber<T>::registerCallback( CallBack<T> cb )
{
	cb_ = cb;
}


}


#endif
