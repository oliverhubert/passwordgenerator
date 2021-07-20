import 'package:flutter/material.dart';
import 'makepwd.dart';
import 'prng.dart';

void main() {
//  myStartRand(0xFFFFFFFFA2FBE3B0);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Taskit Password Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool _showCode = false;
  String _password = "";
  String _name = "";
  String _code = "";

  final nameController = TextEditingController();
  final codeController = TextEditingController();

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
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_add),
                ),
              ),
              TextFormField(
                controller: codeController,
                obscureText: !this._showCode,
                decoration: InputDecoration(
                  labelText: 'Code',
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showCode ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showCode = !this._showCode);
                    },
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _name = nameController.text;
                      _code = codeController.text;
//                      _password = myRand().toString();
                      _password = generatePassword(_name, _code);
                      print(_password);
                    });
                  },
                  child: const Text('Generate Password')),
              Text(_password),
            ]),
      ),
    );
  }
}

// I/flutter ( 6042): testnamecode[114, 37, 50, 112, 77, 63, 45, 49]
