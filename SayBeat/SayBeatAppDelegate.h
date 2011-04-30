//
//  SayBeatAppDelegate.h
//  SayBeat
//
//  Created by Peter Sugihara on 4/30/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SayBeatAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
