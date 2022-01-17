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

int main()
{
	std::cout<<"Program begins ..."<<std::endl;

	pcs::PCS pcs;
	Publisher<Data> pub = pcs.advertise<Data>( "127.0.0.1", 5555 );
	
	Data d;
	d.head1 = 'a';
	d.head2 = 'b';
	d.head3 = 'c';
	

	while(1){
		pub.publish( d );
		sleep(1);
	}
	return 0;
}
