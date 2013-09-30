//
//  PreferencesController.m
//  memoOnBar
//
//  Created by 현우 송 on 13. 9. 19..
//  Copyright 2013년 shwlinux@gmail.com. All rights reserved.
//
#import <Foundation/NSKeyedArchiver.h>
#import "PreferencesController.h"
#import "memoOnBarAppDelegate.h"

@implementation PreferencesController
@synthesize datePicker;
@synthesize textFormatter;
@synthesize preferences;
@synthesize textFormat;
@synthesize anniversary;
@synthesize app;

-(id)init{
    if (![super initWithWindowNibName:@"Preferences"]) {
		return nil;
    }
    
    [self readConfig];

    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];

    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [datePicker setDateValue:anniversary];
    [textFormatter setStringValue:textFormat];
}

- (void)focus
{
    [[self window] center];
    [[self window] orderFrontRegardless];
    [NSApp activateIgnoringOtherApps:YES];
}

- (IBAction)onSave:(id)sender {
    NSString * textFormatOnPreference = [textFormatter stringValue];
    NSDate * anniversaryOnPreference = [datePicker dateValue];
    textFormat = textFormatOnPreference;
    anniversary = anniversaryOnPreference;
    
    [app displayOnBar];
    [self writeConfig];
}

- (IBAction)onToday:(id)sender {
    [datePicker setDateValue:[NSDate date]];
}

- (BOOL)readConfig {
    anniversary = [NSKeyedUnarchiver unarchiveObjectWithFile:@"anniversary.archive"];
    textFormat = [NSKeyedUnarchiver unarchiveObjectWithFile:@"textFormat.archive"];

    return true;
}

- (BOOL)writeConfig {
    [NSKeyedArchiver archiveRootObject:anniversary toFile:@"anniversary.archive"];
    [NSKeyedArchiver archiveRootObject:textFormat toFile:@"textFormat.archive"];
    
     return true;
}

-(void)dealloc{
    [super dealloc];
}
@end
