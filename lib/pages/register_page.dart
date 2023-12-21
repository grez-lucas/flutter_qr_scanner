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
    final loginFormProvider = Provider.of<LoginFormService>(context);

    return Form(
      key: loginFormProvider.formKey,
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
          onChanged: (value) => loginFormProvider.email = value,
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
          onChanged: (value) => loginFormProvider.password = value,
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          elevation: 0,
          color: Theme.of(context).primaryColor,
          onPressed: loginFormProvider.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus(); // Hide keyboard
                  final authService =
                      Provider.of<AuthService>(context, listen: false);

                  if (!loginFormProvider.isValidForm()) return;

                  loginFormProvider.isLoading = true;

                  // Validate if the login is correct
                  final String? errorMessage = await authService.createUser(
                      loginFormProvider.email, loginFormProvider.password);

                  if (errorMessage == null) {
                    // Navigate to home screen
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    // Show error message
                    // NotificationsService.showSnackbar(errorMessage);
                    print(errorMessage);
                  // We dont want the button to be disabled if the login is correct
                  loginFormProvider.isLoading = false;
                  }
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: !loginFormProvider.isLoading
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
