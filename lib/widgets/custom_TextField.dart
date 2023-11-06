import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;


  InputTextFieldWidget(this.textEditingController, this.hintText);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          //alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Border when the field is not focused
            borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
          ),
          fillColor: Colors.white54,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
          focusColor: Colors.white60,
        ),
      ),
    );
  }
}

class PasswordInputTextFieldWidget extends StatelessWidget {
  late final TextEditingController textEditingController;
  final String hintText;

  PasswordInputTextFieldWidget(this.textEditingController, this.hintText);
  bool passwordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextFormField(
        controller: textEditingController,
        obscureText: true,
        decoration: InputDecoration(
          //alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey), // Border when the field is not focused
            borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
          ),
          fillColor: Colors.white54,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
          focusColor: Colors.white60,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(passwordVisible
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () {
            //   setState(
            //         () {
            //       passwordVisible = !passwordVisible;
            //     },
            //   );
             },
          ),
        ),
      ),
    );
  }
}

