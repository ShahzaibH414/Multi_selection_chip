import 'package:flutter/material.dart';
import 'package:multi_chips/widgets/multi_select_chip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Multi Chips'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> list = ['selected1','selected2','selected3','selected4','selected5','selected6','selected7',
    'selected8','selected9','selected10','selected11','selected12','selected13','selected14','selected15',];
  List<String> selectedList = ['selected1','selected2','selected3','selected4','selected5','selected6','selected7',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Multi Select chip for viewing'),
              const SizedBox(height: 10,),
              MultiSelectChip(
                selectedList, list, false,
              ),
              const SizedBox(height: 50,),


              const Text('Multi Select chip for selection'),
              const SizedBox(height: 10,),
              MultiSelectChip(
               list,
                selectedList, true,
                onSelectionChanged: (selectedItems){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
