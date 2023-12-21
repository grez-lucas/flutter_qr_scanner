import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/services/app_services.dart';
import 'package:qr_scanner/ui/input_decrations.dart';
import 'package:qr_scanner/widgets/app_widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 250,
            ),
            CardContainer(
              child: Column(
                children: [
                  Text("Register",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 30),
                  ChangeNotifierProvider(
                      create: (_) => LoginFormService(),
                      child: _RegisterForm()),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text('¿Ya tienes una cuenta?'),
            MaterialButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              color: Theme.of(context).primaryColor,
              child: Text("Ingresar con cuenta existente",
                  style: Theme.of(context).textTheme.bodyMedium),
            )
          ]),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterFormProvider = Provider.of<LoginFormService>(context);

    return Form(
      key: RegisterFormProvider.formKey,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.emailDecoration(context),
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

            RegExp regExp = RegExp(pattern);

            return regExp.hasMatch(value ?? '')
                ? null
                : 'No es un correo válido';
          },
          onChanged: (value) => RegisterFormProvider.email = value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecorations.passwordDecoration(context),
          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : 'La contraseña debe ser de 6 caracteres';
          },
          onChanged: (value) => RegisterFormProvider.password = value,
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          elevation: 0,
          color: Theme.of(context).primaryColor,
          onPressed: RegisterFormProvider.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus(); // Hide keyboard

                  if (!RegisterFormProvider.isValidForm()) return;

                  RegisterFormProvider.isLoading = true;

                  await Future.delayed(// Simulate a delay
                      const Duration(seconds: 4));

                  RegisterFormProvider.isLoading = false;

                  Navigator.pushReplacementNamed(context, 'home');
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: !RegisterFormProvider.isLoading
                ? const Text("Ingresar", style: TextStyle(color: Colors.white))
                : const SpinKitRotatingCircle(
                    color: Colors.white,
                    size: 25,
                  ),
          ),
        )
      ]),
    );
  }
}
