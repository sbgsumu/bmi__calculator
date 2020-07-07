import 'dart:math';

import 'package:flutter/material.dart';

class Brain{

  Brain( {@required this.height,@required this.weight});

  int height , weight ;

  double _bmi ;

  String bmiCalculate(){
    _bmi = weight / pow(height/100 , 2);
    return  _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25){
      return "Overweight";
    }
    else if ( _bmi > 18.5){
      return "Normal ";
    }
    else{
      return "Under Weight";
    }
  }

  String getComments(){
    if (_bmi >= 25){
      return "You have Higher than Normal Body Weight . Try to Exercise More .";
    }
    else if ( _bmi > 18.5){
      return "You have Normal Body Weight . Good Job";
    }
    else{
      return "You have Lower than Normal Body Weight . You can eat a bit more . .";
    }
  }
}