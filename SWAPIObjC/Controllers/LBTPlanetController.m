//
//  LBTPlanetController.m
//  SWAPIObjC
//
//  Created by tyson ericksen on 12/5/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBTPlanetController.h"

//https://swapi.co/api/planets/?format=json

NSString *baseURLString = @"https://swapi.co/api/";
NSString *planetComponent = @"planets/";

@implementation LBTPlanetController

+(void)fetchPlanets:(void (^)(NSArray<LBTPlanet *> *, NSError *))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURLQueryItem *jsonFormat = [NSURLQueryItem queryItemWithName:@"format" value:@"json"];
    NSURL *planetURL = [baseURL URLByAppendingPathComponent:planetComponent];
    NSURLComponents *combinedURL = [NSURLComponents componentsWithURL:planetURL resolvingAgainstBaseURL:true];
    combinedURL.queryItems =@[jsonFormat];
    NSURL *finalURL = combinedURL.URL;
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion([NSArray new], error);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
            
        }
        if (!data)
        {
            NSLog(@"%@", error);
            completion([NSArray new], error);
            return;
        }
        
        NSMutableArray *planets = [NSMutableArray new];
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *resultsArray = topLevelDictionary[@"results"];
        for (NSDictionary *dataDictionary in resultsArray)
        {
            
            LBTPlanet *newPlanet = [[LBTPlanet alloc] initWithDictionary:dataDictionary];
            [planets addObject:newPlanet];
        }
        
        return completion(planets, nil);
        
    }] resume];
}

@end
