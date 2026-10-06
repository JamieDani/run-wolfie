# Project Quack Group 2!!


## Prerequisites - setup
I know some of you have done some mobile dev before so feel free to skip to whatever parts you need, and reach out with any questions!

### I. Downloading `git`

Follow this [link](https://git-scm.com/install/) to install `git` depending on your platform.

If you run `git --version` in your terminal and it doesn't crash, you're good to go!

### II. Downloading VS Code

Follow this [link](https://code.visualstudio.com/download?_exp_download=d53503e735) to install VS Code. You should be able to open it like any app when done.

### III. Setting Up Simulators

#### Xcode (for iOS only)

You can download [Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12Xcode) from the Mac App store. It may take a while.

Setting up a simulator:
1. Open Xcode
2. On the top menu bar (as in the very top left of your computer screen) click **Xcode > Settings**
3. Click the **Components** tab
4. Click 'Get' for iOS platform support.
5. Scroll to the bottom, select `Add Platforms' and you can choose your favorite simulator (preferably one that's a later version).
6. You can run `open -a Simulator` in your terminal to open the simulator. It'll be a tiny iPhone on your screen.

#### Android Studio

You can download Android Studio [here](https://developer.android.com/studio).

Setting up a simulator:
1. Open Android Studio.
2. Click the 3 dots in the top right and `Virtual Device Manager` (or click it from the menu, the UI changes)
3. Use the `+` to add a device and press the play button to run it. It will be a tiny phone on your screen.

### IV. Downloading Flutter

1. Follow this [link](https://docs.flutter.dev/install/quick). Go to "Confirm your Development Platform" and choose your platform, then follow the instructions in "Install and Set Up Flutter" (with VS Code).

2. You may have to add flutter to your path variable depending on the OS of the computer you're working on. Use this [reference](https://docs.flutter.dev/install/add-to-path).

>>If you need any help with this part, message in the chat/DM (it doesn't matter the hour). It may help to look up how to write and save and exit using vim or nano (some text editor).

3. Run `flutter doctor` in your terminal and make sure all the checks pass, otherwise follow the instructions to fulfill all checks. It should look something like this. (If you don't have a Mac you don't need XCode)

```
[✓] Flutter (Channel stable, 3.29.3, on macOS 26.6.2 25G83 darwin-arm64, locale en-US)
[✓] Android toolchain - develop for Android devices (Android SDK version 35.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 26.4.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.1)
[✓] IntelliJ IDEA Community Edition (version 2023.3.2)
[✓] VS Code (version 1.138.0)
[✓] Connected device (5 available)
    ! Error: Browsing on the local area network for procrastination device. Ensure the device is unlocked and attached
      with a cable or associated with the same local area network as this Mac.
      The device must be opted into Developer Mode to connect wirelessly. (code -27)
[✓] Network resources

• No issues found!
```

### V. Setting Up the Project

1. Download [GitHub Desktop](https://desktop.github.com/download/) (or you can use normal `git`, I prefer Desktop because you don't have to memorize commands)
2. In the repo press the green `Code` button on the top right of the files, then select `Open with GitHub Desktop`
3. From GitHub Desktop, you can open the project is Visual Studio code. (It may differ for each computer, but right-clicking/two-finger-clicking the repo name in the top left should give the option `Open in Visual Studio Code`)
4. Open a terminal in VS Code (in the top right, there's 3 squares, pick the one in the middle with the bottom tab). 
5. Run `npm install`
6. Open a simulator (see III setting up simulators)
7. Run `flutter run` and you can select which phone you want it to run on if you have multiple.

It may take a couple minutes to start up for the first time (maybe 10-15mins max) but you should end up with a bare bones Flutter app with one tab for the map and one for the minigames. Yay!

Below are is auto generated text for new flutter projects that you may find useful
---

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
