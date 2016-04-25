//
//  BeginViewController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "BeginViewController.h"
#import "BeginCell.h"
#import "InvestDetailController.h"

@interface BeginViewController ()<WHC_BannerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    WHC_Banner * _banner3;
    CGFloat _lastY;
}

@property(nonatomic,strong)UITableView *beginTableView;


@end

@implementation BeginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationController.navigationBar.barTintColor=TintColor;//只写这个会存在问题
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:TintColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    self.navigationItem.title = @"首页";

    [self createTabelView];
    
}

- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshNavAlpha];
    if(self.beginTableView.y == 0)
    {
        self.navigationController.navigationBar.alpha = 1;
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _beginTableView.y = 0;
    
    if(_beginTableView.y == 0)
    {
        self.navigationController.navigationBar.alpha = 1;
    }
    [self refreshNavAlpha];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.translucent = NO;
}

-(void)createTabelView
{
    _banner3 = [[WHC_Banner alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 200)];
    _banner3.images = @[@"banner-2.jpg",@"banner-0.jpg",@"banner-1.jpg"];
    _banner3.imageTitles = @[@"",@"",@""];
    _banner3.pageViewPosition = Centre;
    [_banner3 startBanner];
    
    _beginTableView=[[UITableView alloc]initWithFrame:CGRectMake(self.view.origin.x, self.view.origin.y, Screen_width, Screen_height-44) style:UITableViewStylePlain];
    _beginTableView.delegate=self;
    _beginTableView.dataSource=self;
    _beginTableView.tableHeaderView=_banner3;
    _beginTableView.tableFooterView=[[UIView alloc]init];
    _beginTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _beginTableView.bounces=NO;
    _beginTableView.scrollEnabled=YES;
    [self.view addSubview:_beginTableView];
    
}

#pragma mark - UItableview delegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"locaId";
    BeginCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil==cell) {
        cell=[[BeginCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell config:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InvestDetailController *ctrl=[[InvestDetailController alloc]init];
    ctrl.detailStr=@"str";
    ctrl.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ctrl animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}


#pragma mark - delegate
-(void)WHC_Banner:(WHC_Banner *)banner networkLoadingWithImageView:(UIImageView *)imageView imageUrl:(NSString *)url index:(NSInteger)index
{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _lastY = scrollView.contentOffset.y;
    [self refreshNavAlpha];
}

#pragma mark - 导航栏透明
- (void)refreshNavAlpha
{
    if (self.beginTableView.height != Screen_height - 44 - 5) {
        self.beginTableView.height = Screen_height - 44 - 5;
    }
    
//    NSLog(@"%f",self.beginTableView.height);
    if (self.view.y != 0) {
        self.view.y = 0;
    }
    
    float alpha = _lastY / 136;
    alpha = alpha > 1 ? 1 : alpha;
    if (alpha < 0) {
        alpha = 0;
    }
    self.navigationController.navigationBar.alpha = alpha;
}

@end
