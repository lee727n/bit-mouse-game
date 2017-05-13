
//
//  Mouse.m
//  打地鼠
//
//  Created by Mikez on 2017/5/10.
//  Copyright © 2017年 Mikez. All rights reserved.
//

#import "Mouse.h"

@implementation Mouse
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        //添加背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
      
        [self addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self setTitle:@"3" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:22];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (NSInteger i = 0; i < 3; i++) {
                
                [NSThread sleepForTimeInterval:.5];
             
                //判断地鼠是否被删除了 如果删除了就不再修改title
                if (!self.superview) {
                    
                    break;
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    int time = [[self titleForState:UIControlStateNormal] intValue] - 1;
                    [self setTitle:@(time).stringValue forState:UIControlStateNormal];
                    if (time==0) {
                        [self removeFromSuperview];
                        
                        //失败次数+1
                        [self.delegate failAction];
                    }
                    
                });
                
            }
            
        });
        
    }
    return self;
}
-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height+20 ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}


- (void)clicked{
    
    
    [self removeFromSuperview];
    
    //成功次数+1
    [self.delegate successAction];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
