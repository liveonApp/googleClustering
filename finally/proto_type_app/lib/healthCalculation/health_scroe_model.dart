enum body_Enum {
  completely_self_reliant, //완전자립
  partial_aidded, //부분도움
  full_aidded, //완전도움
}

enum recognition_Enum {
  no, //아니오
  yes, //예
}
enum behaviorChange_Enum {
  no, //아니오
  yes, //예
}

enum nursing_Enum {
  no, //없다
  yes, //있다
}

enum rehabilitation_dyscinesia_Enum {
  none, //운동장애없음
  partial_dyscinesia, //불완전운동장애
  full_dyscinesia, //완전운동장애
}

enum rehabilitation_joint_restriction_Enum {
  none, //제한없음
  partial_joint_restriction, //한쪽관절제한
  full_joint_restriction, //양관절제한
}

class HealthScoreModel {
  Map<String, int> body = {
    '옷 벗고 입기가 가능하십니까?': 0,
    '세수하기가 가능하십니까?': 0,
    '양치질하기가 가능하십니까?': 0,
    '목욕하기가 가능하십니까?': 0,
    '식사하기가 가능하십니까?': 0,
    '체위 변경하기가 가능하십니까?': 0,
    '일어나 앉기가 가능하십니까?': 0,
    '자리를 옮겨서 앉기가 가능하십니까?': 0,
    '방 밖으로 나올실 수 있습니까?': 0,
    '화장실을 다녀오실 수 있습니까?': 0,
    '대변을 조절하실 수 있습니까?': 0,
    '소변을 조절하실 수 있습니까?': 0,
  };

  Map<String, int> recognition = {
    '방금 전에 들었던 이야기나 일을 잊는다?': 0,
    '오늘이 몇 년, 몇 월, 몇일인지 모른다?': 0,
    '자신이 있는 장소를 알지 못한다?': 0,
    '자신의 나이와 생일을 모른다?': 0,
    '지시를 이해하지 못한다?': 0,
    '주어진 상황에 대한 판단력이 떨어져 있다?': 0,
    '의사소통이나 전달에 장애가 있다?': 0,
  };
  Map<String, int> behaviorChange = {
    '사람들이 무엇을 훔쳤다고 믿거나, 자기를 해하혀한다고 잘못 믿고 있다.': 0,
    '헛것을 보거나 환청을 듣는다': 0,
    '슬퍼 보이거나 기분이 처져 있으며 때로 울기도 한다': 0,
    '밤에 자다가 일어나 주위 사람을 깨우거나 아침에 너무 일찍 일어난다. 또는 낮에는 지나치게 잠을 자고 밤에는 잠을 이루지 못한다.':
        0,
    '주위사람이 도와주려 할 때 도와주는 것에 저항한다': 0,
    '한군데 가만히 있지 못하고 서성거리거나 왔다 갔다 하며 안절부절 못한다': 0,
    '길을 잃거나 헤맨 적이 있다. 외출하면 집이나 병원, 시설로 혼자 들어올 수 없다': 0,
    '화를 내며 폭언이나 폭행을 하는 등 위협적인 행동을 보인다': 0,
    '혼자서 밖으로 나가려고 해서 눈을 뗄 수가 없다': 0,
    '물건을 망가뜨리거나 부순다': 0,
    '의미 없거나 부적절한 행동을 자주 보인다': 0,
    '돈이나 물건을 장롱같이 찾기 어려운 곳에 감춘다': 0,
    '옷을 부적절하게 입는다': 0,
    '대소변을 벽이나 옷에 바르는 등의 행위를 한다': 0,
  };

  Map<String, int> nursing = {
    '기관지 절개관: 기관지를 절개하여 인공기도를 확보하는 간호': 0,
    '흡인: 카테터 등으로 인위적으로 분비물을 제거하여 기도유지': 0,
    '산소요법: 저산소증이나 저산소혈증을 치료, 감소 시키기 위해 산소공급장치를 통해 추가적인 산소 공급': 0,
    '욕창간호: 장기적인 고정체위로 인해 압박 부위의 피부와 하부조직 손상되어 지속적인 드레싱과 체위변경 처치': 0,
    '경관 영양: 구강으로 음식첩취가 아려워 관을 통해서 위, 십이지장 등에 직접 영양을 공급해야 하는 경우': 0,
    '암성통증: 암의 진행을 억제하지 못하여 극심한 통증에 발생': 0,
    '도뇨관리: 배뇨가 자율적으로 관리가 불가능하여 인위적으로 방광을 비우거나 관리': 0,
    '장루: 인공항문을 통해 체외로 대변을 배설 시킴으로 부착장치의 지속적인 관리': 0,
    '투석: 장기적인 신부전증으로 인해 혈액 투석이 필요한 경우': 0,
  };
  Map<String, int> rehabilitation = {
    //운동장애정도
    '오른쪽 상지 (손, 팔, 어깨)이 의지대로 움직이시나요?': 0,
    '오른쪽 하지 (발, 다리) 이 의지대로 움직이시나요?': 0,
    '왼쪽 상지 (손, 팔, 어깨) 이 의지대로 움직이시나요?': 0,
    '왼쪽 하지 (발, 다리) 이 의지대로 움직이시나요?': 0,

    //관절제한정도
    '어깨관절이 자유롭게 움직이시나요?': 0,
    '팔꿈치관절이 자유롭게 움직이시나요?': 0,
    '손목 및 손관절이 자유롭게 움직이시나요?': 0,
    '고관절 (엉덩이관절) 이 자유롭게 움직이시나요?': 0,
    '무릎관절이 자유롭게 움직이시나요?': 0,
    '발목관절이 자유롭게 움직이시나요?': 0,
  };

  Map<String, int> illness = {
    '치매': 0,
    '중풍(뇌졸증)': 0,
    '고혈압': 0,
    '당뇨병': 0,
    '관절염(퇴행성, 류마티스)': 0,
    '요통, 좌골통(디스크)': 0,
    '심부전, 폐질환, 천식 등': 0,
    '난청': 0,
    '백내장, 녹내장': 0,
    '골절, 탈골, 사고 후유증': 0,
    '암': 0,
    '신부전': 0,
    '욕창': 0,
  };
}
