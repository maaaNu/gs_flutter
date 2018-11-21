import 'package:gs_flutter/Actions.dart';

int incrementButton(int currentValue) {
  print(currentValue);
  return currentValue + 2;
}

int buttonReducers(int state, dynamic action) {
  if (action == IncrementingButtonAction.IncrementButton) {
    return incrementButton(state);
  } else if (action == IncrementingButtonAction.DecrementButton) {
    return state - 1;
  }
  return state;
}
