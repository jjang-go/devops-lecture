# CI/CD

## CI/CD란

* 지속적 통합(Continuous Integration) 과 지속적 제공/배포(Continuous Delivery/Deployment)를 의미

* 소프트웨어 배포 프로세스의 속도, 안정성을 높이기 위한 방법

* 배포 과정을 자동화하여 더욱 짧은 주기로 배포

* **DevOps방식의 핵심**, DevOps != CI/CD

* Plan -> Code -> -> Build -> Test -> Release -> Deploy -> Operate

## 사용하는 이유

* 투명성, 책임성

  * 장애 발생시 : 장애 예측 불가, 배포자 파악 불가

  * 롤백 또는 핫픽스

* 자동화

  * 코드 품질 보장(lint, coverage, test)

  * pull request로ㅓ 협업시 approve 최소 조건으로 사용 가능

* 개발 -> 운영 환경으로 원활한 전환

* 협업 효율성의 향상

### CI (Continuous Integration)

* 여러 개발자의 코드 변경 상항을 공유 저장소에 지속적으로 통합

* 개발 프로세스 초기에 오류와 충돌을 미리 발견하기 위한 것

* Plan -> Code -> -> Build -> Test를 포함 - CI와 CD의 경계가 모호하기 때문에 Release까지 포함되는 경우도 있음

* formatter의 중요성

* naming convention
  * camelCase
  * snake_case
  * PascalCase
  * kebab-case
  * flatcase - 대문자일땐 UPPERFLATCASE == Upper case

* test(unit / end-to-end), coverage

* code quality(lint, static analysis)

#### 지속적인 통합 예시

* multi-architecture
  * processor
    * intel, arm, amd
  * OS/Platform
    * iOS, android, web, windows, linux, macOS
  * version
    * python : 2.x, 3.x
    * java : 8, 11, 13.../ corretto, openjdk, oracle
  * docker image build(+tag)

#### CI이 필요한 이유
  * 협업하기 위함

  * 여러 개발자의 코드 변경 사항을 공유 저장소에 지속적으로 통합하는 것

  * 개발 프로세스 초기에 오류와 충돌응ㄹ 미리 발견하기 위한 것

  * 반복적으로 수행하는 작업(=코드리뷰)을 자동화
    * Style Guide : 언어(pep8), 회사, 팀
    * Code Coverage : TDD(test driven development)

### CD (Continuous Delivery/Deployment)

* 지속적인 전달(Continuous Delivery) : 자동으로 배포 X
  * 무조건 배포가 자동으로 안된다는 말은 아님

* 지속적인 배포(Continuous Deployment) : 자동으로 배포 O

* CI 프로세스에서 성공적으로 빌드/테스트/검증된 후 코드 변경 사항을 운영환경으로 자동 전달하는것을 포함

* 다양한 배포방식
  * all at once
    * 즉시 모든 서버에 배포하는 방식
  * blue-green
    * 동일한 구성의 새로운 인프라를 활용해 변경 사항이 있는 애플리케이션을 실행하는 방식
    * Blue: 기존에 운영되던 인프라
    * Green: 새로운 변경사항이 적용된 인프라
    * 블루그린배포는 문제점이 많아서 잘 사용하지 않음
  * rolling
    * 사용 중인 인스턴스 내에서 새 버전을 점진적으로 교체하는 것으로 무중단 배포의 가장 기본적인 방식
    * 운영중인 인스턴스를 순차적으로 재배포 함으로 서비스 운영간 중단없이 기능을 제공 가능
    * 서비스 중단이 없음(무중단배포)
    * 추가 인프라를 구성하지 않고 배포가 가능
    * 선행작업이 유연하게 이루어지지 않는다면 문제가 발생될 수 있음
    * 새로운 버전이 구 버전도 호환이 되어야함
  * canary
    * 일부 서버만 배포하여 기존 운영 환경과 공존시키는 배포 방식
    * 점진적으로 배포함
    * 문제가 있을 경우 변경한 특정 서버만 롤백하면 됨 (영향도 최소화)

* 안정성

  * 개발 : 자동 / 운영 : 수동

  * 선행작업 - 클라우드 가볍게 쓸때는 자동해도 문제X, 서비스 무거워지고, 데이터 많아지고, 사용자가 많아질때는 선행작업이 필요한 경우가 있음
    * DB, Network, Policy

#### 필요한 지식 기술
* IT/Infra : OS, Network
* Governance/Compliance
  * Protocol
  * Culture / Policy
  * Security
  * Log / Alert / Monitoring
  * Law
  * Business

#### DevSecOps
* Dev(Development)
  * Planning -> Creation -> Verifying -> Building -> Packaging
* Sec(Security)
  * Scan -> Analyze -> Remediate -> Monitor
* Ops(Operations)
  * Release -> Deploy -> Operate -> Monitoring