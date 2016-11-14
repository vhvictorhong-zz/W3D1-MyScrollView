//
//  MyScrollView.h
//  MyScrollView
//
//  Created by Victor Hong on 14/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIView

@property (nonatomic, assign) CGSize contentSize;
@property UIPanGestureRecognizer *panGestureRecognizer;

@property (nonatomic, assign) CGPoint panTranslation;

-(void)setPanGesture;
- (instancetype)initWithContentSize:(CGSize)contentSize;

@end
