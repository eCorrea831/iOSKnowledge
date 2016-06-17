//
//  main.m
//  iOSKnowledge
//
//  Created by Aditya Narayan on 6/17/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Zombie.h"
#import "Family.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //1. Zombie crash - objects that are called after they’ve been released and no longer exist.
   
        Zombie * zombieTest = [[Zombie alloc]init];
        NSLog(@"%@", [zombieTest createArray]);
        
        //2. Strong retain cycle -
        
        Family * correa = [[Family alloc]init];
        Child * constantino = [[Child alloc]init];
        correa.child = constantino;
        constantino.family = correa;
        
        //3. Linker error -
        
        
        
        //4. Try/catch -
        
        //5. try/catch with error in try and app crashes
        
        //6. Stack overflow error
        
        //7. Method swizzling
        
        //8. NSDictionary to json conversion failure due to object inside dictionary
        //Prevent these crashes by ...
        
        //9. When forward declaration is necessary
        
    }
    return 0;
}
