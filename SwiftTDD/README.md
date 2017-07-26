Swift를 사용한 TDD 예제

# TDD를 위한 프로젝트 생성
```bash
$ mkdir SwiftTDD
$ cd SwiftTDD
$ swift package init
$ swift package generate-xcodeproj
$ oepn SwiftTDD.xcodeproj
```

# 2장 타락한 객체

* $5 + 10CHF = $10 (환율 2:1)
* ~~$5 * 2 = $10~~
* `amount`를 private로 만들기
* ~~Dollor 부작용?~~
* Money 부작용?

