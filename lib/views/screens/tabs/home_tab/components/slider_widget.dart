import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/data/models/sliders/slider_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/riverpod/providers/category_provider.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/product_list/product_list_screen.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget(this.sliderList);

  final List<SliderList>? sliderList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          height: context.percentHeight * 25,
          viewportFraction: 1,
          autoPlay: true,
        ),
        items: sliderList!
            .map((item) => Container(
                  width: double.infinity,
                  child: Image.network(
                    item.image!.path!,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      print("Exception: $exception\nStackTrace: $stackTrace");
                      return Container();
                    },
                  ),
                ).cornerRadius(10).onInkTap(() {
                  if (item.link!.length > 0) {
                    context
                        .read(categoryItemNotifierProvider.notifier)
                        .getCategoryItem(item.link);
                    context.nextPage(ProductListScreen());
                  } else {
                    toast(LocaleKeys.no_offer.tr(), bgColor: kPrimaryColor);
                  }
                }))
            .toList());
  }
}
