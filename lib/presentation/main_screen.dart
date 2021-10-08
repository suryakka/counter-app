import 'package:counter_app/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc counterBloc;
  @override
  void initState() {
    counterBloc = BlocProvider.of<CounterBloc>(context);
    counterBloc.add(Reset());
    super.initState();
  }

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterLoaded) {
            value = state.value;
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'input manual value'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    onSubmitted: (value) =>
                        counterBloc.add(Input(int.parse(value))),
                  ),
                ),
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => counterBloc.add(Increment(value)),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(height: 5),
            FloatingActionButton(
              onPressed: () => counterBloc.add(Decrement(value)),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            SizedBox(height: 5),
            FloatingActionButton(
              onPressed: () => counterBloc.add(Reset()),
              tooltip: 'Reset',
              child: Icon(Icons.restore),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
