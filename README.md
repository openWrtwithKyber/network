## 📌Team Network
- 해당 페이지는 Network팀의 작업 레포입니다.
오픈소스 공유기 펌웨어인 OpenWrt24.10 버전과 오픈소스 프로젝트 w1.fi 코드를 담고 있습니다.
#### ✅실행 구조
- 쉘 파일을 실행하면 hostpad의 코드를 openwrt에 패치합니다. `./build_firmware.sh`
#### ☺️협업 규칙
- 각 팀원들은 저장소를 fork한 다음 작업 용도에 따라 브랜치를 생성해주세요.
    - 브랜치 이름은 `Tag/설명 : github id` 형식입니다. ex) feat/add PQC function : 21HoKim
    - 
      |Tag|설명|예시|
      |-----|-----|-----|
      |feat/|새로운 기능 추가|feat/oauth2-implementation|
      |fix/|버그 수정|fix/memory-leak-bug|
      |docs/|문서 수정|docs/update-readme|
      |refactor/|기능 변화 없는 코드 구조 개선|refactor/optimize-loop|
      |test/|테스트 코드 추가|test/add-unit-tests|
      |chore/|그 외 정의할 수 없는 작업|chore/add emoticon|
      *추가할 Tag가 있으면 미리 말하고 추가해주세요.
    - 커밋 메시지는 자유롭게 작성하되 자세하게 작성해주세요.
      
- 수정 후 pull request를 날려주세요.
- 파트장이 검수 후 최종 merge 합니다.
#### ⚠️주의사항
- main 브랜치를 수정하지마세요. main 브랜치는 원본 코드의 내용이 존재해야 합니다.
