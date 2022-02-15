#ifndef __DATA_TYPE_H_
#define __DATA_TYPE_H_

#include <type_traits>

namespace zxy
{

// car information message
template<int Size = 10>
struct CarInfo_
{
	uint32_t time_stamp = 0;

	float velocity = 0;
	float acceleration = 0;
	
	float longitude[Size];
	float latitude[Size];
	
	float pitch = 0;
	float yaw = 0;
	float roll = 0;	
	
};
using CarInfo = CarInfo_<10>;

// GPS Info
struct GPSInfo
{
	uint32_t time_stamp;
	
	float longitude;
	float latitude;
};
typedef struct GPSInfo GPSInfo;

// IMU Info
struct IMUInfo
{
	uint32_t time_stamp;
	
	float pitch;
	float yaw;
	float roll;
};
typedef struct IMUInfo IMUInfo;

// Image Info
template<typename T>
struct ImageType
{
	using type = typename std::remove_all_extents<T>::type; 
};

template<>
struct ImageType<unsigned char>
{	
	using type = unsigned char;	
};

template<>
struct ImageType<unsigned short>
{
	using type = unsigned short;
};

template<typename T, int width = 1280, int height = 720, int channel = 1> 
struct ImageInfo_
{
	uint32_t time_stamp;
	
	ImageType<T> data[width][height][channel]; 
};

using ImageInfo = ImageInfo_<unsigned char>;



}

#endif
