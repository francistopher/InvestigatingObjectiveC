@interface Human : NSObject

@property (nonatomic, strong) NSString *firstName;

@property (nonatomic, strong) NSString *lastName;

// out of 2000 ng/dL (nano grams out of deci liters you software "engineers")
@property (nonatomic, strong) NSNumber *testosterone;

@property (nonatomic, strong) NSNumber *yearOfBirth;

@property BOOL isAlive;

- (void)sayName;
- (void)shoutName;

@end
