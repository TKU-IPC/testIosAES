# testIosAES
AES for iOS

AES 256：

    NSString *secret = @"This is the text to be encrypted"; // 明文
    NSString *key = @"b16920894899c7780b5fc7161560a412"; // Key
    NSString *iv = @"275d75495a3d196e"; // Vector
    NSData *encryptedData = [[StringEncryption alloc] encrypt:[secret dataUsingEncoding:NSUTF8StringEncoding] key:key iv:iv];
    NSString *encryptedString =[encryptedData base64EncodedStringWithOptions:0];
    NSData *decryptedData = [[StringEncryption alloc] decrypt:encryptedData key:key iv:iv];
    NSString *decryptedText = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    _txtResult.text = [NSString stringWithFormat:@"AES256 \niv = %@ \nkey = %@\nPlain text = %@\nCypher text = %@\nBack text = %@",iv,key,secret, encryptedString, decryptedText ];    
