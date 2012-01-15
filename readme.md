# Problem Reporter Tweak
## Overview
This was designed to change the default button in the Apple crash reporting app from being the "Send to Apple button" since some of us don't like that behaviour.

## Requirements
- SIMBL
- Slightly modified Info.plist for Problem Reporter.app
        sudo defaults write /System/Library/CoreServices/Problem\ Reporter.app/Contents/Info LSUIElement -bool no
- Compile and install this bundle (~/Library/Application Support/SIMBL/Plugins)