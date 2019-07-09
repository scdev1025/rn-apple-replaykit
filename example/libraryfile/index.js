import { NativeModules } from 'react-native';

const { RNAppleReplaykit } = NativeModules;

export default RNAReplayKit = {
  
  startBroadcast: () => {
    return RNAppleReplaykit.startBroadcast()
  },

  stopBroadcast: () => {
    return RNAppleReplaykit.stopBroadcast()
  }
}