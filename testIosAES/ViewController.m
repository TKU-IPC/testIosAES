//
//  ViewController.m
//  testIosAES
//
//  Created by Tseng Chiang An on 2018/1/8.
//  Copyright © 2018年 Tseng Chiang An. All rights reserved.
//

#import "ViewController.h"
#import "CryptLib.h"
#import "NSData+Base64.h"
#import <Foundation/Foundation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnAES128:(id)sender {
    }

- (IBAction)btnAES256:(id)sender {
    NSString *secret = @"This is the text to be encrypted";
    // this is the text that you want to encrypt.
    
    //NSString *key = @"b16920894899c7780b5fc7161560a412";
    NSString *key = @"b16920894899c7780b5fc7161560a412";
    //key = getKey(key);
    //secret key for encryption. To make encryption stronger, we will not use this key directly. We'll first hash the key next step and then use it.
    
    //key = @"b16920894899c7780b5fc7161560a41"; //this is very important, 32 bytes = 256 bit
    
    NSString *iv = @"275d75495a3d196e";
    //Here we are generating random initialization vector (iv). Length of this vector = 16 bytes = 128 bits
    NSData *encryptedData = [[StringEncryption alloc] encrypt:[secret dataUsingEncoding:NSUTF8StringEncoding] key:key iv:iv];
    // Now that we have input text, hashed key and random IV, we are all set for encryption:
    //    NSString *encryptedData = aesEncryptString(secret, key , iv);
    //    //NSData *encryptedData = [[FWEncryptorAES alloc] encrypt:secret Key:key IV:iv];
    //    NSLog(@"encrypted data:: %@", encryptedData); //print the encrypted text
    NSString *encryptedString =[encryptedData base64EncodedStringWithOptions:0];
    
    NSData *decryptedData = [[StringEncryption alloc] decrypt:encryptedData key:key iv:iv];
    NSString *decryptedText = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    _txtResult.text = [NSString stringWithFormat:@"AES256 \niv = %@ \nkey = %@\nPlain text = %@\nCypher text = %@\nBack text = %@",iv,key,secret, encryptedString, decryptedText ];
    ;
    

}
@end
