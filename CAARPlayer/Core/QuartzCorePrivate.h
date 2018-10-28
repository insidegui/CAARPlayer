//
//  QuartzCorePrivate.h
//  Appearance Maker
//
//  Created by Guilherme Rambo on 26/03/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

@import Cocoa;
@import QuartzCore;

@interface CAFilter : NSObject <NSCopying, NSMutableCopying, NSCoding>

+ (instancetype)filterWithType:(NSString *)type;
+ (NSArray <NSString *> *)filterTypes;

- (NSArray <NSString *> *)outputKeys;
- (NSArray <NSString *> *)inputKeys;
- (void)setDefaults;

@property(copy) NSString *name;
@property(readonly) NSString *type;

@property(getter=isEnabled) BOOL enabled;

@end

extern NSData *CAEncodeLayerTree(CALayer *rootLayer);

extern NSString *kCAPackageTypeArchive;
extern NSString *kCAPackageTypeCAMLBundle;

@interface CAPackage : NSObject

+ (id)packageWithData:(NSData *)data type:(NSString *)type options:(id)opts error:(NSError **)outError;
+ (id)packageWithContentsOfURL:(NSURL *)url type:(NSString *)type options:(id)opts error:(NSError **)outError;

- (NSArray <NSString *> *)publishedObjectNames;

@property(readonly, getter=isGeometryFlipped) BOOL geometryFlipped;
@property(readonly) CALayer *rootLayer;

@end
