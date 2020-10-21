import 'package:flutter/material.dart';

//calculadora de IMC

void main() {
  runApp(MaterialApp(
    home: CJS(),
  ));
}

class CJS extends StatefulWidget {
  @override
  _CJSState createState() => _CJSState();
}

class _CJSState extends State<CJS> {

  //criando controllers
  TextEditingController capital = new TextEditingController();
  TextEditingController taxa = new TextEditingController();
  TextEditingController periodo = new TextEditingController();

  String resultado = "Seu resultado";

  void calcular(){
    double capitalR = double.parse(capital.text);
    double taxaR = double.parse(taxa.text) / 100;
    double periodoR = double.parse(periodo.text);

    double montante = capitalR + (capitalR * taxaR * periodoR);

    setState(() {
      resultado = "O montante final de juros é $montante reais";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULADORA DE JUROS"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextFormField( //cria um input
            controller: capital,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Capital"),
          ),
          TextFormField(
            controller: taxa,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Taxa (Mês)"),
          ),
          TextFormField(
            controller: periodo,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Periodo (Mês)"),
          ),
          RaisedButton(
            onPressed: () {
              calcular();
            },
            child: Text("calcular juros!"),
          ),
          Text(resultado)
        ],
      )
    );
  }
}

