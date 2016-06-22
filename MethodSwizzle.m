//
//  MethodSwizzle.m
//  iOSKnowledge
//
//  Created by Aditya Narayan on 6/20/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "MethodSwizzle.h"
#import <objc/runtime.h>

static IMP __original_Method_Imp;
int _replacement_Method(id self, SEL _cmd)
{
    assert([NSStringFromSelector(_cmd) isEqualToString:@"originalMethod"]);
    int returnValue = ((int(*)(id,SEL))__original_Method_Imp)(self, _cmd);
    return returnValue + 1;
}

@implementation MethodSwizzle

- (void) swizzleExample {
    Method m = class_getInstanceMethod([self class],
                                       @selector(originalMethod));
    __original_Method_Imp = method_setImplementation(m,
                                                     (IMP)_replacement_Method);
}
- (int) originalMethod {

    assert([NSStringFromSelector(_cmd) isEqualToString:@"originalMethod"]);
    return 1;
}

@end
