import React, { useState } from "react";
import {FlatList, StyleSheet, TouchableOpacity, Text, View} from 'react-native'
import AnswerButton from "../components/answer_button";


const Quiz = ({navigation, route}) => {
    const params = route.params;
    const [index, setIndex] = useState(0);
    const [chosen, setChosen] = useState(null);
    const [points, setPoints] = useState(0);

    const handleNext = () => {
        if (chosen != null){
            if (params.questions[index]['answer'] == chosen){
                setPoints(points + 1)
            }
            if (index == params.questions.length - 1){
                
                navigation.navigate("Result", {gametitle: params.gametitle, color: params.color, points: points, questionslength: params.questions.length})
            } else {
                setIndex(index + 1)
            }
            setChosen(null)
        }
    }



    return (
        <View style={styles.container}>
            <View style={[styles.appbar, {backgroundColor: params.color}]}>
                <Text style={styles.appbarText}>{params.gametitle}</Text>
            </View>
            <View style={styles.content}>
                <Text style={styles.questions}>{`Question ${index+1}/${params.questions.length}`}</Text>
                <Text style={styles.question}>{params.questions[index]['question']}</Text>
                <View style={styles.answers}>
                    <FlatList data={params.questions[index]['options']} renderItem={({item, index}) => {
                        return <AnswerButton text={item} isChosen={chosen == index} onPress={() => setChosen(index)} />
                    }} />
                </View>
                <View style= {{paddingHorizontal: 30}}>
                    <TouchableOpacity
                        style={styles.button}
                        activeOpacity={0.9}
                        onPress={handleNext}
                        >
                        <Text style={styles.buttonText}>{index == params.questions.length - 1 ? 'Finish' : 'Next'}</Text>
                    </TouchableOpacity>
                </View>
            </View>
        </View>
    )
}

export default Quiz

const styles = StyleSheet.create({
    container : {
        height: '100%',
        backgroundColor: "#fff"
    },

    appbar : {
      height: 70,
      width: '100%',
      
      alignItems: 'center',
      justifyContent: 'center'
    },
    appbarText : {
        fontSize: 32,
        color: "#fff",
        fontFamily: 'DMSans-Medium',
    },
    questions : {
        paddingLeft: 30,
        paddingRight: 30,
        color: "#FABB05",
        fontSize: 18,
        fontFamily: 'DMSans-Medium',
    },
    question : {
        paddingLeft: 30,
        paddingRight: 30,
        color: "#213057",
        fontSize: 22,
        fontFamily: 'DMSans-Medium',
    },

    content: {
        flexGrow: 1,
        paddingTop: 20,
        paddingBottom: 30,
        display: "flex",
        flexDirection: "column",
        justifyContent: "space-between"
    },

    answers : {
        paddingTop: 20,     
        
    },
    

    button: {
        backgroundColor: '#4285F4',
        height: 80,
        width: '100%',
        borderRadius: 5,
        alignItems: 'center',
        justifyContent: 'center',
        alignSelf: 'center',
      },

      buttonText: {
        color: 'white',
        fontSize: 26,
        fontFamily: 'DMSans-Medium',
      },
})