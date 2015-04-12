//
//  ALMapViewController.h
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface ALMapViewController : ALViewController

@property (nonatomic, assign) CLLocationCoordinate2D currentLocation;

@end
