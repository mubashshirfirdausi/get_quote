import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../common/theme/app_theme.dart';
import '../provider/quote_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/animations/custom_rect_tween.dart';

class QuoteDetailsScreen extends StatelessWidget {
  const QuoteDetailsScreen({super.key, required this.quoteId});

  final String quoteId;

  // @override
  @override
  Widget build(BuildContext context) {
    final quote = context.read<QuotesProvider>().findQuoteById(quoteId);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 200.h),
      child: Hero(
        tag: context.read<QuotesProvider>().findQuoteById(quoteId).id,
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin!, end: end!);
        },
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
              padding: kDefaultPadding.copyWith(top: 40, bottom: 40),
              decoration: AppTheme.gradientDecoration.copyWith(borderRadius: BorderRadius.circular(12)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      quote.text ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
                    ),
                    SizedBox(height: 50.h),
                    Text(
                      quote.author ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 12, height: 1.5),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
