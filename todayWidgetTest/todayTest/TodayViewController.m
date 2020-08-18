//
//  TodayViewController.m
//  todayTest
//


#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#define SCREEN_WIDTH UIScreen.mainScreen.bounds.size.width
@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *contentsLabel;

@property (weak, nonatomic) IBOutlet UIButton *redButton;

@property (weak, nonatomic) IBOutlet UIButton *greenButton;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 10.0,*)) {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    }
    self.preferredContentSize = CGSizeMake(SCREEN_WIDTH, 100);
    // userDefaults group来实现数据共享
    NSUserDefaults * userDef = [[NSUserDefaults alloc] initWithSuiteName:@"group.test.com.baidi.widgetDemo"];
    self.contentsLabel.text = [userDef valueForKey:@"name"];
}

- (IBAction)redbuttonClicked:(id)sender {
    NSLog(@"red");
    //通过宿主app的scheme打开宿主app
    [self.extensionContext openURL:[NSURL URLWithString:@"widgetTestDemo://red"] completionHandler:^(BOOL success) {
        
    }];
}

- (IBAction)greenButtonClicked:(id)sender {
    NSLog(@"green");
    [self.extensionContext openURL:[NSURL URLWithString:@"widgetTestDemo://green"] completionHandler:^(BOOL success) {
        
    }];
}

// widget 布局显示改变时
-(void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize
{
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake(SCREEN_WIDTH, 100);
    } else {
        self.preferredContentSize = CGSizeMake(SCREEN_WIDTH, 200);
    }
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.

    completionHandler(NCUpdateResultNewData);
    
    
}

@end
