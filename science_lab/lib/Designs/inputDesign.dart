import 'package:flutter/material.dart';

class InputDesign extends StatelessWidget {
  final String hint;
  final String topText;
  final Function onChange;
  final bool obscureText;
  final TextEditingController controller;

  const InputDesign(
      {Key key,
      this.hint = "Email",
      this.topText = "E-mail*",
      this.onChange,
      this.obscureText = false,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Card(
              elevation: 20,
              shadowColor: Colors.white12,
              child: Container(
                height: 50,
                child: TextField(
                  onChanged: onChange,
                  controller: controller,
                  obscureText: obscureText,
                  style: TextStyle(
                    color: Color(0xFF282834),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    contentPadding: EdgeInsets.only(left: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
