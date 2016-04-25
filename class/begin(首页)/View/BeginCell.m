//
//  BeginCell.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "BeginCell.h"

@implementation BeginCell
{
    UIImageView *_backgroundImage;
    UIImageView *_productImage;
    
    //标题
    UILabel *_productLabel;
    UILabel *_subLabel;
    UILabel *_interest_rate_label;
    UILabel *_fonttitle_awesome_Label;
    UILabel *_font_awesome_Label;
    
    
    //起投以及期限
    UILabel *_invest_money;
    UILabel *_invest_time;
    
    UILabel *_money;
    UILabel *_time;
    
    UIView *_line_h_View;
    UIView *_line_w_View;
    UIView *_backgroundView;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self cteateUI];
        
    }
    return self;
}


-(void)cteateUI
{
    _productLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 10, Screen_width/5*3, 20)];
    _productLabel.font=LFFont(16);
    _productLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:_productLabel];
    
    _fonttitle_awesome_Label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    _fonttitle_awesome_Label.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _fonttitle_awesome_Label.text = [NSString fontAwesomeIconStringForEnum:FAGithub];
    [self.contentView addSubview:_fonttitle_awesome_Label];
    
    _font_awesome_Label=[[UILabel alloc]initWithFrame:CGRectMake(Screen_width-30, 10, 20, 20)];
    _font_awesome_Label.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _font_awesome_Label.text = [NSString fontAwesomeIconStringForEnum:FAGithub];
    _font_awesome_Label.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-angle-right"];
    _font_awesome_Label.textColor=[UIColor grayColor];
    [self.contentView addSubview:_font_awesome_Label];
    
    _subLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 50, Screen_width/5*3, 20)];
    _subLabel.font=LFFont(12);
    _subLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:_subLabel];
    
    _interest_rate_label=[[UILabel alloc]initWithFrame:CGRectMake(50, 80, Screen_width/5*3, 30)];
    _interest_rate_label.font=LFFont(24);
    [self.contentView addSubview:_interest_rate_label];
    
    _invest_money=[[UILabel alloc]initWithFrame:CGRectMake(Screen_width/5*3, 50, Screen_width/5, 20)];
    _invest_money.font=LFFont(12);
    _invest_money.textColor=[UIColor grayColor];
    _invest_money.textAlignment=NSTextAlignmentRight;
    [self.contentView addSubview:_invest_money];
    
    _invest_time=[[UILabel alloc]initWithFrame:CGRectMake(Screen_width/5*3, 80, Screen_width/5, 20)];
    _invest_time.font=LFFont(12);
    _invest_time.textColor=[UIColor grayColor];
    _invest_time.textAlignment=NSTextAlignmentRight;
    [self.contentView addSubview:_invest_time];
    
    _money=[[UILabel alloc]initWithFrame:CGRectMake(Screen_width/5*4, 50, Screen_width/5, 20)];
    _money.font=LFFont(12);
    [self.contentView addSubview:_money];
    
    _time=[[UILabel alloc]initWithFrame:CGRectMake(Screen_width/5*4, 80, Screen_width/5, 20)];
    _time.font=LFFont(12);
    [self.contentView addSubview:_time];
    
    _line_h_View=[[UIView alloc]initWithFrame:CGRectMake(Screen_width/5*3, 50, 1, 60)];
    _line_h_View.backgroundColor=WhiteColor;
    [self.contentView addSubview:_line_h_View];
    
    _line_w_View=[[UIView alloc]initWithFrame:CGRectMake(0, 40, Screen_width, 1)];
    _line_w_View.backgroundColor=WhiteColor;
    [self.contentView addSubview:_line_w_View];
    
    _backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 130, Screen_width, 10)];
    _backgroundView.backgroundColor=WhiteColor;
    [self.contentView addSubview:_backgroundView];
    
}

-(void)config:(NSInteger)index
{
    if (index==0)
    {
        _productLabel.text=@"直投类产品";
        _subLabel.text=@"预期年化收益率(%)";
        _interest_rate_label.text=@"10.25~12.1";
        _interest_rate_label.textColor=Red_Color;
        _invest_money.text=@"起投";
        _invest_time.text=@"期限";
        _money.text=@"1000元";
        _money.textColor=Red_Color;
        _time.text=@"12个月";
        _time.textColor=Red_Color;
        
        _fonttitle_awesome_Label.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-weibo"];
        _fonttitle_awesome_Label.textColor=Red_Color;
    }
    else if (index==1)
    {
        _productLabel.text=@"综合类产品";
        _subLabel.text=@"预期年化收益率(%)";
        _interest_rate_label.text=@"10.25~12.1";
        _interest_rate_label.textColor=Blue_Color;
        _invest_money.text=@"起投";
        _invest_time.text=@"期限";
        _money.text=@"1000元";
        _money.textColor=Blue_Color;
        _time.text=@"12个月";
        _time.textColor=Blue_Color;
        
        _fonttitle_awesome_Label.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-qq"];
        _fonttitle_awesome_Label.textColor=Blue_Color;
    }
    else if (index==2)
    {
        _productLabel.text=@"债券市场";
        _subLabel.text=@"预期年化收益率(%)";
        _interest_rate_label.text=@"10.25~12.1";
        _interest_rate_label.textColor=Purple_Color;
        _invest_money.text=@"起投";
        _invest_time.text=@"期限";
        _money.text=@"1000元";
        _money.textColor=Purple_Color;
        _time.text=@"12个月";
        _time.textColor=Purple_Color;
        
        _fonttitle_awesome_Label.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-android"];
        _fonttitle_awesome_Label.textColor=Purple_Color;
    }
    else
    {
        _productLabel.text=@"存取通宝";
        _subLabel.text=@"预期年化收益率(%)";
        _interest_rate_label.text=@"10.25~12.1";
        _interest_rate_label.textColor=Green_Color;
        _invest_money.text=@"起投";
        _invest_time.text=@"期限";
        _money.text=@"1000元";
        _money.textColor=Green_Color;
        _time.text=@"12个月";
        _time.textColor=Green_Color;
        
        _fonttitle_awesome_Label.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-github"];
        _fonttitle_awesome_Label.textColor=Green_Color;
    }
}
@end
