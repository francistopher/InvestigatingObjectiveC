#import <Foundation/Foundation.h>
#import "human.m"

int main(int argc, const char *argv []) 
{
	@autoreleasepool
	{
		Human *christopher;
		christopher = [[Human alloc] init];
		[christopher sayName];
		[christopher shoutName];
	}
}
