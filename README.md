## 📌Team Network
- 해당 페이지는 Network팀의 작업 레포입니다.
오픈소스 공유기 펌웨어인 OpenWrt25.12 버전과 오픈소스 프로젝트 w1.fi 코드를 담고 있습니다.
#### 🔗역할
- Openwrt와 w1.fi의 코드를 분석합니다.
- Openwrt의 WPA3-SAE구조에 PQC 로직을 추가합니다.
- 실질적인 펌웨어 수정 및 배포를 담당합니다.
#### ✅실행 구조
- 로컬의 hostap 디렉터리의 소스코드를 openwrt에 의해 패치를 적용한 후 컴파일 됩니다.
#### ☺️협업 규칙
- 각 팀원들은 저장소를 fork하거나 clone한 다음 작업 용도에 따라 브랜치를 생성해주세요.
    - 작업 최종 브랜치는 `master` 입니다. `master` 브랜치는 최종 빌드 결과물 소스코드가 들어갑니다.
    - 작업 브랜치 이름은 `Tag/설명` 형식입니다. ex) `feat/add PQC function`
    - 
      |Tag|설명|예시|
      |-----|-----|-----|
      |feat/|새로운 기능 추가 및 수정|feat/oauth2-implementation|
      |fix/|버그 수정|fix/memory-leak-bug|
      |docs/|문서 수정|docs/update-readme|
      |refactor/|기능 변화 없는 코드 구조 개선|refactor/optimize-loop|
      |test/|테스트 코드 추가|test/add-unit-tests|
      |chore/|그 외 정의할 수 없는 작업|chore/add emoticon|
      *추가할 Tag가 있으면 미리 말하고 추가해주세요.
    - 커밋 메시지는 자유롭게 작성하되 자세하게 작성해주세요. 구분 기호는 주의사항에 있는 특수기호 `/` 와 `-` 만 사용해주세요.
      
- 수정 후 `master` 브랜치로 `pull request`를 날려주세요.
- 파트장이 검수 후 최종 `merge` 합니다.
#### ⚠️주의사항
- `main` 브랜치와 `master` 브랜치에서 코드를 수정하지마세요. `main` 브랜치는 원본 코드의 내용이 존재해야 하고 `master` 브랜치는 최종 작업물이 존재해야 합니다.
- `/`와 `-`를 사용하세요. `_` 같은 특수기호를 사용하지 마세요.
- 브랜치 이름은 전부 소문자로 사용하세요.
