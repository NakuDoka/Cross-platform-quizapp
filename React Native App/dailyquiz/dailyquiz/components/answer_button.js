import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';

const AnswerButton = ({ text, isChosen, onPress }) => {
  return (
    <View style={{ paddingBottom: 12, paddingTop: 3, paddingLeft: 30, paddingRight: 30, }}>
    <TouchableOpacity
      style={[
        styles.button,
        isChosen ? { backgroundColor: '#4285F4' } : { backgroundColor: 'white' },
        
      ]}
      onPress={onPress}
    >
      <View >
        <Text style={[styles.buttonText, isChosen ? { color: 'white' } : { color: 'black' }]}>
          {text}
        </Text>
      </View>
    </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  button: {
    height: 70,
    width: '100%',
    borderRadius: 5,
    alignItems: 'center',
    justifyContent: 'center',
    alignSelf: 'center',
    shadowColor: "#000",
    shadowOffset: { width: 2, height: 2 },
    shadowOpacity: 0.15,
    shadowRadius: 0,
    elevation: 8,
  },
  buttonText: {
    fontSize: 20,
    fontFamily: 'DMSans-Regular',

  },
});

export default AnswerButton;