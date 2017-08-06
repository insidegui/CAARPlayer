//
//  CAARClipView.m
//  CAARPlayer
//
//  Created by Guilherme Rambo on 06/08/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

#import "CAARClipView.h"

@implementation CAARClipView

- (NSRect)constrainBoundsRect:(NSRect)proposedBounds
{
    NSRect constrainedClipViewBounds = [super constrainBoundsRect:proposedBounds];
    
    NSRect documentViewFrame = self.documentView.frame;
    
    if (documentViewFrame.size.width < proposedBounds.size.width) {
        constrainedClipViewBounds.origin.x = floor((proposedBounds.size.width - documentViewFrame.size.width) / -2.0);
    }
    
    if (documentViewFrame.size.height < proposedBounds.size.height) {
        constrainedClipViewBounds.origin.y = floor((proposedBounds.size.height - documentViewFrame.size.height) / -2.0);
    }
    
    return constrainedClipViewBounds;
}

@end
