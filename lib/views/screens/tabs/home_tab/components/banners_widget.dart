import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/data/models/banners/banner_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/riverpod/providers/category_provider.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/product_list/product_list_screen.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BannerWidget extends StatelessWidget {
  final List<BannerList> bannerList;
  final bool isReverse;

  BannerWidget(this.bannerList, {this.isReverse = true});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          height: context.percentHeight * 15,
          viewportFraction: 1,
          autoPlay: true,
          reverse: isReverse,
        ),
        items: bannerList
            .map((item) => Stack(
                  children: [
                    Container(
                        height: context.percentHeight * 15,
                        width: double.infinity,
                        child: Image.network(
                          item.image!,
                          errorBuilder: (BuildContext _, Object error,
                              StackTrace? stack) {
                            return Container();
                          },
                          fit: BoxFit.cover,
                        )).cornerRadius(10),
                    Column(
                      children: [
                        BannerTextWidget(item.title, "title")
                            .pOnly(top: 20, left: 20),
                        BannerTextWidget(item.description, "description")
                            .visible(item.description!.isNotBlank)
                            .pOnly(top: 10, left: 20),
                        BannerTextWidget(item.linkLabel, "label")
                            .pOnly(top: 5, left: 20),
                      ],
                    )
                  ],
                ).onInkTap(() {
                  if (item.link!.length > 0) {
                    context
                        .read(categoryItemNotifierProvider.notifier)
                        .getCategoryItem(item.link.splitAfter(
                            '.${API.base.split(".").last.split("/").first}'));
                    context.nextPage(ProductListScreen());
                  } else {
                    toast(LocaleKeys.no_offer.tr(), bgColor: kPrimaryColor);
                  }
                }))
            .toList());
  }
}

class BannerTextWidget extends StatelessWidget {
  final String? text;
  final String type;

  BannerTextWidget(this.text, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .60,
      child: Row(
        children: [
          Flexible(
            child: type == "title"
                ? Text(text!,
                    style: context.textTheme.overline!.copyWith(
                      color: kBottomBarUnselectedColor,
                      fontWeight: FontWeight.bold,
                    )).text.uppercase.make()
                : Text(text!,
                    style: context.textTheme.caption!
                        .copyWith(color: kBottomBarUnselectedColor)),
          ),
        ],
      ),
    );
  }
}
