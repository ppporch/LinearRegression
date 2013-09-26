//
//  RegressionResult.h
//  PSAdt
//
//  Created by Phillip Porch on 2/25/12.
//  Copyright (c) 2012 ThePorchDotCom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegressionResult : NSObject

@property (nonatomic) double slope;
@property (nonatomic) double intercept;
@property (nonatomic) double correlation;

@end
