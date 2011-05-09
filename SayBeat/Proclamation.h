//
//  Proclamation.h
//  SayBeat
//
//  Created by Peter Sugihara on 5/1/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//
//  Proclamation wraps a string for use with bindings.
#import <Foundation/Foundation.h>


@interface Proclamation : NSObject {
@private
    NSString *string;
}

@property (retain) NSString *string;

@end
