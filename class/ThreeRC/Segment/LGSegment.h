//
//  LGSegment.h
//  LGSegment
//


#import <UIKit/UIKit.h>

@protocol SegmentDelegate <NSObject>

@optional

- (void)scrollToPage:(int)page;

@end

@interface LGSegment : UIView

@property (nonatomic,weak) id<SegmentDelegate>delegate;
@property (nonatomic,assign) CGFloat maxWidth;
@property (nonatomic,strong) NSMutableArray *titleList;
@property (nonatomic,strong) NSMutableArray *buttonList;
@property (nonatomic,weak) CALayer *LGLayer;
@property (nonatomic,assign) CGFloat bannerNowX;

- (void)moveToOffsetX:(CGFloat)X;

@end
