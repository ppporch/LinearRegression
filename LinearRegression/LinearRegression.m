//
//  LinearRegressionData.m
//  LinearRegression
//
//  Created by Phillip Porch on 1/22/12.
//  Copyright (c) 2012 ThePorchDotCom. All rights reserved.
//
// This linear regression calculator object expects to be passed an
// Array of x,y values that are doubles

#import "LinearRegression.h"
#import "DataItem.h"

@interface LinearRegression()

@property (nonatomic, strong) NSMutableArray *workingArray;
@property (nonatomic) double slope;
@property (nonatomic) double intercept;
@property (nonatomic) double correlation;
@property (nonatomic) double sumY;
@property (nonatomic) double sumX;
@property (nonatomic) double sumXY;
@property (nonatomic) double sumX2;
@property (nonatomic) double sumY2;

@end

@implementation LinearRegression


+ (LinearRegression *)sharedInstance
{
    static LinearRegression *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}


- (NSMutableArray *)workingArray {
    if (!_workingArray) {
        _workingArray = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _workingArray;
}

- (void)addDataObject:(DataItem *)data {
    [self.workingArray addObject:data];
}
- (void)clear {
    [self.workingArray removeAllObjects];
}

- (NSArray *)getArray {
    return [self.workingArray copy];
}

// The calculate method assumes that you have passed the x,y data in via the
// addDataObject method. It sorts the array to make sure the x values are
// in order and then returns a RegressionResult object

- (RegressionResult *)calculate {
    RegressionResult *result = [[RegressionResult alloc] init];
    NSInteger theNumber = [self.workingArray count];
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"xValue"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray;
    sortedArray = [self.workingArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sumY = 0.0;
    self.sumX = 0.0;
    self.sumXY = 0.0;
    self.sumX2 = 0.0;
    self.sumY2 = 0.0;
    
    for (DataItem *data in sortedArray) {
        self.sumX = self.sumX + data.xValue;
        self.sumY = self.sumY + data.yValue;
        self.sumXY = self.sumXY + (data.xValue * data.yValue);
        self.sumX2 = self.sumX2 + (data.xValue * data.xValue);
        self.sumY2 = self.sumY2 + (data.yValue * data.yValue);
    }
    result.slope = ((theNumber * self.sumXY) - (self.sumX * self.sumY)) / ((theNumber * self.sumX2) - (self.sumX * self.sumX));
    result.intercept = ((self.sumY * self.sumX2 - (self.slope * self.sumXY)))/((theNumber * self.sumX2) - (self.sumX * self.sumX));
    result.correlation = ((theNumber * self.sumXY) - (self.sumX * self.sumY)) / (sqrt(theNumber * self.sumX2 - (self.sumX * self.sumX)) * sqrt(theNumber * self.sumY2 - (self.sumY * self.sumY)));
    return result;
}

- (RegressionResult *)calculateRegression:(NSArray *)theArray {
    
    // theArray should be an array of DataItem objects that each contain
    // two double numbers ( the x and y value of the data)
    // if you created the original array as a NSMutableArray so you could add
    // objects, you will probably want to make a copy like
    // NSArray *theArray = [mutableArray copy]; and then call the linearRegression object like
    // [instanceOfLinearRegressionData calculateRegression:theArray];
    RegressionResult *result = [[RegressionResult alloc] init];
    NSInteger theNumber = theArray.count;
    self.sumY = 0.0;
    self.sumX = 0.0;
    self.sumXY = 0.0;
    self.sumX2 = 0.0;
    self.sumY2 = 0.0;

    for (DataItem *data in theArray) {
        self.sumX = self.sumX + data.xValue;
        self.sumY = self.sumY + data.yValue;
        self.sumXY = self.sumXY + (data.xValue * data.yValue);
        self.sumX2 = self.sumX2 + (data.xValue * data.xValue);
        self.sumY2 = self.sumY2 + (data.yValue * data.yValue);
    }
    result.slope = ((theNumber * self.sumXY) - self.sumX * self.sumY) / ((theNumber * self.sumX2) - (self.sumX * self.sumX));
    result.intercept = ((self.sumY - (self.slope * self.sumX))/theNumber);
    result.correlation = ((theNumber * self.sumXY) - (self.sumX * self.sumY)) / (sqrt(theNumber * self.sumX2 - (self.sumX * self.sumX)) * sqrt(theNumber * self.sumY2 - (self.sumY * self.sumY)));
    return result;
}

@end
