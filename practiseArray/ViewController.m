//
//  ViewController.m
//  practiseArray
//
//  Created by Наташа on 12.04.18.
//  Copyright © 2018 Наташа. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Create NSArray, containing several strings, using literal declaration.
    NSArray *arr = [NSArray arrayWithObjects:(@"First",@"Second",@"Third", nil)];
    
    //Create mutable array from piviously created NSArray.
    NSMutableArray *arr1 = [NSMutableArray arrayWithArray:arr];
    
    //Create an empty array and obtain its first and last element in a safe way.
    NSArray *array = [[NSArray alloc] init];
    NSString *strFirst = [array firstObject];
    NSString *strLast = [array lastObject];
    
    //Create NSArray, containing strings from 1 to 20
    NSArray *arrWith20Obj = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", nil];
    //Get its shallow copy and real deep copy.
    NSArray *shallowCopyArray = [arrWith20Obj copyWithZone:nil];
   /* for (NSString *i in shallowCopyArray){
        NSLog(@"Element is: %@",i);
    } */
    NSArray *deepCopy = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:arrWith20Obj]];
    //Iterate over array and obtain item at index 13. Print an item.
    NSUInteger index = 13;
    [arrWith20Obj enumerateObjectsUsingBlock:^(id obj,NSUInteger idx, BOOL *stop){
        if(idx=index){
            NSLog(@"Object %@ is on the %i position",arrWith20Obj[idx-1],idx);
            *stop = YES;
        };
    }];
  //Make array mutable. Add two new entries to the end of the array, add an entry to the beginning of the array. Iterate over an array and remove item at index 5.
    NSMutableArray *arrMut = [NSMutableArray arrayWithArray:arrWith20Obj];
    [arrMut addObject:(@"21")];
    [arrMut addObject:(@"22")];
    for (NSString *i in arrMut){
        NSLog(@"Element is: %@",i);
    } 
    [arrMut removeObjectAtIndex:5];
   /* for (NSString *i in arrMut){
        NSLog(@"Element is: %@",i);
    } */
//Create new array of mixed numbers. Sort it in an ascending and descending order.
    NSArray *numbers = [NSArray arrayWithObjects: @"4",@"2",@"7",@"6",nil];
    NSArray *sortedArrayAscending = [numbers sortedArrayUsingComparator: ^(id obj1, id obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSArray *sortedArrayDescending = [numbers sortedArrayUsingComparator:^(id obj1, id obj2) {
        if([obj1 integerValue] < [obj2 integerValue]){
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
}
    - (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
