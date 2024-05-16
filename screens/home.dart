import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../screens/details.dart';


import '../model/base_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  final int _currentIndex = 2;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.7);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Üst Metin
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Cey",
                          style: textTheme.headline1?.copyWith(
                               color:const Color.fromARGB(255, 247, 128, 168),
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                          
                          children: [
                            TextSpan(
                              text: "Shop ",
                              style: textTheme.headline1?.copyWith(
                              color:const Color.fromARGB(255, 247, 128, 168),
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),

              

              /// Body Slider
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: Container(
                  margin: const EdgeInsets.only(top: 0),
                  width: size.width,
                  height: size.height * 0.50,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: mainList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(
                                  data: mainList[index],
                                  isCameFromMostPopularPart: false,
                                ),
                              ),
                            );
                          },
                          child: view(index, textTheme, size));
                    },
                  ),
                ),
              ),

              /// En Popüler Metin
              FadeInUp(
                delay: const Duration(milliseconds: 650),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("En Popüler", style: textTheme.headline3),
                      
                    ],
                  ),
                ),
              ),

              /// En Popüler İçerikler
              FadeInUp(
                delay: const Duration(milliseconds: 750),
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: size.width,
                  height: size.height * 0.44,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: mainList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.63),
                      itemBuilder: (context, index) {
                        BaseModel current = mainList[index];
                        return GestureDetector(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  return Details(
                                    data: current,
                                    isCameFromMostPopularPart: true,
                                  );
                                }),
                              )),
                          child: Hero(
                            tag: current.imageUrl,
                            child: Column(
                              children: [
                                Container(
                                  width: size.width * 0.5,
                                  height: size.height * 0.3,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    image: DecorationImage(
                                      image: AssetImage(current.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Color.fromARGB(61, 0, 0, 0),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    current.name,
                                    style: textTheme.headline2,
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "₺",
                                        style: textTheme.subtitle2?.copyWith(
                                          color:const Color.fromARGB(255, 247, 128, 168),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                      TextSpan(
                                        text: current.price.toString(),
                                        style: textTheme.subtitle2?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ])),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// sayfa görünümü
  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0.0;
          if (_pageController.position.haveDimensions) {
            value = index.toDouble() - (_pageController.page ?? 0);
            value = (value * 0.04).clamp(-1, 1);
          }
          return Transform.rotate(
            angle: 3.14 * value,
            child: card(mainList[index], theme, size),
          );
        });
  }

  /// Sayfa görünümü Kartlar
  Widget card(BaseModel data, TextTheme theme, Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Hero(
            tag: data.id,
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                  image: AssetImage(data.imageUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromARGB(61, 0, 0, 0))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              data.name,
              style: theme.headline2,
            ),
          ),
          RichText(
            text: TextSpan(
              text: "₺",
              style: theme.subtitle2?.copyWith(
                 color:const Color.fromARGB(255, 247, 128, 168),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: data.price.toString(),
                  style: theme.subtitle2
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 25),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
