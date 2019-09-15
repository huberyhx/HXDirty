//
//  ViewController.m
//  HXDirtyRect
//
//  Created by haoxu.wang on 2019/9/14.
//  Copyright © 2019 haoxu.wang. All rights reserved.
//

#import "ViewController.h"
#import "HXDirtyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HXDirtyView *view = [[HXDirtyView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:view];
}


@end
