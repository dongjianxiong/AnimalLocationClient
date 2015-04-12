//
//  ALAnnotation.m
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import "ALAnnotation.h"


@implementation ALAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subTitle;


- initWithPosition:(CLLocationCoordinate2D) coords {
    if (self = [super init]) {
        self.coordinate = coords;
    }
    
    return self;
}

@end
