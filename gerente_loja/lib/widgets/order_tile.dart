import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerente_loja/widgets/order_header.dart';

class OrderTile extends StatelessWidget {

  final DocumentSnapshot order;

  final states = [
    "Aguardando Pagamento", "Em preparação", "Em Transporte", "Aguardando Entrega", "Entregue"
  ];

  OrderTile(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        child: ExpansionTile(
          key: Key(order.documentID),
          initiallyExpanded: order.data["status"] != 4,
          title: Text(
            "#${order.documentID.substring(order.documentID.length - 7, order.documentID.length)} "
                "- ${states[order.data["status"]]}",
            style: TextStyle(color: order.data["status"] != 4 ? Colors.grey[850] : Colors.green),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OrderHeader(order),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: order.data["products"].map<Widget>((product) {
                      return ListTile(
                        title: Text(product["product"]["title"] + " - " + product["size"]),
                        subtitle: Text(product["category"] + "/" + product["pid"]),
                        trailing: Text(
                          product["quantity"].toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        contentPadding: EdgeInsets.zero,
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Firestore.instance.collection("users").document(order["clientId"])
                            .collection("orders").document(order.documentID).delete();
                          order.reference.delete();
                        },
                        textColor: Colors.red,
                        child: Text("Excluir"),
                      ),
                      FlatButton(
                        onPressed: order.data["status"] > 1 ? () {
                          order.reference.updateData({"status": order.data["status"] - 1});
                        } : null,
                        textColor: Colors.grey[850],
                        child: Text("Regredir"),
                      ),
                      FlatButton(
                        onPressed: order.data["status"] < 4 ? () {
                          order.reference.updateData({"status": order.data["status"] + 1});
                        } : null,
                        textColor: Colors.green,
                        child: Text("Avançar"),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
