//
//  WWViewController.m
//  WWPageController
//
//  Created by IDwangluting on 01/10/2019.
//  Copyright (c) 2019 IDwangluting. All rights reserved.
//

#import "WWViewController.h"
#import <WWPageController/WWPageLineMenu.h>
#import "WWTestViewController.h"
#import <YYKit/UIColor+YYAdd.h>
#import <WWBaseLib/UIView+frame.h>

@interface WWViewController ()<WWPageViewControllerDelegate>

@property (nonatomic,strong) NSArray * titles;
@property (nonatomic,strong)WWPageLineMenu *pageMenu;

@property(nonatomic, strong) WWTestViewController *allEarningsSmartGroupListViewController;
@property(nonatomic, strong) WWTestViewController *yearEarningsSmartGroupListViewController;
@property(nonatomic, strong) WWTestViewController *sucessRateSmartGroupListViewController;
@property(nonatomic, strong) WWTestViewController *maxbackSmartGroupListViewController;

@end

@implementation WWViewController {
    WWPageLineMenu *_menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xF5F5F5];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.navigationController.navigationBar.translucent = YES;
    self.title = @"智选组合";
    self.view.backgroundColor = [UIColor whiteColor];
    self.titles = [NSArray arrayWithObjects:@"年化收益", @"总收益", @"成功率", @"最大回撤", nil];
    [self pageMenu];
    self.delegate = self;
    [self reloadData];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.menu.y  = self.navigationController.navigationBar.bottom;
    self.scrollView.y = self.menu.bottom;
}

- (WWPageLineMenu *)pageMenu {
    if (!_menu) {
        _menu = [[WWPageLineMenu alloc] initWithFrame:CGRectMake(0, 0, 0, 45)];
        _menu.normalColor = [UIColor colorWithRGB:0x999999];
        _menu.selectedColor = [UIColor colorWithRGB:0x3c3c3c];
        _menu.lineColor = [UIColor colorWithRGB:0xFF5A1C];
        _menu.font = [UIFont systemFontOfSize:16];
        _menu.bottomViewBGColor = [UIColor colorWithRGB:0xF2F3F6];
        _menu.bottomViewHeight = 0;
        _menu.lineWidth = 20;
        [_menu sizeToFit];
        _menu.frame = CGRectMake(0, 100, self.view.width / (self.titles.count * 2 + 1), 45);
        _menu.backgroundColor = [UIColor whiteColor];
    }
    return _menu;
}

- (NSInteger)numberOfPages:(WWPageViewController *)controller {
    return self.titles.count;
}

- (UIViewController *)pageControllerForIndex:(NSInteger)index{
    switch (index) {
        case 0:
            return self.yearEarningsSmartGroupListViewController;
            break;
        case 1:
            return self.allEarningsSmartGroupListViewController;
            break;
        case 2:
            return self.sucessRateSmartGroupListViewController;
            break;
        case 3:
            return self.maxbackSmartGroupListViewController;
            break;
        default:
            return [[UIViewController alloc] init];
            break;
    }
}



- (NSString*)pageController:(WWPageViewController *)controller titleForPageIndex:(NSInteger)index {
    return self.titles[index];
}

- (WWPageMenu *)pageMenu:(WWPageViewController *)controller {
    return [self pageMenu];
}

- (UIColor *)pageController:(WWPageViewController *)controller colorAtIndex:(NSInteger)index {
    return [UIColor colorWithRGB:0xFF7700];
}

- (void)pageController:(WWPageViewController *)controller didSlideAtindex:(NSInteger)index {}

- (void)pageController:(WWPageViewController *)controller didSelectedAtindex:(NSInteger)index {}



- (WWTestViewController *)yearEarningsSmartGroupListViewController{
    if (!_yearEarningsSmartGroupListViewController) {
        _yearEarningsSmartGroupListViewController = [[WWTestViewController alloc]init];
        _yearEarningsSmartGroupListViewController.view.backgroundColor = [UIColor redColor];
    }
    return _yearEarningsSmartGroupListViewController;
}

- (WWTestViewController *)allEarningsSmartGroupListViewController{
    if (!_allEarningsSmartGroupListViewController) {
        _allEarningsSmartGroupListViewController = [[WWTestViewController alloc]init];
        _allEarningsSmartGroupListViewController.view.backgroundColor = [UIColor greenColor];
    }
    return _allEarningsSmartGroupListViewController;
}

- (WWTestViewController *)sucessRateSmartGroupListViewController{
    if (!_sucessRateSmartGroupListViewController) {
        _sucessRateSmartGroupListViewController = [[WWTestViewController alloc]init];
        _sucessRateSmartGroupListViewController.view.backgroundColor = [UIColor brownColor];
    }
    return _sucessRateSmartGroupListViewController;
}

- (WWTestViewController *)maxbackSmartGroupListViewController{
    if (!_maxbackSmartGroupListViewController) {
        _maxbackSmartGroupListViewController = [[WWTestViewController alloc]init];
        _sucessRateSmartGroupListViewController.view.backgroundColor = [UIColor blackColor];
    }
    return _maxbackSmartGroupListViewController;
}


@end
