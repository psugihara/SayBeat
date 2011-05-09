//
//  TownCrier.m
//  SayBeat
//
//  Created by Peter Sugihara on 4/30/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import "TownCrier.h"
#import "Proclamation.h"

@implementation TownCrier

@synthesize nextProclomation;
@synthesize proclamations;
@synthesize voice;

- (id)init
{
    self = [self initWithVoice:[[NSSpeechSynthesizer availableVoices] lastObject]];
    
    return self;
}

- (id)initWithVoice:(NSString *)voiceIdentifier
{
    self = [super init];
    if (self) {
        nextProclomation = 0;
        voice = [[NSSpeechSynthesizer alloc] initWithVoice:voiceIdentifier];
        voice.delegate = self;
    }
    
    return self;
}

- (void)start
{
    loop = YES;
    [self sayNext];
}

- (void)sayNext
{
    NSString *string = nil;
    if ([proclamations count] >= nextProclomation + 1) {
        Proclamation *p = [proclamations objectAtIndex:nextProclomation];
        if (p.string)
            string = [p.string copy];
    }
    nextProclomation = (nextProclomation + 1) % (int)[proclamations count];

    if (string) {
        [voice startSpeakingString:string];
    } else if (loop) {
        [self sayNext];
    }
}

#pragma - NSSpeechSynthesizerDelegate

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)success
{
    if (loop)
        [self sayNext];
}


@end
