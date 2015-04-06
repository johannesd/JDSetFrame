//
//  UIView+JDSetFrame.m
//
//  Created by Johannes Dörr on 08.05.14.
//  Copyright (c) 2014 Johannes Dörr. All rights reserved.
//

#import "UIView+JDSetFrame.h"


CGRect JDSetFrameToLeft(CGRect frame, CGFloat left)
{
    return CGRectMake(left, frame.origin.y, frame.size.width, frame.size.height);
}

CGRect JDSetFrameToTop(CGRect frame, CGFloat top)
{
    return CGRectMake(frame.origin.x, top, frame.size.width, frame.size.height);
}

CGRect JDSetFrameToLeftTop(CGRect frame, CGFloat left, CGFloat top)
{
    return CGRectMake(left, top, frame.size.width, frame.size.height);
}

CGRect JDSetFrameToWidth(CGRect frame, CGFloat width)
{
    return CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
}

CGRect JDSetFrameToHeight(CGRect frame, CGFloat height)
{
    return CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
}

CGRect JDSetFrameToWidthHeight(CGRect frame, CGFloat width, CGFloat height)
{
    return CGRectMake(frame.origin.x, frame.origin.y, width, height);
}

CGRect JDSetFrameToRightOfView(CGRect frame, UIView *view, CGFloat margin)
{
    return CGRectMake(view.frame.origin.x + view.frame.size.width + margin,
                      view.frame.origin.y,
                      frame.size.width,
                      frame.size.height);
}

CGRect JDSetFrameToBottomOfView(CGRect frame, UIView *view, CGFloat margin)
{
    return CGRectMake(view.frame.origin.x,
                      view.frame.origin.y + view.frame.size.height + margin,
                      frame.size.width,
                      frame.size.height);
}

CGRect JDSetFrameToTopOfView(CGRect frame, UIView *view, CGFloat margin)
{
    return CGRectMake(view.frame.origin.x,
                      view.frame.origin.y - frame.size.height - margin,
                      frame.size.width,
                      frame.size.height);
}

CGRect JDSetFrameToAlignment(CGRect frame, UIView *superview, JDFrameAlignment alignment, UIEdgeInsets insets)
{
    if ((alignment & JDFrameAlignmentTop) != 0) {
        frame = CGRectMake(frame.origin.x, insets.top, frame.size.width, frame.size.height);
    }
    if ((alignment & JDFrameAlignmentMiddle) != 0) {
        frame = CGRectMake(frame.origin.x,
                           floor((superview.bounds.size.height - insets.top - insets.bottom - frame.size.height) / 2) + insets.top,
                           frame.size.width,
                           frame.size.height);
    }
    if ((alignment & JDFrameAlignmentBottom) != 0) {
        frame = CGRectMake(frame.origin.x,
                           superview.bounds.size.height - frame.size.height - insets.bottom,
                           frame.size.width,
                           frame.size.height);
    }
    if ((alignment & JDFrameAlignmentLeft) != 0) {
        frame = CGRectMake(insets.left, frame.origin.y, frame.size.width, frame.size.height);
    }
    if ((alignment & JDFrameAlignmentCenter) != 0) {
        frame = CGRectMake(floor((superview.bounds.size.width - insets.left - insets.right - frame.size.width) / 2) + insets.left,
                           frame.origin.y,
                           frame.size.width,
                           frame.size.height);
    }
    if ((alignment & JDFrameAlignmentRight) != 0) {
        frame = CGRectMake(superview.bounds.size.width - frame.size.width - insets.right,
                           frame.origin.y,
                           frame.size.width,
                           frame.size.height);
    }
    return frame;
}

CGRect JDSetFrameToFill(CGRect frame, UIView *superview, JDFrameFill fill, UIEdgeInsets insets)
{
    if ((fill & JDFrameFillWidth) != 0) {
        frame = CGRectMake(insets.left,
                           frame.origin.y,
                           superview.bounds.size.width - insets.left - insets.right,
                           frame.size.height);
    }
    if ((fill & JDFrameFillHeight) != 0) {
        frame = CGRectMake(frame.origin.x,
                           insets.top,
                           frame.size.width,
                           superview.bounds.size.height - insets.top - insets.bottom);
    }
    if ((fill & JDFrameFillToRight) != 0) {
        frame = CGRectMake(frame.origin.x,
                           frame.origin.y,
                           superview.bounds.size.width - frame.origin.x - insets.right,
                           frame.size.height);
    }
    if ((fill & JDFrameFillToBottom) != 0) {
        frame = CGRectMake(frame.origin.x,
                           frame.origin.y,
                           frame.size.width,
                           superview.bounds.size.height - frame.origin.y - insets.bottom);
    }
    return frame;
}


@implementation UIView (JDSetFrame)

- (void)setFrameToLeft:(CGFloat)left
{
    self.frame = JDSetFrameToLeft(self.frame, left);
}

- (void)setFrameToTop:(CGFloat)top
{
    self.frame = JDSetFrameToTop(self.frame, top);
}

- (void)setFrameToLeft:(CGFloat)left top:(CGFloat)top
{
    self.frame = JDSetFrameToLeftTop(self.frame, left, top);
}

- (void)setFrameToWidth:(CGFloat)width
{
    self.frame = JDSetFrameToWidth(self.frame, width);
}

- (void)setFrameToHeight:(CGFloat)height
{
    self.frame = JDSetFrameToHeight(self.frame, height);
}

- (void)setFrameToWidth:(CGFloat)width height:(CGFloat)height
{
    self.frame = JDSetFrameToWidthHeight(self.frame, width, height);
}

- (void)setFrameToRightOfView:(UIView *)view
{
    [self setFrameToRightOfView:view withMargin:0];
}

- (void)setFrameToRightOfView:(UIView *)view withMargin:(CGFloat)margin
{
    self.frame = JDSetFrameToRightOfView(self.frame, view, margin);
}

- (void)setFrameToBottomOfView:(UIView *)view
{
    [self setFrameToBottomOfView:view withMargin:0];
}

- (void)setFrameToBottomOfView:(UIView *)view withMargin:(CGFloat)margin
{
    self.frame = JDSetFrameToBottomOfView(self.frame, view, margin);
}

- (void)setFrameToTopOfView:(UIView *)view
{
    [self setFrameToTopOfView:view withMargin:0];
}

- (void)setFrameToTopOfView:(UIView *)view withMargin:(CGFloat)margin
{
    self.frame = JDSetFrameToTopOfView(self.frame, view, margin);
}

- (void)setFrameToAlignment:(JDFrameAlignment)alignment
{
    [self setFrameToAlignment:alignment withInsets:UIEdgeInsetsZero];
}

- (void)setFrameToAlignment:(JDFrameAlignment)alignment withInsets:(UIEdgeInsets)insets
{
    if (self.superview == nil) return;
    self.frame = JDSetFrameToAlignment(self.frame, self.superview, alignment, insets);
}

- (void)setFrameToFill:(JDFrameFill)fill
{
    [self setFrameToFill:fill withInsets:UIEdgeInsetsZero];
}

- (void)setFrameToFill:(JDFrameFill)fill withInsets:(UIEdgeInsets)insets
{
    if (self.superview == nil) return;
    self.frame = JDSetFrameToFill(self.frame, self.superview, fill, insets);
}

- (CGFloat)frameLeft
{
    return self.frame.origin.x;
}

- (CGFloat)frameRight
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)frameTop
{
    return self.frame.origin.y;
}

- (CGFloat)frameBottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)frameWidth
{
    return self.frame.size.width;
}

- (CGFloat)frameHeight
{
    return self.frame.size.height;
}

- (NSString *)frameToString
{
    return [NSString stringWithFormat:@"%f %f %f %f", self.frameLeft, self.frameTop, self.frameWidth, self.frameHeight];
}

@end
