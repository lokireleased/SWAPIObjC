//
//  LBTPlanetController.h
//  SWAPIObjC
//
//  Created by tyson ericksen on 12/5/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBTPlanet.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBTPlanetController : NSObject

+(void)fetchPlanets:(void (^) (NSArray<LBTPlanet *> *, NSError *error))completion;


@end

NS_ASSUME_NONNULL_END
