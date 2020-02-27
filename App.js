import React, {useState, useEffect} from 'react';
import {View, Text, StyleSheet} from 'react-native';
import styled from 'styled-components/native';

import Player from './components/Player';
import Credentials from './components/native-modules/PlayerCredentials';
import eventsEmitter from './components/event-emitters/RbEmitter';

const CaptionContainer = styled(View)`
  background-color: blue;
  flex: 2;
`;

const credentials = {
  clientId: 'UIFD0-KngoGd18snqlHR2msiKv-zWFEHAtlDRSAAeTg',
  accountId: '3cbe220d-b8e9-45a4-8c36-87a50d63ba58',
  clientSecret: 'hc4YVU_f683pGHPaRrMB_UEkXvjFF2vnoh5ywVTHOt0',
};
Credentials.setCredentials(credentials);

let subscription = [];
const App: () => React$Node = () => {
  const [credentialLoaded, setCredentialLoaded] = useState(false);
  const [currentCaption, setCurrentCaption] = useState('');
  async function loadCredentials() {
    if (credentialLoaded) {
      return;
    }
    try {
      const loadedCredential = await Credentials.loadCredentials();
      setCredentialLoaded(true);
      console.log(loadedCredential);
    } catch (error) {
      console.log('error');
    }
  }

  const startListening = () => {
    console.log({eventsEmitter});
    subscription.push(
      eventsEmitter.addListener('onLoadDidSucceed', reminder => {
        console.log({reminder, event: 'onLoadDidSucceed'});
      }),
    );
    subscription.push(
      eventsEmitter.addListener('onDidSwitchDirection', reminder => {
        let {stream: videoId, moment: playlistId, caption} = reminder;
        console.log({reminder, event: 'onDidSwitchDirection'});
        setCurrentCaption(caption);
      }),
    );
  };

  useEffect(() => {
    loadCredentials();
  }, []);

  useEffect(() => {
    startListening();
    return () => {
      subscription.forEach(subs => {
        subs.remove();
      });
    };
  }, []);

  return (
    <View credentials={credentials} style={styles.mainContainer}>
      <Text>Hello!</Text>
      {credentialLoaded && (
        <>
          <Player
            style={styles.player}
            // Probé otro id y no anda
            setReel="00000000-0000-0000-0000-000000010855"
          />
          <CaptionContainer>
            <Text>{currentCaption}</Text>
          </CaptionContainer>
        </>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  mainContainer: {
    backgroundColor: 'peru',
    flex: 1,
  },
  player: {
    flex: 1,
    height: 300,
  },
});
export default App;
