//
//  ALAnimal.h
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALLocation.h"

@interface ALAnimal : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, copy) NSDate *birthDay;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, strong) NSURL *imageUrl;

@property (nonatomic, strong) NSString *uniqueCode;

@property (nonatomic, strong) NSString *motherUniqueCode;

@property (nonatomic, strong) ALLocation *currentLocation;

@property (nonatomic, strong) NSArray *locations;


+ (ALAnimal *)alAnimalWithDictionary:(NSDictionary *)dict;

@end
