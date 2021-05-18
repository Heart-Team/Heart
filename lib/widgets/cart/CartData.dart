import "package:flutter/material.dart";
import 'package:heart_app/Providers/Cart.dart';
import 'package:provider/provider.dart';

class CartData extends StatefulWidget {
  final String title;
  final String amount;
  final String img;
  final String ein;

  CartData(this.ein ,this.title, this.amount, this.img, {Key key}) : super(key: key);

  @override
  _CartDataState createState() => _CartDataState();
}

class _CartDataState extends State<CartData> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.amount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<Cart>(context, listen: false);

    return Dismissible(
      key: widget.key,
      direction: DismissDirection.endToStart,
      background: Container(
        child: Icon(
          Icons.delete_forever, 
          color: Colors.white,
          size: 40,
        ),
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30)
      ),
      onDismissed: (_) async {
        await cartProvider.removeItem(widget.ein);
      },
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 150,
                  constraints: BoxConstraints(maxHeight: 150), 
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.cover,
                  )
                )
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          widget.title,
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container( 
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container( 
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Amount ",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12.withOpacity(0.15),
                                          blurRadius: 15)
                                    ]),
                                margin: EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: _controller,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    prefixIconConstraints: BoxConstraints(
                                      maxWidth: 20
                                    ),
                                    prefixIcon: Icon(
                                      Icons.attach_money,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none
                                    ),
                                    contentPadding: EdgeInsets.only(left: 0, top: 10, right: 0)
                                  ),
                                  onSubmitted: (val){
                                    cartProvider.updateItem(widget.ein, val);
                                  },
                                ),
                                  
                                
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}
