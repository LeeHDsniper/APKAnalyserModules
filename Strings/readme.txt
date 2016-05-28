模块功能：

对apk中的resources.arsc资源文件进行解码到./TestResult/stringres/res文件夹中，
对其中的./stringres/res/values/strings.xml文件进行解析，将所有的字符串保存在如下全局变量中：
+ extern string Strings_List[99999]

**********************

文件结构：

----------------------

strings.h             C++头文件/* 定义了全局变量和各种方法 */
strings.cpp           C++源文件

----------------------
test.cpp              C++源文件
test                  可执行文件

**********************

编译环境：

Ubuntu 15.10
g++ 5.2.1

**********************

编译方法：

终端下输入g++ test.cpp ../utils/tinyxml/tinyxml.cpp ../utils/tinyxml/tinystr.cpp ../utils/tinyxml/tinyxmlparser.cpp ../utils/tinyxml/tinyxmlerror.cpp ../utils/tinyxml/xmlanalysis.cpp strings.cpp -o test

**********************

运行：

终端下输入：./test
最终结果：生成/stringres/res文件夹以保存资源信息
测试输出：

Navigate home
Navigate up
More options
Done
See all
Choose an app
Clear query
Search query
Search
Submit query
Voice search
Share with
Share with %s
Update Android Wear
Enable Google Play services
Enable Google Play services
Requested by
Get Google Play services
Get Google Play services
The specified account does not exist on this device. Please choose a different account.
Invalid Account
An application requires Google Play services to be enabled.
A data connection is required to connect to Google Play services.
Network Error
An application requires an update for Google Play services.
Google Play services error
Error signing in the specified account. Please choose a different account.
Sign in failed
Unknown issue with Google Play services.
Google Play services
Update
Update Google Play services
Google Play services are updating
Open on phone
Sign in
Sign in with Google
Client Id required
Client Secret required
Device Id required
Invalid argument
Module not initialized
Unknown Error
User cancelled
User interaction required
Username and password required
"Adobe Creative Cloud powers the world's creativity. Developers: add the Creative SDK to your app in minutes."
A sticker
Color
Decrease value
Flip horizontal
Flip vertical
Increase value
Toggle zoom
Rotate counter clockwise
Rotate clockwise
Size
"Sorry, there's no application on your device to handle this action. Do you want to download it now from the market?"
Orientation
An error occurred
Apply
If you have previously logged in with an Adobe ID, sign in to restore synced supplies
Attention
Blemish
Just tap
Blur
Frames
"Install Aviary's free pack of beautiful high resolution frames to get started."
Brightness
Can’t undo any more
Long press on the photo to restore your original image.
Circle
Close
Color Fix
Eraser
Free Color
Smart Color
Confirm
Contrast
Crop
Custom
Delete
Details
Discard
Discard Edit?
Download
Failed to start download. Please try again later
Draw
Edit Bottom Text
Edit Top Text
Photo Editor
Swipe up or down to adjust the intensity
Applying effects
Effects
Enhance
Food
Night
Portrait
Scenery
Enter text here
There was an error downloading the image, please try again later.
Oops, there was an error while saving the image.
Featured
Featured Effects
Featured Frames
Featured Overlays
Featured Stickers
Feedback
Have a suggestion to improve this photo editor? Let us know.
Filters
Flip
Free
Error
Supplies
Got it!
Have an Adobe ID?
Hi-Def
Free
Download failed
Failed to download the required informations
Failed to download the previews
Install
Installing
Plugin successfully installed
Installed
Installed
Restore
Restore All
Restore All Failed
Restore All in Progress
Already purchased? Tap below to restore all your in-app purchases for free.
Retry
Get this pack and tons of other Aviary effects for one low price with Aviary Passport!
Unavailable
Uninstall
Illuminate
About this editor
Item not found
Keep editing
Learn more
Linear
Loading Image...
Loading...
Meme
No, thanks.
Sure!
Account
New Stickers
No Thanks
%1$s item(s) could not be restored
No item needs to be restored
%1$d Plugins Installed
%1$d more
Restore All Completed
Some items could not be restored
"We're having connection problems :("
Original
Check out the new <b>Blur</b> tool!
Tap imperfections to remove.
Install this free pack to get started!
Tap
Swipe to undo or redo edits
You can also pinch to zoom!
Zoom
Overlays
Owned
Aviary Passport
Pinch to zoom!
Please try again later
Powered by Aviary.com
&#8226; Sign into or create an Adobe ID to unlock 16 total Effects, Frames, Stickers, and Overlays for FREE.<br /><br /> &#8226; Your supplies automatically sync to your Adobe ID, restore anytime from any device.<br /><br />
Thanks!
Now you can download 16 supplies for free! Look out for an Adobe badge and download them now in the Supply Shop.
Get 16 Supplies for Free
Radial
Rectangle
Redeye
Redo
Refresh
Request sent. Please check the notification area of your device for more info
Restore Original
Revert to original?
Rotate
Saturation
Done
Saving...
See More
Send Feedback
Get early access to new features and help create an even better Aviary!
Join the Aviary Beta
Sharpness
Sign In
Sign Up
Square
Tap to flip this sticker
Stickers
"Install Aviary's free pack of beautiful high resolution stickers to get started."
This is a free, limited edition pack. If you uninstall it, you may not be able to restore it again in the future.
Checking for additional packs...
There was a problem connecting to the Google Play store. Please try again.
Monthly
My Supplies
Get this pack and tons of other Aviary effects for one low price with Aviary Passport! Click here for more information!
Cancelled
Refunded
Unknown
You now have unlimited access to every single Effect, Sticker, and Frame pack we offer, including all future packs. To manage your subscription status, visit the Passport account screen in the Shop. Happy Editing!
Purchase Date
Aviary Supply Shop
Text
Tool
Color
Splash
Adjust
Fade
Highlights
Lighting
Shadows
Warmth
Focus
Tint
Brightness, Contrast, Warmth and Saturation are now here!
Try Again
Undo
Version
Vignette
Want it free?
Warning
Welcome to Frames!
Welcome to Stickers!
Whiten
Leave editor
Zoom Mode
ACCEPT
REJECT
Cancel Upload
Add email address
Email Address Already Registered
Do you want to delete this collaborator ?
Invalid Email Address
Could Not Delete The Invitation
Do you want to delete this invitation ?
ADD
(Invited)
CANCEL
Could Not Complete the Invitation
(Owner)
Do you want to leave this folder ?
CANCEL
DELETE
CANCEL
CREATE
Create New Folder
Folder Name
Create A New Folder
Add a Collaborator
Comments
Info
Share
File Details
Height
KB
MB
Modified
px
Size
Uploaded
Width
0MB
0px
No Preview Available
of
%s of %s
FOLDERS
UNKNOWN
UPDATED %s
UPDATED LAST WEEK
UPDATED THIS MONTH
UPDATED THIS WEEK
UPDATED TODAY
%s comments could not be deleted
Could Not Add Comment
%s comment could not be deleted
%s comment deleted successfully
%s comments deleted successfully
%d comments inserted
%d comment inserted
%s items could not be deleted
%s item could not be deleted
%s item deleted successfully
%s items deleted successfully
Edit Errors
%s items could not be edited
%s item could not be edited
%s item edited successfully
%s items edited successfully
%s invitations could not be processed
%s invitation could not be processed
%s invitation processed successfully
%s invitations processed successfully
%s items could not be moved
%s item could not be moved
%s item moved successfully
%s items moved successfully
Upload Errors
%s files could not be uploaded
%s file could not be uploaded
%s file uploaded successfully
%s files uploaded successfully
Could Not Complete the Accept Process
has invited you to the shared folder
You joined
No Notification Found
You rejected the invitation for
Could Not Complete the Reject Process
Share With
Upload Files
Take a Photo
Settings
Add Collaborator
Edit In Progress
Rename
Error:- Target and source location for move operation are same
Error Occured While Adding Comment
Write your comment
CANCEL
SEND
Add a Comment
Comments
Fetching Link...
Delete
Do you want to delete this file?
Do you want to delete this folder?
Do you want to delete this %d items?
CANCEL
DELETE
Edit
Delete
Move
Select Items
Move
Error Occured While Editing Name
New Name
CANCEL
EDIT
Edit Name
"Link couldn't be fetched"
Choose a folder
%d pages
%d of %d
No Comments Found
Send link
Do you want to delete this file?
Close
"Unable to connect to the Creative Cloud. Please check your internet connection and try again"
"The Creative Cloud service you have attempted to access is unavailable. Please check your VPN connection and try again"
"The Creative Cloud service you have attempted to access is unavailable. Please try again"
RETRY
Invalid folder name
No Internet Connection
"An error occurred while authenticating. Please try again later."
Unable to create folder
compositions
composition
"You don't have any Compositions yet"
Assets %s
Assets 1
This Creative Cloud Library is empty
BRUSHES (%s)
COLORS (%s)
COLOR THEMES (%s)
GRAPHICS (%s)
LAYER STYLES (%s)
LOOKS (%s)
TEXT STYLES (%s)
Message about the user not being entitled to to preview the video.
Full access to Adobe ID account
Only one Adobe ID is supported
Adobe
Drawings
Drawing
Download
"You don't have any Drawings yet"
%s Assets
Sort by date imported
"You don't have any Libraries yet"
%s commented on %s
You commented on %s
%s joined %s
You joined %s
ACTIVITY
You
1 day ago
%d days ago
1 hour ago
%d hours ago
Less than a minute ago
%d minutes ago
%d years ago
1 year ago
invited you to the shared folder
INVITES(%d)
INVITE(1)
Could not load the collection
Could not load the asset
Photo compositions
Photo composition
Files
sketches
Sketch
"You don't have any Sketches yet"
No Folders Found
View as Grid
View as List
Collaborate
Edit
Sort Alphabetically
Sort by Date
COMP CC
Create New Folder
My Assets
My Libraries
Library
ILLUSTRATOR DRAW
FILES
ILLUSTRATOR LINE
My Account
PHOTOS
PHOTOSHOP MIX
My Account
Select Folder
PHOTOSHOP SKETCH
Creative Cloud
Could not create invitation
Could not connect to network
Could Not Delete The Collaborator
Delete %s?
Error While Fetching Collaborators
Could Not Leave The Folder
Leave %s?
Collaborators
Error While Fetching Comments
Creative Cloud
Creative SDK
Notifications
"You don't have any photos yet"
Download Adobe Photoshop Mix
"Delivering the power of Adobe Photoshop with the convenience of mobile, Photoshop Mix offers creative, simple, fun photo editing on Android."
Search…
Search
"You don't have any files yet"
CANCEL
Folder already exists
Requires Authentication.
UPLOAD FILES
OPEN
OPEN
OPEN (%s)
OPEN (99+)
(Calculating Usage)
Edit Creative Cloud Settings
Get More Storage
%s used (%s of %s GB)
Switch Accounts
UPLOAD (%s)
Select a Cover
Contains adult content
Select a creative field
comma, separated, tags
Publishing your project.
Tags must contain only alphanumeric characters with or without spaces
Project Description
Name Your Project
Publish
Problem starting service. Please try again later.
SHARE ON:
Info
Copyright Settings
Your Project is Empty
Get started using the options below
Done
Edit
Paste your embed code
Your code is invalid. Please try again.
Embed Media Content
Edit
Preview
Enter a title for your work in progress
Add Title
Problem launching camera to capture picture. Please try again later.
New
Select
There was a problem connecting. Please check your network connection and try again.
Done
Fields
POPULAR
Next
Apply
Your assets are being downloaded from Creative Cloud. Are you sure you would like to cancel?
Creative Cloud
Problem downloading file %1$s. Please try again later.
Creative Cloud
Creative Cloud
Back
Problem loading Accounts. Please try again later.
Choose Account
There was a problem connecting. Please check your network connection and try again.
Attribution
Attribution-Noncommercial
Attribution-Noncommercial-No Derivatives
Attribution-Noncommercial-Share Alike
Attribution-No Derivatives
Attribution-Share Alike
CREATIVE COMMONS
NO LICENSE
No use without explicit permission
Save
Edit Profile
First name is required
Last name is required
First and last name is required
Profile details are saved, but there was a problem saving profile image. Please try again later.
Problem saving profile details. Please try again later.
Company
First Name
Last Name
Location
Occupation / Job Title
Website URL
Problem loading profile details. Please try again later.
All changes will be lost, are you sure you want to quit?
Unsaved Changes
Publish
Cancel
CONTINUE
"You can use Behance to publish work as part of a team, but will lose access to your portfolio if you leave your organization"
"You are currently signed in with an Enterprise ID"
Cancel
OK
Image
Failed to crop image, please try again.
Image not found, please try again.
%1$s Album is empty. Please try different album.
Problem loading Albums. Please try again later.
"Selected image dimensions don't match requirements"
Image must be at least %1$s x %2$s. Selected image is %3$s x %4$s
Image must not be more than %1$s x %2$s. Selected image is %3$s x %4$s
%1$s is an invalid file type. Only %2$s are allowed.
%1$s is an invalid file type.
%1$s is an invalid file type. %2$s are not allowed.
"Selected image doesn't match size requirements"
Image is too small. Minimum file size is %1$s
Image is too large. Maximum file size is %1$s
Cancel
Skip
Done
Back
Albums
Select Images
Select Image
Attribution
Attribution Non-commercial
Attribution Non-commercial No Derivatives
Attribution Non-commercial Share Alike
Attribution No Derivatives
Attribution Share Alike
No use is allowed without explicit permission from owner
Please select a valid city
City
Country
Done
Failed to load location data. Please try again later.
State
Location
Type City name
msg_image_missing-behance-addcontent
%1$s is an invalid file type. Only %2$s are allowed.
"%1$s doesn't match size requirements. Maximum file size is %2$s."
Cannot upload project. %1$s. Please check your network connection and try again.
Error publishing your project on Behance
Behance
Publishing your project
Behance
Check out new project on my @Behance portfolio: %1$s
Tap to view your published project
Published your project on Behance
Behance
Your project cannot be uploaded at this time. Please check your network connection and try again.
VIEW ON BEHANCE
"Visit Behance to view feedback on your work and share on Twitter, Facebook, and more."
Your Work Is Live!
Back
Publish
Problem loading image to publish. Please check and try again.
Cannot upload work in progress. %1$s. Please check your network connection and try again.
Error publishing your work in progress on Behance
Behance
Publishing your work in progress
Behance
Check out new work on my @Behance portfolio: %1$s
Tap to view your published work in progress
Published your work in progress on Behance
Behance
Your work in progress cannot be uploaded at this time. Please check your network connection and try again.
Back
Please Login To Facebook to proceed.
Cancel
OK
Login To Facebook
Error authenticating with Facebook. Please try again later.
Insufficent permissions to share on Facebook.
Error Authenticating with Twitter. Please try again later.
Please Login To Twitter to proceed.
Cancel
OK
Login To Twitter
Are your sure you want to unlink Facebook account?
Cancel
OK
Unlink Facebook Account
Are your sure you want to unlink Twitter account?
Cancel
OK
Unlink Twitter Account
Featured
Most Appreciated
Most Discussed
Most Followed
Most Recent
Most Relevant
Most Viewed
Contains adult content
Publishing your work in progress. Check status bar for progress.
Tags must contain only alphanumeric characters with or without spaces
Please fill all required fields
Problem starting service. Please try again later.
Share on Facebook
Share on Twitter
SHARE ON:
Publish
Back
Info
Ask for feedback
Add Title
comma, separated, tags
Loading …
WebView login requires INTERNET permission
AndroidManifest Error
Loading …
Your Facebook password has changed. Please log into this app again to reconnect your Facebook account.
This app doesn’t have permission to do this. To change permissions, try logging into the app again.
Please log into this app again to reconnect your Facebook account.
Please log into this app again to reconnect your Facebook account.
Your Facebook account is locked. Please log into www.facebook.com to continue.
%1$s, %2$s
%1$s, %2$s, %3$s
Search…
Collapse
Accept
Pencil Sketch
android.support.design.widget.AppBarLayout$ScrollingViewBehavior
Facebook
Google
aviary/meme/LeagueGothic-Regular.otf
center
left
ALIGN_CENTER
center
Allow Ad to create a calendar event?
Create calendar event
Decline
999+
Allow Ad to store image in Picture gallery?
Save image