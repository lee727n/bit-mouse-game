//
//  ViewController.m
//  打地鼠
//
//  Created by Mikez on 2017/5/10.
//  Copyright © 2017年 Mikez. All rights reserved.
//

#import "ViewController.h"
#import "Mouse.h"
@interface ViewController ()<MouseDelegate>
@property (weak, nonatomic) IBOutlet UILabel *failLabel;
@property (weak, nonatomic) IBOutlet UILabel *successLabel;

@end

@implementation ViewController
- (void)successAction{
    self.successLabel.text = @(self.successLabel.text.integerValue+1).stringValue;
}
- (void)failAction{
    self.failLabel.text = @(self.failLabel.text.integerValue+1).stringValue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        while (YES) {
            
            [NSThread sleepForTimeInterval:.8];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                Mouse *m = [[Mouse alloc]initWithFrame:CGRectMake(arc4random()%355, arc4random()%647, 50, 50)];
                m.delegate = self;
                [self.view addSubview:m];
                
                
            });
            
        }
        
    });
    //    
    //    [NSThread detachNewThreadWithBlock:^{
    //           }];
}


//- (void)addMouse {
//    Mouse *m = [[Mouse alloc]initWithFrame:CGRectMake(arc4random()%355, arc4random()%647, 20, 20)];
//    m.delegate = self;
//    [self.view addSubview:m];
//}


@end
