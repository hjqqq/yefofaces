//
//  AppDelegate.h
//  cocos test
//
//  Created by yeforriak on 01/06/2011.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
    UIImageView  *_splashScreen;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UIImageView *splashScreen;

@end
