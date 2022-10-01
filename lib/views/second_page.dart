import 'package:flutter/material.dart';
import 'package:practical/controller/buttons_controller.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ButtonsController>(builder: (context, model, child) {
          return Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: model.buttons
                    .asMap()
                    .map(
                      (index, value) => MapEntry(
                        index,
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: model.controller.text ==
                                    model.buttons[index]
                                ? () =>
                                    model.changeButtons(model.buttons, index)
                                : null,
                            child: Text(
                              model.buttons[index].toString(),
                            ),
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList()),
          );
        }),
      ),
    );
  }
}
