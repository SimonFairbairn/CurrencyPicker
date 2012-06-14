//
//  Currency.h
//  CurrencyPicker
//
//  Created by Simon Fairbairn on 14/06/2012.
//  Copyright (c) 2012 Line In Web Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject

- (int) currencyCount;
- (NSString *)titleForPickerForRow:(NSInteger)row;
- (NSDictionary *)infoForCurrencyAtRow:(NSInteger)row;


@end
