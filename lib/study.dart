import 'package:flutter/material.dart';

void main() {
  runApp(const _MyStatefulWidget());
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({super.key});

  @override
  State<_MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('ㅎㅇ');
  }
}

