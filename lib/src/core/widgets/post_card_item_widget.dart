import 'package:appifylabtask/src/config/import/imports.dart';

class PostItemCard extends StatelessWidget {
  const PostItemCard({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(post.user.profilePic),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.user.fullName, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(FormatedDate().formatTime(post.createdAt), style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
            SizedBox(height: 10),

            // Post Text
            Text(post.feedTxt, style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            post.pic.isNotEmpty && post.pic != null ?CachedNetworkImage(
              imageUrl: post.pic,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ) : SizedBox.shrink(),
            SizedBox(height: 10),

            // Post Actions
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
                  onPressed: () {},
                ),
                TextButton.icon(
                  icon: Icon(Icons.mode_comment_rounded, color: Colors.black),
                  label: Text("Comment"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}