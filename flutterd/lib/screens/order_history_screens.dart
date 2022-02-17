import 'package:flutter/material.dart';
import 'package:flutterd/state/cart_state.dart';
import 'package:flutterd/widgets/add_drower.dart';
import 'package:provider/provider.dart';

class OrderScreens extends StatelessWidget {
  static const routeName = '/order-screens';
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartState>(context).oldorder;
    return Scaffold(
      appBar: AppBar(
        title: Text("Commandes"),
      ),
      drawer: AppDrower(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("Email :${data[i].email}"),
                    Text("Tel :${data[i].phone}"),
                    Text("Adrese :${data[i].address}"),
                    Text("Total : ${data[i].cart.total} MRU"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
