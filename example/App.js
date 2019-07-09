/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Button, View} from 'react-native';
import RNAppleReplayKit from './libraryfile'


export default class App extends Component {

  constructor(props) {
    super(props)
    this.state = {
      isBroadCasting: false
    }
  }

  onPressBroadCast() {
    console.warn('test')
    if (!this.state.isBroadCasting) {
      RNAppleReplayKit.startBroadcast()
      .then((res) => {
        console.warn(res)
        this.setState({isBroadCasting: true})
      })
      .catch(err => {
        console.warn(`${err}`)
      })
    } else {
      RNAppleReplayKit.stopBroadcast()
      .then(() => {
        this.setState({isBroadCasting: false})
      })
      .catch(err => {
        console.warn(err)
      })
    }
  }

  render() {
    return (
      <View style={styles.container}>
        <Button onPress={this.onPressBroadCast.bind(this)} title={this.state.isBroadCasting ? 'Stop Broadcast' : 'Start BroadCast'} />    
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
