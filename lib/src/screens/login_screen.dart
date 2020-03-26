import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25)),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.emailChange,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'User Email',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.passwordChange,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.sumbitValid,
        builder: (context, snapshot) {
          return RaisedButton(
            child: Text('Login'),
            color: Colors.lightGreen,
            onPressed: snapshot.hasData ? bloc.submit : null,
          );
        });
  }
}
