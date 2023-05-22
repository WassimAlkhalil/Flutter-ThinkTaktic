import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/Drawer/drawer.dart';
import 'package:notes/Levels/first_level.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _isPlaying = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'ThinkTaktic',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            SizedBox(
              width: 250,
              height: 250,
              child: Card(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                shadowColor: Colors.white10,
                elevation: 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.addStatusListener(
                          (status) {
                            if (status == AnimationStatus.completed) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FirstLevel(),
                                ),
                              );
                            }
                          },
                        );
                        if (_isPlaying == false) {
                          _controller.forward();
                          _isPlaying = true;
                        }
                      },
                      child: Lottie.asset(
                        'assets/lock.json',
                        width: 200,
                        height: 200,
                        repeat: false,
                        controller: _controller,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
      // DRAWER
      drawer: const MyDrawerScreen(),
    );
  }
}
