//
//  ViewController.m
//  CoreData
//
//  Created by luoliang on 15/2/9.
//  Copyright (c) 2015年 luoliang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Users.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  
    [self test1_2];
    [self test1_3];

    [self test2];
 
}


-(void)test1_2{
    //插入数据
    AppDelegate *appd=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=appd.managedObjectContext;
    Users *user=[NSEntityDescription insertNewObjectForEntityForName:@"Users"inManagedObjectContext:context];
    
//    NSEntityDescription *enti=[NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
//    Users *user=[[Users alloc]initWithEntity:enti insertIntoManagedObjectContext:context];
    
    user.name=@"lis2i";
    user.age=@521;
    [context save:nil];
}
-(void)test1_3{
    //更新数据
    AppDelegate* app=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =app.managedObjectContext;
    NSFetchRequest* res= [NSFetchRequest fetchRequestWithEntityName:@"Users"];
    NSArray *arr=[context executeFetchRequest:res error:nil];
    for (Users *user in arr) {
        if ([user.name isEqualToString:@"lisi"]) {
            user.age=@16;
            [user.managedObjectContext save:nil];
        }
    }
}

-(void)test2{
    //展示数据
    
    AppDelegate* app=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =app.managedObjectContext;
    NSFetchRequest* res= [NSFetchRequest fetchRequestWithEntityName:@"Users"];
    NSArray *arr=[context executeFetchRequest:res error:nil];
    for (Users *user in arr) {
        NSLog(@"\nName is :%@,\nAge is :%@",user.name,user.age);
    }

}
-(void)test1{
    AppDelegate* app=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =app.managedObjectContext;
    
    NSManagedObject *row = [NSEntityDescription
                            insertNewObjectForEntityForName:@"Users"
                            inManagedObjectContext:context];
    
    
    
    [row setValue:@"Test Bank" forKey:@"name"];
    [row setValue:@1 forKey:@"age"];
    
    NSLog(@"%@",[row valueForKey:@"name"]);
    NSLog(@"%@",row);
    
    [context save:nil];
}

@end
