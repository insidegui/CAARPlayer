//
//  CAARRenderer.h
//  CAARQuickLook
//
//  Created by Guilherme Rambo on 06/08/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QuartzCorePrivate.h"

@interface CAARRenderer : NSObject

+ (instancetype)rendererWithPackageURL:(CFURLRef)url;
- (void)renderInContext:(CGContextRef)ctx;

@property (assign) CGSize size;

@end
