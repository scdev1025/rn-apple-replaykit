import { NativeModules } from 'react-native';

const { RNRnAppleReplaykit } = NativeModules;

export default RNAppleReplaykit = {
  
  startBroadcast: () => {
    return new Promise((resolve, reject) => {
      reject('Not Implemented')
    })
  },

  stopBroadcast: () => {
    return new Promise((resolve, reject) => {
      reject('Not Implemented')
    })
  }
}