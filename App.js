import React, {useState, useEffect} from 'react';
import {View, Text, StyleSheet} from 'react-native';
// import {
//   Header,
//   LearnMoreLinks,
//   Colors,
//   DebugInstructions,
//   ReloadInstructions,
// } from 'react-native/Libraries/NewAppScreen';
import Player from './components/Player';
import Credentials from './components/native-modules/PlayerCredentials';

const credentials = {
  clientId: 'UIFD0-KngoGd18snqlHR2msiKv-zWFEHAtlDRSAAeTg',
  accountId: '3cbe220d-b8e9-45a4-8c36-87a50d63ba58',
  clientSecret: 'hc4YVU_f683pGHPaRrMB_UEkXvjFF2vnoh5ywVTHOt0',
};
Credentials.setCredentials(credentials);

const App: () => React$Node = () => {
  const [credentialLoaded, setCredentialLoaded] = useState(false);
  async function loadCredentials() {
    if (credentialLoaded) return
    try {
      const loadedCredential = await Credentials.loadCredentials();
      setCredentialLoaded(true);
      console.log(loadedCredential);
    } catch (error) {
      console.log('error');
    }
  }
  useEffect(() => {
    loadCredentials();
  }, []);
  return (
    <View credentials={credentials} style={styles.mainContainer}>
      <Text>Hello!</Text>
      {credentialLoaded && (
        <Player
          style={styles.player}
          setReel="00000000-0000-0000-0000-000000010855"
        />
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  mainContainer: {
    backgroundColor: "red",
    flex: 1,
  },
  player: {
    flex: 1,
    height: 300,
  },
});
export default App;
