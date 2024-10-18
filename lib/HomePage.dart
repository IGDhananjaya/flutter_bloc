import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/page/second_screen.dart';
import 'package:flutter_bloc_project/page/third_screen.dart';
import 'counter.dart'; // Import CounterBloc from counter.dart

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  late CounterBloc bloc;

  static List<Widget> _screens = <Widget>[
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CounterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Screen 3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CounterBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text(
              "Angka saat ini: ${bloc.counter}",
              style: TextStyle(
                fontSize: 25,
              ),
            );
          },
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                bloc.add('minus');
              },
              icon: Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                bloc.add('add');
              },
              icon: Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}

