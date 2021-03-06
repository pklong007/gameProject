//
//  WKMessageProgressHUD.m
//  WKProgressHUD
//
//  Created by Welkin Xie on 3/8/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import "WKMessageProgressHUD.h"

@implementation WKMessageProgressHUD

- (void)addText {
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.text = self.text;
    self.textLabel.textColor = [UIColor whiteColor];
    
    self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.textLabel sizeToFit];
    
    NSUInteger line = CGRectGetWidth(self.textLabel.frame) / (CGRectGetWidth([UIScreen mainScreen].bounds) - 130);
    if (line >= 1) {
        self.textLabel.numberOfLines = line + 1;
        self.textLabel.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - 130, CGRectGetHeight(self.textLabel.frame));
        CGSize size = [self.textLabel sizeThatFits:self.textLabel.frame.size];
        self.textLabel.frame = CGRectMake(0, 0, size.width, size.height);
    }
}

- (void)compositeElements {
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.textLabel.frame) + 35, CGRectGetHeight(self.textLabel.frame) + 35)];
    self.backView.center = CGPointMake(CGRectGetMidX(self.selfView.frame), CGRectGetMidY(self.selfView.frame));
    self.backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    self.backView.layer.cornerRadius = 10;
    
    self.textLabel.center = CGPointMake(CGRectGetMidX(self.backView.bounds), CGRectGetMidY(self.backView.bounds));
    
    [self.backView addSubview:self.textLabel];
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com