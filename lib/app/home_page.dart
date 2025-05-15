import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import '../main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Applicação de exemplo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // Para centralizar o FAB se usar BottomAppBar
      bottomNavigationBar: BottomAppBar(
        shape:
        const CircularNotchedRectangle(), // Dá um recorte para o FAB se ele estiver encaixado
        notchMargin: 6.0, // Margem do recorte
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // Distribui o espaço
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.info_outline),
              tooltip: 'Sobre',
              onPressed: _navigateToAboutPage,
            ),
            // Espaço reservado para o FAB se estiver centralizado e encaixado.
            // Se o seu FAB de incremento já estiver definido no Scaffold,
            // e você quiser outro botão '+' na barra, você pode adicionar outro IconButton.
            // Se o FAB existente for o seu botão '+', você pode querer ajustar o layout
            // ou usar apenas um IconButton para o '+' na barra.

            // Opção 1: Se o FAB existente é o seu '+' e está centralizado
            const SizedBox(width: 48),
            // Espaço para o FAB encaixado

            // Opção 2: Se você quer um botão '+' *adicional* na barra (além do FAB principal)
            /*
            IconButton(
              icon: const Icon(Icons.add_circle_outline), // Ou outro ícone de '+'
              tooltip: 'Adicionar Item',
              onPressed: () {
                // Ação para o segundo botão de '+'
                print("Outra ação de Adicionar");
              },
            ),
            */
          ],
        ),
      ),
    );
  }

  void _navigateToAboutPage() {
    Routefly.pushNavigate(routePaths.about);
  }
}