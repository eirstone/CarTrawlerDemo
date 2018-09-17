//
//  Vendor.h
//  CarTrawlerDemo
//
//  Created by lei on 14/09/2018.
//  Copyright © 2018 lei. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Vendor : JSONModel

@property (nonatomic,copy) NSString* code;
@property (nonatomic,copy) NSString* name;

@end

NS_ASSUME_NONNULL_END
