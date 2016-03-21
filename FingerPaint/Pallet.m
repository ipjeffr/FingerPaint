//
//  Pallet.m
//  FingerPaint
//
//  Created by Tenzin Phagdol on 2016-03-18.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "Pallet.h"
#import "Line.h"

@interface Pallet()
@property (nonatomic, strong) NSMutableArray *lines;
@property (nonatomic, strong) NSMutableArray *fullLines;

@end

@implementation Pallet

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _lines = [[NSMutableArray alloc] init];//array of line segments
        _fullLines = [[NSMutableArray alloc] init];//full line array: stores each array of line segments
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lines = [[NSMutableArray alloc]init];
    [self.fullLines addObject:self.lines];
    [self createLineWithTouches:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self createLineWithTouches:touches];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
    
}

- (void)createLineWithTouches:(NSSet<UITouch *>*)touches {
    UITouch *touch = [touches anyObject];
    CGPoint previewLocation = [touch previousLocationInView:self];
    CGPoint location = [touch locationInView:self];
    Line *line = [[Line alloc] initWithPreviousLocation:previewLocation location:location];
    line.color = self.colorChange;
    [self.fullLines[self.fullLines.count-1] addObject:line];

    [self setNeedsDisplay]; //calls drawRect
}


- (void)drawRect:(CGRect)rect {
    
    for (NSArray *lines in self.fullLines) {
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];//initialize new BezierPath
        bezierPath.lineCapStyle = kCGLineCapRound;
        bezierPath.lineWidth = 10;
        
        for (Line *line in lines) {
            [line.color set];
            [bezierPath moveToPoint:line.previousLocation];
            [bezierPath addLineToPoint:line.location];
        }
        [bezierPath stroke];
    }
}
@end