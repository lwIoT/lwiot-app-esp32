/*
 * ESP32 device test.
 * 
 * @author Michel Megens
 * @email  dev@bietje.net
 */

#include <stdlib.h>
#include <stdio.h>
#include <esp_attr.h>
#include <esp_heap_caps.h>
#include <lwiot.h>

#include <lwiot/kernel/thread.h>
#include <lwiot/log.h>
#include <lwiot/stl/string.h>
#include <lwiot/io/watchdog.h>
#include <lwiot/util/application.h>

#include <lwiot/stl/move.h>

struct Application : public lwiot::Functor {
protected:
	void run() override
	{
		size_t free_size;

		free_size = heap_caps_get_free_size(MALLOC_CAP_DEFAULT);
		print_dbg("Free heap size: %uKiB\n", free_size / 1024);

		wdt.enable(2000);

		while(true) {
			wdt.reset();
			printf("[%llu] PING!\n", (unsigned long long) lwiot_tick_ms());
			lwiot_sleep(1000);
		}
	}
};


extern "C" void main_start(void)
{
	Application runner;
	print_dbg("Starting application...\n");

	lwiot::Application application(runner);

	application.start();
}

