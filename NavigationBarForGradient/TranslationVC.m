//
//  TranslationVC.m
//  NavigationBarForGradient
//
//  Created by 韩陈昊 on 2017/3/13.
//  Copyright © 2017年 韩陈昊. All rights reserved.
//

#import "TranslationVC.h"
#import "UINavigationBar+Gradient.h"

@interface TranslationVC ()<UITableViewDelegate , UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TranslationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"Translation";
    // Do any additional setup after loading the view.
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Translation"];
    cell.textLabel.text = @" This is a Translation NavigationBar ";
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat value = 64;

    if (offsetY > 0) {
        if (offsetY >= value) {
            [self.navigationController.navigationBar ch_setNavigationBarTransformProgress:1 value:value];
        } else {
            [self.navigationController.navigationBar ch_setNavigationBarTransformProgress:(offsetY / value) value:value];

        }
    } else {
        [self.navigationController.navigationBar ch_setNavigationBarTransformProgress:0 value:value];

        self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
    }

}



@end
