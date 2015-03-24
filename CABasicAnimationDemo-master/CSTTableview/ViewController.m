//
//  ViewController.m
//  CSTTableview
//
//  Created by liuxin on 15/1/31.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "ViewController.h"
#import "TableVIewDataSource.h"
#import "DataModel.h"
#import "ListCell.h"
#import <QuartzCore/QuartzCore.h>

#import "ScendViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDataSource>

@property (nonatomic, strong) TableVIewDataSource *arrayDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self moveGroupLayer];
    [self movePositionLaver];
    [self moveRotationLayer];
    [self moveScaleLayer];
    [self layer01];
    [self layer02];
    [self layer03];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(300, 50, 60, 40);
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
//layer的简单应用
    
    
//    UIView *view = [[UIView alloc] init];
//    [self.view addSubview:view];
//    
//    view.backgroundColor = [UIColor greenColor];
//    view.frame = CGRectMake(100,100, 400, 400);
//    
//    view.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 400, 400)].CGPath;
//    view.layer.masksToBounds = NO;
//    view.layer.shadowOffset = CGSizeMake(-10, 10);
//    view.layer.shadowRadius = 10;
//    view.layer.shadowOpacity = 0.5;
//    
//    
//    view.layer.borderWidth = 5 ;
//    view.layer.borderColor = [[UIColor redColor] CGColor];
////
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
//    btn.backgroundColor = [UIColor lightGrayColor];
//    [view addSubview:btn];
//    view.layer.masksToBounds = YES;
//    
//    view.layer.bounds = CGRectMake(200, 200, 500, 500);
//    
//    view.layer.opacity = 0.5;
//    view.layer.cornerRadius = 100;
    
    

    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)btnPressed:(UIButton *)sender
{
    ScendViewController *SVc = [[ScendViewController alloc] init];
    [self presentViewController:SVc animated:YES completion:nil];
}
- (void)movePositionLaver
{
    CALayer *kkLayer = [[CALayer alloc] init];
    kkLayer.backgroundColor = [[UIColor blueColor]CGColor];
    kkLayer.frame = CGRectMake(10, 120, 40, 40);
    [self.view.layer addSublayer:kkLayer];
    
    CABasicAnimation *positionLayer = [CABasicAnimation animationWithKeyPath:@"position"];
    positionLayer.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
    CGPoint toPoint = kkLayer.position; toPoint.x += 150;
    positionLayer.toValue = [NSValue valueWithCGPoint:toPoint];
    positionLayer.autoreverses = YES;
    positionLayer.repeatCount = NSNotFound;
    [kkLayer addAnimation:positionLayer forKey:@"animationPosition"];
    
    
}

- (void)moveRotationLayer
{
    CALayer *kkLayer = [[CALayer alloc] init];
    kkLayer.backgroundColor = [[UIColor blackColor]CGColor];
    kkLayer.frame = CGRectMake(10, 180, 40, 40);
    kkLayer.contents = (__bridge id)([UIImage imageNamed:@"Icon"].CGImage);
    kkLayer.cornerRadius = 20;
    kkLayer.masksToBounds = YES;
    [self.view.layer addSublayer:kkLayer];
    
    CABasicAnimation *rotationLayer = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationLayer.repeatCount = NSNotFound;
    rotationLayer.autoreverses = YES;
    rotationLayer.fromValue = [NSNumber numberWithFloat:0.0];
    rotationLayer.toValue = [NSNumber numberWithFloat:6.0*M_PI];
    
    CABasicAnimation *positionLayer = [CABasicAnimation animationWithKeyPath:@"position"];
    positionLayer.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
    CGPoint toPoint = kkLayer.position; toPoint.x += 150;
    positionLayer.toValue = [NSValue valueWithCGPoint:toPoint];
    positionLayer.autoreverses = YES;
    positionLayer.repeatCount = NSNotFound;
    
    [kkLayer addAnimation:rotationLayer forKey:@"animationRotation"];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.repeatCount = NSNotFound;
    group.autoreverses = YES;
    group.duration = 5;
    group.animations = [NSArray arrayWithObjects:positionLayer,rotationLayer, nil];
    group.fillMode = kCAFillModeForwards;
    
    [kkLayer addAnimation:group forKey:nil];
}

- (void)moveScaleLayer
{
    CALayer *kkLayer = [[CALayer alloc] init];
    kkLayer.backgroundColor = [[UIColor purpleColor]CGColor];
    kkLayer.frame = CGRectMake(100, 290, 40, 40);
    [self.view.layer addSublayer:kkLayer];
    
    CABasicAnimation *scaleLayer = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleLayer.repeatCount = NSNotFound;
    scaleLayer.autoreverses = YES;
    scaleLayer.fromValue = [NSNumber numberWithFloat:1.0];
    scaleLayer.toValue = [NSNumber numberWithFloat:2.5];
    scaleLayer.fillMode = kCAFillModeForwards;
    
    [kkLayer addAnimation:scaleLayer forKey:@"animationScale"];
}
- (void)moveGroupLayer
{
    //CABasicAnimation
    
    CALayer *kkLayer = [[CALayer alloc] init];//初始化
    kkLayer.backgroundColor = [[UIColor yellowColor]CGColor];
    kkLayer.frame = CGRectMake(10, 60, 40, 40);//设定frame
    kkLayer.cornerRadius = 10;//圆角处理
    [self.view.layer addSublayer:kkLayer];//增加到uiview的layer上面
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
    CGPoint toPoint = kkLayer.position;toPoint.x += 180;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0*M_PI];
    
    CABasicAnimation *scaoleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaoleAnimation.toValue = [NSNumber numberWithFloat:2.5];
    scaoleAnimation.fillMode = kCAFillModeBackwards;
    scaoleAnimation.autoreverses = YES;
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.autoreverses = YES;
    group.duration = 3;
    group.animations = [NSArray arrayWithObjects:animation,rotateAnimation,scaoleAnimation, nil];
    group.fillMode = kCAFillModeForwards;
    kkLayer.contents = (__bridge id)([UIImage imageNamed:@"Icon"].CGImage);
    group.repeatCount = NSNotFound;
    [kkLayer addAnimation:group forKey:nil];
}

- (void)layer01
{
    CALayer *kkLayer = [[CALayer alloc] init];
    kkLayer.frame = CGRectMake(100, 400, 60, 60);
    kkLayer.backgroundColor = [[UIColor greenColor]CGColor];
    [self.view.layer addSublayer:kkLayer];
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    scale.duration = 0.5 +(rand()/10)*0.05;
    scale.fillMode = kCAFillModeForwards;
    scale.repeatCount = 4;
    scale.autoreverses = YES;
    scale.fromValue = [NSNumber numberWithFloat:.8];
    scale.toValue = [NSNumber numberWithFloat:1.2];
    [kkLayer addAnimation:scale forKey:nil];
    
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    anim.duration = 1.0f;
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(10, 10, 200, 200)];
    anim.byValue = [NSValue valueWithCGRect:kkLayer.bounds];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.repeatCount = 1;
    anim.autoreverses = YES;
    [kkLayer addAnimation:anim forKey:nil];
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anim2.duration = 1.f;
    anim2.fromValue = [NSNumber numberWithFloat:0.f];
    anim2.toValue = [NSNumber numberWithFloat:20.f];
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim2.repeatCount = CGFLOAT_MAX;
    anim2.autoreverses = YES;
    [kkLayer addAnimation:anim2 forKey:nil];
    
    CABasicAnimation *anim3 = [CABasicAnimation animationWithKeyPath:@"contents"];
    anim3.duration = 4.f;
    anim3.fromValue = (id)[UIImage imageNamed:@"tixian"].CGImage;
    anim3.toValue = (id)[UIImage imageNamed:@"Icon"].CGImage;
    anim3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim3.repeatCount = CGFLOAT_MAX;
    anim3.autoreverses = YES;
    [kkLayer addAnimation:anim3 forKey:nil];
    
}

- (void)layer02
{
    CALayer *kkLayer = [[CALayer alloc] init];
    kkLayer.frame = CGRectMake(100, 500, 60, 60);
    kkLayer.backgroundColor = [[UIColor whiteColor]CGColor];
    kkLayer.shadowOffset = CGSizeMake(2, 2);
    kkLayer.shadowOpacity = 1;
    [self.view.layer addSublayer:kkLayer];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
//    anim.duration = 1.f;
    anim.fromValue = (id)[UIColor redColor].CGColor;
    anim.toValue = (id)[UIColor blackColor].CGColor;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    anim.repeatCount = CGFLOAT_MAX  ;
//    anim.autoreverses = YES;
    
//    [kkLayer addAnimation:anim forKey:nil];
    
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
//    anim1.duration = 1.f;
    anim1.fromValue = [NSNumber numberWithFloat:0.5];
    anim1.toValue = [NSNumber numberWithFloat:1];
    anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    anim1.repeatCount = CGFLOAT_MAX;
//    anim1.autoreverses = YES;
//    [kkLayer addAnimation:anim1 forKey:nil];
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
//    anim2.duration = 1.f;
    anim2.fromValue = [NSNumber numberWithFloat:10.f];
    anim2.toValue = [NSNumber numberWithFloat:5.f];
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    anim2.repeatCount = CGFLOAT_MAX;
//    anim2.autoreverses = YES;
//    [kkLayer addAnimation:anim2 forKey:nil];
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 1.f;
    group.repeatCount = CGFLOAT_MAX;
    group.autoreverses = YES;
    group.animations = [NSArray arrayWithObjects:anim,anim1,anim2, nil];
    [kkLayer addAnimation:group forKey:nil];
    
}

- (void)layer03
{
    CALayer *kkLayer = [[CALayer alloc] init];
    kkLayer.frame = CGRectMake(100, 600, 60, 60);
    kkLayer.backgroundColor = [[UIColor whiteColor]CGColor];
    kkLayer.shadowOffset = CGSizeMake(2, 2);
    kkLayer.shadowOpacity = 1;
    [self.view.layer addSublayer:kkLayer];
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    
    animation.toValue=[NSNumber numberWithFloat:0.0];
    
    animation.autoreverses=YES;
    
    animation.duration=2.f;
    
    animation.repeatCount=FLT_MAX;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    [kkLayer addAnimation:animation forKey:nil];
}
- (void)setupTableview
{
    TableViewCellConfigureBlock cellConfigure = ^(ListCell *cell ,DataModel *model){
      
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
