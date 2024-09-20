import 'package:flutter/material.dart';
import 'package:projeto_unitudo_flutter/view/pages/cadastropage.dart';
import 'package:projeto_unitudo_flutter/view/pages/resetsenha.dart';
import 'package:projeto_unitudo_flutter/view/pages/feed.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> loginUser(BuildContext context, String email, String password) async {
  final url = Uri.parse('http://127.0.0.1:8000/api/login/'); 

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    print('Login efetuado com sucesso! User ID: ${responseData['user_id']}');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FeedPage()));
  } else if (response.statusCode == 401) {
    print('Credenciais inválidas!');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed. Please try again.')),
    );
  } else {
    print('Algo deu errado. Tente novamente.');
  }
}

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;

    loginUser(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFA8F4D2),
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset('assets/img.perfil.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                  fontSize: 20),
            ),
            SizedBox(
              height: 40,
              child: TextButton(
                child: const Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetSenha(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFF51C490),
                    Color(0xFF51C490),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  // onPressed: () => {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedPage())),
                  //},
                  onPressed: () => _submitLogin(),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: TextButton(
                child: const Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                onPressed:() =>
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Cadastropage(),
                    ),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
