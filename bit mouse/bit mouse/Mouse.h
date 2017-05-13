//
//  Mouse.h
//  打地鼠
//
//  Created by Mikez on 2017/5/10.
//  Copyright © 2017年 Mikez. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MouseDelegate <NSObject>

- (void)successAction;
- (void)failAction;

@end
@interface Mouse : UIButton
@property (nonatomic, weak)id<MouseDelegate> delegate;

@end
