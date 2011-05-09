//
//  ChannelViewController.m
//  SayBeat
//
//  Created by Peter Sugihara on 5/1/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import "ChannelViewController.h"

@implementation ChannelViewController


@synthesize textField;

@synthesize voiceMenu;

@synthesize rateSlider;

@synthesize volumeSlider;

@synthesize looper;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self loadView];

        [voiceMenu removeAllItems];
        NSMutableArray *menuItems = [[NSMutableArray alloc] init];
        for (NSString *s in [NSSpeechSynthesizer availableVoices]) {
            [menuItems addObject:[s substringFromIndex:33]];
        }
        [voiceMenu addItemsWithTitles:menuItems];
        [voiceMenu selectItemWithTitle:@"Whisper"];
        
        looper = [[SpeechLooper alloc] init];

        [self syncVoiceWithControls];
    }
    
    return self;
}

- (IBAction)controlTouched:(id)sender
{
    [self syncVoiceWithControls];
}

- (void)syncVoiceWithControls
{
    NSString *prefix = @"com.apple.speech.synthesis.voice.";
    [looper.voice setVoice:[prefix stringByAppendingString:[voiceMenu titleOfSelectedItem]]];
    [looper.voice setRate:[rateSlider floatValue]];
    [looper.voice setVolume:[volumeSlider floatValue]];
}


@end
