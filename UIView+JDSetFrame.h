//
//  UIView+JDSetFrame.h
//
//  Created by Johannes Dörr on 08.05.14.
//  Copyright (c) 2014 Johannes Dörr. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum
{
    JDFrameAlignmentLeft = 1,
    JDFrameAlignmentCenter = 2,
    JDFrameAlignmentRight = 4,
    JDFrameAlignmentTop = 8,
    JDFrameAlignmentMiddle = 16,
    JDFrameAlignmentBottom = 32
}
JDFrameAlignment;


typedef enum
{
    JDFrameFillWidth = 1,
    JDFrameFillHeight = 2,
    JDFrameFillToRight = 4,
    JDFrameFillToBottom = 8
}
JDFrameFill;


extern CGRect JDSetFrameToLeft(CGRect frame, CGFloat left);
extern CGRect JDSetFrameToTop(CGRect frame, CGFloat top);
extern CGRect JDSetFrameToLeftTop(CGRect frame, CGFloat left, CGFloat top);
extern CGRect JDSetFrameToWidth(CGRect frame, CGFloat width);
extern CGRect JDSetFrameToHeight(CGRect frame, CGFloat height);
extern CGRect JDSetFrameToWidthHeight(CGRect frame, CGFloat width, CGFloat height);
extern CGRect JDSetFrameToSize(CGRect frame, CGSize size);
extern CGRect JDSetFrameToRightOfView(CGRect frame, UIView *view, CGFloat margin);
extern CGRect JDSetFrameToLeftOfView(CGRect frame, UIView *view, CGFloat margin);
extern CGRect JDSetFrameToBottomOfView(CGRect frame, UIView *view, CGFloat margin);
extern CGRect JDSetFrameToTopOfView(CGRect frame, UIView *view, CGFloat margin);
extern CGRect JDSetFrameToAlignment(CGRect frame, UIView *superview, JDFrameAlignment alignment, UIEdgeInsets insets);
extern CGRect JDSetFrameToAlignmentBetweenViews(CGRect frame, UIView *view1, UIView *view2, JDFrameAlignment alignment);
extern CGRect JDSetFrameToFill(CGRect frame, UIView *superview, JDFrameFill fill, UIEdgeInsets insets);
extern NSString * JDSetFrameToString(CGRect frame);


@interface UIView (JDSetFrame)

- (void)setFrameToLeft:(CGFloat)left;
- (void)setFrameToTop:(CGFloat)top;
- (void)setFrameToLeft:(CGFloat)left top:(CGFloat)top;
- (void)setFrameToWidth:(CGFloat)width;
- (void)setFrameToHeight:(CGFloat)height;
- (void)setFrameToWidth:(CGFloat)width height:(CGFloat)height;
- (void)setFrameToSize:(CGSize)size;
- (void)setFrameToRightOfView:(UIView *)view;
- (void)setFrameToRightOfView:(UIView *)view withMargin:(CGFloat)margin;
- (void)setFrameToLeftOfView:(UIView *)view;
- (void)setFrameToLeftOfView:(UIView *)view withMargin:(CGFloat)margin;
- (void)setFrameToBottomOfView:(UIView *)view;
- (void)setFrameToBottomOfView:(UIView *)view withMargin:(CGFloat)margin;
- (void)setFrameToTopOfView:(UIView *)view;
- (void)setFrameToTopOfView:(UIView *)view withMargin:(CGFloat)margin;
- (void)setFrameToAlignment:(JDFrameAlignment)alignment;
- (void)setFrameToAlignment:(JDFrameAlignment)alignment withInsets:(UIEdgeInsets)insets;
- (void)setFrameToAlignment:(JDFrameAlignment)alignment betweenView1:(UIView *)view1 andView2:(UIView *)view2;
- (void)setFrameToFill:(JDFrameFill)fill;
- (void)setFrameToFill:(JDFrameFill)fill withInsets:(UIEdgeInsets)insets;

- (CGFloat)frameLeft;
- (CGFloat)frameRight;
- (CGFloat)frameTop;
- (CGFloat)frameBottom;
- (CGFloat)frameWidth;
- (CGFloat)frameHeight;
- (NSString *)frameToString;

@end


extern void JDSetEqualFramesFromTopToBottom(CGRect firstFrame, CGFloat margin, NSArray *views);
extern void JDSetEqualFramesFromLeftToRight(CGRect firstFrame, CGFloat margin, NSArray *views);
