
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class RadioStatefulWidget extends StatefulWidget {
  const RadioStatefulWidget({super.key});

  @override
  State<RadioStatefulWidget> createState() => _RadioStatefulWidgetState();
}

class _RadioStatefulWidgetState extends State<RadioStatefulWidget> {
  Gender? _character = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          Row(
            children: [
              Radio<Gender>(
                value: Gender.male,
                groupValue: _character,
                onChanged: (Gender? value) {
                  setState(() {
                    _character = value;
                  });
                  print( "Value is:  ${_character}");
                },
              ),
              const Expanded(
                child: Text('Male'),
              )
            ],
          ),
          Row(
            children: [
              Radio<Gender>(
                value: Gender.female,
                groupValue: _character,
                onChanged: (Gender? value) {
                  setState(() {
                    _character = value;
                  });
                  print( "Value is:  ${_character}");
                },
              ),
              const Expanded(child: Text('Female'))
            ],
          ),
        ],
      ),

    );
  }
}
