import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:ceyshopapp/login_signup/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../screens/cart.dart';
import '../screens/home.dart';
import '../screens/search.dart';


class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final int _index = 0;
  bool isSearchActive = false;

  List<Widget> screens = [
    const Home(),
    const Search(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearchActive
            ? FadeIn(
                delay: const Duration(milliseconds: 300),
                child: const Text(
                  "Ara",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )
            : FadeIn(
                delay: const Duration(milliseconds: 300),
              child: const Text(
          "",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
               
              ),
              
        backgroundColor: Colors.white,
        elevation: 0,
       leading: GestureDetector(
        
    onTap: () {
      // Kullanıcı icona tıkladığında yapılacak işlem
     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
    },
    child: const Icon(

      LineIcons.user,
      color: Colors.black,
      size: 30,


    ),
  ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = !isSearchActive;
              });
            },
            icon: isSearchActive
                ? const Icon(
                    LineIcons.searchMinus,
                    color: Colors.black,
                    size: 30,
                  )
                : const Icon(
                    LineIcons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                LineIcons.shoppingBag,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: isSearchActive ? const Search() : const Home(),
      bottomNavigationBar: BottomBarBubble(
        color:const Color.fromARGB(255, 247, 128, 168),
        selectedIndex: _index,
        items: [
          BottomBarItem(iconData: Icons.home),
       
        ],
        onSelect: (index) {},
      ),
    );
  }
}