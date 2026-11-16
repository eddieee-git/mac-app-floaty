<p align="center"><img src="docs/images/icon.png" width="96" alt="Floaty 아이콘"></p>

<h1 align="center">Floaty</h1>

<p align="center">macOS 메뉴바에서 바로 꺼내 쓰는 플로팅 스티커 메모<br>다른 앱 위에 띄워 두고, 필요 없을 때는 단축키 하나로 숨겨요.</p>

<p align="center">
  <a href="https://github.com/eddieee-git/mac-app-floaty/releases/latest">최신 버전 내려받기</a> ·
  <a href="#설치">설치</a> ·
  <a href="#쓰는-방법">쓰는 방법</a> ·
  <a href="#단축키">단축키</a> ·
  <a href="#자주-묻는-질문">자주 묻는 질문</a> ·
  <a href="CHANGELOG.md">변경 기록</a> ·
  <a href="README.en.md">English</a>
</p>

<p align="center"><img src="docs/images/stickers.png" alt="화면에 띄운 Floaty 스티커 세 장"></p>

## 특징

- **항상 위에 띄우기**: 스티커마다 핀으로 켜고 꺼요. 투명도도 스티커별로 조절해요.
- **서식 있는 메모**: 글씨체, 크기, 글자색, 형광펜, 굵게, 기울임, 밑줄, 취소선, 글머리표, 체크리스트(☐ 누르면 ☑), 정렬, 서식 지우기를 지원해요. 이미지도 붙여 넣을 수 있고, 주소는 누를 수 있는 링크로 바뀌어요. ⌘⇧F로 스티커 안에서 찾아요.
- **접기와 숨기기**: 제목 줄만 남기거나 숨겨요. 스티커 하나만, 또는 모두 한 번에 할 수 있어요.
- **전역 단축키**: 어떤 앱을 쓰고 있어도 새 스티커를 만들고 스티커를 접거나 숨겨요. 키는 직접 정해요.
- **알람**: 정해진 시각이 되면 스티커가 앞으로 나와 소리를 내고 깜빡여요. 5분 뒤 다시 알림과 매일 반복도 돼요.
- **잠금**: Touch ID나 Mac 로그인 암호로 풀기 전까지 내용을 화면에서 가려요.
- **스티커 관리 창**: 모든 메모를 목록으로 보고 한 창에서 편집해요. 숨긴 스티커는 메모장처럼 여기서만 쓸 수 있고, 검색과 휴지통(30일 뒤 자동 비움)도 여기서 해요.
- **파일**: 스티커를 RTFD, RTF, 텍스트로 저장하고 불러오며 인쇄해요.
- **꾸미기**: 10가지 색, 라이트·다크 테마, 날짜 표기 방식, 동작별 효과음을 골라요.
- **앱 안 업데이트**: 새 버전이 나오면 알려 주고, 서명을 확인한 뒤 바꿔 넣어요.
- **한국어·영어**: 설정에서 화면 언어를 골라요. 처음에는 Mac의 언어를 따라요.

## 설치

Apple 실리콘 Mac(M1 이상), macOS 13 이상이 필요해요. Intel Mac은 지원하지 않아요.

1. [Releases](https://github.com/eddieee-git/mac-app-floaty/releases/latest)에서 `Floaty-x.y.z.dmg`를 내려받아 열어요.
2. **Floaty**를 **Applications** 폴더로 끌어다 놓아요.
3. Floaty를 열어요. Apple 개발자 서명이 없는 앱이라 처음 한 번은 열 수 없다는 경고가 나와요. **완료**를 누른 뒤:
   - **macOS 15(Sequoia) 이상**: 시스템 설정 → 개인정보 보호 및 보안을 맨 아래까지 내려서 Floaty 옆의 **그래도 열기**를 누르고, 한 번 더 **열기**를 눌러요.
   - **macOS 13·14**: 응용 프로그램 폴더에서 Floaty를 **오른쪽 클릭 → 열기**를 눌러요.

   터미널이 편하면 `xattr -dr com.apple.quarantine /Applications/Floaty.app`을 실행해도 돼요.
4. Dock에는 아이콘이 생기지 않아요. 메뉴바에 압정 꽂힌 메모지 아이콘이 나타나고 **Floaty 시작하기** 스티커가 떠요.

자세한 내용과 다른 Mac으로 옮기는 방법은 [설치 안내](docs/install.md)에 있어요.

## 쓰는 방법

1. 메뉴바의 Floaty 아이콘을 누르고 **새 스티커**를 고르거나 **⌃⌘N**을 눌러요.
2. 내용을 입력해요. 저장은 자동으로 돼요.
3. 제목 줄을 끌어 원하는 곳에 둬요.
4. **⌃⌘H**를 누르면 모든 스티커가 숨고, 다시 누르면 나타나요.

서식, 알람, 잠금, 스티커 관리 창, 파일로 저장하기는 [사용법](docs/guide.md)에 자세히 있어요.

넘김시계 모양의 타이머와 알람, 캘린더 일정 알림은 짝꿍 앱 [Clocky](https://github.com/eddieee-git/mac-app-clocky)에 있어요.

## 단축키

| 키 | 동작 |
|---|---|
| ⌃⌘N | (전역) 새 스티커 |
| ⌃⌘H | (전역) 모두 표시/숨기기 |
| ⌃⌘M | (전역) 모두 최소화/펼치기 |
| ⌃⌥M | (전역) 현재 스티커 최소화/펼치기 |
| ⌃⌥H | (전역) 현재 스티커 숨기기/표시 |
| ⌃⌘⌫ | (전역) 현재 스티커 삭제 (한 번 묻고) |
| esc | 스티커 최소화/펼치기 |
| F2 | 제목 변경 |
| ⌘F | 스티커 관리(검색) |

전역 단축키는 설정 → **단축키**에서 바꾸거나 끌 수 있어요. 스티커 안에서 쓰는 서식 단축키는 [사용법](docs/guide.md#단축키)에 있어요.

## 설정

| 탭 | 내용 |
|---|---|
| 일반 | 언어, 테마, 로그인 시 자동 실행, 삭제하기 전에 확인, 휴지통 30일 자동 비우기(기본 켬), 새 버전 자동으로 확인(기본 켬)·자동으로 설치(기본 켬) |
| 스티커 | 새 스티커의 기본 크기, 글씨체, 글자 크기, 항상 위, 색상. 모든 스티커의 투명도 |
| 날짜 | 날짜·연도·요일·시각 표기 방식 |
| 색상 | 10가지 색의 제목 줄과 바탕 색(라이트·다크 따로) |
| 소리 | 효과음 켜기(기본 끔), 알람을 알림 센터에도 보내기, 동작별 소리 |
| 단축키 | 전역 단축키, 제목 변경 키 |
| 정보 | 버전, GitHub·변경 기록·문제 알리기 링크, 다른 앱 |

## 자주 묻는 질문

**어떤 정보를 보내나요?**
업데이트 확인 때 GitHub 공개 API에 최신 릴리스를 묻는 요청 하나만 보내요. 스티커 내용이나 사용 기록은 어디에도 보내지 않아요. 설정에서 자동 확인을 끄면 그것도 보내지 않아요.

**스티커는 어디에 저장되나요?**
이 Mac의 `~/Library/Application Support/Floaty`에만 저장돼요. iCloud 동기화는 없어요. 하루에 한 번 최근 7일치를 자동으로 백업해요.

**잠근 메모는 얼마나 안전한가요?**
잠긴 메모의 본문은 파일에도 암호화해서 저장해요(키는 로그인 키체인). 제목은 암호화하지 않으며, 내 계정으로 도는 다른 앱까지 막지는 못해요.

**앱을 켰는데 아무것도 안 보여요.**
Dock에는 아이콘이 없어요. 화면 위쪽 메뉴바를 보세요. 메뉴바 항목이 많으면 아이콘이 가려질 수 있어요.

더 많은 질문은 [사용법의 자주 묻는 질문](docs/guide.md#자주-묻는-질문)에 있어요.

## 지우기

1. 메뉴바 Floaty 아이콘 → **Floaty 종료**
2. 응용 프로그램 폴더에서 Floaty를 휴지통으로
3. (선택) 스티커와 설정까지 지우는 방법은 [설치 안내의 삭제](docs/install.md#삭제)에 있어요.

## 직접 빌드하기

Apple 실리콘 Mac, macOS 13 이상, Xcode Command Line Tools가 필요해요(Xcode는 없어도 돼요).

```bash
./scripts/test.sh        # 자체 점검
./scripts/build-app.sh   # build/Floaty.app + build/Floaty-<버전>.dmg
open build/Floaty.app
```

앱은 강화 런타임을 켜서 서명해요. 외부 라이브러리가 없어요.

## 라이선스

[MIT](LICENSE)

<!-- more-apps:start -->
## 다른 앱

| | 앱 | |
|---|---|---|
| <img src="https://raw.githubusercontent.com/eddieee-git/mac-app-clocky/main/docs/images/icon.png" width="32" alt=""> | [Clocky](https://github.com/eddieee-git/mac-app-clocky) | 메뉴바에서 꺼내 쓰는 넘김시계 타이머·알람·일정 알림 |
| <img src="https://raw.githubusercontent.com/eddieee-git/mac-app-gitty/main/docs/images/icon.png" width="32" alt=""> | [Gitty](https://github.com/eddieee-git/mac-app-gitty) | Git 저장소를 파일 관리자처럼 다루는 앱 |
| <img src="https://raw.githubusercontent.com/eddieee-git/mac-app-grabby/main/docs/images/icon.png" width="32" alt=""> | [Grabby](https://github.com/eddieee-git/mac-app-grabby) | 찍고, 그 자리에서 그리고, 바로 붙여 넣는 화면 캡처 |
| <img src="https://raw.githubusercontent.com/eddieee-git/mac-app-peeky/main/docs/images/icon.png" width="32" alt=""> | [Peeky](https://github.com/eddieee-git/mac-app-peeky) | 노치에 가려진 메뉴바 아이콘을 꺼내 보는 앱 |
<!-- more-apps:end -->
