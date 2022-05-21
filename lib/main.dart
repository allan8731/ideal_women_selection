// 주제
// 소개팅을 회사에서 알란(이름)에게 어떤 이상형을 원하는지 묻습니다.
// 이상형란에는 머리 길이, 키, 나이를 넣으면 당신의 이상형 이름이 나옵니다.
void main() {
  var idealFigure = {
    "원하는키 시작": 160,
    "원하는키 끝": 170,
    "원하는머리둘레 시작": 40,
    "원하는머리둘레 끝": 50,
    "원하는나이 시작": 20,
    "원하는나이 끝": 40
  };
  //input Map<String, num> idealFigure
  var test = SelectIdeal.getIdealFigure(idealFigure);
  //testFigure output:
  //원하는 머리둘레는 40 cm ~ 50 cm
  //원하는 키는 160 cm ~ 170 cm
  //원하는 나이는 20 살 ~ 40 살
  test.testFigureInput();
}

// 1. class SelectIdeal (will extends abstract class IdealWomen )
class SelectIdeal {
  // 1.1 field
  // 1.1.0 원하는 수치의 범위를 받는다.
  // 1.1.1 idealHeadSize get this field from constructor
  var idealHeadSize_from;
  var idealHeadSize_to;

  // 1.1.1 idealHeightCheker get this field from constructor
  var idealHeight_from;
  var idealHeight_to;

  // 1.1.1 idealAge get this field from constructor
  var idealAge_from;
  var idealAge_to;

  // 1.2 constructor(Named Constructor)-> 사용자가 범위를 넣을 때 한글로 추가적인 정보를 전달하고 싶어서 사용한다.
  SelectIdeal.getIdealFigure(Map<String, num> idealFigure)
      // 1.2.1 이상적인 머리크기의 시작 (idealHeadSize_from), 이상적인 머리크기의 끝 (idealHeadSize_to) 를 받는다
      : idealHeadSize_from = idealFigure["원하는머리둘레 시작"],
        idealHeadSize_to = idealFigure["원하는머리둘레 끝"],
        // 1.2.2 이상적인 키의 시작  (idealHeight_from), 이상적인 키의 끝 (idealHeight_to) 를 받는다
        idealHeight_from = idealFigure["원하는키 시작"],
        idealHeight_to = idealFigure["원하는키 끝"],
        // 1.2.3 이상적인 나이의 시작 (idealAge_from), 이상적인 나이의 끝 (idealAge_to) 를 받는다
        idealAge_from = idealFigure["원하는나이 시작"],
        idealAge_to = idealFigure["원하는나이 끝"];

  // 1.2.4 test code
  testFigureInput() {
    print("원하는 머리둘레는 $idealHeadSize_from cm ~ $idealHeadSize_to cm");
    print("원하는 키는 $idealHeight_from cm ~ $idealHeight_to cm");
    print("원하는 나이는 $idealAge_from 살 ~ $idealAge_to 살");
  }

// 1.3 method
// 1.3.1 headSizeChecker -> todo::2 allan 의 선택과 비교를 어떻게 할것인가?-> 더미데이터부터 먼저 완성 필요(특정할수가없다)
// 1.3.2 heightChecker ->
// 1.3.3 ageChecker ->
}

//todo::더미데이터의 완성
/*
 목적 더미데이터의 완성
 1. 어떤 형식의 데이터를 받을것인가 이상형 넣는 형식과 같은 Map<String num> 이 좋을듯.
 2. 1번의 데이터를 List 로 받자 최종 형태는 List<Map<String, num>>이 될것이다.
 3. 예시 작성 시작
    {
      "womenList": [
        {
          "name": "가나다",
          "headSize": 50,
          "height": 170,
          "age": 30
        },
        {
          "name": "라마사",
          "headSize": 40,
          "height": 180,
          "age": 20
        },
        {
          "name": "파차하",
          "headSize": 60,
          "height": 160,
          "age": 40
        }
      ]
    }
  4. import 'package:ideal_women_selection/dummyWomenList.json' as json_map_list
  5. dart pad 가 import 'dart:io';를 지원하지 않으므로 import 형식은 나중으로 미루자. todo:: 완성뒤에 json file import test
  6. 변수에 미리 넣어주자.

*/

// 2. class IdealWomen
// 2.1 field
// 2.1.1 List<Map<String num>> womenList

// 3. class SerializeWomenJsonData
// 3.1 field
// 3.1.1 name
// 3.1.2 age
// 3.1.3 height
// 3.1.4 headSize
// 3.2 method
// 3.2.1 {"name":String "심주연" , "age":int 34 , "headSize": double 50 , "height": double 170}

//4. class IdealChecker

//5. class HeadSizeChecker
//6. class HeightChecker
//7. class AgeChecker
