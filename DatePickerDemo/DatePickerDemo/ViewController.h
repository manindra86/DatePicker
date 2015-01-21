//
//  ViewController.h
//  DatePickerDemo
//
//  Created by Manindra on 21/01/15.
//  Copyright (c) 2015 Meritnation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateController.h"
@interface ViewController : UIViewController<DateControllerDelegate>
- (IBAction)onClickDatePicker:(id)sender;

@end

