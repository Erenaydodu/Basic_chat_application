import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Main Chat Project", home: Iskele());
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat Application")),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List mesajlistesi = [];
  TextEditingController t1 = TextEditingController();
  mesajEkle(String mesaj) {
    setState(() {
      mesajlistesi.insert(0, mesaj);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajlistesi.length,
              itemBuilder: (context, index) => Text(mesajlistesi[index]),
            ),
          ),
          Row(),
          TextField(controller: t1, onSubmitted: mesajEkle),
          ElevatedButton(onPressed: mesajEkle(t1.text), child: Text("Gonder")),
        ],
      ),
    );
  }
}
