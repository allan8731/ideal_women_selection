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
  // input:: Map<String, num> idealFigure
  // output:: IdealSelector instance
  IdealSelector test = IdealSelector.getIdealFigure(idealFigure);

  // result output:: [가나다]
  var result = test.idealChecker();
  result;
}

// 1. class IdealSelector
class IdealSelector extends IdealData
    with HeadSizeChecker, HeightChecker, AgeChecker {
  // super class IdealData 에서 메소드와 컨스트럭터 상속
  IdealSelector.getIdealFigure(super.idealFigure) : super.getIdealFigure();

  // 1.1 get womenList
  // 1.2 method
  // 1.2.1 idealChecker
  List<String> idealChecker() {
    // 1.2.1.1 조건을 만족하는 여성의 이름을 저장할 List<String> idealMatchedWomenList
    List<String> idealMatchedWomenList = [];

    // 1.2.1.2 여성의 목록이 존재할때 조건을 각각 비교하는 for 문
    // todo::Uncaught Error: TypeError: Instance of 'JSArray<dynamic>': type 'JSArray<dynamic>' is not a subtype of type 'List<num>’ (headSizeCompare 에 num 과 list 를 넣으면 오류가 나고 num,num,num 을 넣으면 오류가 안난다. 왜 그런지 확인해야함.)
    // womenInformationDetails
    // {name: 가나다, headSize: 50, height: 170, age: 30}
    // {name: 가나다, headSize: 40, height: 180, age: 20}
    // {name: 가나다, headSize: 60, height: 160, age: 40}
    for (final Map<String, dynamic> womanData in womenInformationDetails) {
      //
      // 머리 크기 비교
      if (headSizeCompare(womanData["headSize"], idealHeadSizeDataRange[0],
              idealHeadSizeDataRange[1]) ==
          false) {
        //만족하지 않으면 다음 문장을 읽을 필요없이 넘어간다.
        continue;
      }
      // 키 비교
      if (heightCompare(womanData["height"], idealHeightDataRange[0],
              idealHeightDataRange[1]) ==
          false) {
        //만족하지 않으면 다음 문장을 읽을 필요없이 넘어간다.
        continue;
      }
      // 나이 비교
      if (ageCompare(
              womanData["age"], idealAgeDataRange[0], idealAgeDataRange[1]) ==
          false) {
        //만족하지 않으면 다음 문장을 읽을 필요없이 넘어간다.
        continue;
      }
      //머리크기 비교 &&키 비교 && 나이 비교 를 모두 만족하면 idealMatchedWomenList 에 이름(womenDataKeyList[i])를 추가한다
      idealMatchedWomenList.add(womanData["name"]);
    }
    // 1.2.1.3 idealMatchedWomenList 의 크기가 존재할때(조건을 만족하는 여성이 있을때)
    if (idealMatchedWomenList.isNotEmpty) {
      return idealMatchedWomenList;
    }
    // 1.2.1.4 idealMatchedWomenList 의 크기가 존재하지 않을때(여성의 데이터가 처음부터 없었거나, 조건을 만족하는 여성이 없을때)
    else {
      return ["no data or no women matched :: try to change ideal figures!"];
    }
  }
}

// 2. class IdealData
class IdealData extends WomenData {
  // 2.1 field
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

  // 2.2 constructor
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

  // 2.2 method
  // 2.2.1 getter
  // idealHeadSizeDataRange [ 이상적인 머리 사이즈의 시작, 이상적인 머리사이즈의 끝]
  get idealHeadSizeDataRange => [_idealHeadSizeFrom, _idealHeadSizeTo];

  // idealHeightDataRange [ 이상적인 키의 시작, 이상적인 키의 끝]
  get idealHeightDataRange => [_idealHeightFrom, _idealHeightTo];

  // idealAgeDataRange [ 이상적인 나이의 시작, 이상적인 나이의 끝]
  get idealAgeDataRange => [_idealAgeFrom, _idealAgeTo];
}

// 3. class WomenData
class WomenData {
// 3.1 field
// 3.1.1 List<Map<String,dynamic>> _womenInformationDetails
  static final List<Map<String, dynamic>> _womenInformationDetails = [
    {
      "name": "가나다",
      "headSize": 50,
      "height": 170,
      "age": 30,
    },
    {
      "name": "가나다",
      "headSize": 40,
      "height": 180,
      "age": 20,
    },
    {
      "name": "가나다",
      "headSize": 60,
      "height": 160,
      "age": 40,
    }
  ];

  // 3.2 method
  // 3.2.1 getter
  // 3.2.1.1 get _womenInformationDetails
  get womenInformationDetails => _womenInformationDetails;
}

// 4. mixin HeadSizeChecker
mixin HeadSizeChecker {
  // 4.1 method
  // 4.1.1 headSizeCompare
  // input: num womanFigureHeadSize(여성의 머리사이즈), idealHeadSizeFrom(희망 머리사이즈 최소값),idealHeadSizeTo(희망 머리사이즈 최대값)
  // output: true/false (해당/해당하지않음)
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
  // input: num womanFigureHeight(여성의 키), idealHeightFrom(희망 키 최소값),idealHeightTo(희망 키 최대값)
  // output: true/false (해당/해당하지않음)
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
  // input: num womanFigureAge(여성의 키), idealAgeFrom(희망 키 최소값),idealAgeTo(희망 키 최대값)
  // output: true/false (해당/해당하지않음)
  ageCompare(num womanFigureAge, num idealAgeFrom, num idealAgeTo) =>
      womanFigureAge >= idealAgeFrom && womanFigureAge <= idealAgeTo
          ? true
          : false;
}
//v1