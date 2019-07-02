import { NativeModules } from 'react-native';

const { RNRnAppleReplaykit } = NativeModules;

export const RNAppleReplaykit = {
  
  startBroadcast: () => {
    return new Promise((resolve, reject) => {
      reject('Not Implemented')
    })
  },

  stopBroadcast: () => {
    console.warn('stopBroadcast', 'Not Implemented')
  }
}
