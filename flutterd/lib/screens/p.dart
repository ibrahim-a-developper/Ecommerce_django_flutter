// import 'package:flutter/material.dart';
// import 'package:flutterd/screens/cart_screens.dart';
// import 'package:flutterd/state/cart_state.dart';
// import 'package:flutterd/state/product_state.dart';

// import 'package:flutterd/widgets/singleProduct.dart';
// import 'package:provider/provider.dart';

// class T extends StatelessWidget {


//   @override
//   Widget build(BuildContext context) {
//       @override
//   void didChangeDependencies() async {
//     if (_init) {
//       Provider.of<CartState>(context).getCartDatas();
//       Provider.of<CartState>(context).getoldOrders();
//       _isLoding = await Provider.of<ProductState>(context).getProducts();
//       setState(() {});
//     }
//     _init = false;
//     super.didChangeDependencies();
//   }
//     return Container(
      
//     );
//   }
// }



// class Ptr extends StatefulWidget {
  
 

//   @override
//   State<Ptr> createState() => _PtrState();
// }

// class _PtrState extends State<Ptr> {
//     bool _init = true;
//   bool _isLoding = false;

//   @override
//   void didChangeDependencies() async {
//     if (_init) {
//       Provider.of<CartState>(context).getCartDatas();
//       Provider.of<CartState>(context).getoldOrders();
//       _isLoding = await Provider.of<ProductState>(context).getProducts();
//       setState(() {});
//     }
//     _init = false;
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//       final product = Provider.of<ProductState>(context).poducts;
//     return  Scaffold(
//         appBar: AppBar(
//           title: Text("Welcome to Shop"),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed(CartScreens.routeName);
//               },
//               icon: Icon(Icons.shopping_cart),
//             ),
//           ],
//         ),
    
//         body: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio: 3 / 2,
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemCount: product.length,
//           itemBuilder: (ctx, i) => SingleProduct(
//             id: product[i].id,
//             title: product[i].title,
//             image: product[i].image,
//             favorit: product[i].favorit,
//           ),
//         ),
//       );
//   }
// }