//
//  Line.h
//  FingerPaint
//
//  Created by Tenzin Phagdol on 2016-03-18.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

@import UIKit;

@interface Line : NSObject
@property (nonatomic) CGPoint previousLocation;
@property (nonatomic) CGPoint location;
@property (nonatomic) UIColor *color;
- (instancetype)initWithPreviousLocation:(CGPoint)prevLocation location:(CGPoint)location;
@end