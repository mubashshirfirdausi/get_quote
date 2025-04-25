import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/settings_button.dart';
import 'package:provider/provider.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../auth/presentations/providers/auth_provider.dart';
import '../provider/quote_provider.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      showWelcomeDialog();
    });
  }

  final listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote App'),
        actions: [
          const SettingsButton(),
          IconButton(
            onPressed: () async {
              try {
                await context.read<AuthProvider>().signOut();
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Consumer<QuotesProvider>(builder: (context, quoteProvider, child) {
              return ElevatedButton(
                onPressed: quoteProvider.isLoading
                    ? null
                    : () async {
                        try {
                          await quoteProvider.getQuote();
                          HapticFeedback.mediumImpact();
                        } catch (e) {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                e.toString(),
                              ),
                            ),
                          );
                        }
                      },
                child: const Text('Get Quote'),
              );
            }),
            Expanded(
              child: Consumer<QuotesProvider>(
                  builder: (context, quoteProvider, child) {
                final quotes = quoteProvider.quotes.reversed.toList();
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: quotes.length,
                  // reverse: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index == 0) SizedBox(height: 20.h),
                        if (quotes.isNotEmpty && index == 0) ...[
                          const Text("Tap on card to show full quote"),
                          const SizedBox(height: 20),
                        ],
                        QuoteCard(
                          quote: quotes[index],
                          onDeletedPressed: () {
                            quoteProvider.deleteQuote(quotes[index].id);
                            HapticFeedback.heavyImpact();
                          },
                          // animation: animation,
                        ),
                        if (index == quotes.length - 1) SizedBox(height: 20.h),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showWelcomeDialog() async {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40.h),
              Image.asset(
                Assets.gif.confetti.path,
                height: 100,
              ),
              SizedBox(height: 20.h),
              const Text(
                "Hey User, Welcome to Quote App",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
