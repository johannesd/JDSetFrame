//
//  NSArray+JDSetFrame.m
//  Pods
//
//  Created by Johannes Dörr on 02.09.17.
//
//

#import "NSArray+JDSetFrame.h"
#import "UIView+JDSetFrame.h"

@implementation NSArray (JDSetFrame)

- (void)setFramesFromLeftToRight
{
    [self setFramesFromLeftToRightWithMargin:0];
}

- (void)setFramesFromLeftToRightWithMargin:(CGFloat)margin
{
    UIView *prevView = self.firstObject;
    if ([prevView isKindOfClass:[NSArray class]]) {
        [(NSArray *)prevView setFramesFromTopToBottomWithMargin:margin];
        prevView = [(NSArray *)prevView firstObject];
    }
    for (int i=1; i<self.count; i++) {
        if ([self[i] isKindOfClass:[UIView class]]) {
            [self[i] setFrameToRightOfView:prevView withMargin:margin];
            prevView = self[i];
        }
        else if ([self[i] isKindOfClass:[NSArray class]]) {
            [[self[i] firstObject] setFrameToLeftOfView:prevView withMargin:margin];
            [self[i] setFramesFromTopToBottomWithMargin:margin];
            prevView = [self[i] firstObject];
        }
    }
}

- (void)setFramesFromTopToBottom
{
    [self setFramesFromTopToBottomWithMargin:0];
}

- (void)setFramesFromTopToBottomWithMargin:(CGFloat)margin
{
    UIView *prevView = self.firstObject;
    if ([prevView isKindOfClass:[NSArray class]]) {
        [(NSArray *)prevView setFramesFromLeftToRightWithMargin:margin];
        prevView = [(NSArray *)prevView firstObject];
    }
    for (int i=1; i<self.count; i++) {
        if ([self[i] isKindOfClass:[UIView class]]) {
            [self[i] setFrameToBottomOfView:prevView withMargin:margin];
            prevView = self[i];
        }
        else if ([self[i] isKindOfClass:[NSArray class]]) {
            [[self[i] firstObject] setFrameToBottomOfView:prevView withMargin:margin];
            [self[i] setFramesFromLeftToRightWithMargin:margin];
            prevView = [self[i] firstObject];
        }
    }
}

@end
