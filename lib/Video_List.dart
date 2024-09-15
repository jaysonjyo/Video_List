import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<String> thumbnail = [
    "assets/v2.jpg",
    "assets/v1.jpg",
    "assets/v3.jpg",
    "assets/v4.jpg",
    "assets/v5.jpg",
    "assets/v6.jpg",
  ];
  List<String> title = [
    "Dark Souls",
    "Dark Ambient",
    "Beauty Skintone cream",
    "Singer New Song",
    "Authentic Thailand",
    "Sport Tips"
  ];
  List<dynamic> views = ["10K ", "50K", "1M", "22K", "1K", "2M"];
  List<dynamic> dureation = ["14:47","00:15 ", "09:54", "12:14", "00:47", "09:27"];
  List<dynamic> type = [
    "Dark soul video ",
    "thrilling",
    "Make up review",
    "inspire song",
    "exploring video",
    "Sports tips and regulations"
  ];
  List<dynamic> video = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
  ];

  TextEditingController searchcontroler = TextEditingController();
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  int curentindex = 0;
  int textindex =0;


  _initializeplay(String videoPath) {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoPath))
          ..initialize().then((_) {
            setState(() {
              chewieController = ChewieController(
                videoPlayerController: videoPlayerController,
                aspectRatio: videoPlayerController.value.aspectRatio,
                autoPlay: true,
                looping: false,
              );
            });
          });
  }

  void changevideo(String videopath, int index) {
    setState(() {
      curentindex = index;
    });
    videoPlayerController.pause();
    videoPlayerController.dispose();
    chewieController?.dispose();
    _initializeplay(videopath);
  }

  @override
  void initState() {
    _initializeplay(video[curentindex]);
    setState(() {
      for(int i=0; i<title.length;i++){
        if(title[i]==curentindex){
          textindex= textindex+1;
        }
      }
    });
    // TODO: implement initState
    super.initState();
  }
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Demo Videos",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              color: Colors.black,
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: chewieController == null
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : Chewie(
                      controller: chewieController!,
        
                    ),
        
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        
                        Text(
                           title[curentindex],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22))),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22),
                                  child: Image.asset("assets/p1.jpg")),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Johan",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "28.5 lakh",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 300,
              height: 50,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey,
              ),
              child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    decorationThickness: 0,
                  ),
                  controller: searchcontroler,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Search",
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              onSubmitted: (value){
                    setState(() {
        
                    });
        
              },onChanged: (value){
                    setState(() {
        
                    });
              },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 520,
              width: double.infinity,
              child: ListView.separated(
                itemCount: thumbnail.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  if(searchcontroler.text.isEmpty || title[index].toLowerCase().contains(searchcontroler.text.toLowerCase())){
                  return Container(
                    height: 130,
                    width: double.infinity,
                    color:curentindex==index? Colors.blue:Colors.grey,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: (){
                                changevideo(video[index], index);
                              },
                              child: Container(
                                width: 140,
                                height: 120,
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7))),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Image.asset(
                                      thumbnail[index],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 100, top: 100),
                              child: Container(
                                width: 35,
                                height: 15,
                                color: Colors.black,
                                child: Center(
                                    child: Text(
                                  dureation[index],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                )),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: 200,
                                  child: Text(
                                    maxLines: 2,
                                    title[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 190,
                                child: Text(
                                  maxLines: 2,
                                  type[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${views[index]} views",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                  }else{
                    return  SizedBox();

                  }
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 5,
                  );
                },
              ),
            ),
             SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
