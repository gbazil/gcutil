//
//  main.m
//  gcutil
//
//  Created by Vasily Suvorov on 22/02/2018.
//  Copyright © 2018 Vasily Suvorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSMux.h"

#define HELP "gcutil - graphic card utility\n" \
"Version 18.02, Vasily Suvorov (gbazil@gmail.com)\n" \
"Usage: gcutil [-d|-i|-a]\n" \
"\t-d\tForce Discrete card\n" \
"\t-i\tForce Integrated card\n" \
"\t-a\tDynamic switching\n"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [GSMux switcherOpen];

        if (argc == 1) {
            printf(HELP);

            char *state = "";
            if ([GSMux isUsingIntegratedGPU])
                state = "integrated card";
            if ([GSMux isUsingDiscreteGPU])
                state = "discrete card";

            char *mode = ", dynamic switching is off";
            if ([GSMux isUsingDynamicSwitching])
                mode = ", dynamic switching mode";

            printf("Current state: %s%s\n", state, mode);
        } else {
            if (strcmp(argv[1], "-i") == 0) {
                if ([GSMux setMode:GSSwitcherModeForceIntegrated])
                    printf("integrated card switched on\n");
            } else if (strcmp(argv[1], "-d") == 0) {
                if ([GSMux setMode:GSSwitcherModeForceDiscrete])
                    printf("discrete card switched on\n");
            } else if (strcmp(argv[1], "-a") == 0) {
                if ([GSMux setMode:GSSwitcherModeDynamicSwitching])
                    printf("dynamic switching is on\n");
            } else {
                printf(HELP);
            }
        }

        [GSMux switcherClose];
    }

    return 0;
}
