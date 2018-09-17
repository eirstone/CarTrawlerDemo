//
//  CarDetailWireFrame.h
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarDetailViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CarDetailWireFrame : NSObject

+ (nonnull UIViewController *)navigateToViewDetailModule:(nonnull Vehicle *)vehicle;

@end

NS_ASSUME_NONNULL_END
