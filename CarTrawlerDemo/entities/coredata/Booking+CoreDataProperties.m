//
//  Booking+CoreDataProperties.m
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//
//

#import "Booking+CoreDataProperties.h"

@implementation Booking (CoreDataProperties)

+ (NSFetchRequest<Booking *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Booking"];
}

@dynamic id;
@dynamic pickUpDateTime;
@dynamic pickUpLocation;
@dynamic returnDateTime;
@dynamic returnLocation;

@end
