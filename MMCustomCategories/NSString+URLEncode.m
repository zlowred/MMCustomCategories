//
//  NSString+URLEncode.m
//  DragonCalcPlus
//
//  Created by Зловред on 22.09.13.
//  Copyright (c) 2013 Max Matveev. All rights reserved.
//

#import "NSString+URLEncode.h"

@implementation NSString(URLEncode)
-(NSString *)urlEncoded {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                 NULL,
                                                                                 (__bridge CFStringRef) self,
                                                                                 NULL,
                                                                                 CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                 kCFStringEncodingUTF8));
}
@end
