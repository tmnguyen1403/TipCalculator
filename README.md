# Pre-work - *TipMe*

**TipMe** is a tip calculator application for iOS.

Submitted by: **MinhNguyen**

Time spent: **X** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Add Settings screen which allows user to change background color

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src="https://i.imgur.com/KWBBztN.gifv" title='Video Walkthrough' alt='Video Walkthrough' width="200" height="400" />
Gif link:
![]( https://i.imgur.com/KWBBztN.gifv | width = 100)
GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

1. I created the project with default using SwiftUI. I didn't realize that until I followed the tutorial and tried to run the app on the simulator. I tried to
delete the SwiftUI file and reconfig it but there were too many errors. In the end, I decided to copy the code and restart the project with story board default.

2. There was a struggle when I tried to change the currency and thousand separator. At first, I thought the app would allow users to change the currency symbol.
I was struggling for a while because that task would require to store all of currency symbols in the world. Later, I reviewed the requirement and used locale settings to implement the feature.
`However, the decimal number was not converted correctly if the selected region (such as Germany) uses comma instead of dot. Therefore, I had to use Regex to replace the "comma" with "dot" for those specific regions.

3. I still have struggle setting contrainsts and make the UI looks nice.

## Conclusion
Those tasks took me 10 hours in total.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
