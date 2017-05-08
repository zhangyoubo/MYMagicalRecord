//
//  ViewController.m
//  MYMagicalRecord
//
//  Created by 张友波 on 16/8/11.
//  Copyright © 2016年 张友波. All rights reserved.
//

#import "ViewController.h"
#import "PersonModel.h"
#import <MagicalRecord/MagicalRecord.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initData];
    [self record];
    
    NSNumber *number1= [PersonModel MR_numberOfEntities];  // 单元个数
    NSNumber *number2= [PersonModel MR_numberOfEntitiesWithContext:[NSManagedObjectContext MR_defaultContext]];
    NSNumber *number3= [PersonModel MR_numberOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"age==%@",@"24"]];
    NSLog(@"number1.................%d",number1.intValue);
    NSLog(@"number2.................%d",number2.intValue);
    NSLog(@"number3.................%d",number3.intValue);
    
    BOOL hasAtLeastOne= [PersonModel MR_hasAtLeastOneEntity];  // 是否存在至少一个单元
    
    NSLog(@"hasAtLeastOne.................%d",hasAtLeastOne);
    
}

-(void)initData{
    
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    
    PersonModel *person1=[PersonModel MR_createEntity];
    person1.name=@"one";
    person1.age=@"21";
    person1.address=@"shanghai";
    [arr addObject:person1];
  
    PersonModel *person2=[PersonModel MR_createEntity];
    person2.name=@"one";
    person2.age=@"22";
    person2.address=@"beijing";
    [arr addObject:person2];
    
    PersonModel *person3=[PersonModel MR_createEntity];
    person3.name=@"one";
    person3.age=@"23";
    person3.address=@"guangzhou";
    [arr addObject:person3];
    
    PersonModel *person4=[PersonModel MR_createEntity];
    person4.name=@"one";
    person4.age=@"24";
    person4.address=@"nanjing";
    [arr addObject:person4];
    
    PersonModel *person5=[PersonModel MR_createEntity];
    person5.name=@"one";
    person5.age=@"25";
    person5.address=@"tianjing";
    [arr addObject:person5];

    /**************************************增******************************************/
    
    for (int i=0;i<[arr count]; i++) {
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
    }
    
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError * __MR_nullable error){
//        
//        NSLog(@"contextDidSave..............%d",contextDidSave);
//        
//    }];
    
    /**************************************增******************************************/
    
}

-(void)record{
    
    /**************************************查******************************************/
    //NSArray *array = [PersonModel MR_findAllSortedBy:@"name" ascending:YES];
    NSArray *array=[PersonModel MR_findAllInContext:[NSManagedObjectContext MR_defaultContext]];
    for (int i=0;i<[array count]; i++) {
         PersonModel *person=[array objectAtIndex:i];
         
         NSLog(@"name.................%@",person.name);
         NSLog(@"age..................%@",person.age);
         NSLog(@"address..............%@",person.address);
    }
    
//     NSArray *personsAgeEuqals21   = [PersonModel MR_findByAttribute:@"age" withValue:@"21"];
//    NSArray *personsAgeEuqals21   = [PersonModel MR_findAllSortedBy:@"name" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"name==%@ AND age==%@",@"one",@"21"]];
//    
//    for (int i=0;i<[personsAgeEuqals21 count]; i++) {
//        
//        PersonModel *person=[personsAgeEuqals21 objectAtIndex:i];
//        NSLog(@"name.................%@",person.name);
//        NSLog(@"age..................%@",person.age);
//        NSLog(@"address..............%@",person.address);
//        
//    }
    
   /**************************************查******************************************/
    
 
    /**************************************改******************************************/
    
//    PersonModel *person_change=[array objectAtIndex:3];
//    person_change.name = @"two";
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    /**************************************改******************************************/
    
    
  
    /**************************************删******************************************/
    
//    PersonModel *person_delete=[array objectAtIndex:3];
//    [person_delete MR_deleteEntity];
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    /**************************************删******************************************/

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
