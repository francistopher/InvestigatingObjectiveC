@interface Transcriber : NSObject 

@property (nonatomic, strong) NSString *writingFileName;
@property (nonatomic, strong) NSString *readingFileName;

@property (nonatomic, strong) NSFileManager *fileMngr;

@property (nonatomic, strong) NSFileHandle *writingFileHandle;

-(void) getFileNamesFromTerminalArgs:(int) argc andArray:(char**) argv;

-(void) setReadingFileName:(char*) readingFileName;

-(void) setWritingFileName:(char*) writingfileName;

-(void) buildWritingFile;

-(bool) isReadingFileEditable;

-(id)init;



@end
