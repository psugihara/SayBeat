//
//  SpeechLooper.h
//  SayBeat
//
//  Created by Peter Sugihara on 5/1/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SpeechLooper : NSObject <NSSpeechSynthesizerDelegate> {
    BOOL looping;
@private
    NSString *phrase;
    NSSpeechSynthesizer *voice;
}

@property (nonatomic, retain) NSString *phrase;
@property (nonatomic, retain) NSSpeechSynthesizer *voice;

- (void)speak;

@end
