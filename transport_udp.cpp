#include "transport_udp.h"
#include "transport_udp.h"

namespace pcs{

TransportUDP::TransportUDP() : clientFd(-1),
				serverFd(-1)
{

}

bool TransportUDP::initSocketServer( const int port )
{
	serverFd = socket( AF_INET, SOCK_DGRAM, 0 );
	if( serverFd < 0 ){
		std::cerr<<"socket UDP server failed ..."<<std::endl;
		return false;
	}	
	server_addr_.sin_family = AF_INET;
        server_addr_.sin_addr.s_addr = htonl( INADDR_ANY ) ;
        server_addr_.sin_port = htons( port ); //

	if( bind( serverFd, ( struct sockaddr* )&server_addr_, sizeof( server_addr_ ) ) < 0  ) {
		std::cerr<<"Bind the addr failed ..."<<std::endl;
		return false;
	}
	
	std::cerr<<"Initialize the udp server successfull ..."<<serverFd<<std::endl;
	return true;
}

bool TransportUDP::initSocketClient()
{
	const int on = 1;
	clientFd = socket( AF_INET, SOCK_DGRAM, 0 );
        if( clientFd < 0 ){
                std::cerr<<"socket UDP client falied ..."<<std::endl;
                return false;
        }
        //setsockopt( clientFd, SOL_SOCKET, SO_BROADCAST, &on, sizeof( on ) );
	
	std::cerr<<"initialize the udp client successfull: "<< clientFd <<std::endl;
	/*struct timeval timeout;
        timeout.tv_sec = 1;
        timeout.tv_usec = 0;
        if( setsockopt( clientFd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof( timeout ) ) == -1  ){
                std::cerr<<"set opt failed ..."<<std::endl;
        }*/

        return true;
}

int TransportUDP::read( int fd, unsigned char *buffer, int size )
{
	memset( &server_recv_addr, 0, sizeof( server_recv_addr ) );
	int ret = recvfrom( fd, buffer, size, 0, ( struct sockaddr* )&server_recv_addr, &server_recv_len );
        if( ret <= 0 ){
                std::cerr<<"received error ..."<<std::endl;
                return false;
        }
	
        buffer[ret] = '\n';
        std::cout <<"recvfrom "<< inet_ntoa(server_recv_addr.sin_addr) <<": "<< ntohs( server_recv_addr.sin_port )<< buffer << std::endl;
        return ret;
	/*struct sockaddr_in addr;
	socklen_t addr_len;
	int ret = recvfrom( fd, buffer, size, 0, ( struct sockaddr* )&addr, &addr_len );
        if( ret <= 0 ){
                std::cerr<<"received error ..."<<std::endl;
                return false;
        }
        
        buffer[ret] = '\n';
        std::cout <<"recvfrom "<< inet_ntoa(addr.sin_addr) <<": "<< ntohs( addr.sin_port )<< buffer << std::endl;
        return ret;*/
}

int TransportUDP::write( int fd, unsigned char *buffer, int size )
{
	client_dest_addr.sin_family = AF_INET;
        client_dest_addr.sin_addr.s_addr = INADDR_BROADCAST;
        client_dest_addr.sin_port = htons( 8888 );
        int ret = sendto( fd, buffer, size, 0, ( struct sockaddr*)&client_dest_addr, sizeof( client_dest_addr ) );
        if( ret <= 0 ){
                std::cerr<<"send data falied ..."<<std::endl;
                return false;
        }
    //    std::cerr<<"send data succussfully ..."<<std::endl;
        return ret;
}

int TransportUDP::write( int fd, unsigned char *buffer, int size, int port )
{
	client_dest_addr.sin_family = AF_INET;
        client_dest_addr.sin_addr.s_addr = INADDR_BROADCAST;
        client_dest_addr.sin_port = htons( port );
        int ret = sendto( fd, buffer, size, 0, ( struct sockaddr*)&client_dest_addr, sizeof( client_dest_addr ) );
        if( ret <= 0 ){
                std::cerr<<"send data falied ..."<<std::endl;
                return false;
        }
      //  std::cerr<<"send data succussfully ..."<<std::endl;
        return ret;
}

int TransportUDP::write( int fd, unsigned char *buffer, int size, struct sockaddr_in &clientAddr )
{
	int ret = sendto( fd, buffer, size, 0, ( struct sockaddr*)&clientAddr, sizeof( clientAddr ) );
        if( ret <= 0 ){
                std::cerr<<"send data falied ..."<<std::endl;
                return false;
        }
        //std::cerr<<"send data succussfully ..."<<std::endl;
        return ret;
}

void TransportUDP::closeSocket( int fd )
{
	close( fd );
}

const int TransportUDP::getClientFd() const
{
	return clientFd;
}

int TransportUDP::getClientFd()
{
	return clientFd;
}

const int TransportUDP::getServerFd() const
{
        return serverFd;
}

int TransportUDP::getServerFd()
{
        return serverFd;
}

struct sockaddr_in TransportUDP::getRecvAddr()
{
	return server_recv_addr;
}


}




