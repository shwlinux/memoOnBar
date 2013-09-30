//
//  PreferencesController.h
//  memoOnBar
//
//  Created by 현우 송 on 13. 9. 19..
//  Copyright 2013년 shwlinux@gmail.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class memoOnBarAppDelegate;
@interface PreferencesController : NSWindowController {
    NSWindow *window;
    NSDatePicker *datePicker;
    NSTextField *textFormatter;
    @public
    memoOnBarAppDelegate * app;
}
@property memoOnBarAppDelegate * app;
@property (assign) IBOutlet NSDatePicker *datePicker;
@property (assign) IBOutlet NSTextField *textFormatter;
@property (retain) NSString * textFormat;
@property (retain) NSDate * anniversary;

@property (assign) IBOutlet NSWindow *preferences;
- (void) focus;
- (IBAction)onSave:(id)sender;
- (IBAction)onToday:(id)sender;
- (BOOL) readConfig;
- (BOOL) writeConfig;

@end
