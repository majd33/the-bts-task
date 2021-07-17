
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthenticationForm extends StatefulWidget{

  final void Function (String email, String password , BuildContext mycontext) _submitFun;
  bool isload;
  void Function() majd;

  AuthenticationForm(this._submitFun, this.isload);
  @override
  _AuthenticationFormState createState() =>_AuthenticationFormState();

}


class _AuthenticationFormState extends State<AuthenticationForm>{

  final _formKey =GlobalKey<FormState>();
  bool _isLog=true;
  String _email= "";
  String _password= "";


  void _submit(){
    final isValid =_formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if(isValid){
      _formKey.currentState.save();
      widget._submitFun(_email.trim(), _password.trim(), context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/black.jpg'),
              fit: BoxFit.cover)),
      child: Center(
        child: Card(
          color:Colors.white.withOpacity(0.85),
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autocorrect: false,
                    enableSuggestions: false,
                    textCapitalization: TextCapitalization.none,
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value)=>_email=value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 8) {
                        return 'password must be at least 8 characters';
                      }
                      return null;
                    },
                    obscureText: true,
                    onSaved: (value)=>_password=value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlineButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child:widget.isload?CircularProgressIndicator():
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 15),
                    ),
                    borderSide:
                    BorderSide(color: Theme.of(context).primaryColor),
                    onPressed: _submit, //_submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
      /*Center(
      child:Card(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.none,
                  key: ValueKey('email'),
                  validator: (value){
                    if(value.isEmpty || !value.contains('@') ){
                      return 'please enter a valid email address';}
                    return null;
                  },
                  onSaved: (value)=>_email=value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  key: ValueKey('password'),
                  validator: (value){
                    if(value.isEmpty || value.length<8){
                      return 'password must be at least 8 characters';}
                    return null;
                  },
                  onSaved: (value)=>_password=value,
                  //keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: 20,),
                if(widget.isload)
                  CircularProgressIndicator(),
                if(!widget.isload)
                  RaisedButton(
                    child: Text(_isLog?'Login':'Sign Up'),
                    onPressed :_submit,),
                FlatButton(
                  onPressed: (){setState(() {
                    _isLog=!_isLog;
                  });},
                  child: Text(_isLog?'Creat a new account': 'I already have an account'),
                  textColor: Theme.of(context).primaryColor,)
              ],
            ),
          ),
        ),
      ),
    );*/
  }

}