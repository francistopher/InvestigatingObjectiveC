#import <Foundation/Foundation.h>
#import "transcriber.m"

int main(int argc, char *argv[])
{
	@autoreleasepool 
	{
		Transcriber *transcriber;
		transcriber = [[Transcriber alloc] init];
		[transcriber getFileNamesFromTerminalArgs:argc andArray:argv];
		NSLog(@"hello");	
	}
}
