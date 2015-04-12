//
//  ALQrCodeScanViewController.m
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import "ALQrCodeScanViewController.h"
#import <ZBarSDK/ZBarSDK.h>

@interface ALQrCodeScanViewController ()<ZBarReaderDelegate>

@end

@implementation ALQrCodeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(onClickScan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view from its nib.
}


- (void)onClickScan
{
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    ZBarImageScanner *scanner = reader.scanner;
    
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    [self presentViewController:reader animated:YES completion:^{
        
    }];
}

//代理方法

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    
    NSLog(@"info=%@",info);
    // 得到条形码结果
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results){
        NSLog(@"%@",symbol.data);

    }

        // EXAMPLE: just grab the first barcode
//        break;

    // 将获得到条形码显示到我们的界面上
//    resultText.text = symbol.data;
    
    // 扫描时的图片显示到我们的界面上
//    resultImage.image =
//    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // 扫描界面退出
    [reader dismissViewControllerAnimated:YES completion:^{
        
    }];
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
