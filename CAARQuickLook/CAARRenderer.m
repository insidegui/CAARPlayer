//
//  CAARRenderer.m
//  CAARQuickLook
//
//  Created by Guilherme Rambo on 06/08/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

#import "CAARRenderer.h"

#define kRenderScale 0.9

@interface CAARRenderer ()

@property (strong) CAPackage *package;
@property (copy) NSError *error;

@end

@implementation CAARRenderer

+ (instancetype)rendererWithPackageURL:(CFURLRef)url
{
    NSURL *fileURL = (__bridge NSURL *)url;
    
    NSError *loadError;
    CAPackage *package = [CAPackage packageWithContentsOfURL:fileURL type:kCAPackageTypeArchive options:nil error:&loadError];
    
    CAARRenderer *instance = [[CAARRenderer alloc] initWithPackage:package];
    instance.error = loadError;
    
    return instance;
}

- (instancetype)initWithPackage:(CAPackage *)package
{
    if (!(self = [super init])) return nil;
    
    _package = package;
    _size = package.rootLayer.bounds.size;
    
    return self;
}

- (void)renderInContext:(CGContextRef)ctx
{
    if (_error) {
        [self _renderErrorInContext:ctx];
    } else {
        [self _renderPackageInContext:ctx];
    }
}

- (void)_renderPackageInContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);
    
    CGContextScaleCTM(ctx, kRenderScale, kRenderScale);
    CGContextTranslateCTM(ctx, (_size.width - _size.width * kRenderScale) / 2, (_size.height - _size.height * kRenderScale) / 2);
    
    [_package.rootLayer renderInContext:ctx];
    
    CGContextRestoreGState(ctx);
}

- (void)_renderErrorInContext:(CGContextRef)ctx
{
    CGContextSetFillColorWithColor(ctx, [NSColor redColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, _size.width, _size.height));
}

@end
