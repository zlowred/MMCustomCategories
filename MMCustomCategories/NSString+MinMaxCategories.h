//
//  NSString+MinMaxCategories.h
//  DragonCalc
//
//  Created by Зловред on 30.04.13.
//  Copyright (c) 2013 Max Matveev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(MinMaxCategories)
+ (NSString *) minOf:(NSString * ) strings, ...;
+ (NSString *) maxOf:(NSString * ) strings, ...;
@end
