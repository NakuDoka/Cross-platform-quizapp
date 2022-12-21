import React from "react";
import {StyleSheet, TouchableOpacity, Text, View} from 'react-native'

const Result = ({navigation, route}) => {
    const params = route.params;
    return (
        <View style={styles.container}>
            <View style={[styles.appbar, {backgroundColor: params.color}]}>
                <Text style={styles.appbarText}>{params.gametitle}</Text>
            </View>
            <View style={styles.content}>
                <View></View>
                     <View style={styles.resultText}>
                <Text style={styles.result}>Your result</Text>
                <Text style={styles.results}>{`${params.points}/${params.questionslength}`}</Text>
                </View>
                
                <TouchableOpacity
                    style={styles.button}
                    activeOpacity={0.9}
                    onPress={() => navigation.popToTop()}
                    >
                    <Text style={styles.buttonText}>Go back to menu</Text>
                </TouchableOpacity>
            </View>
        </View>
    )
}

export default Result

const styles = StyleSheet.create({
    container : {
        height: '100%'
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
    resultText : {
        alignSelf: 'center'
    },
    result : {
        color: "#213057",
        fontSize: 32,
        alignSelf: 'center',
        fontFamily: 'DMSans-Medium',


    },
    results : {
        color: "#E94235",
        fontSize: 41,
        alignSelf: 'center',
        fontFamily: 'DMSans-Medium',


    },

    content: {
        flexGrow: 1,
        paddingLeft: 30,
        paddingRight: 30,
        paddingTop: 20,
        paddingBottom: 30,
        display: "flex",
        flexDirection: "column",
        justifyContent: "space-between"
    },


    button: {
        backgroundColor: '#4285F4',
        height: 80,
        width: '100%',
        borderRadius: 5,
        alignItems: 'center',
        justifyContent: 'center',
        alignSelf: 'center'
        
      },
      buttonText: {
        color: 'white',
        fontSize: 26,
        fontFamily: 'DMSans-Medium',

      },
})