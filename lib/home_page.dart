/*
 <Home 탭 구현 페이지>
 23.03.30
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  - 코스페이지로 이동 버튼은 리스트뷰로 만들어진 코스들을 넣어야하지만, 아직 없어서 임의로 버튼으로 넘어가서 gui 구성 먼저 해놓으려고 만들어놨음

23.04.02
  - 코스 눌렀을 때 코스 이미지랑 세부 코스 내용 팝업창 뜨게 해놨음.
  - 리스트뷰 -> 그리드뷰로 변경 완
  - 미친 제목이 중간으로 안가요 도와주세요 @의정
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
    'images/place1.jpg',
    'images/place2.jpg',
    'images/place3.jpg',
    'images/place4.jpg',
    'images/place5.jpg',
    'images/place6.png'
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
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      image,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
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
          flex: 1,
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
                ),
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
                              child:
                                  Text('최민성 님', style: TextStyle(fontSize: 20)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child:
                                  Text('270 개', style: TextStyle(fontSize: 20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: titleList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(titleList[index]);
                  showPopup(context, titleList[index], imageList[index],
                      description[index]);
                },
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Image.asset(imageList[index]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                titleList[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        //버튼은 코스 페이지 gui 확인하기 위해서 만든 버튼임
        Container(
          child: ElevatedButton(
            child: Text('코스페이지로 이동'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => coursepage()),
              );
            },
          ),
        )
      ],
    ));
  }
}
