//
//  ViewController.m
//  MyScrollView
//
//  Created by Victor Hong on 14/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    //[self.view setBounds:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height)];
    
}
- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    
    CGPoint translationInView = [sender translationInView:self.scrollView];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x, oldCenter.y + translationInView.y);
    
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.scrollView];
    
}


@end
