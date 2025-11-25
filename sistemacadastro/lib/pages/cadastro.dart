import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'Tela de cadastro',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(Icons.app_registration, color: Colors.black, size: 100),
                SizedBox(height: 5),
                TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return "Por favor, insira seu nome de usuário";
                    }
                    if (value.length < 3) {
                      return "Nome inválido, tamanho insuficiente (min: 3)";
                    }
                    if (value.contains("@") == true ||
                        value.contains(".") == true) {
                      return "Nome inválido. Não utilize caracteres especiais";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Nome",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return "Por favor, insira seu e-mail";
                    }
                    if (value.length < 5) {
                      return "E-mail inválido, tamanho insuficiente (min: 5)";
                    }
                    if (value.contains("@") == false ||
                        value.contains(".") == false) {
                      return "E-mail inválido. Formato incorreto";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return "Por favor, insira sua nova senha";
                    }
                    if (value.length < 8) {
                      return "Senha inválida, tamanho insuficiente (min: 8)";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Senha",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5),
                TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return "Por favor, insira sua nova senha";
                    }
                    if (value.length < 8) {
                      return "Senha inválida, tamanho insuficiente (min: 8)";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Confirme a senha",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 15, bottom: 15),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        botaoCadastrar();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  botaoCadastrar() {
    if (_formKey.currentState!.validate()) {
      print("legal");
    }
  }
}
