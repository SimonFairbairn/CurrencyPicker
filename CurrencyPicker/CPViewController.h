//
//  CPViewController.h
//  CurrencyPicker
//
//  Created by Simon Fairbairn on 14/06/2012.
//  Copyright (c) 2012 Line In Web Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel* localCurrency;
@property (weak, nonatomic) IBOutlet UILabel* internationalCurrency;
@property (weak, nonatomic) IBOutlet UILabel* country;

- (IBAction) buttonPressed;

@end
