//
//  ViewController.m
//  CAARPlayer
//
//  Created by Guilherme Rambo on 06/08/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

#import "ViewController.h"

#import "Document.h"
#import "CAARClipView.h"

@interface ViewController ()

@property (readonly) Document *document;
@property (strong) NSScrollView *scrollView;
@property (strong) NSView *layerContainer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.wantsLayer = YES;
    self.view.layer = [CALayer layer];
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
}

- (void)viewDidAppear
{
    [super viewDidAppear];
}

- (Document *)document {
    return (Document *)self.representedObject;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    [self _installDocument];
}

- (void)_installDocument
{
    if (!self.document.package) return;
    
    self.scrollView = [[NSScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    self.scrollView.wantsLayer = YES;
    self.scrollView.borderType = NSNoBorder;
    self.scrollView.allowsMagnification = YES;
    self.scrollView.maxMagnification = 200;
    
    self.scrollView.contentView = [[CAARClipView alloc] initWithFrame:self.scrollView.bounds];
    self.scrollView.contentView.wantsLayer = YES;
    
    [self.view addSubview:self.scrollView];
    
    CALayer *rootLayer = self.document.package.rootLayer;
    
    self.layerContainer = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, rootLayer.bounds.size.width, rootLayer.bounds.size.height)];
    self.layerContainer.wantsLayer = YES;
    self.layerContainer.layer = [CALayer layer];
    
    [self.layerContainer.layer addSublayer:rootLayer];
    
    self.layerContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView setDocumentView:self.layerContainer];
}

@end
