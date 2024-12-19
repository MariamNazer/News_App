import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/widgets/loading_indecator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsDetails extends StatelessWidget {
  final News news;
  const NewsDetails(this.news, {super.key});
  static const String routeName = "/newsDetails";

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(news.url!);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;

    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover), // Make sure the background fits correctly
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            news.source?.name ?? "",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ??
                        'https://thumbs.dreamstime.com/b/image-not-available-icon-set-default-missing-photo-stock-vector-symbol-black-filled-outlined-style-no-found-white-332183016.jpg',
                    height: height * 0.3,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (_, __) => const LoadingIndecator(),
                    errorWidget: (_, __, ___) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  news.source?.name ?? '',
                  style:
                      titleSmall?.copyWith(color: AppTheme.grey, fontSize: 10),
                ),
                const SizedBox(height: 4),
                Text(
                  news.title ?? '',
                  style: titleSmall?.copyWith(
                      color: AppTheme.grey, fontWeight: FontWeight.w500),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      timeago.format(news.publishedAt!),
                      style: titleSmall?.copyWith(
                          fontSize: 13, color: AppTheme.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            news.content!,
                            style: titleSmall?.copyWith(
                                fontSize: 13,
                                color: AppTheme.descriptionColor,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: height * 0.06),
                          GestureDetector(
                            onTap: () async {
                              await launchUrl(url);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .view_full_article,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: AppTheme.descriptionColor,
                                          fontWeight: FontWeight.w500),
                                ),
                                const Icon(
                                  Icons.arrow_right,
                                  size: 40,
                                  color: AppTheme.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
