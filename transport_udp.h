#ifndef __TRANSPORT_UDP_H_
#define __TRANSPORT_UDP_H_

#include <iostream>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>

#include "transport.h"

namespace pcs{

class TransportUDP: public Transport
{
public:
	TransportUDP();
	virtual ~TransportUDP()
	{
		std::cout<<"deconstructure of class TransportUDP..."<<std::endl;
	}

	virtual int read( int fd, unsigned char *buffer, int size );
	virtual int write( int fd, unsigned char *buffer, int size );
        virtual int write( int fd, unsigned char *buffer, int size, int port );
        virtual int write( int fd, unsigned char *buffer, int size, struct sockaddr_in &clientAddr );

        virtual void closeSocket( int fd );

	virtual bool initSocketServer( const int port );
        virtual bool initSocketClient();
	
	virtual const int getClientFd() const;
        virtual int getClientFd();

	virtual const int getServerFd() const;
        virtual int getServerFd();

	virtual struct sockaddr_in getRecvAddr();

private:
	int clientFd;
	int serverFd;
	struct sockaddr_in server_addr_;
        struct sockaddr_in client_addr_;


	struct sockaddr_in server_recv_addr;
        socklen_t server_recv_len;

        struct sockaddr_in client_dest_addr;
        //socklen_t client_dest_len;
};

}

#endif
