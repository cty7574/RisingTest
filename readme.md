<1일차>
- 메인화면 탭바 컨트롤러 구성
- 홈 화면에 PagingKit 이식
- contentView를 스크롤 했을 때 메뉴가 넘어가는 delegate 구현 중 오류 발생(내일 해결하자..)
- git 과 xcode 연동 및 commit
- 코로나 확진으로 컨디션이 나빠서 오늘은 간단 작업만 진행

<2일차>
- pagingKit delegate 오류 해결
- 마이컬리 화면 일부분 구성
- 로그인 화면 구성
- 회원가입 화면 구성
- 각 화면간 segue는 아직 정의하지 않음

<3일차>
- 마이컬리 화면 구성
- 화면간 segue 정의

<4일차>
- 레이아웃 iOS 형식으로 수정

<6일차>
- 회원가입 화면 마무리
- 체크박스 구성(성별 선택 및 약관 동의)
- 체크박스 클릭 이벤트 구현(체크 해제시 오류 해결 필요)

<7일차>
- 회원가입 화면 구성
- 체크박스 클릭 이벤트 구현 완료
- 가입하기 버튼 클릭 이벤트 구현(빈칸x, 비밀번호 대조, 약관 동의)
- 회원가입 API 연결("The data couldn't be read because it is missing" 오류 발생) -> DB나 response에 정의한 구조체 간 변수명 차이로 발생한듯, 아직까지는 오타 발견 x

<8일차>
- 회원가입 API 연결 오류 해결(response의 result(구조체)삭제로 해결)
- 로그인 API 연결
- 마이컬리 화면 구현 (1. 로그인 x: 로그인 뷰 표시, 2. 로그인 o: 유저 정보 뷰 표시)
- 유저 정보 불러오기 API 구현 중

<9일차>
- 비밀번호 재확인 화면 구성
- 회원정보 수정 화면 구성
- 로그인 시 회원 정보를 마이컬리 화면
- 회원정보 조회 API 연결
- 회원정보 수정 API 연결
