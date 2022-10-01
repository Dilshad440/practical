import 'package:flutter/material.dart';

class ButtonsController extends ChangeNotifier {
  List<dynamic> buttons = [];

  TextEditingController controller = TextEditingController();

  addButtons() {
    buttons.add(controller.text);
    notifyListeners();
  }

  changeButtons(List<dynamic> buttons, int index) {
    if (index > 0) {
      final s = buttons.elementAt(index - 1);
      controller.text = s;
      notifyListeners();
    } else {
      final s = buttons.elementAt(index + 1);
      controller.text = s;
      notifyListeners();
    }
  }
}
