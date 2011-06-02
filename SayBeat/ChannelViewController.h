//
//  ChannelViewController.h
//  SayBeat
//
//  Created by Peter Sugihara on 5/1/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SpeechLooper.h"


@interface ChannelViewController : NSViewController <NSCoding> {
@private
    NSTextField *textField;
    NSPopUpButton *voiceMenu;
    NSSlider *rateSlider;
    NSSlider *volumeSlider;
    
    SpeechLooper *looper;
}

@property (assign) IBOutlet NSTextField *textField;
@property (assign) IBOutlet NSPopUpButton *voiceMenu;
@property (assign) IBOutlet NSSlider *rateSlider;
@property (assign) IBOutlet NSSlider *volumeSlider;

@property (nonatomic, retain) IBOutlet SpeechLooper *looper;

- (IBAction)controlTouched:(id)sender;
- (void)syncVoiceWithControls;
- (void)syncControlsWithVoice;

@end
