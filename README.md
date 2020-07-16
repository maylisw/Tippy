# Pre-work - *Tippy*

**Tippy** is a tip calculator application for iOS.

Submitted by: **Maÿlis Whetsel**

Time spent: **8** hours spent in total (2hrs on basic implementation)

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [x] UI animations - basic just slides etc..
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Added an app icon
- [x] Added themes (Light/Dark)
- [x] Counter for the number of people splitting the bill

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://imgur.com/a/hITNSR7' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Initally I started the Xcode project using SwiftUI rather than storyboards which made it more diffcult to folow the turorial (although not difficult enough for me to realize something was wrong). I was going to change the UI but I kinda started to like it lol. I could not get the bill amount to work because I could not figure out how to refresh the view controller after calling sceneDidBecomeActive().

## License

    Copyright [2020] [Maÿlis Whetsel]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
