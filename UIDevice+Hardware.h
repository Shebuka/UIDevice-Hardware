/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk
 
 Modified by Eric Horacek for Monospace Ltd. on 2/4/13
 */

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, UIDeviceFamily) {
    UIDeviceFamilyUnknown,
    UIDeviceFamilyiPhone,
    UIDeviceFamilyiPod,
    UIDeviceFamilyiPad,
    UIDeviceFamilyAppleTV,
    UIDeviceFamilyAppleVision,
};

@interface UIDevice (Hardware)

/**
 Returns a machine-readable model name in the format of "iPhone4,1"
 */
- (NSString *)modelIdentifier;

/**
 Returns a human-readable model name in the format of "iPhone 4S". Fallback of the the `modelIdentifier` value.
 */
- (NSString *)modelName;

/**
 Returns a human-readable model name grouped by generation in the format of "iPhone 4S". Fallback of the the `modelIdentifier` value.
 */
- (NSString *)generationModelName;

/**
 Returns the device family as a `UIDeviceFamily`
 */
- (UIDeviceFamily)deviceFamily;

@end
