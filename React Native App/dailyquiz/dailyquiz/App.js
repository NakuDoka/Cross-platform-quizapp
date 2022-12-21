import firebase from '@react-native-firebase/app';
import '@react-native-firebase/firestore';
import React from "react";
import { StyleSheet} from "react-native";
import "./config";
import { NavigationContainer } from '@react-navigation/native';
import MyStack from './navigation';


const App = () => {
  return (
     <NavigationContainer>
        <MyStack />
      </NavigationContainer>
  )
}

const RNfirebaseConfig = {
  apiKey: "AIzaSyDK5A5sAYNjeOJdupvWlP7z9WO6FBS6LQs",
  authDomain: "tnd-blog-dailyquizapp.firebaseapp.com",
  projectId: "tnd-blog-dailyquizapp",
  storageBucket: "tnd-blog-dailyquizapp.appspot.com",
  messagingSenderId: "31890692171",
  appId: "1:31890692171:web:0c9d10b73ba72aee3095ce",
  databaseURL: "https://tnd-blog-dailyquizapp.firebaseio.com",
};

let app;
if (firebase.apps.length === 0) {
  app = firebase.initializeApp(RNfirebaseConfig )
} else {
  app = firebase.app()
}

const db = firebase.firestore();

export default App
