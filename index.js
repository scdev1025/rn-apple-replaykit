import { NativeModules } from 'react-native';

const { RNAppleReplaykit } = NativeModules;

export const RNAReplayKit = {
  
  startBroadcast: () => {
    return new Promise((resolve, reject) => {
      reject('Not Implemented')
    })
  },

  stopBroadcast: () => {
    console.warn('stopBroadcast', 'Not Implemented')
  }
}
