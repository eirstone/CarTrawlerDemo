//
//  VehicleDetailViewProtocol.h
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Vehicle+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CarDetailViewProtocol <NSObject>

- (void)showCarDetailsScreen;

@end


@protocol CarDetailPresenterProtocol <NSObject>

- (void)updateView;
- (NSString*)getCarInformation;
- (NSString*)getCarviewTitle;
- (NSString*)getCarPicturalUrl;

@end




NS_ASSUME_NONNULL_END
