//
//  ViewController.m
//  DelegateBlockNotification
//
//  Created by ttxc on 2017/7/7.
//  Copyright © 2017年 TTXC. All rights reserved.
//

#import "ViewController.h"

#import "DelegateViewController.h"
#import "BlockViewController.h"
#import "NotificationViewController.h"

@interface ViewController ()<TestViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - block
- (IBAction)BlockClick:(id)sender {
    BlockViewController *vc = [[BlockViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
    __weak typeof(self) weakSelf=self;//避免block 循环缓存
    vc.testViewBlock=^(NSString *string){
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"string-->%@",string);
    };
}

#pragma mark - Notification
- (IBAction)NotificationClick:(id)sender
{
    NotificationViewController *vc = [[NotificationViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];//移除通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"test_notification" object:nil];//添加通知
}
-(void)notification:(NSNotification *)notification{
    NSString *sting = [notification object];
    NSLog(@"sting --->%@",sting);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Delegate
- (IBAction)buttonClick:(id)sender {
    DelegateViewController *vc = [[DelegateViewController alloc]init];
    vc.testViewDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)selectedString:(NSString *)string{
    [self dismissViewControllerAnimated:YES completion:nil];//返回上个页面
    NSLog(@"string-- >%@",string);
}

@end
