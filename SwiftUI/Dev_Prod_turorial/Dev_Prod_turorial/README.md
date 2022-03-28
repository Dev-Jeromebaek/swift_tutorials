#  개발, 운영 앱 나누는 법

1. 아이콘 이미지 2개 준비 - asset app Icon 2개
2. AppIcon 에셋 2개 만들어서 이미지 적용
3. TARGETS -> BuildSetting (asset 검색) -> Primary App Icon Set Name -> Debug, Release 세팅
4. TARGETS -> BuildSettings (packaging 검색) -> Packaging -> Product Bundle Identifier - debug, release 세팅
5. TARGETS -> BuildSettings (위에 + 버틍 클릭)
6. User-Defined -> BUNDLE_ID_SUFFIX 만들기 -> debug, release 세팅
*7. 보여지는 앱 이름 바꾸고 싶다면
    TARGETS -> BuildSetting(bundle display name 검색) -> Debug, Release 세팅
    
- Product -> Scheme -> EditScheme으로 확인

