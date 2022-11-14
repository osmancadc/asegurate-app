import 'package:app_asegurate/models/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

abstract class ResultDialog {
  static show(BuildContext context, String message, bool isError) {
    var icon = isError ? Icons.error : Icons.done_all_sharp;
    var color = isError ? Colors.redAccent.shade700 : Colors.green.shade600;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                icon,
                size: MediaQuery.of(context).size.width * 0.15,
                color: color,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}

abstract class CertificationDialog {
  static show(BuildContext context, String message, bool isCertified) {
    var icon = isCertified ? Icons.done_all_sharp : Icons.warning_amber;
    var color = isCertified ? Colors.green.shade600 : Colors.amber.shade900;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                icon,
                size: MediaQuery.of(context).size.width * 0.15,
                color: color,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}

abstract class LoadingDialog {
  static show(BuildContext context) async {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
            ).blurred(
              colorOpacity: 0.5,
              blur: 8,
              blurColor: secondColor,
              overlay: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                child: LiquidCircularProgressIndicator(
                  value: 0.75,
                  borderColor: fifthColor,
                  borderWidth: 1,
                  backgroundColor: fifthColor,
                  valueColor: AlwaysStoppedAnimation(fourthColor),
                  center: Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
              ),
              // CircularProgressIndicator(color: Colors.white),
            ),
            onWillPop: () async => false,
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop("Discard");
  }
}

abstract class Comments {
  static show(BuildContext context, List<CommentElement> comments) async {
    if (comments.isEmpty) {
      showSnackbar('No se encontraron comentarios para esta persona', true);
      return;
    }

    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
            ).blurred(
              colorOpacity: 0.5,
              blur: 8,
              blurColor: secondColor,
              overlay: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                child: CustomScrollView(
                  slivers: [
                    SliverFixedExtentList(
                      itemExtent: 190,
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index < comments.length) {
                          return Scaffold(
                            backgroundColor: firstColor.withOpacity(0),
                            body: Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: fifthColor,
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  ListTile(
                                      title: Text(comments[index].author),
                                      leading: CircleAvatar(
                                        backgroundImage: (comments[index].photo.isNotEmpty)
                                            ? NetworkImage(comments[index].photo)
                                            : AssetImage('assets/images/male.png') as ImageProvider,
                                      ),
                                      subtitle: Column(
                                        children: [
                                          Text(comments[index].comment),
                                          RatingBar.builder(
                                            ignoreGestures: true,
                                            glow: false,
                                            unratedColor: Colors.black54,
                                            itemSize: 20,
                                            direction: Axis.horizontal,
                                            initialRating: comments[index].score / 20,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.yellow.shade700,
                                              size: 100,
                                              shadows: const [
                                                Shadow(color: Colors.white, blurRadius: 5)
                                              ],
                                            ),
                                            onRatingUpdate: (value) {},
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          );
                        }
                        return null;
                      }),
                    )
                  ],
                ),
              ),
              // CircularProgressIndicator(color: Colors.white),
            ),
            onWillPop: () async => true,
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop("Discard");
  }
}

abstract class TermsAndConditions {
  static show(BuildContext context) async {
    int i = 0;
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
            ).blurred(
              colorOpacity: 0.7,
              blur: 8,
              blurColor: Colors.black,
              overlay: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                child: CustomScrollView(
                  slivers: [
                    SliverFixedExtentList(
                      itemExtent: MediaQuery.of(context).size.height * 0.9,
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (i == 0) {
                          i += 1;
                          return FutureBuilder(
                            future: Future.delayed(Duration(milliseconds: 150)).then((value) {
                              return rootBundle.loadString('assets/privacy_policy.md');
                            }),
                            builder: ((context, snapshot) {
                              if (snapshot.hasData) {
                                return Markdown(
                                  styleSheet: MarkdownStyleSheet(
                                    p: TextStyle(color: Colors.white),
                                    listBullet: TextStyle(color: Colors.white),
                                  ),
                                  data: snapshot.data.toString(),
                                  styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
                                );
                              }
                              return Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.width * 0.4,
                                  child: LiquidCircularProgressIndicator(
                                    value: 0.75,
                                    borderColor: fifthColor,
                                    borderWidth: 1,
                                    backgroundColor: fifthColor,
                                    valueColor: AlwaysStoppedAnimation(fourthColor),
                                    center: Icon(
                                      Icons.admin_panel_settings_outlined,
                                      color: Colors.black,
                                      size: MediaQuery.of(context).size.width * 0.2,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }
                      }),
                    )
                  ],
                ),
              ),
              // CircularProgressIndicator(color: Colors.white),
            ),
            onWillPop: () async => true,
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop("Discard");
  }
}
