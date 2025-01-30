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
            _buildPostList(),
            Gap(8.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPostList() {
    return Obx(()=> ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.newsFeed.length,
                itemBuilder: (_,index){
                var post = controller.newsFeed[index];
                  return PostItemCard(
                      post: post,
                      onTapComment: controller.onTapComment,
                      onTapLike: ()=> controller.onTapLike(post.id.toString()),
                  );
                }
            ));
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