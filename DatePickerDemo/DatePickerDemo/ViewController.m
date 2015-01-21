//
//  ViewController.m
//  DatePickerDemo
//
//  Created by Manindra on 21/01/15.
//  Copyright (c) 2015 Meritnation. All rights reserved.
//

#import "ViewController.h"

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


- (IBAction)onClickDatePicker:(id)sender{
    DateController *dateController = [[DateController alloc] initWithDelegate:self];
    [dateController show:sender];

}

- (void)dateChangedTo:(NSString *)chnagedDate{



}
@end
