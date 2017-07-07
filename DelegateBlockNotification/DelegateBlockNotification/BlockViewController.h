//
//  BlockViewController.h
//  DelegateBlockNotification
//
//  Created by ttxc on 2017/7/7.
//  Copyright © 2017年 TTXC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TestViewblock)(NSString *string);

@interface BlockViewController : UIViewController

@property(nonatomic,strong)TestViewblock testViewBlock;


@end
