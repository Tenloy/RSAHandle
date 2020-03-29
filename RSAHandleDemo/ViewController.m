//
//  ViewController.m
//  RSAHandleDemo
//
//  Created by Bairong on 2020/3/29.
//  Copyright © 2020 Roten8. All rights reserved.
//

#import "ViewController.h"
#import "RSAHandle.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *pkcs8Pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCx8DUvfLkHGFo0O9hUPufblFlUVFTmvWegGX0I1MfNNt67hkpzw8+GANneWNl7Nu/5h3qsEyhuyQt4xDk6G4ra9hxr//MG1P6gwhvJ4Q0M3jRevbw3rz9lIspq6MLGOvbiLKBWt0Aqs4x8jPqN1stg/9rRXa49h7bGvyd9QiqFSQIDAQAB\n-----END PUBLIC KEY-----";
    NSString *pkcs8PrivKey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALHwNS98uQcYWjQ72FQ+59uUWVRUVOa9Z6AZfQjUx8023ruGSnPDz4YA2d5Y2Xs27/mHeqwTKG7JC3jEOTobitr2HGv/8wbU/qDCG8nhDQzeNF69vDevP2UiymrowsY69uIsoFa3QCqzjHyM+o3Wy2D/2tFdrj2Htsa/J31CKoVJAgMBAAECgYBUeW42eia5OJVyYMrly+t08iuqflLELD0q447Zh3LHePoq2qkz5kz6GCNWjKXK+hzZQLk7QekbFzTsA3QLoxG68R4P2eSGgIjTJ3TuGms5pNiDSP+m4QI/aC6zMS+9Axv0dTowLeoN7kVs3TV0wvQ0kYTi7nq3/dDut5Trr8Te5QJBANcuFz8L39LbtSyBCQO+N8p/ddlkz5RHOkdPSv6TJ1LZW9B9Sste9PNBKYTRhW9jhjtTkqSCTnhl67GaBmOqqisCQQDTsYafznkfvx3F9+pMVbf9ezrY+p6k0DEoESTeeEXhVe6M7I6S+TZoHomvjK7pe8lxDxptIXKIIzGXcQzzpBhbAkEAoluTjK1/91Bxdh/yVlGrNO5RVHN9MItBzNZmZolPrXJ1lW1EBwkh130+P4n7nV1Bxfe7+MadQLjeSsZFtePquwJBAJl5Nem7zjKG4zX4Q4PuDUMXSRWvtL42Nb0fmMQ1HCx+mUDP65mAVcJsiVOdQd4CIYv28Ci4PAmYwkZR7prgl8sCQF0KITnnTaK69Q7hULUXC5BDEXGIHpnMsZ2THGyKAIccazdoM3v3n8tI+Tps7FkjeAPrrz9F96S+ME0Wjp+oKBE=\n-----END PRIVATE KEY-----";
    //可以用在线网站http://www.metools.info/code/c84.html ,进行PKCS1 PKCS8格式转换
    NSString *pkcs1PrivKey = @"MIICXQIBAAKBgQCx8DUvfLkHGFo0O9hUPufblFlUVFTmvWegGX0I1MfNNt67hkpzw8+GANneWNl7Nu/5h3qsEyhuyQt4xDk6G4ra9hxr//MG1P6gwhvJ4Q0M3jRevbw3rz9lIspq6MLGOvbiLKBWt0Aqs4x8jPqN1stg/9rRXa49h7bGvyd9QiqFSQIDAQABAoGAVHluNnomuTiVcmDK5cvrdPIrqn5SxCw9KuOO2Ydyx3j6KtqpM+ZM+hgjVoylyvoc2UC5O0HpGxc07AN0C6MRuvEeD9nkhoCI0yd07hprOaTYg0j/puECP2guszEvvQMb9HU6MC3qDe5FbN01dML0NJGE4u56t/3Q7reU66/E3uUCQQDXLhc/C9/S27UsgQkDvjfKf3XZZM+URzpHT0r+kydS2VvQfUrLXvTzQSmE0YVvY4Y7U5Kkgk54ZeuxmgZjqqorAkEA07GGn855H78dxffqTFW3/Xs62PqepNAxKBEk3nhF4VXujOyOkvk2aB6Jr4yu6XvJcQ8abSFyiCMxl3EM86QYWwJBAKJbk4ytf/dQcXYf8lZRqzTuUVRzfTCLQczWZmaJT61ydZVtRAcJIdd9Pj+J+51dQcX3u/jGnUC43krGRbXj6rsCQQCZeTXpu84yhuM1+EOD7g1DF0kVr7S+NjW9H5jENRwsfplAz+uZgFXCbIlTnUHeAiGL9vAouDwJmMJGUe6a4JfLAkBdCiE5502iuvUO4VC1FwuQQxFxiB6ZzLGdkxxsigCHHGs3aDN795/LSPk6bOxZI3gD668/RfekvjBNFo6fqCgR";
    
    //加签 验签
    NSString * originalString = @"kkk=123456&name=张三";
    NSString * signString = [RSAHandle signSha1WithRSA:originalString withPriKeyPKCS1:pkcs1PrivKey];
    NSString * signString2 = [RSAHandle signSha1WithRSA:originalString withPriKeyPKCS8:pkcs8PrivKey];
    
    NSLog(@"signString----%@",signString);
    NSLog(@"signString2----%@",signString2);
    
    BOOL isSuccess = [RSAHandle verify:originalString signature:signString withPublicKeyPKCS8:pkcs8Pubkey];
    BOOL isSuccess2 = [RSAHandle verify:originalString signature:signString2 withPublicKeyPKCS8:pkcs8Pubkey];
    
    NSLog(@"isSuccess----%d",isSuccess);
    NSLog(@"isSuccess2----%d",isSuccess2);
    
    //加密 解密
    NSString *encryptString = [RSAHandle encryptString:originalString publicKeyPKCS8:pkcs8Pubkey];
    NSString *decryptString = [RSAHandle decryptString:encryptString privateKeyPKCS1:pkcs1PrivKey];
    NSString *decryptString2 = [RSAHandle decryptString:encryptString privateKeyPKCS8:pkcs8PrivKey];
    NSLog(@"encryptString----%@",encryptString);
    NSLog(@"decryptString----%@",decryptString);
    NSLog(@"decryptString2----%@",decryptString2);
}


@end
