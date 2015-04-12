//
//  ALLocation.h
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef enum LocationAccuracy{
    GPS = 0,
    GSM
}LocationAccuracy;

@interface ALLocation : NSObject

@property (nonatomic, assign) CLLocationCoordinate2D  coordinate;

@property (nonatomic, strong) NSString *date;

@property (nonatomic, assign) LocationAccuracy locationAccuracy;

+ (ALLocation *)alLocationWithDictionary:(NSDictionary *)dict;

@end
