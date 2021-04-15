#ifndef __PCS_H_
#define __PCS_H_


#include "publisher.h"
#include <thread>
#include "subscriber.h"

#define PUBLISHER 1
#define SUBSCRIBER 2

namespace pcs{


class PCS
{
public:
	PCS()
	{

	}	
	~PCS()
	{

	}
	
	template<typename T>
	Publisher<T> advertise( std::string addr, int port );

	template<typename T>
	Subscriber<T> subscribe( std::string addr, int port, CallBack<T> cb );

private:
	
	
};


template<typename T>
Publisher<T> PCS::advertise( std::string addr, int port )
{
	Publisher<T> publisher;
		
	publisher.setSocketInfo( addr, port );
	std::thread publisherThread( &Publisher<T>::createAPublisher, &publisher );
	std::thread timerThread( &Publisher<T>::timerCircle, &publisher );

	publisherThread.detach();
	
	timerThread.detach();

	return publisher;
}

template<typename T>
Subscriber<T> PCS::subscribe( std::string addr, int port, CallBack<T> cb )
{
	Subscriber<T> sub;
	
	sub.createASubscriber( addr, port );
	sub.registerCallback( cb );

	std::thread subscriberThread( &Subscriber<T>::circleReceive, &sub );
	std::thread timerThread( &Subscriber<T>::timerCircle, &sub );
	
	subscriberThread.detach();
	//subscriberThread.join();
	timerThread.detach();

	return sub;
}


}

#endif
