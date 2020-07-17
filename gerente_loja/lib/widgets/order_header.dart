import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerente_loja/blocs/user_bloc.dart';

class OrderHeader extends StatelessWidget {

  final DocumentSnapshot order;

  OrderHeader(this.order);

  @override
  Widget build(BuildContext context) {

    final _userBloc  = BlocProvider.of<UserBloc>(context);
    final _user = _userBloc.getuser(order.data["clientId"]);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${_user["name"]}"),
              Text("${_user["address"]}")
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Produtos: R\$${order.data["productPrice"].toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.w500)),
            Text("Total: R\$${order.data["totalPrice"].toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        )
      ],
    );
  }
}
