//
//  DetailViewController.m
//  AtlanTeamTest
//
//  Created by Eugenie Tyan on 20.10.17.
//  Copyright © 2017 Eugenie Tyan. All rights reserved.
//

#import "DetailViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface DetailViewController () {
    NSArray* tableCellTitle;
    NSArray* responseJSON;
    NSInteger intForPosts;
    NSInteger intForComments;
}

@end

@implementation DetailViewController

@synthesize label1, label2, label3, label4, label5;
@synthesize textField;
@synthesize button;
@synthesize image;
@synthesize buffer;
@synthesize text1, text2;

- (void)viewDidLoad {
    [super viewDidLoad];
    tableCellTitle = [NSArray arrayWithObjects: @"posts", @"comments", @"users", @"photos", @"todos", nil];
    [self loadDataNew: tableCellTitle [buffer]];
    [button setTitle: @"Accept" forState:UIControlStateNormal];
    intForPosts = 99;
    intForComments = 499;
}

- (void) loadDataNew: (NSString *) cellName{
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    NSString* baseString = @"https://jsonplaceholder.typicode.com/";
    NSString * jsonURL = [baseString stringByAppendingFormat: @"%@/", cellName];
    [manager GET: (jsonURL) parameters: nil progress: nil
         success: ^(NSURLSessionTask* operation, id responseObject) {
        [self showData: responseObject];
    } failure: ^(NSURLSessionTask* operation, NSError* error) {
        NSLog(@"%@", error);
    }];
}

- (void) showData: (NSArray *) inputData {
    if (buffer == 0) {
        NSDictionary* responseObjectData = inputData [intForPosts];
        NSNumber* jsonId = [responseObjectData valueForKey: @"id"];
        NSNumber* userId = [responseObjectData valueForKey: @"userId"];
        NSString* formatTitle = [responseObjectData valueForKey: @"title"];
        NSString* formatBody = [responseObjectData valueForKey: @"body"];
        label1.text = [@"UserId: " stringByAppendingString: [userId stringValue]];
        label2.text = [@"Id: " stringByAppendingString: [jsonId stringValue]];
        text1.text = [@"Title\n" stringByAppendingString: formatTitle];
        text2.text = [@"Body\n" stringByAppendingString: formatBody];
        
        [label3 setHidden: YES];
        [label4 setHidden: YES];
        [label5 setHidden: YES];
        [image setHidden: YES];
    }
    if (buffer == 1) {
        NSDictionary* responseObjectData = inputData [intForComments];
        NSNumber* jsonId = [responseObjectData valueForKey: @"id"];
        NSNumber* postId = [responseObjectData valueForKey: @"postId"];
        NSString* formatName = [responseObjectData valueForKey: @"name"];
        NSString* formatEmail = [responseObjectData valueForKey: @"email"];
        NSString* formatBody = [responseObjectData valueForKey: @"body"];
        label1.text = [@"PostId: " stringByAppendingString: [postId stringValue]];
        label2.text = [@"Id: " stringByAppendingString: [jsonId stringValue]];
        label3.text = [@"Name: " stringByAppendingString: formatName];
        label4.text = [@"E-mail: " stringByAppendingString: formatEmail];
        text2.text = [@"Body\n" stringByAppendingString: formatBody];

        [label5 setHidden: YES];
        [text1 setHidden: YES];
        [image setHidden:YES];
    }
    if (buffer == 2) {
        for (int i = 0; i < 5; i++) {
            if (i == 0) {
                NSDictionary* responseObjectData = inputData [i];
                label1.text = [@"1. " stringByAppendingString: [responseObjectData valueForKey: @"name"] ];
            }
            if (i == 1) {
                NSDictionary* responseObjectData = inputData [i];
                label2.text = [@"2. " stringByAppendingString: [responseObjectData valueForKey: @"name"] ];
            }
            if (i == 2) {
                NSDictionary* responseObjectData = inputData [i];
                label3.text = [@"3. " stringByAppendingString: [responseObjectData valueForKey: @"name"] ];
            }
            if (i == 3) {
                NSDictionary* responseObjectData = inputData [i];
                label4.text = [@"4. " stringByAppendingString: [responseObjectData valueForKey: @"name"] ];
            }
            if (i == 4) {
                NSDictionary* responseObjectData = inputData [i];
                label5.text = [@"5. " stringByAppendingString: [responseObjectData valueForKey: @"name"] ];
            }
            
        }
        [text1 setHidden: YES];
        [text2 setHidden: YES];
        [textField setHidden:YES];
        [button setHidden:YES];
        [image setHidden:YES];
    }
    if (buffer == 3) {
        NSDictionary* responseObjectData = inputData [2];
        NSString* formatURL = [responseObjectData valueForKey: @"url"];
        image.image = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString: formatURL]]];
        [label1 setHidden:YES];
        [label2 setHidden:YES];
        [label3 setHidden:YES];
        [label4 setHidden:YES];
        [label5 setHidden:YES];
        [text1 setHidden: YES];
        [text2 setHidden: YES];
        [textField setHidden:YES];
        [button setHidden:YES];
    }
    if (buffer == 4) {
        NSInteger randomToDo = (arc4random() % 200) - 1;
        NSDictionary* responseObjectData = inputData [randomToDo];
        NSNumber* jsonId = [responseObjectData valueForKey: @"id"];
        NSNumber* userId = [responseObjectData valueForKey: @"userId"];
        NSString* formatTitle = [responseObjectData valueForKey: @"title"];
        NSString* ifCompleted;
        BOOL formatCompleted = [responseObjectData valueForKey: @"completed"];
        if (formatCompleted) {
            ifCompleted = @"Yes";
        }
        else {
            ifCompleted = @"No";
        }
        label1.text = [@"UserId: " stringByAppendingString: [userId stringValue]];
        label2.text = [@"Id: " stringByAppendingString: [jsonId stringValue]];
        label3.text = [@"Title: " stringByAppendingString: formatTitle];
        label4.text = [@"Completed: " stringByAppendingString: ifCompleted];
        [label5 setHidden:YES];
        [textField setHidden:YES];
        [text1 setHidden: YES];
        [text2 setHidden: YES];
        [button setHidden:YES];
        [image setHidden:YES];
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView* view in self.view.subviews)
        [view resignFirstResponder];
}

- (IBAction) changeJSONData: (id) sender {
    NSString* dataFromTextField = textField.text;
    NSInteger intDataFromTextField = [dataFromTextField integerValue];
    if (buffer == 0) {
        if (intDataFromTextField > 100) {
            [label1 setHidden:YES];
            [label2 setHidden:YES];
            [label3 setHidden:YES];
            [label4 setHidden:YES];
            [label5 setHidden:YES];
            [text1 setHidden: YES];
            [image setHighlighted: YES];
            text2.text = @"Enter correct data";
        }
        else {
            intForPosts = intDataFromTextField-1;
            [self loadDataNew: tableCellTitle [buffer]];
        }
    }
    if (buffer == 1) {
        if (intDataFromTextField > 500) {
            [label1 setHidden:YES];
            [label2 setHidden:YES];
            [label3 setHidden:YES];
            [label4 setHidden:YES];
            [label5 setHidden:YES];
            [text1 setHidden: YES];
            [image setHighlighted: YES];
            text2.text = @"Enter correct data";
        }
    }
    else {
        intForComments = intDataFromTextField-1;
        [self loadDataNew: tableCellTitle [buffer]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
