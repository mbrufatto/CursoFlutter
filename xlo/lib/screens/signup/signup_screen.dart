import 'package:flutter/material.dart';
import 'package:xlo/screens/signup/widgets/field_title.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Cadastro'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            const FieldTitle(
              title: 'Apelido',
              subtitle: 'Como aparecerá em seus anúncios.',
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Exemplo: João S.'
              ),
              validator: (text) {
                if(text.length < 6)
                  return 'Apelido muito curto';
                return null;
              },
            ),
            const SizedBox(height: 26),
            const FieldTitle(
              title: 'E-mail',
              subtitle: 'Enviaremos um e-mail de confirmação',
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
              ),
              validator: (text) {
                if(text.length < 6 || !text.contains('@'))
                  return 'E-mail inválido';
                return null;
              },
            ),
            const SizedBox(height: 26),
            const FieldTitle(
              title: 'Senha',
              subtitle: 'Use letras, números e caracteres especiais',
            ),
          ],
        ),
      ),
    );
  }
}
