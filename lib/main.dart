// 주제
// 소개팅을 회사에서 알란(이름)에게 어떤 이상형을 원하는지 묻습니다.
// 이상형란에는 머리 길이, 키, 나이를 넣으면 당신의 이상형 이름이 나옵니다.
void main() {
  Map<String, num> idealFigure = {
    "원하는키 시작": 160,
    "원하는키 끝": 170,
    "원하는머리둘레 시작": 40,
    "원하는머리둘레 끝": 50,
    "원하는나이 시작": 20,
    "원하는나이 끝": 40
  };
  //input Map<String, num> idealFigure
  var test = IdealSelect.getIdealFigure(idealFigure);
  //idealFigure Test Part
  test.testFigureInput();
  //testFigure output:
  //원하는 머리둘레는 40 cm ~ 50 cm
  //원하는 키는 160 cm ~ 170 cm
  //원하는 나이는 20 살 ~ 40 살

  //class IdealSelect method Test Part
  test.testIdealSelect();
  //testIdealSelect output:
  // {가나다: {headSize: 50, height: 170, age: 30}, 라마사: {headSize: 40, height: 180, age: 20}, 파차하: {headSize: 60, height: 160, age: 40}}
  // [가나다, 라마사, 파차하]
  // [{headSize: 50, height: 170, age: 30}, {headSize: 40, height: 180, age: 20}, {headSize: 60, height: 160, age: 40}]
}

// 1. class IdealData
class IdealData {
  // 1.1 field
  // 1.1.0 원하는 수치의 범위를 받는다.
  // 1.1.1 idealHeadSize get this field from constructor
  final num? _idealHeadSizeFrom;
  final num? _idealHeadSizeTo;

  // 1.1.1 idealHeightCheker get this field from constructor
  final num? _idealHeightFrom;
  final num? _idealHeightTo;

  // 1.1.1 idealAge get this field from constructor
  final num? _idealAgeFrom;
  final num? _idealAgeTo;

  // 1.2 constructor(Named Constructor)-> 사용자가 범위를 넣을 때 한글로 추가적인 정보를 전달하고 싶어서 사용한다.
  IdealData.getIdealFigure(Map<String, num> idealFigure)
      // 1.2.1 이상적인 머리크기의 시작 (idealHeadSizeFrom), 이상적인 머리크기의 끝 (idealHeadSizeTo) 를 받는다
      : _idealHeadSizeFrom = idealFigure["원하는머리둘레 시작"],
        _idealHeadSizeTo = idealFigure["원하는머리둘레 끝"],
        // 1.2.2 이상적인 키의 시작  (_idealHeightFrom), 이상적인 키의 끝 (_idealHeightTo) 를 받는다
        _idealHeightFrom = idealFigure["원하는키 시작"],
        _idealHeightTo = idealFigure["원하는키 끝"],
        // 1.2.3 이상적인 나이의 시작 (_idealAgeFrom), 이상적인 나이의 끝 (_idealAgeTo) 를 받는다
        _idealAgeFrom = idealFigure["원하는나이 시작"],
        _idealAgeTo = idealFigure["원하는나이 끝"];

  // get IdealData
  // 1.2.4 test code
  testFigureInput() {
    print("원하는 머리둘레는 $_idealHeadSizeFrom cm ~ $_idealHeadSizeTo cm");
    print("원하는 키는 $_idealHeightFrom cm ~ $_idealHeightTo cm");
    print("원하는 나이는 $_idealAgeFrom 살 ~ $_idealAgeTo 살");
  }

// 1.3 method
// todo::여기에서 IdealSelect의 메소드를 불러와서 승부를 봐야한다

//1.3.2
}

/*
 목적 더미데이터의 완성

  1. type Map<String,Map<String,num>>  -> 이름으로 찾을 수 있도록 하는 것이 프로잭트가 커졌을 때 편할 것이다.
  3. 예시 작성 시작
  var womenList =
    {
      "가나다": {
        "headSize": 50,
        "height": 170,
        "age": 30
      },
      "라마사": {
        "headSize": 40,
        "height": 180,
        "age": 20
      },
      "파차하": {
        "headSize": 60,
        "height": 160,
        "age": 40
      }
    }
  4. import 'package:ideal_women_selection/dummyWomenList.json' as json_map_list
  5. dart pad 가 import 'dart:io';를 지원하지 않으므로 import 형식은 나중으로 미루자. todo:: 완성뒤에 json file import test
  6. 변수에 미리 넣어주자.
  7. dummy data 의 형식이 이름으로 찾을 수 있게 바꿔야한다.
  8. 데이터 다루는 법.
      var a= womenList.values.toList();
      var b= womenList.keys.toList();
      print(a[0]);
      print(b[0]);
*/

// 2. class WomenData
mixin WomenData {
// 2.1 field
// 2.1.1 Map<Map<String,num>> womenList
  static final Map<String, Map<String, num>> _womenList = {
    "가나다": {"headSize": 50, "height": 170, "age": 30},
    "라마사": {"headSize": 40, "height": 180, "age": 20},
    "파차하": {"headSize": 60, "height": 160, "age": 40}
  };

  // 2.2 method
  // 2.2.1 getter 지금은 같은 파일이지만 나중에는 달라질것이다 또 womenList는 모든 클레스에서 생긴 인스턴스에서 변하지 않는 값이라 static이다.
  // 2.2.2 모든 데이터 get
  get data => _womenList;

  // 2.2.3 데이터의 key 를 List<String> 으로 get
  get dataKeyList => _womenList.keys.toList();

  // 2.2.4 데이터의 value 를 List<Mpa<String , num>> 으로 get
  get dataValueList => _womenList.values.toList();
}

//4. class IdealSelect
// mixin은 가장 오른쪽에 부른것을 가장 먼저 가져온다. 데이터를 먼저가져오는 것이 이치에 맞다.
class IdealSelect extends IdealData with HeadSizeChecker, HeightChecker, AgeChecker, WomenData {
  //IdealData에서 메소드와 컨스트럭터 상속
  IdealSelect.getIdealFigure(super.idealFigure) : super.getIdealFigure();


  //4.1 get womenList
  //4.2 method

  //4.2.1 test code
  testIdealSelect() {
    print(data.toString());
    print(dataKeyList.toString());
    print(dataValueList.toString());
  }

/*
*  todo::
*  여기에서 womenList 를 탐색하게 될텐데 한번에 하나의 데이터 조각 (예:: womenList["가나다"]) 을 비교하게 되고
*  참/거짓에 따라서 따로 저장해주는 부분이 필요하다.
*/
  //4.2.2 idealChecker
  // 사용할 다른 클레스의 method 목록 ::
  // IdealSelect().dataKeyList,
  // 모든 여성의 이름 목록 List <String>
  // IdealSelect().dataValueList
  // 모든 여성의 세부사항(머리크기,키,나이) 목록 List<Map<String, num>>
  // headSizeCompare,
  // 한명의 여성의 머리크기와 이상형(머리크기) 비교하는 기능
  // heightCompare,
  // 한명의 여성의 키와 이상형(키) 비교하는 기능
  // ageCompare,
  // 한명의 여성의 나이와 이상형(나이) 비교하는 기능.
  //
  //input:
  //output:
  idealChecker() {

  }
}

//5. mixin HeadSizeChecker
mixin HeadSizeChecker {
  //5.1 method
  //5.1.1 headSizeCompare
  //input: 여성(womanFigureHeadSize), 사용자 희망 시작(idealHeadSizeFrom), 끝(idealHeadSizeTo);
  //output: 해당하는지 아닌지 (true/false)
  headSizeCompare(num womanFigureHeadSize, num idealHeadSizeFrom,
          num idealHeadSizeTo) =>
      womanFigureHeadSize >= idealHeadSizeFrom &&
              womanFigureHeadSize <= idealHeadSizeTo
          ? true
          : false;
}
//6. mixin HeightChecker
mixin HeightChecker {
  //6.1 method
  //6.1.1 heightCompare
  //input: 여성(womanFigureHeight), 사용자 희망 시작(idealHeightFrom), 끝(idealHeightSizeTo);
  //output: 해당하는지 아닌지 (true/false)
  heightCompare(
          num womanFigureHeight, num idealHeightFrom, num idealHeightSizeTo) =>
      womanFigureHeight >= idealHeightFrom &&
              womanFigureHeight <= idealHeightSizeTo
          ? true
          : false;
}
//7. mixin AgeChecker
mixin AgeChecker {
  //6.2 method
  //6.2.1 ageCompare
  //input: 여성(womanFigureAge), 사용자 희망 시작(idealAgeFrom), 끝(idealAgeTo);
  //output: 해당하는지 아닌지 (true/false)
  ageCompare(num womanFigureAge, num idealAgeFrom, num idealAgeTo) =>
      womanFigureAge >= idealAgeFrom && womanFigureAge <= idealAgeTo
          ? true
          : false;
}
