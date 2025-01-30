import 'package:appifylabtask/src/config/import/imports.dart';


class FeedScreen extends BaseWidget<NewsFeedController>{
  FeedScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(8.h),
            _buildPostCard(),
            Gap(8.h),
            Obx(()=> ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.newsFeed.length,
                  itemBuilder: (_,index){
                  var post = controller.newsFeed[index];
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

                            // Post Actions
                            Row(
                              children: [
                                Icon(Icons.favorite_border, color: Colors.black),
                                SizedBox(width: 5),
                                Text("${post.likeCount}"),
                                SizedBox(width: 20),
                                Icon(Icons.comment_outlined, color: Colors.black),
                                SizedBox(width: 5),
                                Text("${post.commentCount}"),
                                SizedBox(width: 20),
                                Icon(Icons.share_outlined, color: Colors.black),
                                SizedBox(width: 5),
                                Text("${post.shareCount}"),
                              ],
                            ),

                            // Like and Comment Buttons
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
                                  icon: Icon(Icons.comment_outlined, color: Colors.black),
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
              )),
            Gap(8.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPostCard() {
    return Container(
             padding: EdgeInsets.symmetric(horizontal: 12.w),
             decoration: BoxDecoration(
               border: Border.all(color: Colors.grey.shade300),
               borderRadius: BorderRadius.circular(8.r),
             ),
             width: Get.width.w,
             height: 60.h,
             child: Row(
               children: [
                 // Profile Icon
                 const CircleAvatar(
                   radius: 18,
                   backgroundColor: Colors.grey,
                   child: Icon(Icons.person, color: Colors.white),
                 ),
                 const SizedBox(width: 10),

                 // Text Input
                 Expanded(
                   child: TextField(
                     controller: controller.postEditingController,
                     decoration: const InputDecoration(
                       hintText: "Write Something here...",
                       border: InputBorder.none,
                     ),
                   ),
                 ),

                 // Post Button
               ElevatedButton(
                   onPressed: controller.onTapPost,
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.teal[900],
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5.r),
                     ),
                     foregroundColor: Colors.white,
                     disabledBackgroundColor: Colors.grey.shade300,
                     padding: EdgeInsets.symmetric(horizontal: 16.w),
                   ),
                   child: const Text("Post"),
                 ),
               ],
             ),
           );
  }

}
