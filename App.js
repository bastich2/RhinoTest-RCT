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

// console.log(Player.setCredentials({"hello": "HI"}));
const credentials = {
  clientId: 'UIFD0-KngoGd18snqlHR2msiKv-zWFEHAtlDRSAAeTg',
  accountId: '3cbe220d-b8e9-45a4-8c36-87a50d63ba58',
  clientSecret: 'hc4YVU_f683pGHPaRrMB_UEkXvjFF2vnoh5ywVTHOt0',
};
// [RBSDKV2 setKeysWithClientId:@"UIFD0-KngoGd18snqlHR2msiKv-zWFEHAtlDRSAAeTg"
//           clientSecret:@"hc4YVU_f683pGHPaRrMB_UEkXvjFF2vnoh5ywVTHOt0"
//             accountId:@"3cbe220d-b8e9-45a4-8c36-87a50d63ba58"];
const App: () => React$Node = () => {
  const onCredentialsSetted = event => {
    console.log({event});
  };
  return (
    <View credentials={credentials} style={styles.mainContainer}>
      <Text>Hello!</Text>
      <Player style={styles.player} onCredentialsSetted={onCredentialsSetted} />
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
