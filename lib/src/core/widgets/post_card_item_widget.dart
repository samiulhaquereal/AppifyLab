import 'package:appifylabtask/src/config/import/imports.dart';

class PostItemCard extends StatelessWidget {
  const PostItemCard({
    super.key,
    required this.post,
    required this.onTapLike,
    required this.onTapComment,
  });

  final PostModel post;
  final VoidCallback onTapLike;
  final VoidCallback onTapComment;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(post.user.profilePic),
                ),
               Gap(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.user.fullName, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp)),
                    Text(FormatedDate().formatTime(post.createdAt), style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
            Gap(10.h),
            Text(post.feedTxt, style: TextStyle(fontSize: 14.sp)),
            Gap(10.h),
            post.pic.isNotEmpty && post.pic != null ?CachedNetworkImage(
              imageUrl: post.pic,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ) : SizedBox.shrink(),
            Gap(10.h),
            Row(
              children: [
                Icon(Icons.favorite_border, color: Colors.black),
                Gap(5.w),
                Text("${post.likeCount}"),
                Spacer(),
                Icon(Icons.mode_comment_outlined, color: Colors.black,size: 10.sp,),
                Gap(5.w),
                Text("${post.commentCount}"),
                Gap(5.w),
                Text("Comments"),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.black),
                  label: Text("Like"),
                  onPressed: onTapLike,
                ),
                TextButton.icon(
                  icon: Icon(Icons.mode_comment_rounded, color: Colors.black),
                  label: Text("Comment"),
                  onPressed: onTapComment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}