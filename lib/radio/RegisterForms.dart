import 'package:application_1/main.dart';
import 'package:application_1/radio/Screen2.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class CustomerRegister extends StatefulWidget {
  bool isPassword = false;
  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool flag = true;

  String? password;

  String? email;

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  saveForm() async {
    BuildContext context;
    if (globalKey.currentState!.validate()) {
      globalKey.currentState?.save();
      String result = await Navigator.of(this.context)
          .push(MaterialPageRoute(builder: (context) => Screen2('')));
      print(result);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                } else if (!isEmail(value!)) {
                  return 'Please enter valid email';
                }
              },
              onSaved: (value) {
                this.email = value;
                setEmail(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Email',
                    textScaleFactor: 1.2,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                } else if (value!.length < 6) {
                  return 'Please enter Password more than 6 Charcters';
                }
              },
              onSaved: (value) {
                this.password = value;
                setPassword(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_rounded),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      flag = !flag;
                      setState(() {});
                    },
                    child: Icon(flag
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Password',
                    textScaleFactor: 1.2,
                  )),
              obscureText: flag,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                saveForm();
              },
              child: Text('Save'))
        ],
      ),
    );
  }
}

class MershantRegister extends StatefulWidget {
  bool isPassword = true;
  @override
  State<MershantRegister> createState() => _MershantRegisterState();
}

class _MershantRegisterState extends State<MershantRegister> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool flag = true;

  String? password;
  String? email;
  String? shopName;
  String? shopAddress;
  String? bio;

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  saveForm() async {
    BuildContext context;
    if (globalKey.currentState!.validate()) {
      globalKey.currentState?.save();

      //Navigator.Push
      /*String result = await Navigator.of(this.context)
          .push(MaterialPageRoute(builder: (context) => Screen2()));
      print(result);*/

      //Navigator.PushReplacement Using routes
      //dynamic result = await Navigator.of(this.context).pushNamed('Screen2');
      dynamic result = await Navigator.of(this.context)
          .pushNamed('Screen2', arguments: 'This message from RadioPage');
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                } else if (!isEmail(value!)) {
                  return 'Please enter valid email';
                }
              },
              onSaved: (value) {
                this.email = value;
                setEmail(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Email',
                    textScaleFactor: 1.2,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                } else if (value!.length < 6) {
                  return 'Please enter Password more than 6 Charcters';
                }
              },
              onSaved: (value) {
                this.password = value;
                setPassword(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_rounded),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      flag = !flag;
                      setState(() {});
                    },
                    child: Icon(flag
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Password',
                    textScaleFactor: 1.2,
                  )),
              obscureText: flag,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                }
              },
              onSaved: (value) {
                this.shopName = value;
                setEmail(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.shopping_bag_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Shop Name',
                    textScaleFactor: 1.2,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                }
              },
              onSaved: (value) {
                this.shopAddress = value;
                setEmail(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.shopping_cart_checkout),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Shop Address',
                    textScaleFactor: 1.2,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                }
              },
              onSaved: (value) {
                this.bio = value;
                setEmail(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.design_services_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Bio',
                    textScaleFactor: 1.2,
                  )),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                saveForm();
              },
              child: Text('Save'))
        ],
      ),
    );
  }
}
