# Telstra_Test

## Specifications:
Create a universal iOS app using Swift which:
• Ingests a json feed https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json - **Implemented**

• You can use a third party Json parser to parse this if desired. - **No Third party libraries used**

• Displays the content (including image, title and description) in a table - **Implemented**

• The title in the navbar should be updated from the json - **Implemented**

• Each row should be the right height to display its own content and no taller. No content should be clipped. This means some rows will be larger than others. - **Implemented**

• Don’t download all images at once, only as needed - **Downloading images on scroll**

• Refresh function, either a refresh button or use pull down to refresh. - **Implemented**

• Should not block UI when loading the data from the json feed. - **Loading images in background for smooth scroll**

• Support all iOS versions from the latest back at least 2 versions - **Supporting from iOS 11**

## Requirement:

Use MVVM approach. - **Used clean architecture**

Use Coding Standards and Naming conventions provided by Apple and Google. A link is provided in the requirement doc by Telstra. - **Provided as best**

Use Swift (use of RX Swift will be bonus) for iOS - **Used Swift**

Do no use .xib and storyboards in iOS. Everything has to be done programmatically. - **Done**

Use lazy loading for downloading the images - **Loading images in background**

Use image cache - **Used**

Support iOS 11 - **Supports from iOS 11**

Support both orientation on smartphone and tablet/ipad - **Supports both orientations**

Use concurrency and background threading for API calls. Use GCD in swift - **Used**

You can use latest 3rd party libraries. - **No Third party libraries used**

Writing Unit text cases is a bonus - **Due to time constraint unable to implement**

Format and indent the code. - **Done**

Comment the code wherever necessary. - **Used method and property names to understand their use**

Basic UI styling - **Done**

Make sure there are at least 5-6 commits in the git. Git commit messages should be min 10 words. - **Done**

Make sure there are no spelling mistakes or grammatical mistakes in the code or comments. - **Done**

Use OOPs concepts like encapsulation, abstraction, data hiding etc in the code. - **Done**


## How To Run

As we didn't use any pod libraries no need to run pod install command.

Just open **TelstraPOC.xcodeproj** and run the app to see the output.
