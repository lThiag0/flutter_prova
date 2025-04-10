import 'package:flutter/material.dart';
import 'package:flutter_prova/class/book.dart';

void main() {
  runApp(BookCatalogo());
}

class BookCatalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final book = Book.getExample();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Catálogo de Livros')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: ListView(children: [BookWidget(book: book)])),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Voltando para home!')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 192, 192, 192),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Volta para Home', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookWidget extends StatelessWidget {
  final Book book;

  BookWidget({required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Autor: ${book.author}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 8),
              Text(
                'Ano de Publicação: 2010',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 8),
              Text(
                'Número de Páginas: ${book.pages}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 8),
              Text(
                'Gênero: ${book.isLongBook() ? "Conto de fadas" : "---"}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 8),
              Text(
                'Avaliação: 7/10',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Livro marcado como favorito!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Marcar como Favorito',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
