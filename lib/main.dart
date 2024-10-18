import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_project/HomePage.dart';
// import 'package:flutter_bloc_project/counter.dart';
import 'package:flutter_bloc_project/cubit/counter/counter_cubit.dart';
import 'package:flutter_bloc_project/screen/counter_screen.dart';
import 'package:flutter_bloc_project/screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //   return MaterialApp(
    //     home: BlocProvider(
    //       create: (context) => CounterBloc(),
    //       child: Homepage(),
    //     ),
    //   );
    // }
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        // BlocProvider<CounterBloc>(create: (context) => CounterBloc())
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        initialRoute: '/second',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/second': (context) => const CounterScreen(),
        },
      ),
    );
  }
}
