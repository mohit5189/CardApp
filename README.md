# CardApp

App is sample to list cards in UITableview.

# Steps to run project:
1. Clone repo in Mac
2. Run 'pod install' in terminal, by going to root folder.
3. Open CardApp.xcworkspace

# Steps to add modules:
1. Go to root folder through terminal
2. Run in terminal generamba gen <Module-Name> viper
3. Then run scripts/link_module.sh <Module-Name>
4. You can find module in Modules folder.
  
# Changing folder path for any file
If you change any path, let say path for router. Please update path in Scripts/CuckooInputFiles.xcfilelist too. It help to generate mock.

# Demo

![ScreenShot](https://github.com/mohit5189/CardApp/blob/master/Assets/app.gif)

# Class Diagram

![ScreenShot](https://github.com/mohit5189/CardApp/blob/master/Assets/class.png)

# Design Pattern
VIPER

# Tool used

generamba -> To generate VIPER architecture

# This party libraries
1. Snapkit -> For autolayout management
2. Cuckoo -> For mock file generation
3. Swinject -> For DI 
4. Quick / Nimble -> For unit testing 


# Note
No unit test cases written apart from Viper setup testing. App is UI only so need UI test cases.
