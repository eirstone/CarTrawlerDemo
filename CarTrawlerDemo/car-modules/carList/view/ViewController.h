//
//  ViewController.h
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VehicleListViewProtocol.h"

@class VehicleListPresenter;

@interface ViewController : UIViewController <VehicleListViewProtocol,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) SORTING sorting;

@property (nonatomic) id<VehicleListPresenterProtocol> presenter;

- (IBAction)sortingDefaultButtonClicked:(UIBarButtonItem *)sender;
- (IBAction)sortingBaggageQuantityButtonClicked:(UIBarButtonItem *)sender;
- (IBAction)sortingGroupButtonClicked:(UIBarButtonItem *)sender;

@end

