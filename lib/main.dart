// 주제
// 소개팅을 회사에서 알란(이름)에게 어떤 이상형을 원하는지 묻습니다.
// 이상형란에는 머리 길이, 키, 나이를 넣으면 당신의 이상형 이름이 나옵니다.
void main() {
  final Map<String, num> idealFigure = {
    "원하는키 시작": 160,
    "원하는키 끝": 170,
    "원하는머리둘레 시작": 40,
    "원하는머리둘레 끝": 50,
    "원하는나이 시작": 20,
    "원하는나이 끝": 40
  };
  // input Map<String, num> idealFigure
  // output IdealSelector instance
  IdealSelector test = IdealSelector.getIdealFigure(idealFigure);
  // idealFigure Test Part
  // test.testFigureInput();
  // testFigure output::
  // 원하는 머리둘레는 40 cm ~ 50 cm
  // 원하는 키는 160 cm ~ 170 cm
  // 원하는 나이는 20 살 ~ 40 살

  // class IdealSelector method Test Part
  test.testIdealSelector();
  // testIdealSelector output::
  // {가나다: {headSize: 50, height: 170, age: 30}, 라마사: {headSize: 40, height: 180, age: 20}, 파차하: {headSize: 60, height: 160, age: 40}}
  // [가나다, 라마사, 파차하]
  // [{headSize: 50, height: 170, age: 30}, {headSize: 40, height: 180, age: 20}, {headSize: 60, height: 160, age: 40}]

  test.testDataRangeGet();
  // testDataRangeGet output::
  // [40, 50]
  // [160, 170]
  // [20, 40]

  test.idealChecker();
  // output:: 가나다
}

// 1. class IdealSelector
// mixin은 가장 오른쪽에 부른것을 가장 먼저 가져온다. 데이터를 먼저가져오는 것이 이치에 맞다.
class IdealSelector extends IdealData
    with HeadSizeChecker, HeightChecker, AgeChecker {
  // super class IdealData에서 메소드와 컨스트럭터 상속
  IdealSelector.getIdealFigure(super.idealFigure) : super.getIdealFigure();

  // 1.1 get womenList
  // 1.2 method

  // 1.2.1 test code
  testIdealSelector() {
    print(womenData.toString());
    print(womenDataKeyList.toString());
    print(womenDataValueList.toString());
  }

  testDataRangeGet() {
    print(idealHeadSizeDataRange.toString());
    print(idealHeightDataRange.toString());
    print(idealAgeDataRange.toString());
  }

/*
*  여기에서 womenList 를 탐색하게 될텐데 한번에 하나의 데이터 조각 (예:: womenList["가나다"]) 을 비교하게 되고
*  참/거짓에 따라서 따로 저장해주는 부분이 필요하다.
*/
  // 1.2.2 idealChecker
  void idealChecker() {
    // 사용할 다른 클레스의 method 목록 ::
    // womenDataKeyList,
    // 모든 여성의 이름 목록 List <String>
    // womenDataValueList
    // 모든 여성의 세부사항(머리크기,키,나이) 목록 List<Map<String, num>>
    // idealHeadSizeDataRange,
    // 사용자의 희망 머리 크기 받아오는 getter output:List<num>
    // idealHeightDataRange
    // 사용자의 희망 키 받아오는 getter output:List<num>
    // idealAgeDataRange
    // 사용자의 희망 나이 받아오는 getter output:List<num>
    // headSizeCompare,
    // 한명의 여성의 머리크기와 이상형(머리크기) 비교하는 기능
    // heightCompare,
    // 한명의 여성의 키와 이상형(키) 비교하는 기능
    // ageCompare,
    // 한명의 여성의 나이와 이상형(나이) 비교하는 기능.

    // 1.2.2.1 조건을 만족하는 여성의 이름을 저장할 List<String> idealMatchedWomenList
    List<String> idealMatchedWomenList = [];

    // 1.2.2.2 여성의 목록이 존재할때 조건을 각각 비교하는 for문
    // todo::Uncaught Error: TypeError: Instance of 'JSArray<dynamic>': type 'JSArray<dynamic>' is not a subtype of type 'List<num>’
    // headSizeCompare에 num 과 list 를 넣으면 오류가 나고 num,num,num을 넣으면 오류가 안난다. 왜 그런지 확인해야함.
    for (final womanData in womenData.entries) {
      // womanData
      // MapEntry(가나다: {headSize: 50, height: 170, age: 30})
      // MapEntry(라마사: {headSize: 40, height: 180, age: 20})
      // MapEntry(파차하: {headSize: 60, height: 160, age: 40})
      // 머리 크기 비교
      if (headSizeCompare(womanData.value["headSize"],
              idealHeadSizeDataRange[0], idealHeadSizeDataRange[1]) ==
          false) {
        //만족하지 않으면 다음 문장을 읽을 필요없이 넘어간다.
        continue;
      }
      // 키 비교
      if (heightCompare(womanData.value["height"], idealHeightDataRange[0],
              idealHeightDataRange[1]) ==
          false) {
        //만족하지 않으면 다음 문장을 읽을 필요없이 넘어간다.
        continue;
      }
      // 나이 비교
      if (ageCompare(womanData.value["age"], idealAgeDataRange[0],
              idealAgeDataRange[1]) ==
          false) {
        //만족하지 않으면 다음 문장을 읽을 필요없이 넘어간다.
        continue;
      }
      //머리크기 비교 &&키 비교 && 나이 비교 를 모두 만족하면 idealMatchedWomenList에 이름(womenDataKeyList[i])를 추가한다
      idealMatchedWomenList.add(womanData.key);
    }
    // 1.2.2.3 idealMatchedWomenList의 크기가 존재할때(조건을 만족하는 여성이 있을때)
    if (idealMatchedWomenList.isNotEmpty) {
      //결과값을 프린트한다.
      for (var x in idealMatchedWomenList) {
        print(x);
      }
    }
    // 1.2.2.4 idealMatchedWomenList의 크기가 존재하지 않을때(여성의 데이터가 처음부터 없었거나, 조건을 만족하는 여성이 없을때)
    else {
      print("no data or no women matched :: try to change ideal figures!");
    }
  }
}

// 2. class IdealData
class IdealData extends WomenData {
  // 2.1 field
  // 원하는 이상적 수치의 범위를 받는다.
  // 2.1.1 getIdealFigure get those fields from constructor(named)
  // 2.1.2 _idealHeadSizeFrom(이상적인 머리크기의 시작)
  final num? _idealHeadSizeFrom;

  // 2.1.3 _idealHeadSizeTo(이상적인 머리크기의 끝)
  final num? _idealHeadSizeTo;

  // 2.1.4 _idealHeightFrom(이상적인 키의 시작)
  final num? _idealHeightFrom;

  // 2.1.5 _idealHeightTo(이상적인 키의 끝)
  final num? _idealHeightTo;

  // 2.1.6 _idealAgeFrom(이상적인 나이의 시작)
  final num? _idealAgeFrom;

  // 2.1.7 _idealAgeTo(이상적인 나이의 끝)
  final num? _idealAgeTo;

  // 2.2 constructor(Named Constructor)-> 사용자가 범위를 넣을 때 사용자에게 한글로 추가적인 정보를 전달하고 싶어서 사용한다.
  IdealData.getIdealFigure(Map<String, num> idealFigure)
      // 2.2.1 이상적인 머리크기의 시작 (idealHeadSizeFrom),
      : _idealHeadSizeFrom = idealFigure["원하는머리둘레 시작"],
        // 이상적인 머리크기의 끝 (idealHeadSizeTo) 를 받는다
        _idealHeadSizeTo = idealFigure["원하는머리둘레 끝"],
        // 2.2.2 이상적인 키의 시작  (_idealHeightFrom),
        _idealHeightTo = idealFigure["원하는키 끝"],
        // 이상적인 키의 끝 (_idealHeightTo) 를 받는다
        _idealHeightFrom = idealFigure["원하는키 시작"],
        // 2.2.3 이상적인 나이의 시작 (_idealAgeFrom),
        _idealAgeFrom = idealFigure["원하는나이 시작"],
        // 이상적인 나이의 끝 (_idealAgeTo) 를 받는다
        _idealAgeTo = idealFigure["원하는나이 끝"];

  // 2.2.4 constructor test code
  testFigureInput() {
    print("원하는 머리둘레는 $_idealHeadSizeFrom cm ~ $_idealHeadSizeTo cm");
    print("원하는 키는 $_idealHeightFrom cm ~ $_idealHeightTo cm");
    print("원하는 나이는 $_idealAgeFrom 살 ~ $_idealAgeTo 살");
  }

  // 2.3 method
  // 2.3.1 getter
  // idealHeadSizeDataRange [ 이상적인 머리 사이즈의 시작, 이상적인 머리사이즈의 끝]
  get idealHeadSizeDataRange => [_idealHeadSizeFrom, _idealHeadSizeTo];

  // idealHeightDataRange [ 이상적인 키의 시작, 이상적인 키의 끝]
  get idealHeightDataRange => [_idealHeightFrom, _idealHeightTo];

  // idealAgeDataRange [ 이상적인 나이의 시작, 이상적인 나이의 끝]
  get idealAgeDataRange => [_idealAgeFrom, _idealAgeTo];
}

/*
 목적 더미데이터의 완성

  1. type Map<String,Map<String,num>>  -> 이름으로 찾을 수 있도록 하는 것이 프로잭트가 커졌을 때 편할 것이다.
  3. 예시 작성 시작
  //todo:: 만약 여성의 정보가 부족해서 null일때의 상황을 고려해야한다.
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

// 3. class WomenData
class WomenData {
// 3.1 field
// 3.1.1 Map<Map<String,num>> womenList
  static final Map<String, Map<String, num>> _womenList = {
    "가나다": {"headSize": 50, "height": 170, "age": 30},
    "라마사": {"headSize": 40, "height": 180, "age": 20},
    "파차하": {"headSize": 60, "height": 160, "age": 40}
  };

  // 3.2 method
  // 3.2.1 getter 지금은 같은 파일이지만 나중에는 달라질것이다 또 womenList는 모든 클레스에서 생긴 인스턴스에서 변하지 않는 값이라 static이다.
  // 3.2.2 모든 _womenList get
  get womenData => _womenList;

  // 3.2.3 _womenList 의 key 를 List<String> 으로 get
  get womenDataKeyList => _womenList.keys.toList(growable: false);

  // 3.2.4 _womenList 의 value 를 List<Mpa<String , num>> 으로 get
  get womenDataValueList => _womenList.values.toList(growable: false);
}

// 4. mixin HeadSizeChecker
mixin HeadSizeChecker {
  // 4.1 method
  // 4.1.1 headSizeCompare
  // input: 여성(num womanFigureHeadSize), 사용자 희망 시작 끝(idealHeadSizeFrom,idealHeadSizeTo)
  // output: 해당하는지 아닌지 (true/false)
  bool headSizeCompare(num womanFigureHeadSize, num idealHeadSizeFrom,
          num idealHeadSizeTo) =>
      womanFigureHeadSize >= idealHeadSizeFrom &&
              womanFigureHeadSize <= idealHeadSizeTo
          ? true
          : false;
}

// 5. mixin HeightChecker
mixin HeightChecker {
  // 5.1 method
  // 5.1.1 heightCompare
  // input: 여성(womanFigureHeight), 사용자 희망 시작 끝(idealHeightFrom,idealHeightTo)
  // output: 해당하는지 아닌지 (true/false)
  heightCompare(
          num womanFigureHeight, num idealHeightFrom, num idealHeightTo) =>
      womanFigureHeight >= idealHeightFrom && womanFigureHeight <= idealHeightTo
          ? true
          : false;
}

// 6. mixin AgeChecker
mixin AgeChecker {
  // 6.2 method
  // 6.2.1 ageCompare
  // input: 여성(womanFigureAge), 사용자 희망 시작 끝(idealAgeFrom,idealAgeTo)
  // output: 해당하는지 아닌지 (true/false)
  ageCompare(num womanFigureAge, num idealAgeFrom, num idealAgeTo) =>
      womanFigureAge >= idealAgeFrom && womanFigureAge <= idealAgeTo
          ? true
          : false;
}
