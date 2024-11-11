import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => setState(() {
            _character = SingingCharacter.lafayette;
          }),
          child: Row(
            children: <Widget>[
              Radio<SingingCharacter>(
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
                activeColor: Colors.grey,
              ),
              const Text(
                'lafayette',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () => setState(() {
            _character = SingingCharacter.jefferson;
          }),
          child: Row(
            children: <Widget>[
              Radio<SingingCharacter>(
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
                activeColor: Colors.grey,
              ),
              const Text(
                'jefferson',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              )
            ],
          ),
        ),
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
