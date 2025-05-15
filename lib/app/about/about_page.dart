import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nome do Aplicativo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Versão: 1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Desenvolvido por: Seu Nome/Nome da Empresa',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Este é um aplicativo incrível que faz coisas maravilhosas. '
                  'Ele foi projetado para ajudar os usuários a alcançar [objetivo principal do app]. '
                  'Esperamos que você aproveite a experiência!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            // Você pode adicionar mais informações aqui, como:
            // - Links para termos de serviço ou política de privacidade
            // - Agradecimentos
            // - Informações de contato
            Text(
              'Contato: contato@exemplo.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}