#ifndef __TRANSPORT_H_
#define __TRANSPORT_H_

#include <iostream>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <linux/if_ether.h>
#include <net/if.h>

#include <string.h>

#define ETH_NAME  "ens33"  

namespace pcs
{

class Transport
{
public:
	Transport(){}
	virtual ~Transport(){};
	
	virtual int read( int fd, unsigned char *buffer, int size ) = 0;
	virtual int write( int fd, unsigned char *buffer, int size ) = 0;
	virtual int write( int fd, unsigned char *buffer, int size, int port ) = 0;
	virtual int write( int fd, unsigned char *buffer, int size, struct sockaddr_in &clientAddr ) = 0;	

	virtual void closeSocket( int fd ) = 0;

	virtual bool initSocketServer( const int port ) = 0;
        virtual bool initSocketClient() = 0;

	struct sockaddr_in getLocalIp( int sock_fd )
	{
		struct sockaddr_in  sin;
		struct ifreq ifr;
		
		struct sockaddr_in local;
		socklen_t Len = sizeof( local );		

	        if (getsockname( sock_fd, (struct sockaddr*)&local, &Len ) == -1){
        	        exit(-1);
        	}

        	strncpy(ifr.ifr_name,ETH_NAME,IFNAMSIZ);
	        ifr.ifr_name[IFNAMSIZ - 1] = 0;
        	if(ioctl(sock_fd,SIOCGIFADDR,&ifr) == 0) {
                	memcpy(&sin,&ifr.ifr_addr,sizeof(sin));
	        }
		
		struct sockaddr_in localInfo;
		localInfo.sin_port = local.sin_port;
		localInfo.sin_addr = sin.sin_addr;

		return localInfo;
	}
	
	virtual const int getClientFd() const = 0;
	virtual int getClientFd() = 0;

	virtual const int getServerFd() const = 0;
        virtual int getServerFd() = 0;
	
	virtual struct sockaddr_in getRecvAddr() = 0;

private:
};	

}

#endif
