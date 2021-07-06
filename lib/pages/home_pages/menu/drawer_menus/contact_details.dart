import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'package:food_delivery/widgets/custom_button.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({Key key}) : super(key: key);

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  bool isEnabled = false;
  String phoneNumber;
  final _formKey = GlobalKey<FormState>();

  void onSave() {
    DocumentReference ref =
    FirebaseFirestore.instance.collection('users').doc(currentUserUid);
    ref.update({"phoneNum": phoneNumber});
  }

  @override
  void initState() {
    super.initState();
    DocumentReference ref =
    FirebaseFirestore.instance.collection('users').doc(currentUserUid);
    ref.snapshots().first.then((DocumentSnapshot snapshot) {
      var data = snapshot.data();
      setState(() {
        phoneNumber=data["phoneNum"] ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(phoneNumber);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10.0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Contact Details",
          style: TextStyle(
            color: CustomTheme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          enabled: isEnabled,
                          controller: TextEditingController(text: phoneNumber),
                          keyboardType: TextInputType.number,
                          cursorColor: CustomTheme.primaryColor,
                          onChanged: (val) {
                            phoneNumber = val;
                          },
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Number can't be Empty";
                            }
                            if(val.length < 10){
                              return "Number must be 10 digit";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Phone number",
                            hintStyle: CustomTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.primaryColor,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: CustomTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isEnabled = !isEnabled;
                        });
                      },
                      icon: Icon(Icons.edit),
                    )
                  ],
                ),
              ),
              CustomButton(
                  text: "Save",
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      onSave();
                      Navigator.pop(context);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
