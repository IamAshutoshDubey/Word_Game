# Word Game

## Overview
Word Game is a language game. A user will see an english word on screen. While the english word is displayed, a word in spanish will appear.
The user has to choose if the spanish word is the correct or wrong translation for the displayed English word. Total 15 word pairs would appear on screen. User can input ones response by pressing either of the botton at the bottom of the screen within 5 seconds otherwise 1 life will be deducted. User will have 3 lives. After exhausting all 3 lives or all 15 attemps the game will be over. 

## Architecture
MVVM with Coordinator (MVVM-C) has been used. 

## Dependencies
- RxSwift, Swinject and SwiftyMocky Libraries are added using Swift Package Manager.

## Environment
- iOS 13.0 and above
- XCode 12.0
- Swift 5

## Getting Started
- Use Xcode 12 and above (It should work on XCode 11.5 and above. I didn’t get chance to test on it due to time constraints.)

## Scope of Improvement 
- UI/UX need a complete redesign. 
- Test case coverage should be increased. Could bot spend much time on test cases due to time constraints.
- Result persistance could be implemented.
