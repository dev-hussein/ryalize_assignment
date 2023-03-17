import 'package:flutter/material.dart';
import 'package:ryalize_assignment/constants/app_colors.dart';
import 'package:ryalize_assignment/core/presentation/common_widgets/image_view.dart';
import 'package:ryalize_assignment/features/imdb/domain/entities/movie_data.dart';
import 'package:ryalize_assignment/utils/theming/screen_util.dart';

class ImdbMovieTile extends StatelessWidget {
  final MovieData item;
  const ImdbMovieTile({Key? key , required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorE0E0E0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ImageView(
              path : item.image?.imageUrl ?? '',
              type : ImageType.url,
            width: 70.toWidth,
            height: 100.toHeight,
            fit: BoxFit.cover,
            radius: 10,
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name , style: Theme.of(context).textTheme.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis,),
                Text(item.description , style: Theme.of(context).textTheme.bodyMedium , maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
