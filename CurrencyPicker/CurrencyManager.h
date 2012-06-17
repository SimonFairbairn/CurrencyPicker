//
//  CurrencyManager.h
//  CurrencyPicker
//
//  Created by Simon Fairbairn on 17/06/2012.
//  Copyright (c) 2012 Line In Web Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Currency;

@interface CurrencyManager : NSObject

@property (nonatomic, strong) NSArray* validCurrencies;

- (int) currencyCount;
- (NSString *)titleForPickerForRow:(NSInteger)row;
- (Currency *)infoForCurrencyAtRow:(NSInteger)row;
- (Currency *)infoForCurrencyWithName:(NSString *)name;

@end
