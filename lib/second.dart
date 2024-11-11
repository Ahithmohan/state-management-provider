import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/counter_provider.dart';

class Second extends StatefulWidget {
  const Second({
    super.key,
  });

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    final numberProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          numberProvider.addNumber();
        },
      ),
      body: Column(
        children: [
          Text("The Total Count is ${numberProvider.numbers.last}"),
          Expanded(
            child: ListView.builder(
              itemCount: numberProvider.numbers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(numberProvider.numbers[index].toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
