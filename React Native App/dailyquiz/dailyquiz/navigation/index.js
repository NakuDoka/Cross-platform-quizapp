import { createStackNavigator } from '@react-navigation/stack';
import Result from '../screens/final_page';
import Home from '../screens/home';
import Quiz from '../screens/quiz_page';
import React from "react";

const Stack = createStackNavigator();

function MyStack() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={Home} options={{headerShown: false}}/>
      <Stack.Screen name="QuizPage" component={Quiz}  options={{headerShown: false}}/>
      <Stack.Screen name="Result" component={Result}  options={{headerShown: false}}/>
    </Stack.Navigator>
  );
}

export default MyStack;