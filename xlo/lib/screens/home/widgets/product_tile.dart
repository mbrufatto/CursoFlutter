import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xlo/models/ad.dart';

class  ProductTile extends StatelessWidget {

  ProductTile({this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          child: Row(
            children: [
              SizedBox(
                height: 135,
                width: 127,
                child: Image.file(ad.images[0], fit: BoxFit.cover,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        ad.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(
                        'R\$${ad.price}'
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String numToString(num number) {
    return NumberFormat('###,##0.00', 'pt-br').
    format(double.parse(number.toStringAsFixed(2)));
  }
}
