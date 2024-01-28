This is my first game, SpaceMonkey!
first of all, I do not own any assets that helped me create this game. The assets used are the sole ownership of the orignal creators.
I have borrowed them from the CryptoMonKeys, or Banano server on Discord, and I can and will change them if the original content creators ask me to do so.

to install and compile this game you should use the same version of Godot I have used for compatibility reasons. Here are the steps in which to achieve this.

* 1: visit Godots download page on https://godotengine.org/ and install the 3.5.3 LTS version.
* 2: download the project from here and place it into a separate folder anywhere on your drive.
* 3: Open Godot and select Import.
* 4: Navigate to the project folder and select the project.godot file.
* 5: select 'Import and edit'
* 6: Navigate to Project tab, Export...
Here you can choose various OS' to run the project on. I've only setup for Android and Windows.

FOR WINDOWS
* 1: Navigate to 'Project' and 'Export'
(you don't need to adjust any settings other than these listed!)

* 2: Select your export path.
* Application Icon: res://spacemonkeyicon.ico
* Company Name: ChaosTheory
* Product Name: SpaceMonKey

* 3: Select 'Export Project' and choose a location to save the EXE file.

FOR ANDROID
(this requires additional software)
* 1: Navigate to, download https://adoptium.net/en-GB/temurin/releases/?variant=openjdk17
* 2: Install JDK17 and ensure that 'entire feature will be installed' is selected.
* 3: Ensure JDK has installed coreectly using this line in cmd or Command Prompt: java -version
* 4: Navigate to, download and install https://developer.android.com/studio/ and download the latest version for your OS.
* 5: Open Android Studio, navigate to the settings tab and select SDK Manager
* 6: download and install Android [13 "Tiramisu" API 33] & [14 "UpsideDownCake" API 34]
* 7: navigate to SDK tools and install 'NDK (side by side)', 'Android SDK command-line tools' and 'CMake'.
* 8: Ensure to make a note of the install path at the top of the SDK tools page.

* 9: In Godot navigate to 'Editor' and 'Editor Settings'
* 10: in 'Export' tab select 'Android' and paste the SDK path and 'Select Current Folder'. Here you will see it also requires a 'Debug Keystore' file.
* 11: Open cmd or Command Prompt and type: keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Export Android,O=Android,C=JP" -validity 10000 -deststoretype pkcs12
* 12: This will have generated a keystore file in the same folder Command prompt is defaulted to ie C:\Users\User\Documents> etc.
* 13: In Godot, select the 'Debug Keystore' path and navigate to the folder and select the keystore file. Now close the Settings.
* 14: Navigate to 'Project' and 'Export'
(you don't need to adjust any settings other than these listed!)

* Export Format: Export APK
* Unique Name: com.spacemonkey.game
* Name: SpaceMonKey
* Main 192 x 192: res://assets/art/spacemonkeyicon192192.png
* Adaptive Foreground 432 x 432: res://assets/art/spacemonkeyicon432432.png
* Adaptive Background 432 x 432: res://assets/art/spacemonkeyicon432432.png

* 15: Select 'Export Project' and choose a location to save the APK file.
* 16: navigate to the file on your Android device
* 17: open the file and choose Install
* 18: If a warning appears choose 'More Options' and 'Install Anyway'.
