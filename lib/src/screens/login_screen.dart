import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            SizedBox(
              height: 10,
            ),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'd@email.com',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
            color: Colors.blue,
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: snapshot.hasData ? bloc.submit : null,
          );
        });
  }
}
