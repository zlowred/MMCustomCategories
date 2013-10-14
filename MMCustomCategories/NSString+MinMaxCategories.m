//
//  NSString+MinMaxCategories.m
//  DragonCalc
//
//  Created by Зловред on 30.04.13.
//  Copyright (c) 2013 Max Matveev. All rights reserved.
//

#import "NSString+MinMaxCategories.h"

@implementation NSString(MinMaxCategories)
+ (NSString *) minOf:(NSString * ) strings, ... {
    va_list args;
    va_start(args, strings);
    NSString *current;
    NSString *min;
    for (current = strings; current != nil; current = va_arg(args, NSString *)) {
        if (!min) {
            min = current;
        } else if ([min compare:current] == NSOrderedDescending) {
            min = current;
        }
    }
    va_end(args);
    return min;
}
+ (NSString *) maxOf:(NSString * ) strings, ... {
    va_list args;
    va_start(args, strings);
    NSString *current;
    NSString *max;
    for (current = strings; current != nil; current = va_arg(args, NSString *)) {
        if (!max) {
            max = current;
        } else if ([max compare:current] == NSOrderedAscending) {
            max = current;
        }
    }
    va_end(args);
    return max;
}
@end
