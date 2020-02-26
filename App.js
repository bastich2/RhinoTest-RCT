import React from 'react';
import {View, Text, StyleSheet} from 'react-native';
// import {
//   Header,
//   LearnMoreLinks,
//   Colors,
//   DebugInstructions,
//   ReloadInstructions,
// } from 'react-native/Libraries/NewAppScreen';
import Player from './components/Player';

const App: () => React$Node = () => {
  return (
    <View style={styles.mainContainer}>
      <Text>Hello!</Text>
      <Player style={styles.player} />
    </View>
  );
};

const styles = StyleSheet.create({
  mainContainer: {
    backgroundColor: "red",
    // flex: 1,
  },
  player: {
    // flex: 1,
    width: 500,
    height: 300,
  },
});
export default App;
