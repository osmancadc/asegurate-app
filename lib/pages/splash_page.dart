import 'package:app_asegurate/data/authentication_client.dart';
import 'package:flutter/material.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLogin();
    });
  }

  Future<void> _checkLogin() async {
    final token = await _authenticationClient.accessToken;
    if (token.isEmpty) {
      Navigator.pushNamed(context, '/login');
      return;
    } else {
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
