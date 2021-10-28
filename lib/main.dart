import 'package:flutter/material.dart';
import 'makepwd.dart';
import 'package:clipboard/clipboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Generator',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'taskit makepwd'),
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
        centerTitle: true,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                key: Key('name'),
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_add),
                ),
              ),
              TextFormField(
                key: Key('code'),
                controller: codeController,
                obscureText: !this._showCode,
                decoration: InputDecoration(
                  labelText: 'Code',
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showCode ? Colors.red : Colors.brown,
                    ),
                    onPressed: () {
                      setState(() => this._showCode = !this._showCode);
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  key: Key('button1'),
                  onPressed: () {
                    setState(() {
                      _name = nameController.text;
                      _code = codeController.text;

                      _password = Generator().generatePassword(_name, _code);

                      print(_password);
            
                    });
                  },
                  child: const Text('Generate Password')),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _password,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.copy,
                          color: _password != "" ? Colors.brown : Colors.grey),
                      onPressed: () {
                        if (_password != "") {
                          FlutterClipboard.copy(_password)
                              .then((value) => print('copied'));
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Switch(
                  key: Key('switch1'),
        
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                   // MyHomePageState();

                    print(isSwitched);
                  });
                },
                activeTrackColor: Colors.yellow,
                activeColor: Colors.orangeAccent,
              ),
              Text("legacy"),
            ]),
      ),
    );
  }
}
