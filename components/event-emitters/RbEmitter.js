import {NativeEventEmitter, NativeModules} from 'react-native';
const {RBEventEmitter} = NativeModules;
export default new NativeEventEmitter(RBEventEmitter);
