//
//  memoOnBarAppDelegate.h
//  memoOnBar
//
//  Created by 현우 송 on 13. 9. 18..
//  Copyright 2013년 shwlinux@gmail.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PreferencesController;

@interface memoOnBarAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
    IBOutlet NSMenuItem *runAtLogin;
    IBOutlet NSMenuItem *preferences;
    PreferencesController * preferencesWindow;
    NSTimer * refreshTimer;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) NSTimer * refreshTimer;
- (IBAction)onClickRunAtLogin:(id)sender;
- (IBAction)onClickPreferences:(id)sender;
- (IBAction)onClickQuit:(id)sender;
- (void)displayOnBar;
- (void)refresh:(NSTimer *)timer;


@end
