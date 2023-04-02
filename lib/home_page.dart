/*
 <Home 탭 구현 페이지>
 23.04.2
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  - 코스페이지로 이동 버튼은 리스트뷰로 만들어진 코스들을 넣어야하지만, 아직 없어서 임의로 버튼으로 넘어가서 gui 구성 먼저 해놓으려고 만들어놨음
*/

import 'package:flutter/material.dart';
import 'package:stamp_front/course_page.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = [
    '강남대학교 코스',
    '청계천 코스',
    '전주 한옥마을 코스',
    '여수밤바다 코스',
    '거제도 해변 코스',
    '대전 엑스포 코스'
  ];

  var imageList = [
    'images/place1',
    'images/place2',
    'images/place3',
    'images/place4',
    'images/place5',
    'images/place6'
  ];

  var description = [
    '- - - -',
    '- - - -',
    '- - - -',
    '- - - -',
    '- - - -',
    '- - - -'
  ];

  void showPopup(context, title, image, description) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffC5C2B3),
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Flexible(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffC5C2B3))),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: double.infinity,
                            color: Color(0xffF6F3E0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0xffC5C2B3))),
                              margin: EdgeInsets.fromLTRB(60, 25, 0, 25),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                margin: EdgeInsets.fromLTRB(7, 10, 10, 0),
                                child: Image(
                                  image: AssetImage('images/user_icon.png'),
                                ),
                              ),
                            ),
                          ),
                          flex: 4),
                      Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: double.infinity,
                            color: Color(0xffF6F3E0),
                            child: Container(
                              color: Color(0xffF6F3E0),
                              margin: EdgeInsets.fromLTRB(30, 30, 50, 30),
                              child: Column(
                                children: [
                                  Flexible(
                                      child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          alignment: Alignment.center,
                                          child: Text('최민성 님')),
                                      flex: 5),
                                  Flexible(
                                      child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          alignment: Alignment.center,
                                          child: Text('270 개')),
                                      flex: 5)
                                ],
                              ),
                            ),
                          ),
                          flex: 6)
                    ],
                  ),
                ),
                flex: 3),
            Flexible(
                child: Container(
                  child: ListView.builder(
                  itemCount: titleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(titleList[index]);
                        showPopup(context, titleList[index], imageList[index],
                            description[index]);
                      },
                      child: Card(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(imageList[index]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    titleList[index],
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                )
            ),
            //버튼은 코스 페이지 gui 확인하기 위해서 만든 버튼임
            Flexible(
                child: ElevatedButton(
                  child: Text('코스페이지로 이동'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => coursepage()),
                    );
                  },
                ),
            flex: 2,)
          ],
        ));
  }
}