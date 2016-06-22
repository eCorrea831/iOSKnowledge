//
//  LinkerError.h
//  iOSKnowledge
//
//  Created by Aditya Narayan on 6/20/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Family.h"

@interface LinkerError : NSObject

@property (nonatomic, retain) Family * leo;
@property (nonatomic, retain) NSString * greetingString;

- (NSString *)greetTheFamily:(Family *)family;

@end
