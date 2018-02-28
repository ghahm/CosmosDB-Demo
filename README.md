원본 - https://github.com/Microsoft/developer-immersion-data/tree/master/labs/sp-gda/gdaexpericence1

을 참고하여 간편한 데모 환경을 구성하기 위해 수정한 버전입니다.

### Pre-requisites (보다 간단한 환경 구성을 위해 원본과는 다르게 구성)
* Windows용 npm (https://nodejs.org/en/download/) - node.js로 작성된 웹앱 및 Cosmos DB의 데이터 생성용 스크립트 실행
* Visual Studio Code 또는 기타 Editor
* Angular CLI 2-1.0.0-alpha6 (Demo 순서에 포함되어 있음)

### Introduction (원본 내용)
It used to take extensive time and monotonous efforts to build a Globally Distributed Database conventionally. Also, there were some issues of **Latency** and **Consistency** in case of the data stored in a centralized location. So, to unravel this we will use the **Azure Cosmos Database**.

You will come across the power of Azure Cosmos DB's features such as **Turnkey global distribution, Consistency, Multi-model API, Partitioning, Failover mechanism** and **SLA's** using **ContosoAir** website along with **SQL DB API, Mongo DB API** and **Azure Functions**.

# 1. Clone this repo
   git clone https://github.com/hdinsight/tpcds-hdinsight/ && cd tpcds-hdinsight
# 2. Run TPCDSDataGen.hql with settings.hql file and set the required config variables
   hive -i settings.hql -f TPCDSDataGen.hql -hiveconf SCALE=500 -hiveconf PARTS=500 -hiveconf LOCATION=/HiveTPCDS/ -hiveconf TPCHBIN=resources
# 3. Create tables on the generated data
   hive -i settings.hql -f ddl/createAllExternalTables.hql -hiveconf LOCATION=/HiveTPCDS/ -hiveconf DBNAME=tpcds
# 4. Generate Parquet data (성능을 위해 Parquet 파일로 변환 / 사이즈에 따라 시간이 많이 소요됨)
   hive -i settings.hql -f ddl/createAllParquetTables.hql -hiveconf PARQUETDBNAME=tpcds_pqt -hiveconf SOURCE=tpcds
# 5. Run a test query
   beeline -u "jdbc:hive2://\`hostname -f\`:10002/tpcds_pqt;transportMode=http" -n "" -p "" -i settings.hql -f queries/query12.sql <br>
   <br>
   (주의 : 원본에는 10001 포트로 되어 있으나 10002로 수정하여 실행할 것. 10001은 Hive용 포트이고 10002는 Spark용 포트인데 10001로 실행할 경우 SQL의 Parsing 에러 발생. 테스트 쿼리가 SparkQL Syntax라 Hive Syntax에 맞지 않는 것으로 보임)
# 5. run the queries with Spark (10회 실행)
   for f in queries/*.sql; do for i in {1..10} ; do STARTTIME="`date +%s`";  beeline -u "jdbc:hive2://\`hostname -f\`:10002/tpcds_pqt;transportMode=http" -i sparksettings.hql -f $f  > $f.run_$i.out 2>&1 ; SUCCESS=$? ; ENDTIME="`date +%s`"; echo "$f,$i,$SUCCESS,$STARTTIME,$ENDTIME,$(($ENDTIME-$STARTTIME))" >> times_pqt.csv; done; done; <br>

### 참고
생성된 csv를 기본 container의 /hive 밑으로 복사하기<br>
* hadoop fs -put *.csv /hive
