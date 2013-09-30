//
//  memoOnBarAppDelegate.m
//  memoOnBar
//
//  Created by 현우 송 on 13. 9. 18..
//  Copyright 2013년 shwlinux@gmail.com. All rights reserved.
//

#import "memoOnBarAppDelegate.h"
#import "PreferencesController.h"

@implementation memoOnBarAppDelegate

@synthesize window;
@synthesize refreshTimer;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void) awakeFromNib 
{
    // Initialize Preferences.
    if (!preferencesWindow) {
        preferencesWindow = [[PreferencesController alloc] init];
    }
    
    // Initialize Timer
    
    refreshTimer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
    // Display.
    NSDate * now = [NSDate date];
    NSDate * from = [preferencesWindow anniversary];
    
    if(!from) {
        from = [NSDate date];
    }
    
    NSTimeInterval timeInterval = [now timeIntervalSinceDate: from];
    
    NSString * strFormat = [preferencesWindow textFormat];
    
    if(!strFormat)
        strFormat = @"%d Days!";
    
    NSString * strOnBar = [NSString stringWithFormat: strFormat, (int)(timeInterval / 60 / 60 / 24) + 1];
    
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
    [statusItem setMenu:statusMenu];
    [statusItem setTitle:strOnBar];
    [statusItem setHighlightMode:YES];    
}

- (IBAction)onClickRunAtLogin:(id)sender {
    if([runAtLogin state] == NSOnState)
        [runAtLogin setState:NSOffState];
    else
        [runAtLogin setState:NSOnState];
}

- (IBAction)onClickPreferences:(id)sender {    
    preferencesWindow = [[PreferencesController alloc] init];
    
    [preferencesWindow setApp:self];
    [preferencesWindow showWindow:self];
    [preferencesWindow focus];
}

- (IBAction)onClickQuit:(id)sender {
    [NSApp terminate:self];
}


- (void)displayOnBar {
    NSDate * now = [NSDate date];
    NSDate * from = [preferencesWindow anniversary];
    
    if(!from) {
        from = [NSDate date];
    }
    
    NSTimeInterval timeInterval = [now timeIntervalSinceDate: from];
    
    NSString * strFormat = [preferencesWindow textFormat];
    
    if(!strFormat)
        strFormat = @"%d Days!";
    
    NSString * strOnBar = [NSString stringWithFormat: strFormat, (int)(timeInterval / 60 / 60 / 24) + 1];
    [statusItem setTitle:strOnBar];
}

-(void)dealloc {
    if(preferencesWindow)
        [preferencesWindow dealloc];
}

- (void)refresh:(NSTimer *) timer {
    [self displayOnBar];
}


@end
