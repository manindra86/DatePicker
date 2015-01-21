//
//  DateController.m
//  BSBTest
//
//  Created by Manindra on 21/01/15.
//  Copyright (c) 2015 Meritnation. All rights reserved.
//

#import "DateController.h"

#ifndef VIEW_WIDTH
#define VIEW_WIDTH [UIApplication sharedApplication].keyWindow.rootViewController.view.bounds.size.width
#endif

#ifndef VIEW_HEIGHT
#define VIEW_HEIGHT [UIApplication sharedApplication].keyWindow.rootViewController.view.bounds.size.height
#endif
//a797c74f7fb964e647f5524e264ad051c441e69d

@implementation DateController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithDelegate:(id)delegate{
    
    if (self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}


- (void)show:(UIButton *)sender {
    self.sender = sender;
    if(![(UIViewController *)self.delegate view])
        return;
    
    self.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT);

    UIButton *dateBackgroundView = self;
   // if(!dateBackgroundView){
       // dateBackgroundView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
        dateBackgroundView.tag = 331;
        dateBackgroundView.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6].CGColor;
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateStyle = NSDateFormatterMediumStyle;
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(5, 50, 250, 100)];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.backgroundColor = [UIColor clearColor];
        datePicker.tag = 5001;
        NSDate *date = [df dateFromString:[self titleForState:UIControlStateNormal]];//change it
        if(!date)
            date = [NSDate date];
        datePicker.date = date;
        
        [datePicker addTarget:self
                       action:@selector(dateChange:)
             forControlEvents:UIControlEventValueChanged];
        
        
        
        float width = datePicker.frame.size.width;
        if(width +20 >VIEW_WIDTH)
            width = VIEW_WIDTH - 20;
        
        UIView *pickerBGView = [[UIView alloc] initWithFrame:CGRectMake(VIEW_WIDTH/2 - width/2 ,VIEW_HEIGHT/2- datePicker.frame.size.height+100/2,width  , datePicker.frame.size.height +100)];
        pickerBGView.backgroundColor = [UIColor whiteColor];
        pickerBGView.layer.cornerRadius = 3;
        
        
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.textColor = [UIColor colorWithRed:.2 green:.3 blue:.6 alpha:.9];
        dateLabel.tag = 3001;
        dateLabel.text = [df stringFromDate:datePicker.date];
        [pickerBGView addSubview:dateLabel];
        
        [pickerBGView addSubview:datePicker];
        
        
        UIView *headerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 50,pickerBGView.frame.size.width  , 2)];
        headerLineView.backgroundColor = [UIColor colorWithRed:.2 green:.3 blue:.6 alpha:.9];
        [pickerBGView addSubview:headerLineView];
        
        
        UIView *footerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, datePicker.frame.origin.y + datePicker.frame.size.height + 5,pickerBGView.frame.size.width  , .3)];
        footerLineView.backgroundColor = [UIColor grayColor];
        [pickerBGView addSubview:footerLineView];
        
        UIButton *doneButton = [[UIButton alloc] initWithFrame:CGRectMake(10, datePicker.frame.origin.y + datePicker.frame.size.height +5, pickerBGView.frame.size.width -20 , 40)];
        [doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        [doneButton addTarget:self action:@selector(doneClicked:) forControlEvents:UIControlEventTouchUpInside];
        doneButton.layer.backgroundColor = [UIColor clearColor].CGColor;
        [pickerBGView addSubview:doneButton];
        
        
        [dateBackgroundView addSubview:pickerBGView];
        
        
        
        [dateBackgroundView addTarget:self action:@selector(removeDateView:) forControlEvents:UIControlEventTouchUpInside];
        
        dateBackgroundView.alpha = 0;
        
        [[(UIViewController *)self.delegate view] addSubview:dateBackgroundView];//change it
        
        [UIView animateWithDuration:0.2 animations:^{
            dateBackgroundView.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
        
  //  }
    
}
- (void)dateChange:(id)sendar{
    UILabel *label = (UILabel *)[self viewWithTag:3001];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    NSString *changedDate = [NSString stringWithFormat:@"%@",
                             [df stringFromDate:[(UIDatePicker *)sendar date]]];
    [label setText:changedDate];
    
    if([self.delegate respondsToSelector:@selector(dateChangedTo:)])
        [self.delegate dateChangedTo:changedDate];
    
    
    
}

- (IBAction)removeDateView:(id)sender{
    
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
    
    
    
    
}

- (IBAction)doneClicked:(id)sender{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    
    UIDatePicker *datePicker =(UIDatePicker *)[self viewWithTag:5001];
    //[self.birthDayButton setTitle:[NSString stringWithFormat:@"%@",[df stringFromDate:[datePicker date]]] forState:UIControlStateNormal];
    NSString *changedDate = [NSString stringWithFormat:@"%@",[df stringFromDate:[datePicker date]]];
    if(self.sender)
        [self.sender setTitle:changedDate forState:UIControlStateNormal];
    
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
    
    
    
    
}



@end
