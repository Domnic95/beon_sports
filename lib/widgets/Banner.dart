// ignore_for_file: file_names

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/providers.dart';
import 'Colors.dart';

class BannerView extends ConsumerStatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final void Function()? leadingonTap;

  const BannerView({super.key, this.leadingonTap})
      : preferredSize = const Size.fromHeight(50.0);

  @override
  ConsumerState<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends ConsumerState<BannerView> {
  bool isloading = true;

  fetchBanner() async {
    setState(() {
      isloading = true;
    });
    if (Platform.isAndroid) {
      await ref.read(bannerProvider).getBannerAndroid();
    } else {
      await ref.read(bannerProvider).getBannerIos();
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBanner();
  }

  @override
  Widget build(BuildContext context) {
    final bannerData = ref.read(bannerProvider);
    return isloading
        ? Container(
            height: 80,
            color: Appcolor.primaryColor,
            width: MediaQuery.of(context).size.width,
          )
        : GestureDetector(
            onTap: () {
              if (bannerData.bannerModel.clickurl != "#") {
                launchUrl(Uri.parse(bannerData.bannerModel.clickurl.toString()),
                    mode: LaunchMode.externalApplication);
              }
            },
            child: Container(
              height: 80,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Appcolor.primaryColor,
              ),
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: bannerData.bannerModel.imageurl.toString(),
                placeholder: (context, url) {
                  return const Center(child: CircularProgressIndicator());
                },
                errorWidget: (context, url, error) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
          );
  }
}
