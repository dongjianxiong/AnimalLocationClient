//
//  ALMoreViewController.m
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import "ALMoreViewController.h"
#import "ALQrCodeScanViewController.h"

@interface ALMoreViewController ()

@end

@implementation ALMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(onClickQrCodeScan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view from its nib.
}

- (void)onClickQrCodeScan
{
    ALQrCodeScanViewController *codeScanVc = [[ALQrCodeScanViewController alloc]initWithNibName:@"ALQrCodeScanViewController" bundle:nil];
    [self.navigationController pushViewController:codeScanVc animated:YES];
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
