import 'package:app_asegurate/pages/profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils/utils.dart';

class ProfilePageEdit extends StatefulWidget {
  const ProfilePageEdit({Key? key}) : super(key: key);

  @override
  State<ProfilePageEdit> createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  final con = Get.put(ProfilePageEditController());

  @override
  Widget build(BuildContext context) {
    con.getUserInformation().then((value) => setState(() {}));
    // con.getUserInformation();

    return Scaffold(
      backgroundColor: firstColor,
      appBar: AppBar(
        backgroundColor: firstColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: fifthColor,
            size: MediaQuery.of(context).size.width * 0.12,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: textTitle,
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              _userAvatar(context),
              _userFullName(),
              _userDocument(),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _profileSocialImage(context, Image.asset('assets/images/instagram.png')),
                      _profileSocialImage(context, Image.asset('assets/images/facebook.png')),
                      _profileSocialImage(context, Image.asset('assets/images/twitter.png')),
                    ],
                  ),
                  _boxFormEmail(context),
                  _boxFormPhone(context),
                  _buttonProfileEdit(context)
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget _userAvatar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 70, top: 15),
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.26,
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 90.0,
          backgroundImage: con.getAvatar(),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => FractionallySizedBox(
                      heightFactor: 0.35,
                      child: Scaffold(
                        body: con.sourceSelector(context),
                      ),
                    )),
              );
              setState(() {});
            },
            child: Icon(
              Icons.camera_alt,
              color: thirdColor,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _userFullName() {
    return Text(
      (con.user != null) ? formatName(con.user!.name) : '',
      style: TextStyle(
        color: fifthColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _userDocument() {
    return Text(
      con.user != null ? formatDocument(con.user!.document) : '',
      style: TextStyle(
        color: fifthColor,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _profileSocialImage(BuildContext context, Image image) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Padding(padding: const EdgeInsets.all(5.0), child: image),
    );
  }

  Widget _boxFormEmail(context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [_textEmailAddress(context)],
      ),
    );
  }

  Widget _boxFormPhone(context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [_textCellPhone(context)],
      ),
    );
  }

  Widget _textEmailAddress(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Correo Electrónico',
          labelStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        validator: (value) => validateEmail(value),
        autovalidateMode: AutovalidateMode.always,
      ),
    );
  }

  Widget _textCellPhone(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Número de Celular *',
          labelStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        autovalidateMode: AutovalidateMode.always,
        validator: (value) => validatePhone(value),
      ),
    );
  }

  Widget _buttonProfileEdit(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      child: ElevatedButton(
        onPressed: () => con.updateInfo(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: thirdColor,
          padding: EdgeInsets.symmetric(),
        ),
        child: const Text(
          'Actualizar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
