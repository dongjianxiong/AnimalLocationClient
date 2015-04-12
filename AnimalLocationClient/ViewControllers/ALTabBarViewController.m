//
//  ALTabBarViewController.m
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import "ALTabBarViewController.h"
#import "ALMapViewController.h"
#import "ALAnimalsTableViewController.h"
#import "ALMoreViewController.h"

@interface ALTabBarViewController ()

@end

@implementation ALTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ALMapViewController *mapVc = [[ALMapViewController alloc]initWithNibName:@"ALMapViewController" bundle:nil];
    UINavigationController *mapNavi = [[UINavigationController alloc]initWithRootViewController:mapVc];
    mapVc.title = @"定位";
    
    
    ALAnimalsTableViewController *animalsVc = [[ALAnimalsTableViewController alloc]initWithNibName:@"ALAnimalsTableViewController" bundle:nil];
    animalsVc.title = @"列表";
    UINavigationController *animalNavi = [[UINavigationController alloc]initWithRootViewController:animalsVc];
    
    ALMoreViewController *moreVc = [[ALMoreViewController alloc]initWithNibName:@"ALMoreViewController" bundle:nil];
    moreVc.title = @"更多";
    UINavigationController *moreNavi = [[UINavigationController alloc]initWithRootViewController:moreVc];
    
    self.viewControllers = [NSArray arrayWithObjects:mapNavi,animalNavi,moreNavi, nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
