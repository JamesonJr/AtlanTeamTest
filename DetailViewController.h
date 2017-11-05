//
//  DetailViewController.h
//  AtlanTeamTest
//
//  Created by Eugenie Tyan on 20.10.17.
//  Copyright © 2017 Eugenie Tyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *text1;
@property (weak, nonatomic) IBOutlet UITextView *text2;
- (IBAction) changeJSONData: (id) sender;

@property (assign) NSInteger buffer;
@end
