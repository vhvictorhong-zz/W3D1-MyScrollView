//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Victor Hong on 14/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}
- (instancetype)initWithContentSize:(CGSize)contentSize
{
    self = [super init];
    if (self) {
        _contentSize = contentSize;
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureOccured:)];
        [self addGestureRecognizer:self.panGestureRecognizer];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    return [self initWithContentSize:CGSizeZero];
}





-(void)setPanGesture
{
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureOccured:)];
    [self addGestureRecognizer:self.panGestureRecognizer];
}

-(void)panGestureOccured:(UIPanGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateBegan)
    {
        self.panTranslation = [sender translationInView:self];
    }
    
    CGFloat xTrans = [sender translationInView:self].x - self.panTranslation.x;
    CGFloat yTrans = [sender translationInView:self].y - self.panTranslation.y;
    
    if(self.bounds.origin.x - xTrans <= (self.contentSize.width - self.bounds.size.width) && self.bounds.origin.x - xTrans >= 0)
    {
        [self setBounds:CGRectMake(self.bounds.origin.x - xTrans, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
    }
    
    if(self.bounds.origin.y - yTrans <= (self.contentSize.height - self.bounds.size.height) && self.bounds.origin.y - yTrans >= 0)
    {
        [self setBounds:CGRectMake(self.bounds.origin.x, self.bounds.origin.y - yTrans, self.bounds.size.width, self.bounds.size.height)];
    }
    
    self.panTranslation = [sender translationInView:self];
    
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        //break
    }
    
    NSLog(@"x:%f y:%f", xTrans, yTrans);
    
    
}

@end
