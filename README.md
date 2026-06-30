# 팜지기 프로모 사이트

[Farmjigi](https://github.com/jtjeon73-hue/Farmjigi) 앱 출시 전 홍보·마케팅용 Flutter 웹 랜딩페이지입니다.

**팜지기**는 온실·축사 환경을 실시간 모니터링하고, 장비를 원격 제어하며, 에너지·정비·일일 보고서를 관리하는 **스마트 농장 관리 플랫폼**입니다.

## 현재 상태

- **베타 개발 중 · 프로모션 사이트**
- Farmjigi 앱의 핵심 기능(농장 관리, 원격 제어, 대시보드 등)은 개발·테스트 중이며, 일부 화면은 데모 데이터로 표시될 수 있습니다.
- 정식 출시 전까지 기능 안정화가 진행됩니다.

## 주요 섹션

| 섹션 | 설명 |
|------|------|
| 메인 히어로 | 팜지기 브랜드 · 스마트 농장 관리 플랫폼 소개 |
| 팜지기가 돕는 일 | 실시간 모니터링, 원격 제어, 농장 관리, 데이터 분석, 에너지·정비 |
| 주요 기능 미리보기 | 대시보드, 농장 등록, 원격 제어, 에너지, 정비, 일일 보고서 |
| 앱 화면 구성 | Farmjigi 앱 5개 메인 탭 구조 미리보기 |
| 이런 분들께 추천합니다 | 농장 운영자·스마트팜 관리자 타깃 |
| 현재 준비 단계 | 5단계 개발 로드맵 |
| FAQ | 스마트 농장 관리 관련 질문 |
| 하단 CTA | 앱 미리보기, 문의하기, 출시 소식 받기 |

## 브랜드 (Farmjigi 앱 기준)

| 항목 | 값 |
|------|-----|
| 한국어 명칭 | 팜지기 |
| 영문 명칭 | Farmjigi |
| 태그라인 | 스마트 농장 관리 플랫폼 |
| Primary | `#1B4332` |
| Accent | `#D4A574` |
| Background | `#F5F7F4` |

## GitHub Pages 배포 주소

https://jtjeon73-hue.github.io/FarmjigiPromo/

## 로컬 실행 방법

```bash
flutter pub get
flutter run -d chrome
```

## 배포 빌드 방법

```bash
flutter build web --release --base-href "/FarmjigiPromo/"
```

## docs 폴더 배포 방식

```powershell
if (Test-Path .\docs -PathType Leaf) { Remove-Item .\docs -Force }
if (-not (Test-Path .\docs -PathType Container)) { New-Item -ItemType Directory .\docs }
robocopy .\build\web .\docs /MIR
New-Item -ItemType File .\docs\.nojekyll -Force
```

GitHub 저장소 **Settings → Pages → Branch: main, Folder: /docs**

## 프로젝트 구조

```
lib/
  main.dart
  theme/app_theme.dart      # Farmjigi 앱과 동일 색상 팔레트
  pages/landing_page.dart
  widgets/landing_widgets.dart
web/
  index.html                # OG/Twitter 메타태그
  og-image.png
docs/                       # GitHub Pages 배포 산출물
```

## 남은 TODO

- [ ] 문의 이메일(`farmjigi@example.com`)을 실제 연락처로 변경
- [ ] Farmjigi 앱 `assets/images/logo.png` 확보 후 프로모 히어로에 적용
- [ ] 앱 스토어/웹앱 링크 확정 후 "앱 미리보기" 버튼 연결
- [ ] 출시 소식 받기 (이메일 수집) 기능 구현
- [ ] Farmjigi 앱 정식 출시 시 프로모 사이트 상태 문구 업데이트
