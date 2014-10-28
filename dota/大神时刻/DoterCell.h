//
//  DoterCell.h
//  大神时刻
//
//  Created by jin chunhao on 14-3-2.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoterCell : UITableViewCell
{
    UIImageView * doterImgView;
    UITextView * doterName;
}
@property (nonatomic,strong) UIImageView * doterImgView;
@property (nonatomic,strong) UITextView * doterName;
@end
