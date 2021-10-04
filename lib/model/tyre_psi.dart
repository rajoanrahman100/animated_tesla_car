import 'package:flutter/material.dart';

class TyrePsi{
  final double psi;
  final int temp;
  final bool isLowPressure;

  TyrePsi({required this.psi,required this.temp,required this.isLowPressure});
}

final List<TyrePsi> demoList=[
  TyrePsi(psi: 23.6, temp: 56, isLowPressure: true),
  TyrePsi(psi: 35.0, temp: 41, isLowPressure: false),
  TyrePsi(psi: 34.6, temp: 41, isLowPressure: false),
  TyrePsi(psi: 34.8, temp: 42, isLowPressure: false),
];