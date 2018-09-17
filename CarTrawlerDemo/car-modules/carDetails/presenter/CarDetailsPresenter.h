//
//  CarDetailsPresenter.h
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarDetailViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CarDetailsPresenter : NSObject <CarDetailPresenterProtocol>


@property (nonatomic,strong) Vehicle *car;
@property (nonatomic,weak) id<CarDetailViewProtocol> view;

@end

NS_ASSUME_NONNULL_END
