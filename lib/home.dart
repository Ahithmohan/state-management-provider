import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/counter_provider.dart';
import 'package:provider_state/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(builder: (context, numberModel, child) {
      return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.grid_view_rounded),
          title: const Text("State Management Demo"),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Second(),
                    ));
              },
              child: Icon(
                Icons.navigate_next,
                size: 40,
              ),
            )
          ],
          backgroundColor: Colors.cyan,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black87,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            numberModel.addNumber();
          },
        ),
        body: Column(
          children: [
            Text("The Total Count is ${numberModel.numbers.last}"),
            Expanded(
              child: ListView.builder(
                itemCount: numberModel.numbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(numberModel.numbers[index].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
