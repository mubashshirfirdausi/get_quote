import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../quote/presentation/widgets/theme_button.dart';
import 'package:provider/provider.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../common/constants/size_constants.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        actions: const [
          ThemeButton(),
        ],
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: Center(
          child:
              Consumer<AuthProvider>(builder: (context, authProvider, child) {
            return ElevatedButton.icon(
              onPressed: authProvider.isLoading
                  ? null
                  : () async {
                      try {
                        await context.read<AuthProvider>().signInWithGoogle();
                      } catch (e) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    },
              icon: SvgPicture.asset(Assets.icons.googleIcon),
              label: const Text("Sign in with Google"),
            );
          }),
        ),
      ),
    );
  }
}
