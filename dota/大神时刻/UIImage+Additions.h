//
//  UIImage+Additions.h
//  BabyShow
//
//  Created by 耿 晓亮 on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

@interface UIImage (UIImage_Additions)

-(UIImage*) scaleImagetoSize:(CGSize) size;

-(UIImage*) cutImagetoSize:(CGSize) size;

-(UIImage*) stretchImagetoSize:(CGSize) size;

-(UIImage*) topLeftImagetoSize:(CGSize) size;

-(UIImage*) grayImage;

@end
