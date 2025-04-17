# UIDevice-Hardware

A lightweight Objective-C category for `UIDevice` that provides detailed hardware information for iOS devices, including model identifiers, model names, and device family classification. This library is useful for developers who need to identify specific Apple device models (iPhone, iPad, iPod, Apple TV, Apple Vision) programmatically.

Originally created by **Erica Sadun** and modified by **Eric Horacek** for Monospace Ltd., this fork is maintained by [Shebuka](https://github.com/Shebuka) with updated device support and additional features.

## Features

- Retrieve the **model identifier** (e.g., `iPhone15,4`) of the current device.
- Get the **human-readable model name** (e.g., `iPhone 15`) with variant details (e.g., `GSM`, `Wi-Fi`, `Cellular`).
- Extract the **generation model name** (e.g., `iPhone 15` without variant details).
- Determine the **device family** (iPhone, iPad, iPod, Apple TV, Apple Vision, or Unknown).
- Supports a wide range of Apple devices, including:
  - iPhone (1 to 16 Pro Max)
  - iPad (1st Gen to 10th Gen, Air, Mini, Pro)
  - iPod Touch (1st to 7th Gen)
  - Apple TV (1st to 4K 3rd Gen)
  - Apple Vision Pro
- Lightweight and easy to integrate into iOS projects.
- BSD License for flexible use in commercial and open-source projects.

## Installation

### Manual Installation

1. Download the repository or clone it:
   ```bash
   git clone https://github.com/Shebuka/UIDevice-Hardware.git
   ```
2. Copy the `UIDevice+Hardware.h` and `UIDevice+Hardware.m` files into your Xcode project.
3. Import the header file in your code:
   ```objc
   #import "UIDevice+Hardware.h"
   ```

### CocoaPods (Not Supported)

This repository does not currently support CocoaPods. If you would like to contribute a Podspec, please submit a pull request.

## Usage

The `UIDevice+Hardware` category extends `UIDevice` with methods to access hardware information. Below are examples of how to use the provided methods.

### Example Code

```objc
#import "UIDevice+Hardware.h"

- (void)logDeviceInfo {
    UIDevice *device = [UIDevice currentDevice];
    
    // Get the model identifier (e.g., "iPhone15,4")
    NSString *modelIdentifier = [device modelIdentifier];
    NSLog(@"Model Identifier: %@", modelIdentifier);
    
    // Get the full model name (e.g., "iPhone 15")
    NSString *modelName = [device modelName];
    NSLog(@"Model Name: %@", modelName);
    
    // Get the generation model name (e.g., "iPhone 15" without variant details)
    NSString *generationModelName = [device generationModelName];
    NSLog(@"Generation Model Name: %@", generationModelName);
    
    // Get the device family (e.g., UIDeviceFamilyiPhone)
    UIDeviceFamily deviceFamily = [device deviceFamily];
    NSString *familyName;
    switch (deviceFamily) {
        case UIDeviceFamilyiPhone: familyName = @"iPhone"; break;
        case UIDeviceFamilyiPad: familyName = @"iPad"; break;
        case UIDeviceFamilyiPod: familyName = @"iPod"; break;
        case UIDeviceFamilyAppleTV: familyName = @"Apple TV"; break;
        case UIDeviceFamilyAppleVision: familyName = @"Apple Vision"; break;
        default: familyName = @"Unknown"; break;
    }
    NSLog(@"Device Family: %@", familyName);
}
```

### Output Example

For an iPhone 15 running on a physical device:
```
Model Identifier: iPhone15,4
Model Name: iPhone 15
Generation Model Name: iPhone 15
Device Family: iPhone
```

For an iPad Simulator:
```
Model Identifier: x86_64
Model Name: iPad Simulator
Generation Model Name: iPad Simulator
Device Family: iPad
```

## Supported Devices

The library supports a comprehensive list of Apple devices, with mappings from model identifiers to human-readable names. Below is a summary of supported device categories:

- **iPhone**: From iPhone 1 to iPhone 16 Pro Max, including regional variants (GSM, CDMA, Global).
- **iPad**: Includes iPad (1st to 10th Gen), iPad Air (1st to 5th Gen, M2 models), iPad Mini (1st to 6th Gen, A17 Pro), and iPad Pro (9.7-inch to 13-inch M4).
- **iPod Touch**: 1st to 7th Generation.
- **Apple TV**: 1st to 4K 3rd Generation.
- **Apple Vision**: Apple Vision Pro.
- **Simulators**: iPhone and iPad simulators (x86, x86_64 architectures).

For a complete list of supported model identifiers, refer to the `modelNameForModelIdentifier:` method in `UIDevice+Hardware.m`.

## Requirements

- **iOS**: Compatible with iOS 7.0 and later.
- **Xcode**: Built with ARC (Automatic Reference Counting).
- **Language**: Objective-C (can be used in Swift projects with a bridging header).

## Contributing

Contributions are welcome! If you would like to add support for new devices, fix bugs, or improve the documentation, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m "Add new feature"`).
4. Push to your fork (`git push origin feature-branch`).
5. Open a pull request with a detailed description of your changes.

Please ensure your code follows the existing style and includes appropriate documentation.

## License

This project is licensed under the **BSD License**. See the `LICENSE` file for details.

```plaintext
BSD License
Use at your own risk
```

## Credits

- **Original Author**: Erica Sadun ([http://ericasadun.com](http://ericasadun.com))
- **Modified By**: Eric Horacek for Monospace Ltd.
- **Maintainer**: [Shebuka](https://github.com/Shebuka)
- **Device Data Source**: [The Apple Wiki](https://www.theapplewiki.com/)

## Contact

For questions, suggestions, or bug reports, please open an issue on the [GitHub repository](https://github.com/Shebuka/UIDevice-Hardware/issues).

---

*Last updated: April 17, 2025*
