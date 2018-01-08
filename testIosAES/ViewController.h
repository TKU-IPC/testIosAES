//
//  ViewController.h
//  testIosAES
//
//  Created by Tseng Chiang An on 2018/1/8.
//  Copyright © 2018年 Tseng Chiang An. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)btnAES128:(id)sender;
- (IBAction)btnAES256:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *txtResult;

@end

