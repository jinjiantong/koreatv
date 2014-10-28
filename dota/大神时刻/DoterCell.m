//
//  DoterCell.m
//  大神时刻
//
//  Created by jin chunhao on 14-3-2.
//  Copyright (c) 2014年 jin chunhao. All rights reserved.
//

#import "DoterCell.h"

@implementation DoterCell
@synthesize doterImgView;
@synthesize doterName;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
//        doterImgView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        //doterImgView.image=[UIImage imageNamed:@"js"];
//        doterImgView.layer.borderWidth=1;
//        doterImgView.layer.borderColor=[UIColor orangeColor].CGColor;
//        [self addSubview:doterImgView];
     
        doterName=[[UITextView alloc] initWithFrame:CGRectMake(160, 20, 160, 60)];
        doterName.backgroundColor=[UIColor clearColor];
        [doterName setTextColor:[UIColor colorWithRed:42/250.0 green:55/250.0 blue:68/250.0 alpha:1]];
        doterName.font=[UIFont systemFontOfSize:13];
        //doterName.backgroundColor=[UIColor redColor];
        doterName.textAlignment=NSTextAlignmentLeft;
        doterName.editable=NO;
        doterName.userInteractionEnabled=NO;
        [doterName setScrollEnabled:NO];
        [self addSubview:doterName];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.selectionStyle=UITableViewCellSelectionStyleNone;
      // Configure the view for the selected state
}

@end
