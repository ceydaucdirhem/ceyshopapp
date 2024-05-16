import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import '../model/base_model.dart';
import '../utils/constants.dart';
import '../widget/add_to_card.dart';
import '../widget/reuseable_text.dart';
import '../widget/reuseable_button.dart';

class Details extends StatefulWidget {
  const Details({
    required this.data,
    super.key,
    required this.isCameFromMostPopularPart,
  });

  final BaseModel data;
  final bool isCameFromMostPopularPart;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedSize = 3;
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    BaseModel current = widget.data;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Top Image
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  Hero(
                    tag: widget.isCameFromMostPopularPart
                        ? current.imageUrl
                        : current.id,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(current.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: gradient),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// info
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            current.name,
                            style: textTheme.headline3?.copyWith(fontSize: 22),
                          ),
                          ReuseableText(
                            price: current.price,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 252, 111, 200),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(current.star.toString(),
                              style: textTheme.headline5),
                          const SizedBox(
                            width: 8,
                          ),
                          Text("(${current.review.toString()}bin görünüm)",
                              style: textTheme.headline5
                                  ?.copyWith(color: Colors.grey)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

           

            
            /// renk seç
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
                child: Text(
                  "Renk seç",
                  style: textTheme.headline3,
                ),
              ),
            ),

            ///renkler
            FadeInUp(
              delay: const Duration(milliseconds: 700),
              child: SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 1, // Sadece gümüş renk için 1 eleman
                  itemBuilder: (ctx, index) {
                    var current = Colors.grey; // Sadece gümüş renk
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = 0; // Gümüş rengi seçildiğinde index'i 0 yap
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AnimatedContainer(
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                            color: current,
                            border: Border.all(
                              color: selectedColor == 0 ? primaryColor : Colors.transparent,
                              width: selectedColor == 0 ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          duration: const Duration(milliseconds: 200),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            /// sepete ekle butnonu
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: ReuseableButton(
                  text: "Sepete ekle",
                  onTap: () {
                    AddToCart.addToCart(current, context);
                  },
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
      elevation: 0,
      backgroundColor: Colors.transparent,
      
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
           color:Colors.black,
        ),
      ),
      
    );
    
  }
}
