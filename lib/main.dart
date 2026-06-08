import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/Features/Data/datasource/product_service.dart';
import 'package:todolist/Features/Data/repo_impl/product_repo_impl.dart';
import 'package:todolist/Features/Presentation/bloc/product_bloc.dart';
import 'package:todolist/Features/Presentation/screens/home.dart';
import 'package:todolist/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductRepoImpl(ProductService())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TuDU',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF0E1423),
          primaryColor: const Color(0xFFF5C13B),
          colorScheme: ColorScheme.dark(
            primary: const Color(0xFFF5C13B),
            secondary: const Color(0xFF5F7CFF),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0E1423),
            foregroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFF19243C),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(color: Color(0xFF8A9BB8)),
          ),
          textTheme: ThemeData.dark().textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
