//
//  TownCrier.h
//  SayBeat
//
//  Created by Peter Sugihara on 4/30/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TownCrier : NSObject <NSSpeechSynthesizerDelegate> {
    int nextProclomation;
@private
    BOOL loop;
    NSArray *proclamations;
    NSSpeechSynthesizer *voice;
}

@property (assign) int nextProclomation;
@property (nonatomic,retain) NSArray *proclamations; // Proclomations
@property (retain) NSSpeechSynthesizer *voice;

- (id)initWithVoice:(NSString *)voiceIdentifier;
- (void)start;
- (void)sayNext;

@end
