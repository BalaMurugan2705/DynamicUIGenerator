import 'package:flutter/material.dart';
import 'package:test_app/screens/my_screen1.dart';
import 'package:test_app/screens/my_screen2.dart';

import 'my_screen3.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  ValueNotifier<int> currentTab = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text("My Web"),
        leading: const Icon(Icons.desktop_mac),
      ),
      body: ValueListenableBuilder(
          valueListenable: currentTab,
          builder: (context, int tab, _) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  sideBar(),
                  Expanded(
                      child: tab == 0
                          ? const Screen1()
                          : tab == 1
                              ? const Screen2()
                              : const Screen3())
                ],
              ),
            );
          }),
    );
  }

  sideBar() {
    return ValueListenableBuilder(
        valueListenable: currentTab,
        builder: (context, int tab, _) {
          return Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tab == 0
                            ? Colors.black
                            : Colors.deepPurple, // Background color
                      ),
                      onPressed: () {
                        currentTab.value = 0;
                      },
                      child: const Text(
                        "Screen 1",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tab == 1
                            ? Colors.black
                            : Colors.deepPurple, // Background color
                      ),
                      onPressed: () {
                        currentTab.value = 1;
                      },
                      child: const Text(
                        "Screen 2",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tab == 2
                            ? Colors.black
                            : Colors.deepPurple, // Background color
                      ),
                      onPressed: () {
                        currentTab.value = 2;
                      },
                      child: const Text(
                        "Screen 3",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          );
        });
  }
}
