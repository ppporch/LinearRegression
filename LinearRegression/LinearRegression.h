//
//  LinearRegressionData.h
//  LinearRegression
//
//  Created by Phillip Porch on 1/22/12.
//  Copyright (c) 2012 ThePorchDotCom. All rights reserved.
//
#import "RegressionResult.h"
#import "DataItem.h"
#import "RegressionResult.h"

@interface LinearRegression : NSObject

+ (LinearRegression *)sharedInstance;

- (RegressionResult *)calculateRegression:(NSArray *)data;
- (void)addDataObject:(DataItem *)data;
- (void)clear;
- (RegressionResult *)calculate;

@end
