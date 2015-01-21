//
//  DateController.h
//  BSBTest
//
//  Created by Manindra on 21/01/15.
//  Copyright (c) 2015 Meritnation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@protocol DateControllerDelegate<NSObject>

- (void)dateChangedTo:(NSString *)chnagedDate;

@end
@interface DateController : UIButton
@property (nonatomic,weak ) UIButton *sender;
@property (nonatomic,weak) id <DateControllerDelegate>  delegate;
- (void)show:(UIButton *)sender;
- (id)initWithDelegate:(id)delegate;
@end



