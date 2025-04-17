/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk

 Modified by Eric Horacek for Monospace Ltd. on 2/4/13
 */

#import "UIDevice+Hardware.h"

#import <sys/sysctl.h>


@interface UIDevice (Hardward)

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier;

- (NSString *)generationModelNameForModelIdentifier:(NSString *)modelIdentifier;

@end

@implementation UIDevice (Hardware)

- (NSString *)getSysInfoByName:(char *)typeSpecifier {
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);

    char *answer = calloc(size, sizeof(char));
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);

    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];

    free(answer);
    return results;
}

- (NSString *)modelIdentifier {
    return [self getSysInfoByName:"hw.machine"];
}

- (NSString *)modelName {
    return [self modelNameForModelIdentifier:[self modelIdentifier]];
}

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier {
    // iPhone https://www.theapplewiki.com/wiki/List_of_iPhones

    if ([modelIdentifier isEqualToString:@"iPhone1,1"])    return @"iPhone 1";
    if ([modelIdentifier isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([modelIdentifier isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([modelIdentifier isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
    if ([modelIdentifier isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([modelIdentifier isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([modelIdentifier isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([modelIdentifier isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([modelIdentifier isEqualToString:@"iPhone8,4"])    return @"iPhone SE (1st gen)";
    if ([modelIdentifier isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone10,1"])   return @"iPhone 8 (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone10,3"])   return @"iPhone X (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone10,4"])   return @"iPhone 8 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone10,6"])   return @"iPhone X (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([modelIdentifier isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max (China)";
    if ([modelIdentifier isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([modelIdentifier isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([modelIdentifier isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([modelIdentifier isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([modelIdentifier isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    if ([modelIdentifier isEqualToString:@"iPhone12,8"])   return @"iPhone SE (2nd gen)";
    if ([modelIdentifier isEqualToString:@"iPhone13,1"])   return @"iPhone 12 mini";
    if ([modelIdentifier isEqualToString:@"iPhone13,2"])   return @"iPhone 12";
    if ([modelIdentifier isEqualToString:@"iPhone13,3"])   return @"iPhone 12 Pro";
    if ([modelIdentifier isEqualToString:@"iPhone13,4"])   return @"iPhone 12 Pro Max";
    if ([modelIdentifier isEqualToString:@"iPhone14,2"])   return @"iPhone 13 Pro";
    if ([modelIdentifier isEqualToString:@"iPhone14,3"])   return @"iPhone 13 Pro Max";
    if ([modelIdentifier isEqualToString:@"iPhone14,4"])   return @"iPhone 13 mini";
    if ([modelIdentifier isEqualToString:@"iPhone14,5"])   return @"iPhone 13";
    if ([modelIdentifier isEqualToString:@"iPhone14,6"])   return @"iPhone SE (3rd gen)";
    if ([modelIdentifier isEqualToString:@"iPhone14,7"])   return @"iPhone 14";
    if ([modelIdentifier isEqualToString:@"iPhone14,8"])   return @"iPhone 14 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone15,2"])   return @"iPhone 14 Pro";
    if ([modelIdentifier isEqualToString:@"iPhone15,3"])   return @"iPhone 14 Pro Max";
    if ([modelIdentifier isEqualToString:@"iPhone15,4"])   return @"iPhone 15";
    if ([modelIdentifier isEqualToString:@"iPhone15,5"])   return @"iPhone 15 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone16,1"])   return @"iPhone 15 Pro";
    if ([modelIdentifier isEqualToString:@"iPhone16,2"])   return @"iPhone 15 Pro Max";
    if ([modelIdentifier isEqualToString:@"iPhone17,3"])   return @"iPhone 16";
    if ([modelIdentifier isEqualToString:@"iPhone17,4"])   return @"iPhone 16 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone17,1"])   return @"iPhone 16 Pro";
    if ([modelIdentifier isEqualToString:@"iPhone17,2"])   return @"iPhone 16 Pro Max";
    if ([modelIdentifier isEqualToString:@"iPhone17,5"])   return @"iPhone 16e";

    // iPad https://www.theapplewiki.com/wiki/List_of_iPads

    if ([modelIdentifier isEqualToString:@"iPad1,1"])      return @"iPad 1G";
    if ([modelIdentifier isEqualToString:@"iPad2,1"])      return @"iPad 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,2"])      return @"iPad 2G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,3"])      return @"iPad 2G (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPad2,4"])      return @"iPad 2G (Wi-Fi Rev A)";
    if ([modelIdentifier isEqualToString:@"iPad3,1"])      return @"iPad 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,2"])      return @"iPad 3G (Global)";
    if ([modelIdentifier isEqualToString:@"iPad3,3"])      return @"iPad 3G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,4"])      return @"iPad 4G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,5"])      return @"iPad 4G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,6"])      return @"iPad 4G (Global)";
    if ([modelIdentifier isEqualToString:@"iPad6,11"])     return @"iPad 5G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad6,12"])     return @"iPad 5G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad7,5"])      return @"iPad 6G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad7,6"])      return @"iPad 6G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad7,11"])     return @"iPad 7G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad7,12"])     return @"iPad 7G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad11,6"])     return @"iPad 8G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad11,7"])     return @"iPad 8G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad12,1"])     return @"iPad 9G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad12,2"])     return @"iPad 9G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad13,18"])    return @"iPad 10G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad13,19"])    return @"iPad 10G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad15,7"])     return @"iPad (A16) (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad15,8"])     return @"iPad (A16) (Cellular)";
    
    // iPad Air https://www.theapplewiki.com/wiki/List_of_iPad_Airs

    if ([modelIdentifier isEqualToString:@"iPad4,1"])      return @"iPad Air 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,2"])      return @"iPad Air 1G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,3"])      return @"iPad Air 1G (China)";
    if ([modelIdentifier isEqualToString:@"iPad5,3"])      return @"iPad Air 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,4"])      return @"iPad Air 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad11,3"])     return @"iPad Air 3G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad11,4"])     return @"iPad Air 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad13,1"])     return @"iPad Air 4G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad13,2"])     return @"iPad Air 4G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad13,16"])    return @"iPad Air 5G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad13,17"])    return @"iPad Air 5G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad14,8"])     return @"iPad Air [11-inch] (M2) (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad14,9"])     return @"iPad Air [11-inch] (M2) (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad14,10"])    return @"iPad Air [13-inch] (M2) (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad14,11"])    return @"iPad Air [13-inch] (M2) (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad15,3"])     return @"iPad Air [11-inch] (M3) (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad15,4"])     return @"iPad Air [11-inch] (M3) (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad15,5"])     return @"iPad Air [13-inch] (M3) (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad15,6"])     return @"iPad Air [13-inch] (M3) (Cellular)";

    // iPad mini https://www.theapplewiki.com/wiki/List_of_iPad_minis

    if ([modelIdentifier isEqualToString:@"iPad2,5"])      return @"iPad mini 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,6"])      return @"iPad mini 1G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,7"])      return @"iPad mini 1G (Global)";
    if ([modelIdentifier isEqualToString:@"iPad4,4"])      return @"iPad mini 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,5"])      return @"iPad mini 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,6"])      return @"iPad mini 2G (China)"; // TD-LTE model see https://support.apple.com/en-us/HT201471#iPad-mini2
    if ([modelIdentifier isEqualToString:@"iPad4,7"])      return @"iPad mini 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,8"])      return @"iPad mini 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,9"])      return @"iPad mini 3G (China)";
    if ([modelIdentifier isEqualToString:@"iPad5,1"])      return @"iPad mini 4G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,2"])      return @"iPad mini 4G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad11,1"])     return @"iPad mini 5G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad11,2"])     return @"iPad mini 5G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad14,1"])     return @"iPad mini 6G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad14,2"])     return @"iPad mini 6G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad16,1"])     return @"iPad mini (A17 Pro) (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad16,2"])     return @"iPad mini (A17 Pro) (Cellular)";

    // iPad Pro https://www.theapplewiki.com/wiki/IPad_Pro

    if ([modelIdentifier isEqualToString:@"iPad6,3"])      return @"iPad Pro [9.7 inch] 1G (Wi-Fi)"; // http://pdadb.net/index.php?m=specs&id=9938&c=apple_ipad_pro_9.7-inch_a1673_wifi_32gb_apple_ipad_6,3
    if ([modelIdentifier isEqualToString:@"iPad6,4"])      return @"iPad Pro [9.7 inch] 1G (Cellular)"; // http://pdadb.net/index.php?m=specs&id=9981&c=apple_ipad_pro_9.7-inch_a1675_td-lte_32gb_apple_ipad_6,4
    if ([modelIdentifier isEqualToString:@"iPad6,7"])      return @"iPad Pro [12.9 inch] 1G (Wi-Fi)"; // http://pdadb.net/index.php?m=specs&id=8960&c=apple_ipad_pro_wifi_a1584_128gb
    if ([modelIdentifier isEqualToString:@"iPad6,8"])      return @"iPad Pro [12.9 inch] 1G (Cellular)"; // http://pdadb.net/index.php?m=specs&id=8965&c=apple_ipad_pro_td-lte_a1652_32gb_apple_ipad_6,8
    if ([modelIdentifier isEqualToString:@"iPad7,1"])      return @"iPad Pro [12.9 inch] 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad7,2"])      return @"iPad Pro [12.9 inch] 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad7,3"])      return @"iPad Pro [10.5 inch] 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad7,4"])      return @"iPad Pro [10.5 inch] 1G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,1"])      return @"iPad Pro [11 inch] 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,2"])      return @"iPad Pro [11 inch] 1G (1TB, Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,3"])      return @"iPad Pro [11 inch] 1G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,4"])      return @"iPad Pro [11 inch] 1G (1TB, Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,5"])      return @"iPad Pro [12.9 inch] 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,6"])      return @"iPad Pro [12.9 inch] 3G (1TB, Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,7"])      return @"iPad Pro [12.9 inch] 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,8"])      return @"iPad Pro [12.9 inch] 3G (1TB, Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,9"])      return @"iPad Pro [11 inch] 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,10"])     return @"iPad Pro [11 inch] 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,11"])     return @"iPad Pro [12.9 inch] 4G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,12"])     return @"iPad Pro [12.9 inch] 4G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad13,4"])     return @"iPad Pro [11 inch] 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad13,5"])     return @"iPad Pro [11 inch] 3G (Cellular US)";
    if ([modelIdentifier isEqualToString:@"iPad13,6"])     return @"iPad Pro [11 inch] 3G (Cellular Global)";
    if ([modelIdentifier isEqualToString:@"iPad13,7"])     return @"iPad Pro [11 inch] 3G (Cellular China)";
    if ([modelIdentifier isEqualToString:@"iPad13,8"])     return @"iPad Pro [12.9 inch] 5G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad13,9"])     return @"iPad Pro [12.9 inch] 5G (Cellular US)";
    if ([modelIdentifier isEqualToString:@"iPad13,10"])    return @"iPad Pro [12.9 inch] 5G (Cellular Global)";
    if ([modelIdentifier isEqualToString:@"iPad13,11"])    return @"iPad Pro [12.9 inch] 5G (Cellular China)";
    if ([modelIdentifier isEqualToString:@"iPad14,3"])     return @"iPad Pro [11 inch] 4G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad14,4"])     return @"iPad Pro [11 inch] 4G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad14,5"])     return @"iPad Pro [12.9 inch] 6G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad14,6"])     return @"iPad Pro [12.9 inch] 6G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad16,3"])     return @"iPad Pro [11 inch] (M4) (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad16,4"])     return @"iPad Pro [11 inch] (M4) (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad16,5"])     return @"iPad Pro [13 inch] (M4) (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad16,6"])     return @"iPad Pro [13 inch] (M4) (Cellular)";
    
    // iPod https://www.theapplewiki.com/wiki/List_of_iPod_touches

    if ([modelIdentifier isEqualToString:@"iPod1,1"])      return @"iPod touch 1G";
    if ([modelIdentifier isEqualToString:@"iPod2,1"])      return @"iPod touch 2G";
    if ([modelIdentifier isEqualToString:@"iPod3,1"])      return @"iPod touch 3G";
    if ([modelIdentifier isEqualToString:@"iPod4,1"])      return @"iPod touch 4G";
    if ([modelIdentifier isEqualToString:@"iPod5,1"])      return @"iPod touch 5G";
    if ([modelIdentifier isEqualToString:@"iPod7,1"])      return @"iPod touch 6G"; // as 6,1 was never released 7,1 is actually 6th generation
    if ([modelIdentifier isEqualToString:@"iPod9,1"])      return @"iPod touch 7G";

    // Apple TV https://www.theapplewiki.com/wiki/List_of_Apple_TVs

    if ([modelIdentifier isEqualToString:@"AppleTV1,1"])   return @"Apple TV 1G";
    if ([modelIdentifier isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3G (Rev A)"; // small, incremental update over 3,1
    if ([modelIdentifier isEqualToString:@"AppleTV5,3"])   return @"Apple TV 4G"; // as 4,1 was never released, 5,1 is actually 4th generation
    if ([modelIdentifier isEqualToString:@"AppleTV6,2"])   return @"Apple TV 4K";
    if ([modelIdentifier isEqualToString:@"AppleTV11,1"])  return @"Apple TV 4K 2G";
    if ([modelIdentifier isEqualToString:@"AppleTV14,1"])  return @"Apple TV 4K 3G";

    // Apple Vision https://www.theapplewiki.com/wiki/List_of_Apple_Visions

    if ([modelIdentifier isEqualToString:@"RealityDevice14,1"])  return @"Apple Vision Pro";

    // Simulator
    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
    {
        BOOL smallerScreen = ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }

    return modelIdentifier;
}

- (NSString *)generationModelName {
    return [self generationModelNameForModelIdentifier:[self modelIdentifier]];
}

- (NSString *)generationModelNameForModelIdentifier:(NSString *)modelIdentifier {
    NSString *modelName = [self modelNameForModelIdentifier:modelIdentifier];
    
    NSString *generationModelName = [[modelName componentsSeparatedByString:@" ("] firstObject];
    
    return generationModelName;
}

- (UIDeviceFamily)deviceFamily {
    NSString *modelIdentifier = [self modelIdentifier];
    if ([modelIdentifier hasPrefix:@"iPhone"])  return UIDeviceFamilyiPhone;
    if ([modelIdentifier hasPrefix:@"iPod"])    return UIDeviceFamilyiPod;
    if ([modelIdentifier hasPrefix:@"iPad"])    return UIDeviceFamilyiPad;
    if ([modelIdentifier hasPrefix:@"AppleTV"]) return UIDeviceFamilyAppleTV;
    if ([modelIdentifier hasPrefix:@"Reality"]) return UIDeviceFamilyAppleVision;
    return UIDeviceFamilyUnknown;
}

@end
