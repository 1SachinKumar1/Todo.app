import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  var eMail = TextEditingController();
  var pass = TextEditingController();

  //SignIn fun..
  void signIn() async {
    //show DialogBox

    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    //reading inputs from controller/textFields
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: eMail.text, password: pass.text);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //wrong email
      if (e.code == 'user-not-found') {
        wrongMailMessage();
      }
      //wrong password
      else if (e.code == "wrong_password") {
        wrongPassMessage();
      }
    }
  }

  //fun for wrongEmail
  void wrongMailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple.shade300,
          title: const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text("Incorrect eMail",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        );
      },
    );
  }

  // fun for wrongPass
  void wrongPassMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Incorrect Password"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 30,
              fontWeight: FontWeight.w600),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          elevation: 20,
          shadowColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple.shade400,
          toolbarHeight: 100,
          title: const Text('Log In')),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
          Color(0xffe0c3fc),
          Color(0xffe0c3fc),
        ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_mjlh3hcy.json",
              )),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: eMail,
                  decoration: InputDecoration(
                      hintText: "Please enter your email.",
                      prefixIcon: const Icon(Icons.mail),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        borderSide:
                            BorderSide(color: Colors.purple.shade700, width: 2),
                      )),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      hintText: "Please enter your password.",
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        borderSide:
                            BorderSide(color: Colors.purple.shade700, width: 2),
                      )),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: signIn, child: const Text("Log In")),
              const SizedBox(
                height: 20,
              ),
              const Text("Forgot Password?"),
            ],
          ),
        ),
      ),
    );
  }
}
