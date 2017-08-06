//
//  Document.m
//  CAARPlayer
//
//  Created by Guilherme Rambo on 06/08/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (void)makeWindowControllers {
    // Override to return the Storyboard file name of the document.
    [self addWindowController:[[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"]];
    
    self.windowControllers.firstObject.window.styleMask |= NSWindowStyleMaskFullSizeContentView;
    self.windowControllers.firstObject.window.titlebarAppearsTransparent = YES;
    
    [[self.windowControllers.firstObject contentViewController] setRepresentedObject:self];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    self.package = [CAPackage packageWithData:data type:kCAPackageTypeArchive options:nil error:outError];
    
    return YES;
}


@end
