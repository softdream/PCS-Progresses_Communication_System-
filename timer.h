#ifndef __TIMER_H_
#define __TIMER_H_

#include <iostream>
#include <chrono>
#include <thread>

namespace pcs{

class Timer{
public:
	Timer()
	{

	}
	~Timer()
	{

	}

	void createATimer();

private:
	void timeCircle();

};

}

#endif

