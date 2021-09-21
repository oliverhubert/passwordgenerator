import 'package:flutter/material.dart';
import 'makepwd.dart';
import 'makepwd2021.dart';
import 'prng.dart';
import 'package:clipboard/clipboard.dart';

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
  String _name = "";
  String _code = "";
  bool isSwitched = false;

  final nameController = TextEditingController();
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                      color: this._showCode ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showCode = !this._showCode);
                    },
                  ),
                ),
              ),
              Text(''),
              Text(''),
              Text(''),
              ElevatedButton(
                  onPressed: () {
                    if (isSwitched == false) {
                      setState(() {
                        _name = nameController.text;
                        _code = codeController.text;

                        _password = generatePassword2021(_name, _code);
                        print(_password);
                        print('switch = false');
                      });
                    } else
                      setState(() {
                        _name = nameController.text;
                        _code = codeController.text;

                        _password = generatePassword(_name, _code);
                        print(_password);
                        print('switch = true');
                      });
                  },
                  child: const Text('Generate Password')),
              Text(''),
              Text(''),
              Text(''),
              Text(
                _password,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  Icons.copy,
                  color: Colors
                      .grey, //          color: this._showCode ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  if (_password != "") {
                    FlutterClipboard.copy(_password)
                        .then((value) => print('copied'));
                  
                  } else {
                    print('nothing to copy');
                  }
                },
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: Colors.yellow,
                activeColor: Colors.orangeAccent,
              ),
            ]),
      ),
    );
  }
}
