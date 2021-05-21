import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:proto_type_app/screens/healthCheck_Screen.dart';
import 'package:proto_type_app/screens/seniorTalkTalk.dart';
import '../widgets/menuIconWidget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        //leading: Text('이제야'),
        title: //로그인 및 로고
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('이제야'),
            Text('나야나'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                //메인광고
                Container(
                  width: width * .9,
                  child: mainAd(_currentPage, (int increment) {
                    setState(() {
                      _currentPage = increment;
                    });
                  }),
                ),
                SizedBox(
                  height: 40,
                ),
                //메뉴 아이콘들
                Container(
                  width: width * 0.7,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          menuIconWidget(
                            Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            context,
                            '시니어톡톡',
                            SeniorTalkTalkScreen(),
                          ),
                          menuIconWidget(
                            Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            context,
                            '아이콘',
                            Container(),
                          ),
                          menuIconWidget(
                            Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            context,
                            '아이콘',
                            Container(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      menuIconRow(context),
                      SizedBox(
                        height: 20,
                      ),
                      menuIconRow(context),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //원하는 행복거리 검색
                Container(
                  width: width * .9,
                  child: searchingBox(context),
                ),
                SizedBox(
                  height: 40,
                ),
                //건강측정
                Container(
                  width: width * .9,
                  child: healthCheck(context),
                ),
                SizedBox(
                  height: 40,
                ),
                //최신정보
                Container(
                  width: width * .9,
                  child: uptodatedInformation(context),
                ),
                SizedBox(
                  height: 40,
                ),
                //회사정보 및 제휴 문의
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.grey[300],
                  child: companyInformation(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget mainAd(int currenPage, Function(int newValue) addToValue) {
  final List<String> imgList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
  ];

  return //스크롤 광고(오늘의 추천)
      Column(
    children: [
      Container(
        child: CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                addToValue(index);
              }),
          items: imgList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(i));
              },
            );
          }).toList(),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currenPage == index
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ],
  );
}

Widget menuIconRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      menuIconWidget(
        Icon(
          Icons.email,
          color: Colors.black,
        ),
        context,
        '아이콘',
        Container(),
      ),
      menuIconWidget(
        Icon(
          Icons.access_alarms,
          color: Colors.black,
        ),
        context,
        '아이콘',
        Container(),
      ),
      menuIconWidget(
        Icon(
          Icons.calculate,
          color: Colors.black,
        ),
        context,
        '아이콘',
        Container(),
      ),
    ],
  );
}

Widget searchingBox(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '원하는 행복거리를 찾아 보세요.',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 40,
        child: TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              //hintText: '행복을 찾으세요',
              // helperText: 'Keep it short, this is just a demo.',
              // labelText: 'Life story',

              suffixIcon: Icon(Icons.search),
              prefixText: ' ',
              //suffixText: 'USD',
              suffixStyle: const TextStyle(color: Colors.green)),
          onChanged: (text) {
            text = text.toLowerCase();
          },
        ),
      ),
    ],
  );
}

Widget healthCheck(BuildContext context) {
  return Column(
    children: [
      Text(
        '최신정보',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        width: 300,
        height: 55,
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HealthCheckScreen()),
            );
          },
          child: Text(
            '건강측정',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}

Widget uptodatedInformation(BuildContext context) {
  return Column(
    children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            '최신정보',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text('채녈 최신 포스팅')),
          ),
          SizedBox(
            width: 40,
          ),
          Container(
            height: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text('채녈 최신 포스팅')),
          ),
        ],
      )
    ],
  );
}

Widget companyInformation(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('주식회사 리브온'),
      SizedBox(
        height: 10,
      ),
      Text(
          '㈜리브온은 통신판매 중개자로서 통신판매의 당사자가 아니며 서비스 및 상품의 예약, 이용과 환불 등과 관련한 의무와 책임은 각 판매자나 시설에게 있습니다.'),
      Row(
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            child: Text('개인정보 처리방침'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            child: Text('서비스 이용약관'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            child: Text('사업자 정보 확인'),
          ),
        ],
      ),
      Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          child: Text('제휴 문의 (시설/서비스 등록)'),
        ),
      ),
    ],
  );
}
