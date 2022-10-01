import 'package:flutter/material.dart';
import 'package:practical/controller/buttons_controller.dart';
import 'package:practical/views/second_page.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ButtonsController>(builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_formField(model), _submitButton(context)],
        );
      }),
    );
  }

  Widget _submitButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Provider.of<ButtonsController>(context, listen: false).addButtons();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ));
          }
        },
        child: const Text("Submit"));
  }

  Widget _formField(ButtonsController model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some value';
            }
            return null;
          },
          controller: model.controller,
          decoration: const InputDecoration(
              hintText: "Enter Value Here...",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent))),
        ),
      ),
    );
  }
}
