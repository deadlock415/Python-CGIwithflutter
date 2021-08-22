import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  web() async {
    var url = Uri.http("192.168.1.2", "/cgi-bin/cmd.py", {"x": cmd, "y": cn});
    var response = await http.get(url);
    print(response.body);
    setState(() {
      output = response.body;
    });
  }
    // print(cmd);
  }

  late String cmd;
  late String cn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          title: Text("Python-CGI With Flutter"),
        ),
        body: Column(
          children: [
            Container(
            margin: const EdgeInsets.all(10.0),
            child: Text("Enter Your Command : ",
            style: TextStyle(fontSize: 30.0),

            ),
            ),
            TextField(
              onChanged: (value) {
                cmd = value;
              },
              autocorrect: false,
              textInputAction: TextInputAction.send,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.airplay),
                  hintText: "Enter Docker Image"),
            ),
            TextField(
              onChanged: (value) {
                cn = value;
              },
              autocorrect: false,
              textInputAction: TextInputAction.send,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.add_to_queue),
                  hintText: "Enter Docker Name"),
            ),
            OutlinedButton(
              onPressed: web,
              child:  Text('RUN',
              style: TextStyle(fontSize: 20.0),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
