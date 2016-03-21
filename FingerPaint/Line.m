//
//  Line.m
//  FingerPaint
//
//  Created by Tenzin Phagdol on 2016-03-18.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)initWithPreviousLocation:(CGPoint)prevLocation location:(CGPoint)location {
    if (self = [super init]) {
        _previousLocation = prevLocation;
        _location = location;
    }
    return self;
}

@end
