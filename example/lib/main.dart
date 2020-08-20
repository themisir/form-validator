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
  final formKey = GlobalKey<FormState>();

  void validate() {
    formKey.currentState.validate();
  }

  void changeLocale(value) {
    setState(() {
      FormValidator.setLocale(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.translate),
            onSelected: changeLocale,
            itemBuilder: (context) => FormValidator.locales.keys
                .map((key) => PopupMenuItem(
                      value: key,
                      child: Text(key.toUpperCase()),
                    ))
                .toList(),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: ValidationBuilder().email().maxLength(50).test,
                decoration: InputDecoration(labelText: 'Email'),
                autovalidate: true,
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: ValidationBuilder().minLength(5).maxLength(50).test,
                decoration: InputDecoration(labelText: 'Name'),
                autovalidate: true,
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: ValidationBuilder().phone().test,
                decoration: InputDecoration(labelText: 'Phone number'),
                autovalidate: true,
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: ValidationBuilder().ip().test,
                decoration: InputDecoration(labelText: 'IPv4 address'),
                autovalidate: true,
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: ValidationBuilder().ipv6().test,
                decoration: InputDecoration(labelText: 'IPv6 address'),
                autovalidate: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: validate,
        tooltip: 'Next',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
