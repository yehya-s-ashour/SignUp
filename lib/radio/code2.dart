import 'package:flutter/material.dart';

import 'RegisterForms.dart';
import 'code2.dart';

enum Kind { customer, seller }

class radio extends StatefulWidget {
  String name;
  @override
  radio(this.name);
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {
  Kind? groupValue = Kind.customer;
  List<String> categories = ['Electronics', 'Fashion', 'Software'];
  String? dropDownValue = 'Electronics';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                value: Kind.customer,
                groupValue: groupValue,
                onChanged: (Kind? v) {
                  this.groupValue = v;
                  setState(() {});
                },
                title: Text("Customer"),
              ),
            ),
            Expanded(
              child: RadioListTile(
                value: Kind.seller,
                groupValue: groupValue,
                onChanged: (Kind? v) {
                  this.groupValue = v;
                  setState(() {});
                },
                title: Text("Seller"),
              ),
            ),
          ],
        ),
        this.groupValue == Kind.customer
            ? CustomerRegister()
            : MershantRegister(),
        DropdownButton<String>(
            value: this.dropDownValue,
            items: categories.map((e) {
              return DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              );
            }).toList(),
            onChanged: (v) {
              this.dropDownValue = v;
              setState(() {});
            }),
      ],
    );
  }
}
