import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int _index = 0;
  int? _selectOption = null;
  int _rightAnswers = 0;
  bool _isOnCorrect = false;

  int get index => _index;
  set setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  int? get selectOption => _selectOption;
  set setselectOption(int index) {
    _selectOption = index;
    notifyListeners();
  }

  void changeselectOption(int index) {
    _selectOption = index;
    notifyListeners();
  }

  int? get rightAnswers => _rightAnswers;
  set setRightAnswers(int index) {
    _rightAnswers = index;
    notifyListeners();
  }

  bool get isOnCorrect => _isOnCorrect;
  set setisOnCorrect(bool isOnCorrect) {
    _isOnCorrect = isOnCorrect;
    notifyListeners();
  }

  void changeisOnCorrect(bool isOnCorrect) {
    _isOnCorrect = isOnCorrect;
    notifyListeners();
  }

  void addRightAnswer() {
    _rightAnswers++;
    notifyListeners();
  }

  void nextPage() {
    _selectOption = null;
    _index++;
    _isOnCorrect = false;
    notifyListeners();
  }

  void resetQuiz() {
    _selectOption = null;
    _index = 0;
    _rightAnswers = 0;
    _isOnCorrect = false;
    notifyListeners();
  }
}
