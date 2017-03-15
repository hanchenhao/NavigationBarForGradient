//
//  GradientVC.m
//  NavigationBarForGradient
//
//  Created by 韩陈昊 on 2017/3/9.
//  Copyright © 2017年 韩陈昊. All rights reserved.
//

#import "GradientVC.h"
#import "UINavigationBar+Gradient.h"
@interface GradientVC ()<UITableViewDelegate , UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GradientVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = YES;
    self.title = @"Gradient";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController.navigationBar ch_setBackgroundColor:[UIColor clearColor]];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Gradient"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Gradient"];
    }
    cell.textLabel.text = @" This is a Gradient NavigationBar";
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UIColor *color = [UIColor whiteColor];
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > 0) {
        CGFloat alpha = MIN(1, 1 - (( 64 - offsetY) / 64));
        [self.navigationController.navigationBar ch_setBackgroundColor:color alpha:alpha];
        
    } else {
        [self.navigationController.navigationBar ch_setBackgroundColor:color alpha:0];
        
    }
    
}



@end
