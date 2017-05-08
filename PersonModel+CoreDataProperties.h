//
//  PersonModel+CoreDataProperties.h
//  MYMagicalRecord
//
//  Created by 张友波 on 16/8/11.
//  Copyright © 2016年 张友波. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PersonModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *age;
@property (nullable, nonatomic, retain) NSString *address;

@end

NS_ASSUME_NONNULL_END
