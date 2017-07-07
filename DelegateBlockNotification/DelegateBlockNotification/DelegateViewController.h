//
//  DelegateViewController.h
//  DelegateBlockNotification
//
//  Created by ttxc on 2017/7/7.
//  Copyright © 2017年 TTXC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestViewDelegate <NSObject>

-(void)selectedString:(NSString *)string;
@end

@interface DelegateViewController : UIViewController

@property(assign, nonatomic) id <TestViewDelegate> testViewDelegate;

@end
