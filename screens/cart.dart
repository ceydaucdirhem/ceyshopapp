import 'package:animate_do/animate_do.dart';
import 'package:ceyshopapp/screens/placeorder.dart';



import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';



import '../data/app_data.dart';

import '../widget/reuseable_row_for_cart.dart';

import '../main_wrapper.dart';

import '../model/base_model.dart';



import '../widget/reuseable_button.dart';



class Cart extends StatefulWidget {

  const Cart({super.key});



  @override

  State<Cart> createState() => _CartState();

}



class _CartState extends State<Cart> {

  /// toplam fiyat hesaplama

  double calculateTotalPrice() {

    double total = 0.0;

    if (itemsOnCart.isEmpty) {

      total = 0;

    } else {

      for (BaseModel data in itemsOnCart) {

        total = total + (data.price * data.value);

      }
      //kargo ücreti hesaplama
      total +=calculateShipping();

    }

    return total;

  }



  /// Kargo Hesapla

  double calculateShipping() {

    double shipping = 0.0;

    if (itemsOnCart.isEmpty) {

      shipping = 0.0;

      return shipping;

    } else if (itemsOnCart.length <= 4) {

      shipping = 50.00;

      return shipping;

    } else {

      shipping = 50.00;

      return shipping;

    }

  }



  /// Alt Toplam Fiyatı Hesaplayın

  int calculateSubTotalPrice() {

    int subTotal = 0;

    if (itemsOnCart.isEmpty) {

      subTotal = 0;

    } else {

      for (BaseModel data in itemsOnCart) {

        subTotal = subTotal + data.price.round();

        subTotal = subTotal;

      }

    }

    return subTotal < 0 ? 0 : subTotal;

  }



  /// alışveriş sepeti için silme işlevi

  void onDelete(BaseModel data) {

    setState(() {

      if (itemsOnCart.length == 1) {

        itemsOnCart.clear();

      } else {

        itemsOnCart.removeWhere((element) => element.id == data.id);

      }

    });

  }



  @override

  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    var textTheme = Theme.of(context).textTheme;



    return Scaffold(

      appBar: _buildAppBar(context),

      body: SizedBox(

        width: size.width,

        height: size.height,

        child: Stack(

          children: [

            SizedBox(

              width: size.width,

              height: size.height * 0.6,

              child: itemsOnCart.isEmpty

           

                  /// Liste Boş:

                  ? Column(

                      children: [

                        SizedBox(

                          height: size.height * 0.02,

                        ),

                        FadeInUp(

                          delay: const Duration(milliseconds: 200),

                          child: const Image(

                            image: AssetImage("assets/images/empty.png"),

                            fit: BoxFit.cover,

                          ),

                        ),

                        SizedBox(

                          height: size.height * 0.01,

                        ),

                        FadeInUp(

                          delay: const Duration(milliseconds: 250),

                          child: const Text(

                            "Sepetiniz şu anda boş :(",

                            style: TextStyle(

                                fontWeight: FontWeight.w400, fontSize: 16),

                          ),

                        ),

                        FadeInUp(

                          delay: const Duration(milliseconds: 300),

                          child: IconButton(

                            onPressed: () {

                              Navigator.pushReplacement(

                                  context,

                                  MaterialPageRoute(

                                      builder: (context) =>

                                          const MainWrapper()));

                            },

                            icon: const Icon(

                              Icons.shopping_bag_outlined,

                              color: Colors.black,

                            ),

                          ),

                        ),

                      ],

                    )

           

                  /// Liste Boş Değil:

                  : ListView.builder(

                    padding: EdgeInsets.only(bottom: size.height * 0.1),

                      physics: const BouncingScrollPhysics(),

                      itemCount: itemsOnCart.length,

                      itemBuilder: (context, index) {

                        var current = itemsOnCart[index];

                        return Column(

                          children: [

                            FadeInUp(

                              delay: Duration(milliseconds: 100 * index + 80),

                              child: Container(

                                decoration: BoxDecoration(border: Border.all(color: Colors.white)),

                               

                                margin: const EdgeInsets.all(0.15),

                                width: size.width,

                                height: size.height * 0.2,

                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.start,

                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Container(

                                      margin: const EdgeInsets.all(2.0),

                                      decoration: BoxDecoration(

                                        boxShadow: const [

                                          BoxShadow(

                                            offset: Offset(0, 4),

                                            blurRadius: 4,

                                            color: Color.fromARGB(61, 0, 0, 0),

                                          )

                                        ],

                                        image: DecorationImage(

                                            image: AssetImage(current.imageUrl),

                                            fit: BoxFit.cover),

                                      ),

                                      width: size.width * 0.35,

                                      height: size.height * 0.65,

                                    ),

                                    SizedBox(

                                      height: size.height * 0.55,

                                    ),

                                    Padding(

                                      padding:

                                          const EdgeInsets.only(left: 14.0),

                                      child: Column(

                                        crossAxisAlignment:

                                            CrossAxisAlignment.start,

                                        children: [

                                          SizedBox(

                                            child: Row(

                                              mainAxisAlignment:

                                                  MainAxisAlignment

                                                      .spaceBetween,

                                              children: [

                                                Text(

                                                  current.name,

                                                  style: const TextStyle(

                                                      fontSize: 18),

                                                ),

                                                IconButton(

                                                    onPressed: () {

                                                      onDelete(current);

                                                    },

                                                    icon: const Icon(

                                                      Icons.close,

                                                      color: Colors.grey,

                                                    ))

                                              ],

                                            ),

                                          ),

                                          RichText(

                                              text: TextSpan(

                                                  text: "₺",

                                                  style: textTheme.subtitle2

                                                      ?.copyWith(

                                                    fontSize: 22,
                                                    color: const Color.fromARGB(

                                                        255, 247, 128, 168),

                                                    fontWeight: FontWeight.bold,

                                                  ),

                                                  children: [

                                                TextSpan(

                                                  text:

                                                      current.price.toString(),

                                                  style: textTheme.subtitle2

                                                      ?.copyWith(

                                                    fontSize: 17,

                                                    fontWeight: FontWeight.w600,

                                                  ),

                                                )

                                              ])),

                                              SizedBox(height: 10),

                                          Container(

                                            width: size.width * 0.2,

                                            height: size.height * 0.05,

                                            child: Row(

                                              children: [

                                                Container(

                                                  margin:

                                                      const EdgeInsets.all(4.0),

                                                  decoration: BoxDecoration(

                                                    borderRadius:

                                                        BorderRadius.circular(

                                                            10),

                                                    border: Border.all(

                                                        color: Colors.grey),

                                                  ),

                                                  child: InkWell(

                                                    borderRadius:

                                                        BorderRadius.circular(

                                                            10),

                                                    onTap: () {

                                                      setState(() {

                                                        if (current.value > 1) {

                                                          current.value--;

                                                        } else {

                                                          onDelete(current);

                                                          current.value = 1;

                                                        }

                                                      });

                                                    },

                                                    child: const Icon(

                                                      Icons.remove,

                                                      size: 16,

                                                      color: Colors.grey,

                                                    ),

                                                  ),

                                                ),

                                                Padding(

                                                  padding: EdgeInsets.symmetric(

                                                      horizontal:

                                                          size.width * 0.02),

                                                  child: Text(

                                                    current.value.toString(),

                                                    style: textTheme.subtitle2

                                                        ?.copyWith(

                                                      fontSize: 15,

                                                      fontWeight:

                                                          FontWeight.w600,

                                                    ),

                                                  ),

                                                ),

                                                Container(

                                                  decoration: BoxDecoration(

                                                    borderRadius:

                                                        BorderRadius.circular(

                                                            10),

                                                    border: Border.all(

                                                      color: Colors.grey,

                                                    ),

                                                  ),

                                                  child: InkWell(

                                                    borderRadius:

                                                        BorderRadius.circular(

                                                            10),

                                                    onTap: () {

                                                      setState(() {

                                                        current.value >= 0

                                                            ? current.value++

                                                            : null;

                                                      });

                                                    },

                                                    child: const Icon(

                                                      Icons.add,

                                                      size: 16,

                                                      color: Colors.grey,

                                                    ),

                                                  ),

                                                ),

                                              ],

                                            ),

                                          ),

                                        ],

                                      ),

                                    )

                                  ],

                                ),

                              ),

                            ),

                           

                          ],

                        );

                      }),

            ),



            /// Bottom Card

            Positioned(

              bottom: 5,

              child: Container(

                width: size.width,

                height: size.height * 0.40,

                color: Colors.white,

                child: Padding(

                  padding: const EdgeInsets.symmetric(

                      horizontal: 0.25, vertical: 5.0),

                  child: Column(

                    children: [

                      FadeInUp(

                        delay: const Duration(milliseconds: 350),

                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                                  Text(
                                    "Promosyon/Öğrenci Kodu",
                                    style: textTheme.headline3?.copyWith(
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),


                            const Icon(

                              Icons.arrow_forward_ios_sharp,

                              color: Colors.grey,

                            ),

                          ],

                        ),

                      ),

                      SizedBox(

                        height: size.height * 0.01,

                      ),

                      FadeInUp(

                        delay: const Duration(milliseconds: 400),

                        child: ReuseableRowForCart(

                          price: calculateSubTotalPrice().toDouble(),

                          text: 'Alt Toplam',

                        ),

                      ),

                      FadeInUp(

                        delay: const Duration(milliseconds: 450),

                        child: ReuseableRowForCart(

                          price: calculateShipping(),

                          text: 'Kargo ',

                        ),

                      ),

                      const Padding(

                        padding: EdgeInsets.symmetric(vertical: 10.0),

                        child: Divider(),

                      ),

                      FadeInUp(

                        delay: const Duration(milliseconds: 500),

                        child: ReuseableRowForCart(

                          price: calculateTotalPrice(),

                          text: 'Toplam',

                        ),

                      ),

                      FadeInUp(

                        delay: const Duration(milliseconds: 550),

                        child: Padding(

                          padding: const EdgeInsets.symmetric(vertical: 5.0),

                          child: ReuseableButton(

                              text: "Ödeme",

                              onTap: () {

                                Navigator.pushReplacement(

                                    context,

                                    MaterialPageRoute(

                                        builder: (context) => PaymentPage()));

                              }),

                        ),

                      )

                    ],

                  ),

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }



  AppBar _buildAppBar(BuildContext context) {

    return AppBar(

      backgroundColor: Colors.transparent,

      elevation: 0,

      centerTitle: true,

      title: const Text(

        "Sepetim",

        style: TextStyle(

            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),

      ),

      leading: IconButton(

        onPressed: () {

          Navigator.pop(context);

        },

        icon: const Icon(

          Icons.arrow_back_rounded,

          color: Colors.black,

        ),

      ),

      actions: [

        IconButton(

          onPressed: () {},

          icon: const Icon(

            LineIcons.user,

            color: Colors.black,

          ),

        ),

      ],

    );

  }

}

