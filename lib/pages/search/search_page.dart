import 'package:app_asegurate/data/tutorial_client.dart';
import 'package:app_asegurate/pages/search/search_controller.dart';
import 'package:app_asegurate/widgets/widgets.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:app_tutorial/app_tutorial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  State<ConsultPage> createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  List<TutorialItems> items = [];

  GlobalKey generalKey = GlobalKey();
  GlobalKey inputKey = GlobalKey();
  GlobalKey radioKey = GlobalKey();
  GlobalKey searchKey = GlobalKey();

  @override
  void initState() {
    Color backgroundColor = Colors.black26.withOpacity(0.8);

    items.addAll({
      TutorialItems(
        globalKey: generalKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'En esta página podrás consultar a cualquier persona usando su número de cédula o celular',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          "Toque para continuar",
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      TutorialItems(
        globalKey: inputKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Primero ingresa el número de cédula o celular que deseas consultar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          "Toque para continuar",
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      TutorialItems(
        globalKey: radioKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Selecciona si estás consultando una cédula o una cuenta de nequi/daviplata',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          "Toque para continuar",
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      TutorialItems(
        globalKey: searchKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Por último presiona el botón de buscar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 120,
          )
        ],
        widgetNext: Text(
          "Toque para continuar",
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTutorial(context, items);
    });
  }

  Future<void> _showTutorial(BuildContext context, List<TutorialItems> items) async {
    TutorialClient _tutorialClient = GetIt.instance<TutorialClient>();

    final alreadyShowed = await _tutorialClient.viewedSearch;

    if (!alreadyShowed) {
      Tutorial.showTutorial(context, items);
      await _tutorialClient.saveState('VIEWED_SEARCH');
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ConsultController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: fifthColor,
              size: MediaQuery.of(context).size.width * 0.12,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: textTitle,
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      drawer: MenuDrawer().menuDrawer(context),
      backgroundColor: firstColor,
      body: SingleChildScrollView(
        child: Column(children: [
          _consultTitle(context),
          _boxForm(context),
          _radioButton(context),
          _buttonSearch(context),
        ]),
      ),
    );
  }

  Widget _consultTitle(context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Text(
        'CONSULTAR UNA PERSONA',
        key: generalKey,
        style: TextStyle(
          fontFamily: 'TradeGothicInline',
          color: fifthColor,
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [_textIdentification(context)],
      ),
    );
  }

  Widget _textIdentification(context) {
    ConsultController con = Get.put(ConsultController());

    return Container(
      key: inputKey,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: con.identificationValue,
        validator: (value) => con.validateInput(value),
        autovalidateMode: AutovalidateMode.always,
        decoration: const InputDecoration(
          labelText: 'Número de documento o celular',
          labelStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _radioButton(context) {
    ConsultController con = Get.put(ConsultController());
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
        left: MediaQuery.of(context).size.width * 0.2,
        right: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Column(
        key: radioKey,
        children: [
          Row(
            children: [
              Obx(() => Radio(
                    value: "CC",
                    groupValue: con.selectedRadio.value,
                    onChanged: (value) => con.selectedRadio.value = value as String,
                    activeColor: Colors.blue.shade300,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  )),
              const Text(
                'Cédula de Ciudadanía',
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
                    value: "PHONE",
                    groupValue: con.selectedRadio.value,
                    onChanged: (value) => con.selectedRadio.value = value as String,
                    activeColor: Colors.blue.shade300,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  )),
              const Text(
                'Nequi o Daviplata',
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

  Widget _buttonSearch(BuildContext context) {
    ConsultController con = Get.put(ConsultController());
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ElevatedButton(
        key: searchKey,
        onPressed: () => con.consult(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: thirdColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Buscar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
