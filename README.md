
# react-native-rn-apple-replaykit

## Getting started

`$ npm install react-native-rn-apple-replaykit --save`

### Mostly automatic installation

`$ react-native link react-native-rn-apple-replaykit`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-rn-apple-replaykit` and add `RNRnAppleReplaykit.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNRnAppleReplaykit.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNRnAppleReplaykitPackage;` to the imports at the top of the file
  - Add `new RNRnAppleReplaykitPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-rn-apple-replaykit'
  	project(':react-native-rn-apple-replaykit').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-rn-apple-replaykit/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-rn-apple-replaykit')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNRnAppleReplaykit.sln` in `node_modules/react-native-rn-apple-replaykit/windows/RNRnAppleReplaykit.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Rn.Apple.Replaykit.RNRnAppleReplaykit;` to the usings at the top of the file
  - Add `new RNRnAppleReplaykitPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNRnAppleReplaykit from 'react-native-rn-apple-replaykit';

// TODO: What to do with the module?
RNRnAppleReplaykit;
```
  