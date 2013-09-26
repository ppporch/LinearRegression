---
Title: Objective C Linear Regression
---
I was working on a small iPhone project that required a linear
regression but was not able to find anything written in objective
C. I decided to create an Objective C class to do this and decided
to share it with others. The original version took an array of x,y objects
and did the regression analysis on it. I reworked this to have 
a shared instance and allow addition of single x,y objects (each with
double values). There is a clear method to clear the stored array.

Methods:

+ (LinearRegression *)sharedInstance; creates a singleton
- (void)addDataObject:(DataItem *)data; adds an x,y object to the array
- (void)clear; clears the data array
- (RegressionResult *)calculate; calculates the regression with the current
   array
- (RegressionResult *)calculateRegression:(NSArray *)thearray; older method
   that allowed passing an entire array in for calculation
- (NSArray *)getArray; gets the current working array of x,y objects

✂------✂------✂------✂------✂------✂------✂------✂------✂------✂------

Phillip Porch ppporch@theporch.com
