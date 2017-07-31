//
//  BlockViewController.h
//  DelegateBlockNotification
//
//  Created by ttxc on 2017/7/7.
//  Copyright © 2017年 TTXC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TestViewblock)(NSString *string);

typedef void(^SLblockString)(NSString *string);


@interface BlockViewController : UIViewController

@property(nonatomic,strong)TestViewblock testViewBlock;
@property (nonatomic,copy) SLblockString blockstring;



@property(nonatomic, copy) UIView *(^viewGetter)(NSString *imageName); //注意其返回类型为UIView *


@end
