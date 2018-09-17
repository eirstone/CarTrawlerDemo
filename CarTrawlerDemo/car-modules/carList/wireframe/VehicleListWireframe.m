//
//  VehicleListWireframe.m
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehicleListWireframe.h"
#import "Vehicle+CoreDataClass.h"
#import "ViewController.h"
#import "GetVehAvailRSCoreLocalDataManager.h"
#import "GetVehAvailRSCoreRemoteDataManager.h"
#import "VehicleListPresenter.h"
#import "VehicleDataInteractor.h"
#import "CarDetailWireFrame.h"

@implementation VehicleListWireframe

+ (UIViewController*)createVehicleList{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navCtrl = [storyboard instantiateViewControllerWithIdentifier:@"mainNavigationController"];
    if ([navCtrl.childViewControllers.firstObject isKindOfClass:[ViewController class]]) {
        ViewController *vehicleView = navCtrl.childViewControllers.firstObject;
        
        GetVehAvailRSCoreLocalDataManager *localMgr = [[GetVehAvailRSCoreLocalDataManager alloc] init];
        GetVehAvailRSCoreRemoteDataManager *remoteMgr = [[GetVehAvailRSCoreRemoteDataManager alloc] init];
        
        VehicleListPresenter *presenter = [[VehicleListPresenter alloc] init];
        VehicleDataInteractor *interactor = [[VehicleDataInteractor alloc] init];
        
        
        vehicleView.presenter = presenter;
        presenter.view = vehicleView;
        presenter.interactor = interactor;
        presenter.wireframe = [[VehicleListWireframe alloc] init];
        
        interactor.presenter = presenter;
        interactor.localDataManagerProtocol = localMgr;
        interactor.remoteDataManagerProtocol = remoteMgr;
        
        
        return navCtrl;
    }
    
    return nil;
}

#pragma mark - VehicleListWireframeProtocol
- (void)presentVehicleDetailScreen:(Vehicle*)vehicle fromCurrentVehicleListView:(UIViewController*)viewCtrl{

    UIViewController *vc = [CarDetailWireFrame navigateToViewDetailModule:vehicle];
    
    [viewCtrl.navigationController pushViewController:vc animated:true];
    
}

@end
