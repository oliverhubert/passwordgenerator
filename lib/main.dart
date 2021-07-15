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
  bool _obscureText = true;
  String _password = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Benutzername',
                    icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: const Icon(Icons.person_add))),
                obscureText: _obscureText,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Code',
                    icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: const Icon(Icons.lock))),
                obscureText: _obscureText,
              ),
              IconButton(
                  icon: const Icon(Icons.hide_source), onPressed: _toggle),
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

class PasswordGenerated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Generated"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$generatePassword'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
