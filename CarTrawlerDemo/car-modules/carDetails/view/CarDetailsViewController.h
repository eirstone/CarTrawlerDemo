//
//  CarDetailsViewController.h
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarDetailViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CarDetailsViewController : UIViewController <CarDetailViewProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
@property (weak, nonatomic) IBOutlet UILabel *carDetailsLabel;

@property (nonatomic) id<CarDetailPresenterProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
