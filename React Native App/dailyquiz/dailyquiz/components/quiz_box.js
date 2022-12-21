import React from 'react';
import {  View, Text, TouchableHighlight, StyleSheet, Dimensions, Icon  } from 'react-native';

// <Icon name={quiz.icon} size={45} color="#fff" />
const Quizbox = ({ title, icon, color, questions, onPress  }) => {
const { height, width } = Dimensions.get('window');
    return (
        <View style={{paddingBottom: 15,  paddingHorizontal:30, paddingTop: 5}}>
        <TouchableHighlight
          style={[styles.container, {height: height / 7,}]}
          onPress={onPress}
        >
          <View style={styles.row}>
            <View style={[styles.iconbox, {backgroundColor: color,marginLeft: (height / 7 - 70) / 2, marginRight: (height / 7 - 70) / 2,}]}> 
            </View>
            <View style={[styles.titleContainer, {width: width - 60 - 70 - (height / 7 - 70), height: height / 7}]}>
              <Text style={[styles.title, {paddingTop: (height / 7 - 70) / 2}]} numberOfLines={2}>{title}</Text>
              <View style={styles.questionsContainer}>
                <Text style={styles.questions}>{`${questions.length} questions`}</Text>
              </View>
            </View>
          </View>
        </TouchableHighlight>
        </View>
      );
    };

    const styles = StyleSheet.create({
        container: {          
          backgroundColor: '#fff',
          shadowColor: '#000',
          shadowOffset: { width: 4, height: 4 },
          shadowOpacity: 0.15,
          shadowRadius: 4,
          elevation: 8,

        },
        row: {
          flexDirection: 'row',
        },
        iconbox: {
          width: 70,
          height: 70,
          alignSelf: 'center',

        },
        titleContainer: {          
          justifyContent: 'space-between',
        },
        title: {
          fontSize: 18,
          color: '#213057',
          paddingRight: 20,
          fontFamily: 'DMSans-Medium',
        },
        questionsContainer: {
          alignSelf: 'flex-end',
          paddingBottom: 15,
          paddingRight: 10
        },
        questions: {
          color: '#fff',
          fontSize: 12,
          padding: 2,
          borderRadius: 20,
          backgroundColor: '#4257B2',
          paddingHorizontal: 6,
          paddingVertical: 2,
          fontFamily: 'DMSans-Medium',
        },
      });

export default Quizbox;