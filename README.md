# 자취방 대여 시스템
<div align = "center">
  <img src = "https://github.com/SangHyeok-Kang/DataRepository/blob/3c52b3dd4790332c96966e645d099ba4123a3b34/%EB%82%B4%EB%B0%A9%EC%96%B4%EB%95%8C/banner.png">
</div>

<br>

## 💡 주제

- **네이버 클라우드 시스템**을 사용한 자취방 대여 웹 사이트 구축

<br>

## 📝 설명

- **내방 어때?** 는 **COVID-19**로 인하여 **비대면 수업**이 활성화되었고 실제로 거주하고 있지 않지만 **장기간 계약**으로 인해 **월세에 부담**을 느끼고있는 자취생들을 위한 플랫폼입니다.
- **통학**을 해야하는 학생들에게 공강시간에 장소를 대여해주어 시간을 **효율적**으로 사용할 수 있도록 하고, **자취생**들은 금전적인 문제를 해결할 수 있도록 제공합니다. 

<br>

## 🖥️ 시스템 구조도

<div align = "center">
  <img src = "https://github.com/SangHyeok-Kang/DataRepository/blob/9b7f711b74b3c595006fc3519018d4a78a480fa1/%EB%82%B4%EB%B0%A9%EC%96%B4%EB%95%8C/system.png">
</div>

## 🖥️ 기술 스택
- **Language** : HTML5, CSS3, JSP
- **Server** :  NCP([Compact] 1vCPU, 2GB Mem [g1)], Apache Tomcat 9Apache Tomcat 9
- **OS** : Ubuntu 18.04
- **Database** : MySQL 8.0.29 
- **Tools** : VSCode , Git

<br>

## ✨ 주요 기능

- **방 등록**
    - 사용자는 자신의 방을 등록하여 예약을 받을 수 있습니다.
    - 방 사진, 옵션, 주소, 계좌번호 등 자신의 방 정보를 입력을 통해 등록이 가능합니다.
- **방 검색 및 예약**
    - 사용자는 방의 세부 내역을 확인하고 시간을 선택하여 예약이 가능합니다.
- **리뷰 및 평점**
    - 사용자는 방을 사용 후 그 방과 집주인에 대한 리뷰와 평점을 남길 수 있습니다.
- **사용자 관리 및 신고**
    - 사용자는 문의 등록 및 사용자 신고기능을 통해 부적절한 사용자에 대해 신고 혹은 질문 등록이 가능합니다.
    - 사용자 이용제한 기능을 통해 관리자는 부적절한 사용자에 대해 이용제한을 부여할 수 있습니다.
<br>

## 🔥 트러블 슈팅

> 💡 **네이버 클라우드 서버 안정화**

- 외부 공격으로 인한 네이버 클라우드 서버 중단현상이 발생하였습니다.
- 문제 해결을 위해, 기존의 서버 데이터를 백업한 후 새로운 서버에 마운트 과정을 거치면서 복구를 하였으며 허용된 IP만 서버에 접근할 수 있도록 설정하여 서버의 보안과 안정성을 향상 시켰습니다.

<br>

<!--
## 📘 ERD
<div align = "center">
  <img src = "">
</div>
-->

## 📲 UI

<div align = "center">
  
| 메인 페이지 | 방 등록 |
| :---: | :---: |
| <img width="350" alt="메인페이지" src="https://github.com/SangHyeok-Kang/DataRepository/blob/9b7f711b74b3c595006fc3519018d4a78a480fa1/%EB%82%B4%EB%B0%A9%EC%96%B4%EB%95%8C/%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80.png"> | <img width="350" alt="방 등록" src="https://github.com/SangHyeok-Kang/DataRepository/blob/b89867881039ab86c66d46a188aecd691574d3a2/%EB%82%B4%EB%B0%A9%EC%96%B4%EB%95%8C/%EB%B0%A9%20%EB%93%B1%EB%A1%9D%20%ED%99%94%EB%A9%B4.png"> |

| 방 예약 | 예약 내역 조회 |
| :---: | :---: |
| <img width="350" alt="방 예약" src="https://github.com/SangHyeok-Kang/DataRepository/blob/b89867881039ab86c66d46a188aecd691574d3a2/%EB%82%B4%EB%B0%A9%EC%96%B4%EB%95%8C/%EC%98%88%EC%95%BD%20%ED%8E%98%EC%9D%B4%EC%A7%80.png"> | <img width="350" alt="예약 내역 조회" src="https://github.com/SangHyeok-Kang/DataRepository/blob/b89867881039ab86c66d46a188aecd691574d3a2/%EB%82%B4%EB%B0%A9%EC%96%B4%EB%95%8C/%EC%98%88%EC%95%BD%20%EB%82%B4%EC%97%AD%20%EC%A1%B0%ED%9A%8C.png"> |

</div>

<br>

## 👨‍👦팀 구성
<div align="center">

|강상혁 ``` Fullstack Dev ```| 송준섭 ```Backend Dev``` | 김성찬 ```Backend Dev``` | 김민승 ```Frontend Dev``` |
|:-:|:-:|:-:|:-:|
| <img src="https://avatars.githubusercontent.com/u/104892909?s=400&v=4" width=130> | <img src="https://avatars.githubusercontent.com/u/115469010?v=4" width=130> | <img src="https://avatars.githubusercontent.com/u/115801420?v=4" width=130> |
| [@SangHyeok-Kang](https://github.com/SangHyeok-Kang)| [@JunSeop-Song](https://github.com/Junseop-Song)| [@tjdckscert](https://github.com/tjdckscert)|

