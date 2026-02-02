import 'package:flutter/material.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';

class WorkshopHeader extends StatelessWidget {
  const WorkshopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.workshop_title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // //TODO 设置
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.settings, color: Colors.white),
          // ),
        ],
      ),
    );
  }
}
