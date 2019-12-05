//
//  LBTPlanet.h
//  SWAPIObjC
//
//  Created by tyson ericksen on 12/5/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBTPlanet : NSObject

@property (nonatomic, readonly, copy) NSString *planetName;
@property (nonatomic, readonly, copy) NSString *climate;
@property (nonatomic, readonly, copy) NSString *population;
@property (nonatomic, readonly, copy) NSString *year;
@property (nonatomic, readonly, copy) NSString *day;

-(instancetype)initWithPlanetName:(NSString *)planetName
                          climate:(NSString *)climate
                       population:(NSString *)population
                             year:(NSString *)year
                              day:(NSString *)day;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

