#include <iostream>

#include "pcs.h"

#include "transport_udp.h"
#include "data_type.h"
#include <unistd.h>

int main()
{
	std::cout<<"Program begins ..."<<std::endl;

	pcs::PCS pcs;
	pcs::Publisher<zxy::CarInfo> pub = pcs.advertise<zxy::CarInfo>( "127.0.0.1", 5555 );
	
	zxy::CarInfo car_info;
	car_info.time_stamp = 1245677;
	car_info.velocity = 30.0f;
	car_info.acceleration = 1.0f;
	car_info.pitch = 0.3f;
	car_info.yaw = 0.4f;
	car_info.roll = 0.5f;

	int count = 0;
	while(1){
		// 
		pub.publish( car_info );
		//sleep(1);
		usleep( 40000 );
		count ++;
	//	std::cout<<"publish a message, count : "<<count<<std::endl;
	}
	return 0;
}
