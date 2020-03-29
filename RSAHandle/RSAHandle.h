//
//  RSAHandle.h
//  RSAHandle
//
//  Created by Bairong on 2020/3/28.
//  Copyright © 2020 BambooL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSAHandle : NSObject

#pragma mark -- 加签 验签
/**
*  加签
*  @param content  需要加签的字符串
*  @param priKey   私钥字符串
*/
+ (NSString *)signSha1WithRSA:(NSString *)content withPriKeyPKCS1:(NSString *)priKey;
+ (NSString *)signSha1WithRSA:(NSString *)content withPriKeyPKCS8:(NSString *)priKey;
/**
*  验签
*  @param content     加签的字符串
*  @param signature   签名
*  @param publicKey   公钥字符串
*/
+ (BOOL)verify:(NSString *)content signature:(NSString *)signature withPublicKeyPKCS1:(NSString *)publicKey;
+ (BOOL)verify:(NSString *)content signature:(NSString *)signature withPublicKeyPKCS8:(NSString *)publicKey;

#pragma mark -- 加密 解密
/**
 *  加密
 *  @param str   需要加密的字符串
 *  @param path  '.der'格式的公钥文件路径
 */
+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;

/**
 *  @param str    需要加密的字符串
 *  @param pubKey 公钥字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKeyPKCS1:(NSString *)pubKey;
+ (NSString *)encryptString:(NSString *)str publicKeyPKCS8:(NSString *)pubKey;

/**
 *  解密
 *  @param str       需要解密的字符串
 *  @param path      '.p12'格式的私钥文件路径
 *  @param password  私钥文件密码
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;

/**
 *  @param str     需要解密的字符串
 *  @param privKey 私钥字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKeyPKCS1:(NSString *)privKey;
+ (NSString *)decryptString:(NSString *)str privateKeyPKCS8:(NSString *)privKey;


@end

NS_ASSUME_NONNULL_END
