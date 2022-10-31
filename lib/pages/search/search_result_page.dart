import 'package:app_asegurate/pages/search/search_result_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:app_asegurate/widgets/menu_drawer.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:app_tutorial/app_tutorial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blur/blur.dart';

class ConsultPageResult extends StatefulWidget {
  const ConsultPageResult({Key? key}) : super(key: key);

  @override
  State<ConsultPageResult> createState() => _ConsultPageResultState();
}

class _ConsultPageResultState extends State<ConsultPageResult> {
  final DetailpageController con = Get.put(DetailpageController());
  List<TutorialItems> items = [];

  GlobalKey generalKey = GlobalKey();
  GlobalKey reputationKey = GlobalKey();
  GlobalKey scoreKey = GlobalKey();
  GlobalKey cetificationKey = GlobalKey();

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
            'Cuanto consultes a una persona, podrás ver sus datos personales  y una calificación otorgada de 1 a 5 estrellas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
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
        globalKey: reputationKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'La reputación es calculada tomando en cuenta los datos como antecedentes penales, procesos judiciales y su reputación en plataformas como MercadoLibre',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 350,
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
        globalKey: scoreKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'La calificación es calculada teniendo en cuenta los diferentes comentarios y puntuaciones dejados por otros usuarios dentro de la plataforma',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 350,
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
        globalKey: cetificationKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'En caso de que la persona se encuentre certificada como confiable, acá aparecerá un sello de certificación',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 350,
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
        globalKey: scoreKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Si deseas ver los comentarios dados por otras personas, puedes presionar sobre la caja de color',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 350,
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
      con.showCertificationMessage(context);
      con.loadComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
            child: Stack(children: [
              _backgroundImage(context),
              Column(
                children: [
                  _personPhoto(context),
                  _personName(),
                  SizedBox(height: 5),
                  _personDocument(),
                  SizedBox(height: 5),
                  SizedBox(height: 5),
                  _ratingBar(),
                  _badgeCertified(context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _reputation(context),
                  _score(context),
                ],
              ),
            ]),
          ),
        ));
  }

  Widget _backgroundImage(BuildContext context) {
    return SizedBox(
      key: generalKey,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.47,
      child: con.photo.value == ''
          ? Image.asset('assets/images/${con.gender.value}.png', fit: BoxFit.cover)
              .blurred(colorOpacity: 0.7, blur: 8, blurColor: Colors.black12)
          : Image.network(con.photo.value, fit: BoxFit.cover)
              .blurred(colorOpacity: 0.7, blur: 8, blurColor: Colors.black12),
    );
  }

  Widget _personPhoto(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 70, top: 15),
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.26,
      child: CircleAvatar(
        backgroundImage: con.photo.value == ''
            ? AssetImage('assets/images/${con.gender.value}.png') as ImageProvider
            : NetworkImage(con.photo.value),
      ),
    );
  }

  Widget _personName() {
    return con.name.value == ''
        ? Container()
        : Container(
            margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).size.height * 0.02),
            child: Text(
              con.name.value,
              style:
                  const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          );
  }

  Widget _personDocument() {
    return con.document.value == ''
        ? Container()
        : Text(
            formatDocument(con.document.value),
            style: TextStyle(
              color: fifthColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          );
  }

  Widget _ratingBar() {
    return RatingBar.builder(
      initialRating: con.stars.value == 0 ? 0 : con.stars.value.toDouble(),
      itemSize: 40.0,
      minRating: 0,
      ignoreGestures: true,
      direction: Axis.horizontal,
      allowHalfRating: false,
      unratedColor: Colors.white70,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      onRatingUpdate: (value2) {},
    );
  }

  Widget _reputation(BuildContext context) {
    final reputation = con.reputation.value;
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 1.05),
        child: const Text(
          'Reputación',
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.02,
      ),
      Stack(key: reputationKey, children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: con.getColorScale(reputation),
          ),
          width: 70,
          height: 70,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            reputation.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
          ),
        ),
      ]),
    ]);
  }

  Widget _score(BuildContext context) {
    final score = con.score.value;
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 1.05),
        child: const Text(
          'Calificación',
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.02,
      ),
      GestureDetector(
        key: scoreKey,
        onTap: (() => con.showComments(context)),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: con.getColorScale(score),
            ),
            width: 70,
            height: 70,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              score.toString(),
              style:
                  const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
      )
    ]);
  }

  Widget _badgeCertified(BuildContext context) {
    return Container(
      key: cetificationKey,
      margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).size.height * 0.06),
      child: con.certified.value
          ? Image.asset('assets/images/certified.png', width: 500, height: 320)
          : null,
    );
  }
}
