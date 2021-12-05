import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/data/models/home/entity/news_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNewWidget extends StatelessWidget {
  const BottomNewWidget({
    Key? key, required this.news,
  }) : super(key: key);
  final List<News> news;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView.separated(
        itemCount: news.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_,index){
          return Container(
            height: 280,
            width: Get.width-110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: news[index].previewImage??'',
                    errorWidget: (_,__,___)=>
                        Center(child: Icon(Icons.error_outline,size: 50,color: AppColors.midGrey)),
                    progressIndicatorBuilder: (_,__,___)=>
                        Center(child: CircularProgressIndicator()),
                    height: 150,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            news[index].title??'',
                            style: AppTextStyles.newsTitle
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Text(
                            news[index].fullText??'',
                            style: AppTextStyles.newsBody,
                            maxLines: 3,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Spacer(),
                        Text(
                            '03.12.2021',
                            style: AppTextStyles.newsBody.copyWith(
                                color: AppColors.midGrey)
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_,__)=> const SizedBox(width: 12),
      ),
    );
  }
}
