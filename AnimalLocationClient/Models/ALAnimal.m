//
//  ALAnimal.m
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import "ALAnimal.h"

@implementation ALAnimal

+ (ALAnimal *)alAnimalWithDictionary:(NSDictionary *)dict
{
    ALAnimal *alAnimal = [[ALAnimal alloc]init];
    alAnimal.name = [dict valueForKey:@"name"];
    alAnimal.age = [[dict valueForKey:@"age"] integerValue];
    alAnimal.gender = [dict valueForKey:@"gender"];
    alAnimal.birthDay = [dict valueForKey:@"birthDay"];
    alAnimal.imageUrl = [NSURL URLWithString:[dict valueForKey:@"imageUrl"]];
    alAnimal.uniqueCode = [dict valueForKey:@"uniqueCode"];
    alAnimal.motherUniqueCode = [dict valueForKey:@"motherUniqueCode"];
    alAnimal.locations = [dict valueForKey:@"locations"];
    alAnimal.currentLocation = [ALLocation alLocationWithDictionary:[dict valueForKey:@"currentLocation"]];
    return alAnimal;
}


@end
