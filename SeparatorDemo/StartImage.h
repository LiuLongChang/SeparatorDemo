//
//  StartImage.h
//  SeparatorDemo
//
//  Created by langyue on 16/3/28.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Group;




@interface StartImagesManager : NSObject




@end




@interface StartImage : NSObject

@property(nonatomic,copy)NSString * url;
@property(strong,nonatomic)NSString * fileName,*descriptionStr,*pathDisk;
@property(strong,nonatomic)Group* group;




@end





@interface Group : NSObject


@property(strong,nonatomic)NSString*name,*author,*link;



@end

