//
//  ViewController.m
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"CarTrawlerDemo";
    self.sorting = DEFAULT;
    [self.presenter updateView];
}

- (IBAction)sortingDefaultButtonClicked:(UIBarButtonItem *)sender{
    self.sorting = DEFAULT;
    [self.tableView reloadData];
}

- (IBAction)sortingBaggageQuantityButtonClicked:(UIBarButtonItem *)sender{
    self.sorting = BAGGAGE_QUANTITY;
    [self.tableView reloadData];
}


- (IBAction)sortingGroupButtonClicked:(UIBarButtonItem *)sender{
    self.sorting = GROUP;
    [self.tableView reloadData];
}

#pragma mark - VehicleListViewProtocol
- (void)showLoading {
    //show loading animation while downloading data from server
}

- (void)hideLoading {
    //hide loading animation while downloading data from server
}

- (void)showError:(nonnull NSError *)error {
    //show any error occurred while downloading data from server
    NSLog(@"Failed to download the json data %@",[error localizedDescription]);
}

- (void)showVehicleData{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)imageData:(NSData*)imageData andIndexPath:(NSIndexPath*)indexpath{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView cellForRowAtIndexPath:indexpath].imageView.image = [UIImage imageWithData:imageData];
        [self.tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
    });
}

#pragma mark - UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *cellIdentififer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentififer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentififer];
        cell.detailTextLabel.numberOfLines = 2;
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.text =  [self.presenter getBookingInformation];
            cell.imageView.image = nil;
            cell.detailTextLabel.text = @"";
        }
    }
    else{
        cell.textLabel.numberOfLines = 1;
        NSDictionary *dict = [self.presenter getVehicleText:self.sorting atIndexPath:indexPath];

        cell.textLabel.text = dict[@"title"];
        cell.detailTextLabel.text = dict[@"subtitle"];
        NSData *imageData = dict[@"imageData"];
        if (imageData) {
            cell.imageView.image = [UIImage imageWithData:imageData];
        }
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (self.sorting == GROUP) {
        //1 is legend
        return [self.presenter totalVendors] + 1;
    }
    else{
        //one is legend, the other is car list
        return 2;
    }
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //legend section
    if (section == 0) {
        return @"Legend";
    }
    else{
        
        if (self.sorting == GROUP) {
            
            return [self.presenter getVehicleGroupSectionTitle:section-1];
        }
        else{
            return @"Vehicles";
        }
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        //display legend info
        return 1;
    }
    else{
        
        if (self.sorting == GROUP) {

            //minus 1, since the first section is for legend info
            return [self.presenter numberOfRowsInSectionForGroupedOption:section-1];
        }
        else{
            return [self.presenter totalVehicles];
        }
    }
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return;
    }
    
    [self.presenter showDetailsForVehicle:indexPath sorting:self.sorting fromCurrentVehicleListView:self];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){
    
}


@end
