import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'money.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Cart()),
        ChangeNotifierProvider(create: (BuildContext context) => Money())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Multi Provider State Management"),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Balance"),
                  Consumer<Money>(
                    builder: (BuildContext context, Money value, Widget child) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple[100], width: 2),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text("Rp. ${value.balance}"),
                        ),
                      );
                    }
                  )
                ],
              ),
              Consumer<Cart>(
                builder: (BuildContext context, Cart value, Widget child) {
                  return Container(
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.purple),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text("Apple (500) x ${value.total}"),
                        ),
                        Spacer(),
                        Container(
                          child: Text("${500 * value.total}"),
                        )
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        ),
        floatingActionButton: Consumer<Cart>(
          builder: (BuildContext context, Cart cart, Widget child) {
            return Consumer<Money>(
              builder: (BuildContext context, Money money, Widget child) {
                return FloatingActionButton(
                  child: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    if (money.balance >= 500) {
                      cart.total += 1;
                      money.balance -= 500;
                    }
                  },
                );
              }
            );
          }
        )
      ),
    );
  }
}