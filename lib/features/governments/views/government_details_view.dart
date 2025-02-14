import 'package:flutter/material.dart';
import 'package:go_egypt_with_firebase/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_firebase/features/governments/models/landmarks_model.dart';
import 'package:go_egypt_with_firebase/features/governments/views/widgets/build_landmark_dialog.dart';
import 'package:go_egypt_with_firebase/features/governments/views/widgets/gorenment_banner_item.dart';
import 'package:go_egypt_with_firebase/features/governments/views/widgets/landmark_card_item.dart';
import 'package:go_egypt_with_firebase/generated/l10n.dart';

class GovernmentDetailsView extends StatelessWidget {
  final String tagName;
  final String image;
  final String arName;

  const GovernmentDetailsView({
    super.key,
    required this.tagName,
    required this.image,
    required this.arName,
  });

  @override
  Widget build(BuildContext context) {
    final filteredLandmarks = LandmarksModel.landmarks
        .where(
          (landmark) => landmark.enGovernorateName == tagName,
        )
        .toList();

    return Scaffold(
      appBar: buildGovernmentsDetailsAppBar(context),
      body: Column(
        children: [
          Hero(
            tag: tagName,
            child: GovernmentBannerItem(image: image),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: filteredLandmarks.length,
              itemBuilder: (context, index) {
                final landmark = filteredLandmarks[index];
                return GestureDetector(
                  onTap: () {
                    buildLandmarkDialog(
                      context,
                      landmark,
                      isCurrentLocaleEnglish() ? tagName : arName,
                    );
                  },
                  child: LandmarkCardItem(landmark: landmark),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildGovernmentsDetailsAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        isCurrentLocaleEnglish()
            ? '$tagName ${S.of(context).landmarks}'
            : '${S.of(context).landmarks} $arName',
      ),
    );
  }
}
