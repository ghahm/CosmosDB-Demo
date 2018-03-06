원본 - https://github.com/Microsoft/developer-immersion-data/tree/master/labs/sp-gda/gdaexpericence1

을 참고하여 간편한 데모 환경을 구성하기 위해 수정한 버전입니다.

### Pre-requisites (보다 간단한 환경 구성과 실행 환경을 위해 원본과는 다르게 구성)
* Windows용 npm (https://nodejs.org/en/download/) : node.js로 작성된 웹앱 및 Cosmos DB의 데이터 생성용 스크립트 실행
* Visual Studio Code 또는 기타 Editor
* Angular CLI 2-1.0.0-alpha6 (Demo 순서에 포함되어 있음)

### Introduction (원본 내용)
It used to take extensive time and monotonous efforts to build a Globally Distributed Database conventionally. Also, there were some issues of **Latency** and **Consistency** in case of the data stored in a centralized location. So, to unravel this we will use the **Azure Cosmos Database**.

You will come across the power of Azure Cosmos DB's features such as **Turnkey global distribution, Consistency, Multi-model API, Partitioning, Failover mechanism** and **SLA's** using **ContosoAir** website along with **SQL DB API, Mongo DB API** and **Azure Functions**.

### Scenarios
[Intro](https://github.com/ghahm/CosmosDB-Demo-01/blob/master/content/intro.md) <br>
[Scenario 1: Globally distributed application for experiencing low latency](https://github.com/ghahm/CosmosDB-Demo-01/blob/master/content/0.md) <br>
[Scenario 2: Consistency (원본 링크)](https://github.com/Microsoft/developer-immersion-data/blob/master/labs/sp-gda/gdaexpericence1/story_a_gda_using_cosmosdb/content/1.md) <br>
[Scenario 3: Multi-model API (원본 링크)](https://github.com/Microsoft/developer-immersion-data/blob/master/labs/sp-gda/gdaexpericence1/story_a_gda_using_cosmosdb/content/2.md) <br>
[Scenario 4: Partitioning (원본 링크)](https://github.com/Microsoft/developer-immersion-data/blob/master/labs/sp-gda/gdaexpericence1/story_a_gda_using_cosmosdb/content/3.md) <br>
[Conclusion (원본 링크)](https://github.com/Microsoft/developer-immersion-data/blob/master/labs/sp-gda/gdaexpericence1/story_a_gda_using_cosmosdb/content/conclusion.md) <br>
<br>
***(참고)*** Scenario 2와 3의 Visual Studio 환경 및 실행 위치 등은 Scenario 1에서 설명한 변경 가이드를 참고하여 적절히 실행
