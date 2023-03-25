/*
 <Home 탭 구현 페이지>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  -

*/

import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Flexible(child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xffC5C2B3)
                  )
              ),
              child: Row(
                children: [
                  Flexible(child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: double.infinity,
                    color: Color(0xffF6F3E0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color(0xffC5C2B3)
                          )
                      ),
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
                      flex: 4
                  ),
                  Flexible(child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: double.infinity,
                    color: Color(0xffF6F3E0),
                    child: Container(
                      color: Color(0xffF6F3E0),
                      margin: EdgeInsets.fromLTRB(30, 30, 50, 30),
                      child: Column(
                        children: [
                          Flexible(child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text('최민성 님')
                          ),
                              flex: 5),
                          Flexible(child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text('270 개')
                          ),
                              flex: 5)
                        ],
                      ),
                    ),
                  ),
                      flex: 6
                  )
                ],
              ),
            ),
                flex: 3
            ),
            Flexible(child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xffC5C2B3)
                    )
                ),
                child: Text('여기에 리스트뷰로 코스들 넣기')
            ),
                flex: 7
            )
          ],
        )
    );
  }
}