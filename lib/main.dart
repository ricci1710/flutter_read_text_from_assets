import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Read Text File From Assets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Read Text File From Assets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _textFromFile = 'Empty';

  getDate() async {
    String response = await rootBundle.loadString('text_notes/my_text.txt');
    setState(() {
      _textFromFile = response;
    });
  }

  clear() {
    setState(() {
      _textFromFile = 'Empty';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _textFromFile,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: getDate,
                child: const Text('Get Data'),
              ),
            ),
            ElevatedButton(
              onPressed: clear,
              child: const Text('clear'),
            ),
          ],
        ),
      ),
    );
  }
}
