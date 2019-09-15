//
//  HXDirtyView.m
//  HXDirtyRect
//
//  Created by haoxu.wang on 2019/9/14.
//  Copyright © 2019 haoxu.wang. All rights reserved.
//

#import "HXDirtyView.h"

#define BRUSH_SIZE 32


@interface HXDirtyView ()

@property (nonatomic, strong) NSMutableArray *strokes;

@end

@implementation HXDirtyView

- (NSMutableArray *)strokes {
    if (!_strokes) {
        _strokes = [[NSMutableArray alloc] init];
    }
    return _strokes;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add brush stroke
    [self addBrushStrokeAtPoint:point];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add brush stroke
    [self addBrushStrokeAtPoint:point];
    
    
}

//##################################################### 脏区域版本
- (void)addBrushStrokeAtPoint:(CGPoint)point
{
    //add brush stroke to array
    [self.strokes addObject:[NSValue valueWithCGPoint:point]];

    //set dirty rect
    [self setNeedsDisplayInRect:[self brushRectForPoint:point]];
}

- (CGRect)brushRectForPoint:(CGPoint)point
{
    return CGRectMake(point.x - BRUSH_SIZE/2, point.y - BRUSH_SIZE/2, BRUSH_SIZE, BRUSH_SIZE);
}

- (void)drawRect:(CGRect)rect
{
    //redraw strokes
    for (NSValue *value in self.strokes) {
        //get point
        CGPoint point = [value CGPointValue];

        //get brush rect
        CGRect brushRect = [self brushRectForPoint:point];
        //only draw brush stroke if it intersects dirty rect
//        NSLog(@"-*/-*/-*/-*/*-/-*/-*/-*/-*/-*/ %@  %@", NSStringFromCGRect(rect), NSStringFromCGRect(brushRect));
        if (CGRectIntersectsRect(rect, brushRect)) {
            //draw brush stroke
            [[UIImage imageNamed:@"star"] drawInRect:brushRect];
        } else {
            NSLog(@"-*/-*/-*/-*/*-/-*/-*/-*/-*/-*/");
        }
    }
}



//##################################################### 普通版本
//- (void)addBrushStrokeAtPoint:(CGPoint)point
//{
//    //add brush stroke to array
//    [self.strokes addObject:[NSValue valueWithCGPoint:point]];
//
//    //needs redraw
//    [self setNeedsDisplay];
//}
//
//- (void)drawRect:(CGRect)rect
//{
//    //redraw strokes
//    for (NSValue *value in self.strokes) {
//        //get point
//        CGPoint point = [value CGPointValue];
//
//        //get brush rect
//        CGRect brushRect = CGRectMake(point.x - BRUSH_SIZE/2, point.y - BRUSH_SIZE/2, BRUSH_SIZE, BRUSH_SIZE);
//
//        //draw brush stroke    ￼
//        [[UIImage imageNamed:@"star"] drawInRect:brushRect];
//    }
//}

@end
