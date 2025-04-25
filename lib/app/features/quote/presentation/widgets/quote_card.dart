import 'package:flutter/material.dart';
import 'package:get_qoute/app/features/settings/presentation/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/animations/custom_rect_tween.dart';
import '../../../../common/animations/hero_dialog_route.dart';
import '../../../../common/theme/app_theme.dart';
import '../../domain/entitiies/qoute_entity.dart';
import '../screens/qoute_details_screen.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.quote,
    required this.onDeletedPressed,
    // required this.animation,
  });

  final Quote quote;
  final void Function() onDeletedPressed;
  // final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: quote.id,
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin!, end: end!);
      },
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(HeroDialogRoute(
            builder: (context) => QuoteDetailsScreen(quoteId: quote.id),
            fullscreenDialog: false,
          )
              // MaterialPageRoute(
              //   builder: (context) => QuoteDetailsScreen(quoteId: quote.id),
              // ),
              ),
          // child:
          // SizeTransition(
          //   key: ValueKey(quote.id),
          //   sizeFactor: animation,
          //   child:
          //   Card(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(12),
          // ),
          child: Consumer<SettingsProvider>(builder: (_, settimgsProvider, __) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: AppTheme.getGradientDecoration(
                      settimgsProvider.themeColor.primaryColor)
                  .copyWith(borderRadius: BorderRadius.circular(12)),
              // height: 200,
              child: ListTile(
                title: Text(
                  quote.text ?? "",
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  "Author: ${quote.author ?? ""}",
                  style: const TextStyle(color: Colors.white),
                  // overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.shade300,
                  ),
                  onPressed: onDeletedPressed,
                ),
              ),
            );
          }),
          //   ),
          // ),
        ),
      ),
    );
  }
}
