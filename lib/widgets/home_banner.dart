// ignore_for_file: file_names

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/providers.dart';

class HomeBanner extends ConsumerStatefulWidget {
  const HomeBanner({super.key});

  @override
  @override
  ConsumerState<HomeBanner> createState() => _BannerViewState();
}

class _BannerViewState extends ConsumerState<HomeBanner> {
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
        ? const Center(child: CircularProgressIndicator())
        : GestureDetector(
            onTap: () {
              if (bannerData.bannerModel.homeclickurl != "#") {
                launchUrl(
                    Uri.parse(bannerData.bannerModel.homeclickurl.toString()),
                    mode: LaunchMode.externalApplication);
              }
            },
            child: CachedNetworkImage(
              imageUrl: bannerData.bannerModel.homeimageurl.toString(),
              placeholder: (context, url) {
                return const Center(child: CircularProgressIndicator());
              },
              errorWidget: (context, url, error) {
                return const Center(child: Icon(Icons.error));
              },
            ),
          );
  }
}
