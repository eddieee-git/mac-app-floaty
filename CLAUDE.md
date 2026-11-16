> 문서·UI 규칙은 ../mac-app/STYLE.md를 따른다. 다르게 할 때는 여기에 이유를 적는다.

> 업데이트 코드(`AppUpdater.swift`)는 다섯 앱 공통이다. 여기서 고치지 않고 ../mac-app/shared/AppUpdater.swift를 고친 뒤 ../mac-app/scripts/sync-shared.sh로 복사한다. 이 앱에만 해당하는 값은 `UpdaterSetup.swift`에 있다. 시험할 때는 디버그 빌드에서 `-debugUpdateURL <주소>`, `-debugUpdatePublicKey <키>`, `-debugAppVersion <버전>`을 쓴다.

# Floaty 작업 안내

macOS 메뉴바에 사는 떠 있는 스티커 메모 앱. AppKit + SwiftUI, SwiftPM으로만 빌드한다(Xcode 프로젝트 없음). Apple 실리콘, macOS 13 이상.

## 지켜야 할 것

- **Apple 계정이 필요한 기능은 만들지 않는다.** iCloud 동기화, 공증(notarization), 유료 개발자 인증서, 그런 엔타이틀먼트가 필요한 기능은 제안하지 않는다. 서명은 ad-hoc + 강화 런타임까지만.
- **외부 라이브러리를 넣지 않는다.** 시스템 프레임워크만 쓴다(CryptoKit, Carbon 등).
- **타이머·시계 알람은 짝꿍 앱 Clocky**([mac-app-clocky](https://github.com/eddieee-git/mac-app-clocky))의 몫이다. Floaty에는 스티커마다 거는 알람만 둔다.
- **`REQUIREMENTS.md`는 로컬 전용**이다(.gitignore). 커밋하거나 내용을 공개 문서·커밋 메시지에 옮기지 않는다.
- **push와 릴리스는 사용자가 말할 때만** 한다. 평소에는 구현 → 빌드 → `/Applications`에 다시 설치 → 로컬 커밋까지.
- 커밋은 `main`에 바로 하지 않고 작업 브랜치에서 한 뒤 `main`에 합친다(공통 규칙).
- 사용자는 코딩을 잘 모른다. 한국어 쉬운 말로, 지금 단계와 남은 단계를 알려 준다.
- 커밋 작성자는 `eddieee-git <10068254+eddieee-git@users.noreply.github.com>`.

## 코드

- `Sources/Floaty/` 한 타깃. 진입점 `main.swift`, 앱 전체는 `AppDelegate.swift`, 스티커 창은 `StickyPanel`(NSPanel)과 `StickyController`.
- 설정은 `AppSettings`(UserDefaults, `@Published` + `didSet` 저장). 새 설정은 `Keys`, 프로퍼티, `init`의 기본값 세 곳에 넣고, 화면은 `SettingsWindow.swift`.
- 화면 문구는 한국어로 쓰고 `L("한국어")`로 감싼다. 영어는 `Localization.swift`의 `english` 사전에 같은 키로 넣는다. 빠뜨리면 영어 화면에 한국어가 나온다.
- 주석은 한국어로, 무엇보다 왜를 적는다.
- 앱 안 업데이트는 `AppUpdater.swift`(공통)와 `UpdaterSetup.swift`. GitHub `releases/latest`를 보고, dmg를 `.sig`(Ed25519)로 확인한 뒤 번들을 바꾸고 다시 켠다. 공개 키는 코드에 있다.

## 빌드와 설치

```bash
scripts/build-app.sh
```

`build/Floaty.app`, `build/Floaty-<버전>.dmg`가 생긴다. 서명 키가 있으면 `.sig`와 0.2.1 호환용 `Floaty.dmg`/`Floaty.dmg.sig` 사본도 만든다.

설치해서 확인할 때:

```bash
osascript -e 'quit app "Floaty"'; rm -rf /Applications/Floaty.app && ditto build/Floaty.app /Applications/Floaty.app && open /Applications/Floaty.app
```

`NoteCrypto.swift`의 `SecAccessCreate` 사용 중단 경고는 알고 있는 것이니 그대로 둔다.

## 시험

먼저 자체 점검을 돌린다. 디버그 빌드 뒤 앱의 `--self-test` 모드를 실행한다.

```bash
./scripts/test.sh
```

업데이트 전 과정(확인 → 내려받기 → 서명 확인 → 바꿔 넣기 → 다시 켜기)은 `../mac-app/scripts/e2e-update-test.sh`로 확인한다.

키·창 동작처럼 자체 점검이 다루지 않는 것은 임시 폴더에 시험용 실행 파일을 만들어 확인한다.

1. `Sources/Floaty/*.swift`를 복사하고 `main.swift`는 뺀다.
2. 내부를 건드릴 수 있게 `private`을 지운다:
   `sed -E -i '' 's/private\(set\) //g; s/(^|[^a-zA-Z])private (var|let|func|static|lazy|final|enum|struct|class)/\1\2/g' src/*.swift`
3. 시험 코드를 `t/main.swift`에 쓰고 `swiftc -O -o test src/*.swift t/main.swift`.
4. 실제 스티커를 건드리지 않도록 `HOME`과 `CFFIXED_USER_HOME`을 임시 폴더로 바꿔 실행한다. 모달 알림은 `.modalPanel` 모드에 넣은 Timer로 `NSApp.stopModal(withCode:)`를 불러 닫는다.
5. 시험 실행 파일도 메뉴바 아이콘을 띄운다. 기다리다 멈추면 꼭 `kill`해서, 진짜 Floaty 옆에 아이콘이 하나 더 남지 않게 한다.

업데이트 기능은 디버그 빌드의 `-debugUpdateURL` 인자로 로컬 서버(`python3 -m http.server`)의 가짜 릴리스 JSON을 보게 해서 시험한다. 이때 번들 ID를 바꾼 시험용 `.app` 안에서 실행해야 켜져 있는 Floaty와 겹치지 않는다.

## 문서

사용자 문서는 한국어와 영어 두 벌이고, 바꿀 때 같이 고친다.

- `README.md` / `README.en.md`
- `docs/guide.md` / `docs/guide.en.md`: 사용법, 메뉴·단축키·설정 표
- `docs/install.md` / `docs/install.en.md`: 설치, 보안 경고, 업데이트, 삭제
- `CHANGELOG.md` / `CHANGELOG.en.md`: 릴리스 전 변경은 맨 위 "다음 버전" / "Next version"에 모은다

스크린샷은 `docs/images/`. 설정 창 모양을 바꾸면 해당 스크린샷도 다시 찍는다.

## 릴리스

1. `Resources/Info.plist`의 `CFBundleShortVersionString`과 `CFBundleVersion`(1씩 올림)을 바꾸고, 두 변경 기록의 "다음 버전"/"Next version" 제목을 `## <버전> (YYYY-MM-DD)`로 바꾼다(없으면 새로 쓴다). 항목은 0.2.3부터 짧은 명사형(`- **이름**: 설명`)으로 쓴다.
2. 릴리스 노트를 `docs/releases/v<버전>.md`에 쓴다. 틀은 `../mac-app/templates/release-note.md`, 한국어 다음 `## English`.
3. `./scripts/test.sh`를 돌린 뒤 `scripts/build-app.sh`로 빌드한다. 서명 키는 저장소 밖 `~/.config/floaty/update-signing.key`에 있다(`FLOATY_UPDATE_KEY`로 바꿀 수 있음). 키가 없으면 `.sig`가 안 생기고, 그 릴리스는 앱 안에서 자동 설치되지 않는다.
4. `git push origin main`.
5. 릴리스를 만든다. dmg, `.sig`, 0.2.1 호환 사본까지 네 파일을 모두 올린다.
   ```bash
   gh release create v<버전> build/Floaty-<버전>.dmg build/Floaty-<버전>.dmg.sig build/Floaty.dmg build/Floaty.dmg.sig --title "Floaty <버전>" --notes-file docs/releases/v<버전>.md --latest
   ```
6. `curl`로 `releases/latest`를 받아 네 파일이 다 있는지, 받은 dmg의 체크섬과 서명이 맞는지 확인한다.

서명 키를 새로 만들면(`swift scripts/sign-update.swift keygen`) 이미 설치된 앱은 새 릴리스를 자동으로 받지 못한다. 키는 잃어버리지 않게 따로 백업한다.

## 지금 상태 (2026-11-16)

다섯 앱 전체의 상태와 남은 일은 `../mac-app/CLAUDE.md`와 `../mac-app/CHECKLIST.md`에 있다. 여기에는 Floaty 것만 적는다.

- **최신 릴리스는 0.2.3(2026-11-15)**이고 `main`과 GitHub가 같다. 아직 내지 않은 변경은 없고, 다음 버전은 0.2.4.
- **업데이트**: 0.2.2 → 0.2.3 앱 안 업데이트는 사용자가 실제로 확인했다. 공통 AppUpdater가 실제 릴리스로 스스로 업데이트하는 것은 0.2.4를 낼 때 처음 일어난다.
- **0.2.1 호환 사본**(`Floaty.dmg`, `Floaty.dmg.sig`): 0.2.1 사용자가 거의 없어지면 `build-app.sh`와 릴리스 명령에서 뺀다.

### 남은 일

- [ ] **설정 창 스크린샷 다시 찍기**: 정보 탭과 새 업데이트 칸이 생겼다. 개인 내용이 찍힐 수 있어 사용자가 찍는다.
- [ ] **안 쓰는 번역 정리**: 옛 업데이트 코드(`Updater.swift`) 문구가 `Localization.swift`의 `english` 사전에 남아 있다.
- [ ] **Swift 6 경고**: `AppDelegate`에서 `AppUpdater.shared`를 부르는 줄. Swift 5 모드에서는 동작에 영향 없음.
- [ ] **실제 키보드 확인**: Esc 두 번(최소화 → 펼치기), F2, ⌘⌫, ⌃⌘⌫, 한글 조합 중 Esc는 시험용 실행 파일로만 확인했다. Floaty는 메뉴바 앱이라 Claude의 화면 제어 도구 목록에 나오지 않으니 사용자에게 눌러 봐 달라고 한다.
