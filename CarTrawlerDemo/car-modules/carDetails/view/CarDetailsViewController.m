//
//  CarDetailsViewController.m
//  CarTrawlerDemo
//
//  Created by lei on 16/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "CarDetailsViewController.h"

@interface CarDetailsViewController ()

@end

@implementation CarDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [self.presenter getCarviewTitle];
    [self.presenter updateView];
}

#pragma mark - CarDetailViewProtocol
- (void)showCarDetailsScreen{
    
    dispatch_async(dispatch_get_main_queue(), ^{

        self.carDetailsLabel.text = [self.presenter getCarInformation];

        //set car image
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.presenter getCarPicturalUrl]]];
        self.carImageView.image = [UIImage imageWithData:data];
    });
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
