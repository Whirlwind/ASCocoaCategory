//
//  NSString+ASMD5.m
//  Pods
//
//  Created by Whirlwind on 2016/7/24.
//
//

#import "NSString+ASMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ASMD5)

- (NSString *)as_MD5 {
    const char    *pointer = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];

    CC_MD5(pointer, (CC_LONG)strlen(pointer), md5Buffer);

    NSMutableString *string = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [string appendFormat:@"%02x", md5Buffer[i]];

    return string;
}

@end
