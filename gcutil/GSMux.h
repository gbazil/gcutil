//
//  GSMux.h
//  gfxCardStatus
//
//  Created by Cody Krieger on 6/21/11.
//  Copyright 2011 Cody Krieger. All rights reserved.
//
//  Changed for use in a CLI application on 2/22/18
//  by Vasily Suvorov (gbazil@gmail.com)
//

#import <Foundation/Foundation.h>

#define kDriverClassName "AppleGraphicsControl"

typedef enum {
    GSSwitcherModeForceIntegrated,
    GSSwitcherModeForceDiscrete,
    GSSwitcherModeDynamicSwitching,
    GSSwitcherModeToggleGPU
} GSSwitcherMode;

@interface GSMux : NSObject

// Switching driver initialization and cleanup routines.
+ (BOOL)switcherOpen;
+ (void)switcherClose;

+ (BOOL)setMode:(GSSwitcherMode)mode;

+ (BOOL)isUsingIntegratedGPU;
+ (BOOL)isUsingDiscreteGPU;
+ (BOOL)isUsingDynamicSwitching;

// Whether or not a machine is using the old-style "you must log out first"
// switching policy or not. We kick machines into said policy when we switch to
// Integrated Only or Discrete Only for reliability and consistency purposes.
+ (BOOL)isUsingOldStyleSwitchPolicy;

+ (BOOL)isOnIntegratedOnlyMode;
+ (BOOL)isOnDiscreteOnlyMode;

@end
