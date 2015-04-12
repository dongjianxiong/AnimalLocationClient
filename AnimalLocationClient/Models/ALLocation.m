//
//  ALLocation.m
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import "ALLocation.h"

@implementation ALLocation

+ (ALLocation *)alLocationWithDictionary:(NSDictionary *)dict
{
    ALLocation *alLocation = [[ALLocation alloc]init];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [[dict valueForKey:@"latitude"] floatValue];
    coordinate.longitude = [[dict valueForKey:@"longitude"] floatValue];
    alLocation.coordinate = coordinate;
    alLocation.date = [dict valueForKey:@"date"];
    alLocation.locationAccuracy = [[dict valueForKey:@"locationAccuracy"] intValue];
    return alLocation;
}
@end
