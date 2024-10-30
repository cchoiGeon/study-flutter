import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// StatelessWidget 클래스 : 상태를 가지지 않는 위젯을 구성하는 기본 클래스
// 상태를 갖지 않는다 == 한 번 그려진 후 다시 그리지 않는 경우 , 프로퍼티로 변수 X, 상수는 O
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( // 테마를 지정해줌
        primarySwatch: Colors.blueGrey
      ),
      home: MyHomePapge()
    );
  }
}

class MyHomePapge extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePapge> {
  var _text = 'Hello';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: Text(
        _text,
        style: TextStyle(fontSize: 40),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
            setState(() {
              _text = 'World';
            })
          },
        child: Icon(Icons.touch_app),
      ),
    );
  }
}