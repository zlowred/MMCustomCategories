//
//  NSString+Digest.h
//  DragonCalc
//
//  Created by Зловред on 14.03.13.
//  Copyright (c) 2013 Max Matveev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString(Digest)
-(NSString *)sha1;
-(NSString *)md5;
@end
