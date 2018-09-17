//
//  Booking+CoreDataProperties.h
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//
//

#import "Booking+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Booking (CoreDataProperties)

+ (NSFetchRequest<Booking *> *)fetchRequest;

@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSDate *pickUpDateTime;
@property (nullable, nonatomic, copy) NSString *pickUpLocation;
@property (nullable, nonatomic, copy) NSDate *returnDateTime;
@property (nullable, nonatomic, copy) NSString *returnLocation;

@end

NS_ASSUME_NONNULL_END
