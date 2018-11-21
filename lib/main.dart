import 'package:flutter/material.dart';
import 'package:gs_flutter/app.dart';
import 'package:gs_flutter/reducers/CountingButton.dart';
import 'package:redux/redux.dart';


final store = new Store<int>(buttonReducers, initialState: 0);

void main() {
  runApp(StoreWrapper(store));
}