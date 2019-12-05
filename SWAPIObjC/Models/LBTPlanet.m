//
//  LBTPlanet.m
//  SWAPIObjC
//
//  Created by tyson ericksen on 12/5/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBTPlanet.h"

@implementation LBTPlanet

- (instancetype)initWithPlanetName:(NSString *)planetName climate:(NSString *)climate population:(NSString *)population year:(NSString *)year day:(NSString *)day
{
    self = [super init];
    if (self) {
        _planetName = [planetName copy];
        _climate = [climate copy];
        _population = [population copy];
        _year = [year copy];
        _day = [day copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *planetName = dictionary[@"name"];
    NSString *climate = dictionary[@"climate"];
    NSString *population = dictionary[@"population"];
    NSString *year = dictionary[@"orbital_period"];
    NSString *day = dictionary[@"rotation_period"];
    
    return [self initWithPlanetName:planetName climate:climate population:population year:year day:day];
}

@end
