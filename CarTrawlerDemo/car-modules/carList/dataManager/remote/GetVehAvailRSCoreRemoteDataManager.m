//
//  GetCarListRemoteDataManager.m
//  CarTrawlerDemo
//
//  Created by lei on 15/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "GetVehAvailRSCoreRemoteDataManager.h"

@implementation GetVehAvailRSCoreRemoteDataManager

- (void)retrieveCarsJsonData:(CompletionBlockString)completionBlock andErrorBlock:(ErrorBlock)errorBlock {
    
    NSURL *requestURL = [NSURL URLWithString:@"http://www.cartrawler.com/ctabe/cars.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    [[[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            errorBlock(error);
            return;
        }
        
        if (data) {
            
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            if ([jsonData isKindOfClass:[NSArray class]]) {
                NSArray *array = jsonData;
                if(array.count > 0){
                    if([array[0] isKindOfClass:[NSDictionary class]]){
                        NSDictionary *dict = array[0][@"VehAvailRSCore"];
                        NSError *parseError = nil;
                        VehAvailRSCore *core = [[VehAvailRSCore alloc] initWithDictionary:dict error:&parseError];
                        
                        if (parseError) {
                            errorBlock(parseError);
                            return;
                        }
                        
                        completionBlock(core);
                    }
                }
            }
        }
    }] resume];
    
}

@end
