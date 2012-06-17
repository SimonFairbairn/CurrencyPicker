//
//  CPViewController.m
//  CurrencyPicker
//
//  Created by Simon Fairbairn on 14/06/2012.
//  Copyright (c) 2012 Line In Web Design. All rights reserved.
//

#import "CPViewController.h"
#import "CurrencyManager.h"
#import "Currency.h"

@interface CPViewController ()

@property (strong, nonatomic) CurrencyManager* currencyCodes;


@end

@implementation CPViewController

@synthesize picker = _picker;
@synthesize localCurrency = _localCurrency;
@synthesize internationalCurrency = _internationalCurrency;
@synthesize currencyCodes = _currencyCodes;
@synthesize country = _country;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
    self.currencyCodes = [[CurrencyManager alloc] init];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) buttonPressed {
    // NSInteger selectedCurrency = [self.picker selectedRowInComponent:0];
    
    Currency* item = [self.currencyCodes infoForCurrencyAtRow:[self.picker selectedRowInComponent:0]];
    
    self.localCurrency.text = item.symbol;
    self.internationalCurrency.text = item.code;
    self.country.text = item.name;
}


#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    
    return self.currencyCodes.currencyCount;
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
 

    return [self.currencyCodes titleForPickerForRow:row];

}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {

}



@end
