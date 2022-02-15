# PCS-Progresses_Communication_System-

### 一、PCS通信库中使用—发布信息
该PCS通信库主要是为了多个进程之间通信而设立的，使用接口简单，首先对于信息的发送方（即这里的publisher），我们需要做以下几个工作：</br>
#### 1、定义消息结构体
消息结构体的定义是根据你所需要的消息类型自己定义的，你想传输什么数据，那就自己定义该数据的格式。如下例子所示：</br>

如图所示的消息体就是由消息头，消息尾和消息内容三部分组成的，你可以根据情况任意定义该消息的格式。</br>
#### 2、实例化一个PCS的对象
 
该对象里主要是实现了发布订阅机制的初始化操作，这些在构造函数里已经完成了，用户不需要关心。</br>
#### 3、实例化一个Publisher对象
 
这里就用到了PCS类中的发布消息的接口函数：
```cpp
  template<typename T>
  Publisher<T> advertise( const std::string &ip_addr, const int ip_port );
```
该函数的功能：</br>
		注册一个发布者，并分配好其通信所需的ip和端口；</br>
该函数的形参的含义分别是：</br>
		ip_addr: 发布者进程本机的IP地址（本机内通信一般用127.0.0.1）；</br>
		ip_port: 发布者进程通信的端口号（自己分配，只要不冲突就行了）；</br>
返回值：</br>
		返回一个Publisher对象。</br>
#### 4、发布消息
 
	这里用到了Publisher类中的接口函数：</br>
```cpp
	template<typename T>
  void publish( T &data );
```
该函数的功能：</br>
  发布一帧消息。</br>
该函数的形参的含义分别是：</br>
	data: 所要发布的消息数据；</br>
### 三、PCS通信库中使用—订阅信息
订阅信息即接收发布者所发布的消息的过程。注意消息类型要与publisher进程里的数据类型保持一致。 </br>
第一步仍然是实例化一个PCS类对象；</br>
第二步是注册一个订阅者，使用接口：</br>
```cpp
  template<typename T>
  Subscriber<T> subscriber( const std::string &ip_addr, const int ip_port, std::function<void*( T )> &callback );
```
该函数的功能：</br>
		注册一个订阅者，包括设置一个接收到一帧信息之后的回调函数。</br>
该函数的形参的含义分别是：</br>
		ip_addr: 发布者进程本机的IP地址；</br>
		ip_port: 发布者进程通信的端口号；</br>
	注意这两个参数与publisher中的保持一致才能通信；</br>
		callback: 回调函数的函数指针。注意回调函数的格式是固定的（返回值是void, 形参是： 自定义的消息类型 变量）；</br>
该函数的返回值：</br>
		返回一个Subscriber对象。</br>
