import React, { useState, useEffect } from 'react'
import {FlatList, StyleSheet, Text, View} from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context';
import Quizbox from '../components/quiz_box';
import firestore from '@react-native-firebase/firestore';
import { ActivityIndicator } from 'react-native';

const colorMap = {"Blue": "#4285F4", "Yellow": "#FABB05", "Green": "#34A853", "Red": "#E94235"};

const Home = ({navigation}) => {
    const [loading, setLoading] = useState(true); // Set loading to true on component mount
    const [data, setData] = useState([]); // Initial empty array of users

    useEffect(() => {
        const subscriber = firestore()
    .collection('quiz')
    .onSnapshot(querySnapshot => {
      const data = [];

      querySnapshot.forEach(documentSnapshot => {
        data.push({
          ...documentSnapshot.data(),
          key: documentSnapshot.id,
        });
      });

      setData(data);
      setLoading(false);
    });
        // Unsubscribe from events when no longer in use
    return () => subscriber();
    }, []);

    if (loading) {
        return <ActivityIndicator />;
    }
    
    return (
        <View >
            <SafeAreaView style={styles.safearea}>
                <View>
                    <View style={styles.column}>
                        <Text style={styles.textGrey}>Hello</Text>
                        <Text style={styles.headlineBlue}>Lets quiz!</Text>
                        <View style={styles.sizedbox1}></View>
                        <Text style={styles.bigText}>Here is the most recent Quizes</Text>
                    </View>
                    <View style={styles.sizedbox2}></View>
                    <View style={styles.expanded}>
                        <FlatList data={data} renderItem={({item, index}) => {
                            return  (
                                <Quizbox title={item['Title']} color={colorMap[item['Color']]} questions={item['questions']} 
                                onPress={() => navigation.navigate("QuizPage",{gametitle: item['Title'], questions: item['questions'], color: colorMap[item['Color']]})} />
                            )
                        }}/>
                    </View>
                </View>
            </SafeAreaView>
        </View>
    )
}

export default Home
const styles = StyleSheet.create({
    safearea : {
        paddingTop: 15,
        backgroundColor: "#fff"
        
    },
    column: {
        paddingLeft: 30,
        paddingRight: 30,
    },
    sizedbox1: {
        height: 30
    },
    bigText: {
        fontSize:36,
        color: "#213057",
        fontFamily: 'DMSans-Medium',
    },
    sizedbox2: {
        height: 20,
        
    },
    expanded: {
        display: "flex",
        flexgrow: 1,
        paddingTop: 10,
        backgroundColor: '#fff',
        width: "100%",
        height: "100%",
        overflow: "visible",
        
    },
    textGrey: {
        fontSize: 18,
        color: "#A7A7A7",
        fontFamily: 'DMSans-Medium',

    },
    headlineBlue: {
        fontSize: 24,
        color: "#213057",
        fontFamily: 'DMSans-Medium',

    }
})