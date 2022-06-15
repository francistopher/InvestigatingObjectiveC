#import <Foundation/Foundation.h>
#import "transcriber.h"

@implementation Transcriber:NSObject

-(void) getFileNamesFromTerminalArgs:(int)argc andArray:(char**)argv
{
	if (argc > 1) { // the user entered input file name
		if (argc > 2) { // the user entered the output file name
			[self setWritingFileName: argv[2]];
		} else { // the user didn't enter the output file name
			[self setWritingFileName: "transcription.m"];
		}
		[self setReadingFileName: argv[1]];
		if ([self isReadingFileEditable]) {
			[self buildWritingFile];
		}
	} else { // the user didn't enter the input file name
		[self setReadingFileName: "template.m"];
		[self setWritingFileName: "transcription.m"];
	}
	NSLog(@"READING FILE NAME %@", _readingFileName);
	NSLog(@"WRITING FILE NAME %@", _writingFileName);
}

-(bool) isReadingFileEditable
{
	if (_fileMngr != nil) { // file manager exists
		if ([_fileMngr fileExistsAtPath: _readingFileName] && [_fileMngr isWritableFileAtPath: _readingFileName]) {
			NSLog(@"READING FILE DOES EXIST AND IS WRITABLE");
			return true;
		} else {
			NSLog(@"READING FILE DOES NOT EXIST AND IS NOT WRITABLE"); 
			return false;
		}
	} else { // file manager doesn't exist
		_fileMngr = [NSFileManager defaultManager];
		return [self isReadingFileEditable];
	}
}

-(void) buildWritingFile
{
	[_fileMngr createFileAtPath: _writingFileName contents: nil attributes: nil];
	_writingFileHandle = [NSFileHandle fileHandleForUpdatingAtPath: _writingFileName];
	NSLog(@"File Created for Writing");

	// write import to file
	const char *byteString = "#import <Foundation/Foundation.h>";
	NSMutableData *data;
	data = [NSMutableData dataWithBytes:byteString length:strlen(byteString)];
	[_writingFileHandle seekToFileOffset: 0];
	[_writingFileHandle writeData: data];
	[_writingFileHandle closeFile];

}

-(void) setWritingFileName:(char*)writingFileName // updates the writing file name
{
	_writingFileName = [NSString stringWithUTF8String: writingFileName];
}

-(void) setReadingFileName:(char*)readingFileName // updates the reading file name
{
	_readingFileName = [NSString stringWithUTF8String: readingFileName];
}

-(id) init // constructor 
{
	self = [super init];
	_fileMngr = [NSFileManager defaultManager];
	return self;
}

@end
