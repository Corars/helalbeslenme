import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

/// bazı alanlarda şu ifade geçiyor -->
///
class _AuthState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false,
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.5),
        BlendMode.dstATop,
      ),
      image: AssetImage('assets/images/background.jpg'),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'E-Mail',
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Geçersiz e-mail';
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Şifre giriniz';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildAcceptTerms() {
    return SwitchListTile(
      value: _formData[
          'acceptTerms'], //burası önemli eğer bunu vermezsek tıklayınca durumu değişmiyor.
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Kullanım şartlarını kabul ederim.'),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() && _formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
    //print(_emailValue);
    //print(_passwordValue);
    Navigator.pushReplacementNamed(context, '/producs');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.5, //ekran genişliğine göre alanların genişliği değişsin.
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmailField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordField(),
                    _buildAcceptTerms(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Colors.white,
                          child: Text('Giriş'),
                          onPressed: _submitForm,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text('Öğrenme'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/learn');
                          },
                        ),
                        GestureDetector(
                          //özel widget yapmak istenirse kullanılabilir
                          onTap: _submitForm,
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Özel Giriş',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
