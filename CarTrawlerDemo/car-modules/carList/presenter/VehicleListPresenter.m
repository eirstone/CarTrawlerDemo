//
//  VehicleListPresenter.m
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "VehicleListPresenter.h"

@interface ImageDownloaderOperation : NSOperation

@property (nonatomic,strong) NSString *imageUrl;
@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,weak) VehicleListPresenter *interactor;

- (instancetype)initWithImageUrl:(NSString*)imageUrl andIndexPath:(NSIndexPath*)indexPath;

@end

@implementation ImageDownloaderOperation

- (instancetype)initWithImageUrl:(NSString*)imageUrl andIndexPath:(NSIndexPath*)indexPath{

    self = [super init];
    if (self) {
        self.imageUrl = imageUrl;
        self.indexPath = indexPath;
    }
    
    return self;
}

- (void)main{
    
    if (self.isCancelled) {
        return;
    }
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageUrl]];
    
    if (self.isCancelled) {
        return;
    }
    
    [self.interactor.imagesCache setValue:data forKey:self.imageUrl];
    [self.interactor imageData:data andIndexPath:self.indexPath];
}

@end



@interface VehicleListPresenter() 

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@end


@implementation VehicleListPresenter

- (instancetype)init{
    self = [super init];
    if (self) {
        self.operationQueue = [NSOperationQueue new];
        self.operationQueue.maxConcurrentOperationCount = 5;
        self.imagesCache = [NSMutableDictionary new];
    }
    
    return self;
}

#pragma mark - VehicleListPresenterProtocol
- (void)showDetailsForVehicle:(NSIndexPath *)indexPath sorting:(SORTING)sorting fromCurrentVehicleListView:(UIViewController *)viewController{

    Vehicle *vehicle = nil;
    
    if (sorting == GROUP) {
        vehicle = [self.vehicleVendors[indexPath.section-1].vehicle allObjects][indexPath.row];
    }
    else if(sorting == BAGGAGE_QUANTITY){
        vehicle = [self getVehiclesListByBaggageQuantity][indexPath.row];
    }
    else{
        vehicle = [self getDefaultVehiclesList][indexPath.row];
    }
    
    //to car details view
    [self.wireframe presentVehicleDetailScreen:vehicle fromCurrentVehicleListView:viewController];
    
}

- (void)updateView {
    [self.view showLoading];
    [self.interactor retrieveData];
}

- (NSString*)getBookingInformation{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    
    NSString *pickTime = [formatter stringFromDate:self.booking.pickUpDateTime];
    NSString *returnTime = [formatter stringFromDate:self.booking.returnDateTime];

    
    return [NSString stringWithFormat:@"From: %@ %@\nTo: %@ %@",self.booking.pickUpLocation,pickTime,self.booking.returnLocation,returnTime];
}

- (NSArray<Vehicle*>*)getDefaultVehiclesList{
    
    NSMutableArray<Vehicle*> *vehicleArray = [NSMutableArray array];
    
    for (VehicleVendor *item in self.vehicleVendors ) {
        for (Vehicle *vehicle in item.vehicle) {
            [vehicleArray addObject:vehicle];
        }
    }
    
    //sorting by price by default
    [vehicleArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        Vehicle *v1 = obj1;
        Vehicle *v2 = obj2;
        
        return (v1.rateTotalAmount.intValue > v2.rateTotalAmount.intValue);
        
    }];
    
    return vehicleArray;
}


- (NSArray<Vehicle*>*)getVehiclesListByBaggageQuantity{
    
    NSMutableArray<Vehicle*> *vehicleArray = [NSMutableArray array];
    
    for (VehicleVendor *item in self.vehicleVendors ) {
        for (Vehicle *vehicle in item.vehicle) {
            [vehicleArray addObject:vehicle];
        }
    }
    
    //sorting by price by default
    [vehicleArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        Vehicle *v1 = obj1;
        Vehicle *v2 = obj2;
        
        return (v1.baggageQuantity > v2.baggageQuantity);
        
    }];
    
    return vehicleArray;
}

- (NSInteger)totalVehicles{
    NSInteger retVal = 0;
    for (VehicleVendor *vehicleVendor in self.vehicleVendors) {
        retVal += vehicleVendor.vehicle.count;
    }
    
    return retVal;
}

- (NSInteger)totalVendors{
    
    return self.vehicleVendors.count;
}

- (NSInteger)numberOfRowsInSectionForGroupedOption:(NSInteger)section{
    return self.vehicleVendors[section].vehicle.count;
}

- (NSString*)getVehicleGroupSectionTitle:(NSInteger)groupSection{
    return self.vehicleVendors[groupSection].vendorName;
}

- (NSDictionary*)getVehicleText:(SORTING)sorting atIndexPath:(NSIndexPath*)indexPath{

    Vehicle *vehicle = nil;
    
    if (sorting == GROUP ) {
        vehicle = [self.vehicleVendors[indexPath.section-1].vehicle allObjects][indexPath.row];
    }
    else if(sorting == BAGGAGE_QUANTITY){
        vehicle = [self getVehiclesListByBaggageQuantity][indexPath.row];
    }
    else{
        vehicle = [self getDefaultVehiclesList][indexPath.row];
    }
    
    
    NSData *imageData = nil;
    imageData = self.imagesCache[vehicle.pictureURL];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];

    if (!imageData) {
        ImageDownloaderOperation *operation = [[ImageDownloaderOperation alloc] initWithImageUrl:vehicle.pictureURL andIndexPath:indexPath];
        operation.interactor = self;
        [self.operationQueue addOperation:operation];
    }
    else{
        [dict setValue:imageData forKey:@"imageData"];
    }

    [dict setValue:[NSString stringWithFormat:@"%@ - %@",vehicle.vehMakeModel,vehicle.status] forKey:@"title"];
    [dict setValue:[NSString stringWithFormat:@"Price: %@%@ , BaggageQuantity: %d",vehicle.rateTotalAmount,vehicle.currencyCode,vehicle.baggageQuantity] forKey:@"subtitle"];

    return dict;

}
     
- (void)imageData:(NSData*)imageData andIndexPath:(NSIndexPath*)indexpath{

    [self.view imageData:imageData andIndexPath:indexpath];
};

#pragma mark - VehicleListInteractorProtocolOutput
- (void)vehicleListDataFetched:(nonnull NSArray<VehicleVendor *> *)vehicleVendors andBooking:(nonnull Booking *)booking {
    [self.view hideLoading];
    
    self.vehicleVendors = vehicleVendors;
    self.booking = booking;
    
    [self.view showVehicleData];
}

- (void)onError:(NSError*)error{
    [self.view showError:error];
}

@end
