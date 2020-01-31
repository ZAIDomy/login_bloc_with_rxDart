import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of<Bloc>(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
         emailField(bloc),
         passwordField(bloc),
         Container(margin: EdgeInsets.only(top: 25.0),),
         submitField(bloc)
        ],
      ),
    );
  }

  Widget  emailField(Bloc bloc){

    return  StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
          return  TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email',
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail,
          );
      },
    );

  }

  Widget  passwordField(Bloc bloc){

    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snapshot){
          return  TextField(
            obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            hintText: '**********',
            errorText: snapshot.error
          ),
          onChanged: bloc.changePassword,
        );
      },
    );

  }

  Widget  submitField(Bloc bloc){

    return  StreamBuilder(
      stream: bloc.submitValid,
      builder: (context,snapshot){
        return  RaisedButton(
            child: Text('login'),
            color: Colors.blue,
            onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );

  }







}