//
//  InvestViewController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "InvestViewController.h"
#import "DirectTypeController.h"
#import "SynthesizeTypeController.h"
#import "TransferTypeController.h"
#import "DepositTypeController.h"
#import "LGSegment.h"

//Segment高度
#define LG_segmentH 40

@interface InvestViewController ()<UIScrollViewDelegate,SegmentDelegate>
{
    
}
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property(nonatomic,strong)NSMutableArray *buttonList;
@property (nonatomic, weak) LGSegment *segment;
@property(nonatomic,weak)CALayer *LGLayer;

@end

@implementation InvestViewController

//懒加载
- (NSMutableArray *)buttonList
{
    if (!_buttonList)
    {
        _buttonList = [NSMutableArray array];
    }
    return _buttonList;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=TintColor;
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationItem.title = @"投资详情";
    self.view.backgroundColor=WhiteColor;
    //加载Segment
    [self setSegment];
    //加载ViewController
    [self addChildViewController];
    //加载ScrollView
    [self setContentScrollView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)setSegment
{
    [self buttonList];
    //初始化
    LGSegment *segment = [[LGSegment alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, LG_segmentH)];
    segment.delegate = self;
    segment.backgroundColor=[UIColor whiteColor];
    self.segment = segment;
    [self.view addSubview:segment];
    [self.buttonList addObject:segment.buttonList];
    self.LGLayer = segment.LGLayer;
}

-(void)addChildViewController
{
    
    DirectTypeController  *DirectVC = [[DirectTypeController alloc]init];
    DirectVC.view.backgroundColor= [UIColor colorWithRed:80.0/255 green:227.0/255 blue:194.0/255 alpha:100];
    [self addChildViewController:DirectVC];
    SynthesizeTypeController  *SynthesizeVC = [[SynthesizeTypeController alloc]init];
    SynthesizeVC.view.backgroundColor= [UIColor colorWithRed:0.0/255 green:167.0/255 blue:210.0/255 alpha:100];
    [self addChildViewController:SynthesizeVC];
    TransferTypeController *TransferVC = [[TransferTypeController alloc]init];
    TransferVC.view.backgroundColor= [UIColor colorWithRed:249.0/255 green:123.0/255 blue:134.0/255 alpha:100];
    [self addChildViewController:TransferVC];
    DepositTypeController *DepositVC = [[DepositTypeController alloc]init];
    DepositVC.view.backgroundColor= [UIColor colorWithRed:0.0/255 green:167.0/255 blue:210.0/255 alpha:100];
    [self addChildViewController:DepositVC];
}

-(void)setContentScrollView
{
    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+LG_segmentH+5, self.view.frame.size.width, Screen_height-LG_segmentH-64-44-5)];
    [self.view addSubview:sv];
    sv.bounces = NO;
    sv.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    sv.contentOffset = CGPointMake(0, 0);
    sv.pagingEnabled = YES;
    sv.showsHorizontalScrollIndicator = NO;
    sv.scrollEnabled = YES;
    sv.userInteractionEnabled = YES;
    sv.delegate = self;
    
    for (int i=0; i<self.childViewControllers.count; i++) {
        UIViewController * vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake(i * Screen_width, 5, Screen_width, Screen_height-LG_segmentH-64-44-5);
        [sv addSubview:vc.view];
        
    }
    
    sv.contentSize = CGSizeMake(4 * Screen_width, 0);
    self.contentScrollView = sv;
}

#pragma mark - UIScrollViewDelegate
//实现LGSegment代理方法
-(void)scrollToPage:(int)Page {
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = self.view.frame.size.width * Page;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentScrollView.contentOffset = offset;
    }];
}
// 只要滚动UIScrollView就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    [self.segment moveToOffsetX:offsetX];
    
}


@end