# Generic user defaults wrapper
A generic wrapper around the UserDefaults object to make properties accessible without having to paste the string keys everywhere throughout your project.


## Installation 
GenericUserDefaults is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile: 
```ruby
pod 'GenericUserDefaults'
```

## Usage
```swift
import GenericUserDefaults

// Extend UserDefaults and add your keys as below, custom objects must adopt Codable or DeCodable protocol
   extension UserDefaults {
    
    @UserDefault(key: "has_seen_app_introduction", defaultValue: false)
    static var hasSeenAppIntroduction: Bool?
    
    @UserDefault(key: "user_data", defaultValue: nil)
    static var userData: User?
}

struct User: Codable {
    let name: String
}

// Assign a value
UserDefaults.hasSeenAppIntroduction = true

// Retrive a value
if let hasSeenAppIntroduction = UserDefaults.hasSeenAppIntroduction, hasSeenAppIntroduction {
  //TODO: - what you want 
}

// Delete a value
UserDefaults.hasSeenAppIntroduction = nil
```
## Author 
Asad Ullah, asad_622@hotmail.com 

## License 
GenericUserDefaults is available under the MIT license. See the LICENSE file for more info.
