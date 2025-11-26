import 'package:flutter/material.dart';
import 'dart:math';

import 'package:sistemacadastro/auth.dart';

class Sorteador extends StatefulWidget {
  const Sorteador({super.key});

  @override
  State<Sorteador> createState() => _SorteadorState();
}

class _SorteadorState extends State<Sorteador> {
  int numeroSorteado = 0;
  final Random random = Random();

  void sortearNumero() {
    setState(() {
      numeroSorteado = random.nextInt(100) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'Sorteador de números',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.green[100],
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Olá ',
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  TextSpan(
                    text: 'usuário',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: ', sorteie um número',
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Número Sorteado:',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$numeroSorteado',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: sortearNumero,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Sortear Número',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      AuthService().logoutUser();
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
