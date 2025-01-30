import 'package:appifylabtask/src/config/import/imports.dart';

class NewsFeedController extends BaseController{

  TextEditingController postEditingController = TextEditingController();
  RxList<PostModel> newsFeed = <PostModel>[].obs;

  @override
  void onInit() async{
    super.onInit();
    _getNewsFeed();
  }

  void _getNewsFeed()async{
    await dataFetcher(()async{
      Map<String, dynamic>? response = await apiServices.getNewsFeed(tokenType: await prefs.getTokenType(), token: await prefs.getToken());
      if(response?['response'] != null){
        var posts = List<PostModel>.from(response?['response'].map((x) => PostModel.fromJson(x)));
        newsFeed.assignAll(posts);
      }
    }
    );
  }


    void onTapPost(){

  }
}