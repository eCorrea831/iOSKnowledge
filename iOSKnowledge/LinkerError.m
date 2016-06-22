//
//  LinkerError.m
//  iOSKnowledge
//
//  Created by Aditya Narayan on 6/20/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "LinkerError.h"
#import "Family.h"

@implementation LinkerError

- (NSString *)greetTheFamily:(Family *)family {
    self.greetingString = [NSString stringWithFormat:@"Hello, %@ family!", family];
    return self.greetingString;
}

@end
