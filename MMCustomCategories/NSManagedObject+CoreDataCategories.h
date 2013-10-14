//
//  NSManagedObject+CoreDataCategories.h
//  DragonCalc HD
//
//  Created by Зловред on 10.09.12.
//  Copyright (c) 2012 Max Matveev. All rights reserved.
//

#import <CoreData/CoreData.h>

@protocol CoreDataErrorHandler <NSObject> 
@required
- (void) handleError : (NSError *) error;
@end

@interface NSManagedObject (CoreDataCategories)

+ (void)setErrorHandler:(id<CoreDataErrorHandler>)errorHandler;
+ (NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context;
+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context;
+ (id)findOneInContext:(NSManagedObjectContext *)context;
+ (void)handleError:(NSError *)error;
+ (NSUInteger)countInContext:(NSManagedObjectContext *)context;
+ (NSUInteger)countWithPredicate:(NSPredicate*)predicate inContext:(NSManagedObjectContext *)context;
+ (NSArray *)findAllSortedBy:(NSString*)sortField ascending:(bool)ascending withPredicate: (NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (NSArray *)findAllSortedBy:(NSString*)sortField ascending:(bool)ascending withPredicate: (NSPredicate *)predicate andLimit: (int) limit inContext:(NSManagedObjectContext *)context;
+ (id)createInContext:(NSManagedObjectContext *)context;
+ (id)findOneByAttribute:(NSString*) attribute withValue:(id)value inContext:(NSManagedObjectContext *)context;
+ (id)findOneWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (id)findFirstSortedBy:(NSString*)sortField ascending:(bool)ascending inContext:(NSManagedObjectContext *) context;

- (void)deleteInContext:(NSManagedObjectContext *)context;
@end
