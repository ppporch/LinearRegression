LinearRegression
================

Objective C Linear Regression calculations

This is a very small objective c set of routines to calculate a linear regression. The original version took
an array of x,y objects and calculated  the regression coefficient, the y intercept and the correlation coefficient.

The new and improved program will take individual x,y data items and add to an internal working array. It can
clear the array, calculate the correlation parameters with the current working array, and return the current array. 
I left in the original calculation routine in place for backwards compatibility. The program does sort the array
by x values prior to calculating the correlation in case any objects were added out of order.

ppporch@theporch.com
