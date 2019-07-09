
# rn-apple-replaykit
A React Native Package to access Replaykit on iOS, not support Android
## Getting started

`npm install --save https://github.com/scdev1025/rn-apple-replaykit.git`

### Mostly automatic installation

`$ react-native link rn-apple-replaykit`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `rn-apple-replaykit` and add `RNAppleReplaykit.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNAppleReplaykit.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)

## Usage
```javascript
import RNAppleReplayKit from 'rn-apple-replaykit';
```

#### Start broadcast
```javascript
RNAppleReplayKit.startBroadcast()
.then((res) => {
  console.warn(res)
  this.setState({isBroadCasting: true})
})
.catch(err => {
  console.warn(`${err}`)
})
```

#### Stop broadcast
```javascript  
RNAppleReplayKit.stopBroadcast()
.then(() => {
  this.setState({isBroadCasting: false})
})
.catch(err => {
  console.warn(err)
})
```

## Troubleshoot

### Compile error : cannot find the basic classes from swift code
It's because of the xcode issue.
Please try to add new swift file on iOS project, and then try to build it.
