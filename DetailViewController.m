//
//  DetailViewController.m
//  AtlanTeamTest
//
//  Created by Eugenie Tyan on 20.10.17.
//  Copyright © 2017 Eugenie Tyan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize label1, label2, label3, label4, label5;
@synthesize textField;
@synthesize button;
@synthesize image;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Делаем невидимыми все объекты, будем включать видимость при необходимости
    [label1 setHidden:YES];
    [label2 setHidden:YES];
    [label3 setHidden:YES];
    [label4 setHidden:YES];
    [label5 setHidden:YES];
    [textField setHidden:YES];
    [button setHidden:YES];
    [image setHidden:YES];
    [button setTitle:@"Accept" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
