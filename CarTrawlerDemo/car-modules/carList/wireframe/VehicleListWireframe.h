//
//  VehicleListWireframe.h
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Vehicle+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@protocol VehicleListWireframeProtocol <NSObject>

- (void)presentVehicleDetailScreen:(Vehicle*)vehicle fromCurrentVehicleListView:(UIViewController*)viewCtrl;

@end

@interface VehicleListWireframe : NSObject <VehicleListWireframeProtocol>

+ (UIViewController*)createVehicleList;

@end

NS_ASSUME_NONNULL_END
