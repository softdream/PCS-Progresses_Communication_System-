#include <iostream>

#include "pcs.h"

#include "transport_udp.h"

#include <unistd.h>

#include "data_type.h"

int count = 0;

void carInfoProcessFunc( zxy::CarInfo a )
{
	count ++;
	std::cout<<"count : "<<count<<std::endl;
	std::cout<<"car info.time_stamp   : "<<a.time_stamp<<std::endl;
	std::cout<<"car info.velocity     : "<<a.velocity<<std::endl;
	std::cout<<"car info.acceleration : "<<a.acceleration<<std::endl;
	std::cout<<"car info.pitch        : "<<a.pitch<<std::endl;
	std::cout<<"car info.yaw          : "<<a.yaw<<std::endl;
	std::cout<<"car info.roll         : "<<a.roll<<std::endl;	

	// process ...
}

int main()
{
	std::cout<<"Program begins ..."<<std::endl;

	pcs::PCS pcs;
	
	pcs::Subscriber<zxy::CarInfo> sub = pcs.subscribe<zxy::CarInfo>( "127.0.0.1", 5555, carInfoProcessFunc );


	while(1){
		//TODO ... other 

	
	}


	return 0;
}
