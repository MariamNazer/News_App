import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/news/news_datails.dart';
import 'package:news_app/widgets/loading_indecator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: width * 0.08),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsDatails(news),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
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
            const SizedBox(
              height: 4,
            ),
            Text(
              news.source?.name ?? '',
              style: titleSmall?.copyWith(color: AppTheme.grey, fontSize: 10),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              news.title ?? '',
              style: titleSmall?.copyWith(
                  color: AppTheme.grey, fontWeight: FontWeight.w500),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                timeago.format(news.publishedAt!),
                style: titleSmall?.copyWith(fontSize: 13, color: AppTheme.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
