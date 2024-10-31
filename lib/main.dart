import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController _altura = TextEditingController();
  TextEditingController _peso = TextEditingController();

  String _texto = "Digite suas informações";

  double imc = 0;

  void calcular() {
    setState(() {
      double altura = double.parse(_altura.text);
      double peso = double.parse(_peso.text);

      double alturametros = altura / 100;
      print(alturametros);

      if (altura > 0) {
        imc = peso / (alturametros * alturametros);
        if (imc < 18.5) {
          _texto = "Abaixo do peso normal";
        } else if (imc >= 18.5 && imc <= 24.9) {
          _texto = "Peso Normal";
        } else if (imc >= 25.0 && imc <= 29.9) {
          _texto = "Excesso de peso";
        } else if (imc >= 30.0 && imc <= 34.9) {
          _texto = "Obesidade classe I";
        } else if (imc >= 35.0 && imc <= 39.9) {
          _texto = "Obesidade classe II";
        } else {
          _texto = "Obesidade classe III";
        }
      } else {
        _texto = "Insira valores válidos";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora de IMC",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fitness_center,
                color: Color.fromARGB(255, 242, 247, 0),
                size: 100,
              ),
              TextField(
                controller: _altura,
                decoration: InputDecoration(hintText: "Altura (CM)"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _peso,
                decoration: InputDecoration(hintText: "Peso (KG)"),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(onPressed: calcular, child: Text("Calcular")),
              Text("Seu IMC é:"),
              Text(
                imc.toStringAsPrecision(4),
              ),
              Text(
                _texto,
              )
            ],
          ),
        ),
      ),
    );
  }
}
