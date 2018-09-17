//
//  CarDetailWireFrame.m
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "CarDetailWireFrame.h"
#import "CarDetailsPresenter.h"
#import "CarDetailsViewController.h"


@implementation CarDetailWireFrame

+ (nonnull UIViewController *)navigateToViewDetailModule:(nonnull Vehicle *)vehicle {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CarDetailsViewController *carView = (CarDetailsViewController*)[storyboard instantiateViewControllerWithIdentifier:@"CarDetailsViewController"];
    if (carView != nil) {
        
        CarDetailsPresenter *presenter = [[CarDetailsPresenter alloc] init];
        
        presenter.view = carView;
        presenter.car = vehicle;
        
        carView.presenter = presenter;
        
        return carView;
    }
    
    return nil;
}

@end
