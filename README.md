[![CI Status](http://img.shields.io/travis/Max Fellmuth/MonkeyPatch.svg?style=flat)](https://travis-ci.org/Max Fellmuth/MonkeyPatch)
[![Version](https://img.shields.io/cocoapods/v/MonkeyPatch.svg?style=flat)](http://cocoapods.org/pods/MonkeyPatch)
[![License](https://img.shields.io/cocoapods/l/MonkeyPatch.svg?style=flat)](http://cocoapods.org/pods/MonkeyPatch)
[![Platform](https://img.shields.io/cocoapods/p/MonkeyPatch.svg?style=flat)](http://cocoapods.org/pods/MonkeyPatch)

# 🙊💬 MonkeyPatch
*Start iterating like a maniac!*

 > MonkeyPatch allows you to temporarliy replace values in you project during runtime with an extremely minimal code surface.

## Whaaaat?
They say a line of code is better than a thousand words:
```swift

// 1️⃣ Let's suppose we have a String like the right one ("Richard Hendricks").

print("PiedPiper CEO: ", "Richard Hendricks")
// => "PiedPiper CEO: Richard Hendricks"

// 2️⃣ If we provie a MonkeyPatch key and no value has been set for it, everything works as before.

let currentCEO = "Richard Hendricks".monkeyPatch("replacementCEO")
print("PiedPiper CEO: ", "Richard Hendricks")
// => "PiedPiper CEO: Richard Hendricks"

// 3️⃣ BUT! If we have provided a value for the "replacementCEO" key anywhere in the app, that value will be returned.

String.setMonkeyPatch("replacementCEO", "Jack Barker")
print("PiedPiper CEO: ", "Richard Hendricks".monkeyPatch("replacementCEO"))
// => "PiedPiper CEO: Jack Barker"
```

## Why?

This technique allows you to temporarily change values during runtime. You could use this as a foundation for an internal settings screen to set staging urls, toggle unreleased features, tweak animation values, you name it! The values are automatically persisted for you across app launches in the `NSUserDefaults`.

The beauty of this approach is that you don't need to add a lot of spaggheti code and you can easily remove it after you are done with tweaking.

## How?
MonkeyPatch takes advantage of Swift's protocols and protocol extensions. That means it just works out of the box!

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MonkeyPatch is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MonkeyPatch"
```

## Author

Max Fellmuth, max@maxfellmuth.com

## License

MonkeyPatch is available under the MIT license. See the LICENSE file for more info.
