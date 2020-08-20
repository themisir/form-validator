import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _validate() {
    _form.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: ValidationBuilder().email().maxLength(50).build(),
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator:
                    ValidationBuilder().minLength(5).maxLength(50).build(),
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: ValidationBuilder().phone().build(),
                decoration: InputDecoration(labelText: 'Phone number'),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: ValidationBuilder().ip().build(),
                decoration: InputDecoration(labelText: 'IPv4 address'),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: ValidationBuilder().ipv6().build(),
                decoration: InputDecoration(labelText: 'IPv6 address'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validate,
        tooltip: 'Next',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
