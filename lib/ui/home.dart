import 'package:flutter/material.dart';

void main() {
  runApp(HomeTela());
}

class HomeTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu Pequeno Grimório')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Escolha uma opção:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação do botão 1
                Navigator.pushNamed(context, '/catalogo');
              },
              child: Text('Ir para o catalogo de livros'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
