//
//  NSManagedObject+CoreDataCategories.m
//  DragonCalc HD
//
//  Created by Зловред on 10.09.12.
//  Copyright (c) 2012 Max Matveev. All rights reserved.
//

#import "NSManagedObject+CoreDataCategories.h"

@implementation NSManagedObject (CoreDataCategories)

static id<CoreDataErrorHandler> errorHandler;

+(void)setErrorHandler:(id<CoreDataErrorHandler>)_errorHandler {
    errorHandler = _errorHandler;
}

+(void)handleError:(NSError *)error {
    if (error != nil)
    {
        if (errorHandler) {
            [errorHandler handleError:error];
        } else {
            NSLog(@"Core data error: %@", error);
            abort();
        }
    }
}

+ (NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription entityForName:NSStringFromClass(self) inManagedObjectContext:context];
}

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return results;
}

+ (id)findOneInContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setFetchLimit:1];
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return [results count] == 0 ? nil : [results objectAtIndex:0];
}
+ (id)findOneWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setFetchLimit:1];
    [request setPredicate:predicate];
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return [results count] == 0 ? nil : [results objectAtIndex:0];
}
+(NSUInteger)countInContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSError *error = nil;
    NSUInteger result = [context countForFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return result;
}
+ (NSUInteger)countWithPredicate:(NSPredicate*)predicate inContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setPredicate:predicate];
    NSError *error = nil;
    NSUInteger result = [context countForFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return result;
}
+ (NSArray *)findAllSortedBy:(NSString*)sortField ascending:(bool)ascending withPredicate: (NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    if (predicate) {
        [request setPredicate:predicate];
    }
    if (sortField) {
        [request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:sortField ascending:ascending]]];
    }
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return results;
}
+ (NSArray *)findAllSortedBy:(NSString*)sortField ascending:(bool)ascending withPredicate: (NSPredicate *)predicate andLimit: (int) limit inContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    if (predicate) {
        [request setPredicate:predicate];
    }
    if (sortField) {
        [request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:sortField ascending:ascending]]];
    }
    NSError *error = nil;
    [request setFetchLimit:limit];
    NSArray *results = [context executeFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return results;
}

+ (id)findFirstSortedBy:(NSString*)sortField ascending:(bool)ascending inContext:(NSManagedObjectContext *) context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:sortField ascending:ascending]]];
    [request setFetchLimit:1];
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return [results count] == 0 ? nil : [results objectAtIndex:0];
}

+ (id)createInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(self) inManagedObjectContext:context];
}
+ (id)findOneByAttribute:(NSString*) attribute withValue:(id)value inContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setFetchLimit:1];
    [request setPredicate:[NSPredicate predicateWithFormat:[NSString stringWithFormat:@"%@ = %%@",  attribute], value]];
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    [NSManagedObject handleError:error];
    return [results count] == 0 ? nil : [results objectAtIndex:0];
}
-(void)deleteInContext:(NSManagedObjectContext *)context {
    [context deleteObject:self];
}
@end
