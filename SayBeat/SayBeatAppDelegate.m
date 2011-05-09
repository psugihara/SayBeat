//
//  SayBeatAppDelegate.m
//  SayBeat
//
//  Created by Peter Sugihara on 4/30/11.
//  Copyright 2011 Peter Sugihara. All rights reserved.
//

#import "SayBeatAppDelegate.h"
#import "SpeechLooper.h"

@implementation SayBeatAppDelegate

@synthesize window;
@synthesize channel1, channel2, channel3, channel4;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    c1 = [[ChannelViewController alloc] initWithNibName:@"ChannelView" bundle:nil];
    [channel1 addSubview:c1.view];

    c2 = [[ChannelViewController alloc] initWithNibName:@"ChannelView" bundle:nil];
    [channel2 addSubview:c2.view];
    
    c3 = [[ChannelViewController alloc] initWithNibName:@"ChannelView" bundle:nil];
    [channel3 addSubview:c3.view];
    
    c4 = [[ChannelViewController alloc] initWithNibName:@"ChannelView" bundle:nil];
    [channel4 addSubview:c4.view];
    
//    [self loadDefaults];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
//    [self saveDefaults];
}

#pragma mark - Defaults

static NSString *VersionKey = @"Version";

static NSString *C1LooperKey = @"C1Looper";
static NSString *C2LooperKey = @"C2Looper";
static NSString *C3LooperKey = @"C3Looper";
static NSString *C4LooperKey = @"C4Looper";

- (void)loadDefaults
{
    // Load defaults.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults stringForKey:VersionKey]) {
        NSData *data;
        
        data = [defaults objectForKey:C1LooperKey];
        [c1 setLooper:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
        
        data = [defaults objectForKey:C2LooperKey];
        [c2 setLooper:[NSKeyedUnarchiver unarchiveObjectWithData:data]];

        data = [defaults objectForKey:C3LooperKey];
        [c3 setLooper:[NSKeyedUnarchiver unarchiveObjectWithData:data]];

        data = [defaults objectForKey:C4LooperKey];
        [c4 setLooper:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    } else { // first use of the app
        c1.looper.phrase = @"Hi, how are you?";
        [c1.textField setStringValue:@"Hi, how are you?"];
        [c2.textField setStringValue:@"I'm a talker looper!"];
        [c3.textField setStringValue:@"Type something here and I'll say it."];
        [c4.textField setStringValue:@"Toggle my buttons below too!"];
    }
}

- (void)saveDefaults
{
    NSData *data;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

	data = [NSKeyedArchiver archivedDataWithRootObject:c1.looper];
	[defaults setObject:data forKey:C1LooperKey];
	
    data = [NSKeyedArchiver archivedDataWithRootObject:c2.looper];
	[defaults setObject:data forKey:C2LooperKey];
    
	data = [NSKeyedArchiver archivedDataWithRootObject:c3.looper];
	[defaults setObject:data forKey:C3LooperKey];

    data = [NSKeyedArchiver archivedDataWithRootObject:c4.looper];
	[defaults setObject:data forKey:C4LooperKey];

    NSString *currentVersion = (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    [defaults setObject:currentVersion forKey:VersionKey];
     
	[defaults synchronize];
}

@end
