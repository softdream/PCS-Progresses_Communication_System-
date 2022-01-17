#include <iostream>

#include "pcs.h"

#include "transport_udp.h"

#include <unistd.h>


unsigned char buffer[32];

using namespace pcs;

int a = 40;

struct Data{
        char head1;
        char head2;
        char head3;

        char data[64];

        char rear;

};
typedef struct Data Data;

void test( Data a )
{
	//std::cout<<"a = "<<a<<std::endl;
	std::cout<<"a.head1 = "<<a.head1<<std::endl;
	std::cout<<"a.head2 = "<<a.head2<<std::endl;
	std::cout<<"a.head3 = "<<a.head3<<std::endl;
	
	// process ...
}

int main()
{
	std::cout<<"Program begins ..."<<std::endl;

	pcs::PCS pcs;
	//Publisher<int> pub = pcs.advertise<int>( "192.168.72.129", 5555 );
	
	Subscriber<Data> sub = pcs.subscribe<Data>( "127.0.0.1", 5555, test );


	while(1){
	//	pub.publish( a );
		sleep(1);
	}


	return 0;
}
