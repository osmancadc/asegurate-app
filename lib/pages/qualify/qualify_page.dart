import 'package:app_asegurate/pages/qualify/qualify_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:app_asegurate/widgets/menu_drawer.dart';
import 'package:app_tutorial/app_tutorial.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QualifyPage extends StatefulWidget {
  const QualifyPage({Key? key}) : super(key: key);

  @override
  State<QualifyPage> createState() => _QualifyPageState();
}

class _QualifyPageState extends State<QualifyPage> {
  List<TutorialItems> items = [];

  GlobalKey documentKey = GlobalKey();
  GlobalKey nameKey = GlobalKey();
  GlobalKey radioKey = GlobalKey();
  GlobalKey starsKey = GlobalKey();
  GlobalKey commentsKey = GlobalKey();
  GlobalKey sendKey = GlobalKey();

  @override
  void initState() {
    Color backgroundColor = Colors.black26.withOpacity(0.8);

    items.addAll({
      TutorialItems(
        globalKey: documentKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Para calificar a una persona primero necesitas ingresar su número de cédula o celular',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 220,
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
            'Después selecciona si es número de cédula o, por lo contrario, estás consultando un número de nequi o daviplata',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 170,
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
        globalKey: nameKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Luego de completar los dos pasos anteriores, te debería aparecer el nombre de la persona a calificar aquí',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 130,
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
        globalKey: starsKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Acá le puedes dar una calificación de 0 a 5 estrellas',
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
        globalKey: commentsKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Es muy importante que dejes un comentario que sea valioso para los demás usuarios que consulten a esta persona',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 250,
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
        globalKey: sendKey,
        touchScreen: true,
        bottom: 200,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Cuando tengas todo listo, dale al botón de enviar ¡y eso será todo!',
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
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Tutorial.showTutorial(context, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(QualifyController());
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
        child: Column(
          children: [
            _boxIdentification(context),
            _radioButton(context),
            _boxFullName(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.055,
            ),
            _scoreSelector(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            _commentsRating(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            _buttonSend(context),
          ],
        ),
      ),
    );
  }

  Widget _boxIdentification(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textIdentification(context),
          ],
        ),
      ),
    );
  }

  Widget _radioButton(context) {
    QualifyController con = Get.put(QualifyController());
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
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
                    groupValue: con.typeRadio.value,
                    onChanged: (value) {
                      con.typeRadio.value = value as String;
                      con.getFullName();
                    },
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
                    groupValue: con.typeRadio.value,
                    onChanged: (value) {
                      con.typeRadio.value = value as String;
                      con.getFullName();
                    },
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

  Widget _boxFullName(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: 30,
        right: 30,
      ),
      child: Column(
        children: [
          _textName(context),
        ],
      ),
    );
  }

  Widget _scoreSelector(BuildContext context) {
    QualifyController con = Get.put(QualifyController());
    return Container(
      key: starsKey,
      child: RatingBar.builder(
        glow: false,
        unratedColor: Colors.black54,
        itemSize: 45,
        initialRating: 3,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.yellow.shade500,
          size: 100,
          shadows: const [Shadow(color: Colors.white, blurRadius: 20)],
        ),
        onRatingUpdate: (double value) {
          con.scoreValue = (value * 20).round();
        },
      ),
    );
  }

  Widget _commentsRating(context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.16,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textComments(context),
          ],
        ),
      ),
    );
  }

  Widget _textComments(context) {
    QualifyController con = Get.put(QualifyController());
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      key: commentsKey,
      child: TextField(
        maxLines: 5,
        maxLength: 255,
        controller: con.commentsController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Comentarios *',
        ),
      ),
    );
  }

  Widget _buttonSend(BuildContext context) {
    QualifyController con = Get.put(QualifyController());
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
      child: ElevatedButton(
        key: sendKey,
        onPressed: () => con.upload(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: thirdColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: const Text(
          'Enviar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget _textIdentification(context) {
    QualifyController con = Get.put(QualifyController());
    return Container(
      key: documentKey,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: con.objectiveController,
          decoration: const InputDecoration(
            labelText: 'Número de documento o celular *',
            labelStyle: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textName(BuildContext context) {
    QualifyController con = Get.put(QualifyController());
    return Container(
      key: nameKey,
      color: Colors.grey.shade400,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        readOnly: true,
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombre completo',
        ),
      ),
    );
  }
}
