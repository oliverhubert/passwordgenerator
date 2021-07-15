import 'package:flutter/material.dart';
import 'generatepw.dart';

void main() {
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
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_add),
                ),
              ),
              TextFormField(
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
                      _password = getPassword();
                    });
                  },
                  child: const Text('Generate Password')),
              Text(_password)
            ]),
      ),
    );
  }
}

getPassword() {
  String password = generatePassword('test', 'code');
  print(password);
  return password;
}
