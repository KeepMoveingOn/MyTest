//
//  Person.h
//  Test
//
//  Created by wcq on 2017/7/26.
//  Copyright © 2017年 Aspire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *lastName;
+ (instancetype)share;

@end
