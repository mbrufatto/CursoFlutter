import 'package:flutter/material.dart';
import 'package:flutter_animation2/screen/login/widgets/input_field.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: [
            InputField(
              hint: "Username",
              obscure: false,
              icon: Icons.person_outline
            ),
            InputField(
                hint: "Password",
                obscure: true,
                icon: Icons.lock_outline
            ),

          ],
        ),
      ),
    );
  }
}
