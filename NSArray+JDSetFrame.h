//
//  NSArray+JDSetFrame.h
//  Pods
//
//  Created by Johannes Dörr on 02.09.17.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (JDSetFrame)

- (void)setFramesFromLeftToRight;
- (void)setFramesFromLeftToRightWithMargin:(CGFloat)margin;
- (void)setFramesFromTopToBottom;
- (void)setFramesFromTopToBottomWithMargin:(CGFloat)margin;

@end
