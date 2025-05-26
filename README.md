![Image](https://github.com/user-attachments/assets/62f5c2c9-a8fc-4847-9b66-9381ef36b9ed)

<div align="right">
  <img src="https://github.com/user-attachments/assets/46f120e7-8fb4-46ef-9200-b7578eb66daa" height=30 width=30>&nbsp;
  <a href="https://apps.apple.com/kr/app/%EA%B2%BD%EC%A0%9C%EC%8A%A4%ED%86%A1/id6739859649">AppStore에서 보기</a>
</div>


<br><br>

## 🙌 프로젝트 소개

- 경제STOCK은 재미있는 인터랙티브 콘텐츠와 실시간 경제 데이터로 경제 개념을 배울 수 있는 기초 경제 학습용 iOS 서비스입니다.

- 경제 지표 대시보드를 통해 한국은행에서 제공하는 최신 경제 상황을 확인할 수 있습니다.

- 기초 경제 이론 강의(기초경제, 물가, 실업, 화페와 금융, 환율과 국제수지)를 단계별로 학습할 수 있습니다.
  
- 가상으로 작성한 단원별 경제 뉴스를 함께 분석하면서 경제 개념이 실제로 어떻게 쓰이는지 알 수 있습니다.
  
- AI가 강의내용을 요약해주거나, 경제 관련 질문을 받는 등의 학습 도우미 역할을 수행합니다.
  
- 학생이나 경제 입문자 등 경제에 대한 배경지식이 적은 사용자가 쉽고 흥미롭게 경제를 공부하도록 돕는 것이 목표입니다.

<br><br>

## 👥 팀원 구성
<br>
<div align="center">
  
| **권형일** | **정예은** |
| :------: |  :------: |
| <img src="https://github.com/user-attachments/assets/f21d71fe-ce7b-4be8-99ed-65d24529dcdf" height=150 width=150> | <img src="https://github.com/user-attachments/assets/cce7bf85-3b8c-4b3a-a594-d71c3930312d" height=150 width=150> |
| iOS 개발 | 컨텐츠 기획 및 작성 |

</div>

<br><br>

## 🎨 개발 환경

- **클라이언트** <br><br>
: &nbsp;&nbsp; <img src="https://github.com/user-attachments/assets/3e6d384d-7236-464c-92f0-242e52c7e4cd" height=50 width=50> &nbsp; Swift, &nbsp; <img src="https://github.com/user-attachments/assets/34ae1446-2e29-4099-878e-e5ced09f5ad1" height=50 width=50> &nbsp;SwiftUI, &nbsp; <img src="https://github.com/user-attachments/assets/f6ea23db-3f7e-4a01-9569-f4c71262be7c" height=50 width=50> &nbsp;Combine

- **백엔드** <br><br>
: &nbsp;&nbsp; <img src="https://github.com/user-attachments/assets/c396eca8-b46d-4c30-bf19-29ab9e03213a" height=40 width=30> &nbsp; Firebase, &nbsp; <img src="https://github.com/user-attachments/assets/68311341-bb6f-4b19-8c4c-a75c9f142ae7" height=40 width=40> &nbsp; Cloud Functions

- **데이터베이스** <br><br>
: &nbsp;&nbsp; <img src="https://github.com/user-attachments/assets/c4f953e5-c152-4048-be2c-56db24a66048" height=40 width=40> &nbsp; SwiftData, &nbsp; <img src="https://github.com/user-attachments/assets/7f696449-6dba-4390-96cf-46620035385d" height=40 width=35> &nbsp; Firebase Firestore, &nbsp; <img src="https://github.com/user-attachments/assets/137f9843-1b0c-42e7-a592-5e31bef334d7" height=42 width=42> &nbsp; Firebase Storage

- **알림 서비스** <br><br>
: &nbsp;&nbsp; <img src="https://github.com/user-attachments/assets/e4385433-ad7b-4950-afa5-548a827b05b0" height=45 width=45> &nbsp; Firebase Cloud Messaging API(V1)

- **버전 및 이슈 관리** <br><br>
: &nbsp;&nbsp; <img src="https://github.com/user-attachments/assets/1188196c-7469-4301-9592-ad1c9c029a09" height=40 width=40> &nbsp; Github, &nbsp; <img src="https://github.com/user-attachments/assets/1a7e3c68-90ac-442a-ae95-14f88c1dd0a0" height=40 width=40> &nbsp; Github Issue

- **협업** <br><br>
: &nbsp;&nbsp; <img src="https://github.com/user-attachments/assets/4e88ece5-cc26-4130-a05a-c6dc401e7bdd" height=40 width=40> &nbsp; Notion

- **디자인** <br><br>
: &nbsp;&nbsp; <img src="https://github.com/user-attachments/assets/8b93e1bf-7f04-4882-943a-2267d40d40a6" height=40 width=40> &nbsp; Lottie, &nbsp; <img src="https://github.com/user-attachments/assets/9ec3f050-163b-4968-85b3-1528aaf85de5" height=40 width=40> &nbsp; Goodnote Design

- **배포** <br><br>
: &nbsp;&nbsp; <img src="https://github.com/user-attachments/assets/46f120e7-8fb4-46ef-9200-b7578eb66daa" height=40 width=40> &nbsp; AppStore

<br><br>

## 📱 핵심 기능

<br>

<table>
  <tr>
    <td colspan="2" align="center"><b>초기화면</b></td>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/9c9592bf-27dc-4925-814b-ff6bb33ce5e8">
    </td>
    <td>
      - 앱 접속시 Combine을 활용하여 한국은행 Open API 기반 요청을 통한 경제 지표 데이터 수신<br><br>
      - 수신한 데이터를 Swift Chart 및 최신 수치와 증감률 표시<br><br>
      - Google AdMob의 배너 광고 로드
    </td>
  </tr>
</table>

<br>

<table>
  <tr>
    <td colspan="2" align="center"><b>로그인 화면</b></td>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/0e3392c3-3e77-4535-a9a7-1fe0c55f509e">
    </td>
    <td>
      - 로그인을 수행한 이후부터 데이터를 SwiftData가 아닌 Firebase Firestore에 저장<br><br>
      - Apple, Google, Kakao 소셜 로그인 및 이메일 기반 로그인 방식도 제공
    </td>
  </tr>
</table>

<br>

<table>
  <tr>
    <td colspan="2" align="center"><b>경제 강의</b></td>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/72f40fc2-52c9-442c-bafe-7334a21754dd">
    </td>
    <td>
      - Lottie를 활용하여 애니메이션 기반 인터랙티브 UI 경제 강의 구현<br><br>
      - 로그인 여부에 따라 강의 진행 기록을 SwiftData와 Firebase Firestore에 분기하여 저장<br><br>
      - 프로젝트 네비게이션 전역을 관리하는 경로 클래스를 활용하여 특정 페이지부터 이어서 학습 가능<br><br>
      - 뷰 내부의 요소에 id를 붙여 특정 요소로 자동 스크롤
    </td>
  </tr>
</table>

<br>

<table>
  <tr>
    <td colspan="2" align="center"><b>경제 뉴스</b></td>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/45e0274e-14fc-4c74-889f-8e220212d5fa">
    </td>
    <td>
      - 가상의 경제 뉴스를 기반으로 경제 내용 분석 및 퀴즈 제공<br><br>
      - 로그인 여부에 따라 강의 진행 기록을 SwiftData와 Firebase Firestore에 분기하여 저장<br><br>
      - 프로젝트 네비게이션 전역을 관리하는 경로 클래스를 활용하여 특정 페이지부터 이어서 학습 가능<br><br>
      - 뷰 내부의 요소에 id를 붙여 특정 요소로 자동 스크롤
    </td>
  </tr>
</table>

<br>

<table>
  <tr>
    <td colspan="2" align="center"><b>AI 서비스</b></td>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/767ff12c-adc7-48b0-bfb2-99322bf93e36">
    </td>
    <td>
      - GoogleGenerativeAI SDK를 통해 Gemini-1.5-flash 모델을 사용하여 챗봇 구성<br><br>
      - 챗봇 모델 생성시 초기값을 주입하여 경제 관련 답변만 하도록 챗봇 튜닝<br><br>
      - history 방식을 사용하여 연속적인 질의에도 맥락을 이어갈 수 있도록 구현
    </td>
  </tr>
</table>

<br>

<table>
  <tr>
    <td colspan="2" align="center"><b>알림 서비스</b></td>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/8d57ada5-41af-42c4-9f86-74df81c3ec65">
    </td>
    <td>
      - Firebase Cloud Messaging api(v1)을 사용하여 푸시 알림 시스템 구현<br><br>
      - Topic 구독 상태에 따라 알림 수신 여부를 제어하도록, 내부적으로 Topic 구독 및 해제 기능 구현
    </td>
  </tr>
</table>

<br><br>

## 📅 개발 기간

- 2024.09~2025.04

<br><br>
