//
//  ViewController.m
//  todayWidgetTest
//



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults * userDef = [[NSUserDefaults alloc] initWithSuiteName:@"group.test.com.baidi.widgetDemo"];
    [userDef setValue:@"lili" forKeyPath:@"name"];
    [userDef synchronize];
}


@end
