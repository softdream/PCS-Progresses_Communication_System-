#include <iostream>

#include "pcs.h"

#include "transport_udp.h"

#include <unistd.h>


unsigned char buffer[32];

using namespace pcs;

int a = 40;


void test( int a )
{
	std::cout<<"a = "<<a<<std::endl;
}

int main()
{
	std::cout<<"Program begins ..."<<std::endl;

	pcs::PCS pcs;
	//Publisher<int> pub = pcs.advertise<int>( "192.168.72.129", 5555 );
	
	Subscriber<int> sub = pcs.subscribe<int>( "192.168.72.137", 5555, test );


	while(1){
	//	pub.publish( a );
		sleep(1);
	}


	return 0;
}
