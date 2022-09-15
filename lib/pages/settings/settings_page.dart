import 'package:app_asegurate/pages/settings/settings_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils.dart';

class SettingsPage extends StatelessWidget {
  //TODO: Review this key, flutter says it is necessary
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsPageController());
    return Scaffold(
      backgroundColor: colorSecondary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: colorFontIcon,
            size: MediaQuery.of(context).size.width * 0.12,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: textTitle,
        titleSpacing: 00.3,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _accountText(context, 'Cuenta'),
          _rolTExt(context),
          const SizedBox(
            height: 40,
          ),
          _accountText(context, 'Notificaciones'),
          _radioButton(context),
          _accountText(context, 'Mostrarme Por:'),
          _radioButtonIdentification(context)
        ],
      ),
    );
  }

  Widget _rolTExt(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Vendedor',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          color: colorFont,
        ),
      ),
    );
  }

  Widget _radioButtonIdentification(context) {
    SettingsPageController con = Get.put(SettingsPageController());
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.17,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Obx(() => Radio(
                    value: "identification",
                    groupValue: con.selectedRadioIdentification.value,
                    onChanged: (value2) {
                      con.onChangedRadioIdentification(value2);
                    },
                    activeColor: Colors.blue.shade300,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  )),
              const Text(
                'Cedula',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                    value: "nequi_daviplata",
                    groupValue: con.selectedRadioIdentification.value,
                    onChanged: (value2) {
                      con.onChangedRadioIdentification(value2);
                    },
                    activeColor: Colors.blue.shade300,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  )),
              const Text(
                'Nequi/Daviplata',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _radioButton(context) {
    SettingsPageController con = Get.put(SettingsPageController());

    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.17,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Obx(() => Radio(
                    value: "si",
                    groupValue: con.selectedRadio.value,
                    onChanged: (value) {
                      con.onChangedRadio(value);
                    },
                    activeColor: Colors.blue.shade300,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  )),
              const Text(
                'Si',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                    value: "no",
                    groupValue: con.selectedRadio.value,
                    onChanged: (value) {
                      con.onChangedRadio(value);
                    },
                    activeColor: Colors.blue.shade300,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  )),
              const Text(
                'No',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _accountText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.3,
          bottom: MediaQuery.of(context).size.height * 0.01),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width * 0.06,
          color: colorFont,
        ),
      ),
    );
  }
}
