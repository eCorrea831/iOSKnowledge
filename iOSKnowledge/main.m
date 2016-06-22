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
#import "LinkerError.h"
#import "MethodSwizzle.h"

//stack overflow
int fizzbuzz(int);

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
        
        LinkerError * linkerError = [[LinkerError alloc]init];
        NSString * testString = [linkerError greetTheFamily];
        
        //4/5. Try/catch -
        
        NSArray * colors = @[@"Green", @"Purple", @"Pink"];
        int selectedIndex = 3;
        @try {
            NSString * color = colors[selectedIndex];
            NSLog(@"The selected color is: %@", color);
        } @catch(NSException * theException) {
            NSLog(@"An exception occurred: %@", theException.name);
            NSLog(@"Here are some details: %@", theException.reason);
        } @finally {
            NSLog(@"Executing finally block");
        }
        
        //6. Stack overflow error
        
        int i = 1;
        printf("%d\n", fizzbuzz(i));
        
        //7. Method swizzling
        
        MethodSwizzle * example = [[MethodSwizzle alloc]init];
        int originalReturn = [example originalMethod];
        NSLog(@"The int is %d", originalReturn);
        [example swizzleExample];
        int swizzledReturn = [example originalMethod];
        assert(originalReturn == 1); //true
        assert(swizzledReturn == 2); //true
        NSLog(@"The int is now %d", swizzledReturn);
        
        //8. NSDictionary to json conversion failure due to object inside dictionary
        //Prevent these crashes by ...ensuring that you are putting the appropriate object types into a dictionary. Primitive types, for example, are not permitted in NSDictionaries.
        
        NSString * stockString = @"http://finance.yahoo.com/d/quotes.csv?s=GOOG&f=a";
        NSURLSession * session = [NSURLSession sharedSession];
        NSURLSessionDataTask * stockData = [session dataTaskWithURL:[NSURL URLWithString:stockString] completionHandler:^(NSData * data, NSURLResponse *response, NSError * error) {
            
            int stock = *(int*)([data bytes]);;

            NSDictionary * stockDictionary = [[NSDictionary alloc]initWithObjects:stock forKeys:@"Goog"];
        }];
        
        [stockData resume];
        
        //9. When forward declaration is necessary
        //See MONThang.h
        
    }
    return 0;
}

int fizzbuzz(int i) {
    
//    if (i > 100) {
//        return 0;
//    }
//    else {
        if ((i % 3 == 0) && (i % 5 == 0)) {
            printf("fizzbuzz\n");
        }
        else if (i % 3 == 0) {
            printf("fizz\n");
        }
        else if (i % 5 == 0) {
            printf("buzz\n");
        }
        else {
            printf("%d\n", i);
        }
        fizzbuzz(i + 1);
//    }
    return 0;
}
