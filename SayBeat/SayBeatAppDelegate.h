//
//  SayBeatAppDelegate.h
//  SayBeat
//
//  Created by Peter Sugihara on 4/30/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ChannelViewController.h"

@interface SayBeatAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    
    NSView *channel1;
    NSView *channel2;
    NSView *channel3;
    NSView *channel4;
    
    ChannelViewController *c1;
    ChannelViewController *c2;
    ChannelViewController *c3;
    ChannelViewController *c4;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *channel1;
@property (assign) IBOutlet NSView *channel2;
@property (assign) IBOutlet NSView *channel3;
@property (assign) IBOutlet NSView *channel4;

- (void)loadDefaults;
- (void)saveDefaults;

@end
