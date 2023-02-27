import 'package:flutter/material.dart';
import '../constants.dart' as constant;
import '../constants.dart' as constant2;

class textfield extends StatelessWidget {
  final String text;
  final bool isPassword;
  final Function(String) onChanged;

  const textfield({
    super.key,
    required this.text,
    required this.isPassword,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(color: constant.txtColor),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: constant2.txtColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: constant.txtColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.pink,);
  }
}
*/