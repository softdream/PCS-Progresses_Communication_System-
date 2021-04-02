#include <iostream>

#include "pcs.h"

#include "transport_udp.h"

#include <unistd.h>


unsigned char buffer[32];

using namespace pcs;

int a = 40;

int main()
{
	std::cout<<"Program begins ..."<<std::endl;

	pcs::PCS pcs;
	Publisher<int> pub = pcs.advertise<int>( "192.168.72.129", 5555 );
	

	while(1){
		pub.publish( a );
		sleep(1);
	}
	return 0;
}
