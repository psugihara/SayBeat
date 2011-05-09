//
//  SpeechLooper.m
//  SayBeat
//
//  Created by Peter Sugihara on 5/1/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import "SpeechLooper.h"


@implementation SpeechLooper


@synthesize phrase;

@synthesize voice;

- (id)init
{
    self = [super init];
    if (self) {
        voice = [[NSSpeechSynthesizer alloc] init];
        voice.delegate = self;
        looping = YES;
        phrase = @"";
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)setPhrase:(NSString *)p
{
    // Get rid of strings that are just whitespace.
    NSString *trimmed = [p stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
    if ([phrase isNotEqualTo:trimmed]) {
        phrase = [trimmed retain];
        if (looping && ![voice isSpeaking] && ![phrase isEqualToString:@""]) {
            [self speak];
        }
    }
}

- (void)speak
{
    [voice startSpeakingString:phrase];
}
     
#pragma - NSSpeechSynthesizerDelegate
 
 - (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)success
{
    if (looping && [phrase isNotEqualTo:@""])
        [self speak];
}
 
#pragma mark - NSCoding

static NSString *PhraseKey = @"Phrase";
static NSString *VoiceKey = @"Voice";
static NSString *RateKey = @"Rate";
static NSString *VolumeKey = @"Volume";

- (void)encodeWithCoder:(NSCoder *)encoder
{
    NSNumber *rate = [NSNumber numberWithFloat:[voice rate]];
    NSNumber *volume = [NSNumber numberWithFloat:[voice volume]];
    
    [encoder encodeObject:phrase forKey:PhraseKey];
    [encoder encodeObject:[voice voice] forKey:VoiceKey];
    [encoder encodeObject:rate forKey:RateKey];
    [encoder encodeObject:volume forKey:VolumeKey];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        voice = [[NSSpeechSynthesizer alloc] initWithVoice:[decoder decodeObjectForKey:VoiceKey]];
        voice.delegate = self;
        [voice setRate:[[decoder decodeObjectForKey:RateKey] floatValue]];
        [voice setVolume:[[decoder decodeObjectForKey:VolumeKey] floatValue]];
        looping = YES;
        self.phrase = [decoder decodeObjectForKey:PhraseKey];
    }
    return self;
}


@end
