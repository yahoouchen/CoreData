//
//  Users.h
//  CoreData
//
//  Created by luoliang on 15/2/10.
//  Copyright (c) 2015年 luoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Users : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;

@end
