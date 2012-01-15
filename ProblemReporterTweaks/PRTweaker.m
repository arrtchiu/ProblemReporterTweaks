//
//  PRTweaker.m
//  ProblemReporterTweaks
//
//  Created by arrtchiu on 15/01/12.
//

#import "PRTweaker.h"

@implementation PRTweaker
+ (PRTweaker*)sharedInstance {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

+ (void)load {
    NSArray* windows = [[NSApplication sharedApplication] windows];
    for (NSWindow* window in windows) {
        NSView* contentView = [window contentView];
        for (NSView* view in [contentView subviews]) {
            if ([view isKindOfClass:NSClassFromString(@"OpaqueView")]) {
                for (NSView* subview in [view subviews]) {
                    if ([subview isKindOfClass:[NSButton class]]) {
                        NSButton* button = (NSButton*)subview;
                        NSString* selector = NSStringFromSelector([button action]);
                        if ([selector isEqualToString:@"sendToApple:"]) {
                            [button setKeyEquivalent:@""];
                        }
                    }
                }
            }
        }
    }
}
@end
