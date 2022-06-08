#import <Foundation/Foundation.h>

void writeIncludeFoundationToFile(NSFileHandle *f) {
	const char *byteString = "#import <Foundation/Foundation.h>";
	NSMutableData *data;
	data = [NSMutableData dataWithBytes:byteString length:strlen(byteString)];
	[f seekToFileOffset: 0];
	[f writeData: data];
	[f closeFile];
}

int main(int argc, char *argv[])
{
	@autoreleasepool {
		NSLog(@"hello, world");
		NSString *hName = @"transcription.m";
		NSString *wfName = @"./transcription.m";
		NSString *rfName = @"./input.m";

		if (argc > 1) { // determine the file to write to
			wfName = [NSString stringWithUTF8String: argv[0]];
			if (argc > 2) { // determine the file name
				hName = [NSString stringWithUTF8String: argv[1]];
			}
		} 

		NSFileManager *fileMngr;
		fileMngr = [NSFileManager defaultManager];

		if ([fileMngr fileExistsAtPath: rfName] == YES) {
			NSLog(@"File exists!");
			if ([fileMngr isWritableFileAtPath: rfName] == YES) {
				NSLog(@"File is writable!");
			} else {
				NSLog(@"File is not writable!");
				return 1;
			}
		} else {
			NSLog(@"File doesn't exist!");
			return 1;
		}

		NSFileHandle *fr = [NSFileHandle fileHandleForReadingAtPath: rfName];
		NSFileHandle *fw = [NSFileHandle fileHandleForUpdatingAtPath: wfName];

		if (fw == nil) {
			[fileMngr createFileAtPath: wfName contents: nil attributes: nil];
			fw = [NSFileHandle fileHandleForUpdatingAtPath: wfName];
			NSLog(@"File Created");
			NSLog(@"File Handler Created");
		}
		
		writeIncludeFoundationToFile(fw);
		
	}
	return 0;
}

