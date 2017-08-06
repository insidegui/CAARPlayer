//
//  Document.h
//  CAARPlayer
//
//  Created by Guilherme Rambo on 06/08/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "QuartzCorePrivate.h"

@interface Document : NSDocument

@property (nonatomic, strong) CAPackage *package;

@end

