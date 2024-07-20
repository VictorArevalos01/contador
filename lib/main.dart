import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;
  void decrementa() {
      setState(() {
        cont--;
      });

  }

  void incrementa() {
    setState(() {
      cont++;
    });
  }
  bool get vazio => cont == 0;
  bool get cheio => cont >= 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/IMG_3074.jpg'),
              fit: BoxFit.cover,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              cheio ? "Lotado" : 'Pode entrar!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                cont.toString(),
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: vazio ? null : decrementa,
                  style: TextButton.styleFrom(
                      backgroundColor: vazio ? Colors.white.withOpacity(0.2) :Color(0xFF7F2AC6),
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44))),
                  child: Text('Saiu',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                SizedBox(width: 32),
                TextButton(
                    onPressed: cheio ? null : incrementa,
                    style: TextButton.styleFrom(
                        backgroundColor: cheio ? Colors.white.withOpacity(0.2) : Color(0xFF7F2AC6),
                        fixedSize: const Size(100, 100),
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(44))),
                    child: Text("Entrou",
                        style: TextStyle(color: Colors.white, fontSize: 16)))
              ],
            )
          ],
        ),
      ),
    );
  }
}

