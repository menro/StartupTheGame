//  ModalAlert.h
//
//  Created by Hans-Juergen Richstein
//  Copyright 2012 ROMBOS. All rights reserved.

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface ModalAlert : NSObject
+ (void) Ask: (NSString *) question onLayer: (CCLayer *) layer yesBlock: (void(^)())yesBlock noBlock: (void(^)())noBlock;
+ (void) Confirm: (NSString *) question onLayer: (CCLayer *) layer okBlock: (void(^)())okBlock cancelBlock: (void(^)())cancelBlock;
+ (void) Tell: (NSString *) statement onLayer: (CCLayer *) layer okBlock: (void(^)())okBlock;
@end