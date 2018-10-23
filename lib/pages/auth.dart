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
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

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

  TextField _buildEmailField() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'E-Mail',
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  TextField _buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
    );
  }

  _onSubmit() {
    print(_emailValue);
    print(_passwordValue);
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
            child: Column(
              children: <Widget>[
                _buildEmailField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildPasswordField(),
                SwitchListTile(
                  value:
                      _acceptTerms, //burası önemli eğer bunu vermezsek tıklayınca durumu değişmiyor.
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
                  title: Text('Kullanım şartlarını kabul ederim.'),
                ),
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
                      onPressed: _onSubmit,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
