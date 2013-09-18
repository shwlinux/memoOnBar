//
//  memoOnBarAppDelegate.h
//  memoOnBar
//
//  Created by 현우 송 on 13. 9. 18..
//  Copyright 2013년 shwlinux@gmail.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface memoOnBarAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
