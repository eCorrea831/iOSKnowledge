//
//  Zombie.m
//  iOSKnowledge
//
//  Created by Aditya Narayan on 6/17/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie

- (NSArray *)createArray {

    NSArray * array = [[NSArray alloc]init];
    
    array = @[@"I", @"am", @"a", @"zombie"];
    [array release];
    
    return array;
}

@end
