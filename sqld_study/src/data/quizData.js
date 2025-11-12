const quizData = [
  {
    id: 1,
    question: "엔터티는 데이터베이스에서 관리되는 객체 또는 개념을 의미한다.",
    correctAnswer: "O",
    explanation:
      "엔터티는 업무에서 관리되는 데이터 집합으로, 저장되고 관리되어야 하는 데이터의 최소 단위입니다.",
    category: "엔터티",
  },
  {
    id: 2,
    question:
      "관계형 데이터베이스에서 속성(Attribute)은 테이블의 행(Row)을 의미한다.",
    correctAnswer: "X",
    explanation:
      "속성(Attribute)은 테이블의 열(Column)을 의미합니다. 행(Row)은 레코드 또는 튜플이라고 합니다.",
    category: "속성",
  },
  {
    id: 3,
    question:
      "정규화는 데이터의 중복을 최소화하고 무결성을 보장하기 위한 과정이다.",
    correctAnswer: "O",
    explanation:
      "정규화는 데이터의 중복을 최소화하고, 데이터의 일관성, 정확성, 단순성을 보장하기 위한 과정입니다.",
    category: "정규화",
  },
  {
    id: 4,
    question: "SQL에서 GROUP BY 절은 WHERE 절 이전에 실행된다.",
    correctAnswer: "X",
    explanation:
      "SQL 실행 순서는 FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY 순서로 실행됩니다.",
    category: "GROUP BY, HAVING 절",
  },
  {
    id: 5,
    question: "HAVING 절은 그룹화된 데이터에 조건을 적용할 때 사용한다.",
    correctAnswer: "O",
    explanation:
      "HAVING 절은 GROUP BY로 그룹화된 결과에 조건을 적용할 때 사용합니다. WHERE는 개별 행에 조건을 적용합니다.",
    category: "GROUP BY, HAVING 절",
  },
  {
    id: 6,
    question:
      "JOIN은 두 개 이상의 테이블을 연결하여 데이터를 검색하는 방법이다.",
    correctAnswer: "O",
    explanation:
      "JOIN은 두 개 이상의 테이블에서 관련된 행들을 결합하여 하나의 결과 집합을 만드는 연산입니다.",
    category: "조인",
  },
  {
    id: 7,
    question: "NULL 값은 0 또는 공백과 같은 값이다.",
    correctAnswer: "X",
    explanation:
      "NULL은 '알 수 없음' 또는 '해당 없음'을 의미하는 특수한 값으로, 0이나 공백과는 다릅니다.",
    category: "NULL 속성의 이해",
  },
  {
    id: 8,
    question:
      "인덱스(Index)는 데이터 검색 속도를 향상시키지만 데이터 입력, 수정, 삭제 작업의 성능은 저하시킬 수 있다.",
    correctAnswer: "O",
    explanation:
      "인덱스는 데이터 검색 속도를 향상시키지만, 데이터 변경 시 인덱스도 함께 업데이트해야 하므로 입력, 수정, 삭제 작업의 성능은 저하될 수 있습니다.",
    category: "관계형 데이터베이스 개요",
  },
  {
    id: 9,
    question:
      "서브쿼리(Subquery)는 메인 쿼리 내에서 독립적으로 실행될 수 없다.",
    correctAnswer: "X",
    explanation:
      "서브쿼리는 메인 쿼리와 독립적으로 실행될 수 있으며, 그 결과가 메인 쿼리에 사용됩니다.",
    category: "서브 쿼리",
  },
  {
    id: 10,
    question:
      "DCL(Data Control Language)은 데이터베이스 객체에 대한 접근 권한을 관리하는 SQL 명령어 집합이다.",
    correctAnswer: "O",
    explanation:
      "DCL은 GRANT, REVOKE 등의 명령어를 포함하며, 데이터베이스 객체에 대한 접근 권한을 관리합니다.",
    category: "DCL",
  },
  {
    id: 11,
    question:
      "식별자는 하나의 엔터티 내에서 인스턴스를 구분할 수 있는 구분자이다.",
    correctAnswer: "O",
    explanation:
      "식별자는 엔터티 내에서 각각의 인스턴스를 유일하게 구분할 수 있는 속성 또는 속성의 조합입니다.",
    category: "식별자",
  },
  {
    id: 12,
    question:
      "관계형 데이터베이스에서 관계(Relationship)는 엔터티 간의 업무적 연관성을 의미한다.",
    correctAnswer: "O",
    explanation:
      "관계는 두 개 이상의 엔터티 간에 존재하는 업무적 연관성을 의미하며, 이를 통해 데이터 간의 논리적 연결을 표현합니다.",
    category: "관계",
  },
  {
    id: 13,
    question:
      "데이터 모델링에서 1:N 관계는 한 엔터티의 하나의 인스턴스가 다른 엔터티의 여러 인스턴스와 관계를 맺는 것을 의미한다.",
    correctAnswer: "O",
    explanation:
      "1:N 관계는 하나의 부모 엔터티 인스턴스가 여러 개의 자식 엔터티 인스턴스와 관계를 맺는 것을 의미합니다.",
    category: "관계",
  },
  {
    id: 14,
    question:
      "제2정규형(2NF)은 제1정규형(1NF)을 만족하고 부분 함수적 종속성을 제거한 상태이다.",
    correctAnswer: "O",
    explanation:
      "제2정규형은 제1정규형을 만족하면서 기본키가 아닌 모든 속성이 기본키에 완전 함수적 종속인 상태로, 부분 함수적 종속성을 제거한 상태입니다.",
    category: "정규화",
  },
  {
    id: 15,
    question:
      "제3정규형(3NF)은 제2정규형(2NF)을 만족하고 이행적 함수 종속성을 제거한 상태이다.",
    correctAnswer: "O",
    explanation:
      "제3정규형은 제2정규형을 만족하면서 기본키가 아닌 모든 속성이 기본키에 이행적 함수 종속이 아닌 상태입니다.",
    category: "정규화",
  },
  {
    id: 16,
    question:
      "BCNF(Boyce-Codd Normal Form)는 제3정규형(3NF)보다 더 엄격한 정규형이다.",
    correctAnswer: "O",
    explanation:
      "BCNF는 제3정규형을 만족하면서 모든 결정자가 후보키인 상태로, 제3정규형보다 더 엄격한 정규형입니다.",
    category: "정규화",
  },
  {
    id: 17,
    question:
      "SQL에서 UNION 연산자는 두 개의 SELECT 문 결과를 합칠 때 중복된 행을 제거한다.",
    correctAnswer: "O",
    explanation:
      "UNION 연산자는 두 개의 SELECT 문 결과를 합치면서 중복된 행을 자동으로 제거합니다. 중복을 유지하려면 UNION ALL을 사용해야 합니다.",
    category: "집합 연산자",
  },
  {
    id: 18,
    question:
      "SQL에서 INTERSECT 연산자는 두 개의 SELECT 문 결과 중 공통된 행만 반환한다.",
    correctAnswer: "O",
    explanation:
      "INTERSECT 연산자는 두 개의 SELECT 문 결과에서 공통으로 존재하는 행만 반환합니다.",
    category: "집합 연산자",
  },
  {
    id: 19,
    question:
      "SQL에서 MINUS(또는 EXCEPT) 연산자는 첫 번째 SELECT 문의 결과에서 두 번째 SELECT 문의 결과를 제외한 행을 반환한다.",
    correctAnswer: "O",
    explanation:
      "MINUS(Oracle) 또는 EXCEPT(SQL Server, PostgreSQL)는 첫 번째 SELECT 문의 결과에서 두 번째 SELECT 문의 결과와 중복되는 행을 제외한 나머지 행을 반환합니다.",
    category: "집합 연산자",
  },
  {
    id: 20,
    question:
      "SQL에서 INNER JOIN은 두 테이블에서 조인 조건을 만족하는 행만 반환한다.",
    correctAnswer: "O",
    explanation:
      "INNER JOIN은 두 테이블에서 조인 조건을 만족하는 행만 결과에 포함시킵니다.",
    category: "조인",
  },
  {
    id: 21,
    question:
      "SQL에서 LEFT OUTER JOIN은 왼쪽 테이블의 모든 행과 오른쪽 테이블에서 조인 조건을 만족하는 행을 반환한다.",
    correctAnswer: "O",
    explanation:
      "LEFT OUTER JOIN은 왼쪽 테이블의 모든 행을 포함하고, 오른쪽 테이블에서는 조인 조건을 만족하는 행만 포함합니다. 조인 조건을 만족하지 않는 경우 오른쪽 테이블의 열은 NULL 값으로 채워집니다.",
    category: "조인",
  },
  {
    id: 22,
    question: "SQL에서 FULL OUTER JOIN은 양쪽 테이블의 모든 행을 반환한다.",
    correctAnswer: "O",
    explanation:
      "FULL OUTER JOIN은 양쪽 테이블의 모든 행을 포함하며, 조인 조건을 만족하지 않는 경우 해당 테이블의 열은 NULL 값으로 채워집니다.",
    category: "조인",
  },
  {
    id: 23,
    question:
      "SQL에서 SELF JOIN은 동일한 테이블을 자기 자신과 조인하는 것이다.",
    correctAnswer: "O",
    explanation:
      "SELF JOIN은 하나의 테이블을 자기 자신과 조인하는 것으로, 테이블 내에서 행과 행 사이의 관계를 찾을 때 사용합니다.",
    category: "조인",
  },
  {
    id: 24,
    question: "SQL에서 COUNT 함수는 NULL 값을 포함하여 행의 수를 계산한다.",
    correctAnswer: "X",
    explanation:
      "COUNT 함수는 NULL 값을 제외하고 행의 수를 계산합니다. 단, COUNT(*)는 NULL 값을 포함한 모든 행의 수를 계산합니다.",
    category: "함수",
  },
  {
    id: 25,
    question:
      "SQL에서 GROUP BY 절은 SELECT 절에 집계 함수가 없어도 사용할 수 있다.",
    correctAnswer: "O",
    explanation:
      "GROUP BY 절은 SELECT 절에 집계 함수가 없어도 사용할 수 있지만, SELECT 절에는 GROUP BY 절에 명시된 열이나 집계 함수만 사용할 수 있습니다.",
    category: "GROUP BY, HAVING 절",
  },
  {
    id: 26,
    question: "SQL에서 DELETE 문은 테이블의 구조를 변경한다.",
    correctAnswer: "X",
    explanation:
      "DELETE 문은 테이블에서 행을 삭제하는 DML 명령어로, 테이블의 구조는 변경하지 않습니다. 테이블 구조를 변경하는 것은 DDL 명령어인 ALTER TABLE입니다.",
    category: "DML",
  },
  {
    id: 27,
    question:
      "SQL에서 TRUNCATE 문은 테이블의 모든 행을 삭제하지만 테이블 구조는 유지한다.",
    correctAnswer: "O",
    explanation:
      "TRUNCATE 문은 테이블의 모든 행을 삭제하지만 테이블 구조는 유지합니다. DELETE와 달리 로그를 남기지 않아 더 빠르게 실행되며, 롤백이 불가능합니다.",
    category: "DDL",
  },
  {
    id: 28,
    question:
      "SQL에서 COMMIT 명령어는 트랜잭션의 변경 사항을 영구적으로 데이터베이스에 반영한다.",
    correctAnswer: "O",
    explanation:
      "COMMIT은 트랜잭션의 모든 변경 사항을 데이터베이스에 영구적으로 반영하는 TCL 명령어입니다.",
    category: "TCL",
  },
  {
    id: 29,
    question:
      "SQL에서 ROLLBACK 명령어는 트랜잭션의 변경 사항을 취소하고 이전 상태로 되돌린다.",
    correctAnswer: "O",
    explanation:
      "ROLLBACK은 트랜잭션의 모든 변경 사항을 취소하고 이전 상태로 되돌리는 TCL 명령어입니다.",
    category: "TCL",
  },
  {
    id: 30,
    question:
      "SQL에서 SAVEPOINT는 트랜잭션 내에서 특정 지점을 표시하여 부분적으로 롤백할 수 있게 한다.",
    correctAnswer: "O",
    explanation:
      "SAVEPOINT는 트랜잭션 내에서 특정 지점을 표시하여, ROLLBACK TO SAVEPOINT 명령어를 통해 해당 지점까지만 롤백할 수 있게 합니다.",
    category: "TCL",
  },
  {
    id: 31,
    question:
      "SQL에서 ALTER TABLE 명령어는 테이블의 구조를 변경하는 데 사용된다.",
    correctAnswer: "O",
    explanation:
      "ALTER TABLE은 테이블의 구조를 변경하는 DDL 명령어로, 열 추가/삭제/수정, 제약조건 추가/삭제 등의 작업을 수행할 수 있습니다.",
    category: "DDL",
  },
  {
    id: 32,
    question: "SQL에서 DROP TABLE 명령어는 테이블을 완전히 삭제한다.",
    correctAnswer: "O",
    explanation:
      "DROP TABLE은 테이블을 데이터베이스에서 완전히 삭제하는 DDL 명령어입니다. 테이블의 구조와 데이터가 모두 삭제됩니다.",
    category: "DDL",
  },
  {
    id: 33,
    question: "SQL에서 GRANT 명령어는 사용자에게 특정 권한을 부여한다.",
    correctAnswer: "O",
    explanation:
      "GRANT는 사용자에게 특정 객체에 대한 권한을 부여하는 DCL 명령어입니다.",
    category: "DCL",
  },
  {
    id: 34,
    question: "SQL에서 REVOKE 명령어는 사용자로부터 특정 권한을 회수한다.",
    correctAnswer: "O",
    explanation:
      "REVOKE는 사용자로부터 특정 객체에 대한 권한을 회수하는 DCL 명령어입니다.",
    category: "DCL",
  },
  {
    id: 35,
    question:
      "SQL에서 윈도우 함수(Window Function)는 행과 행 간의 관계를 쉽게 정의하기 위해 제공되는 함수이다.",
    correctAnswer: "O",
    explanation:
      "윈도우 함수는 행과 행 간의 관계를 정의하여 연산을 수행하는 함수로, OVER 절을 통해 윈도우를 정의하고 그 범위 내에서 집계, 순위 등을 계산합니다.",
    category: "윈도우 함수",
  },
  {
    id: 36,
    question:
      "SQL에서 ROW_NUMBER() 함수는 결과 집합의 각 행에 대해 고유한 순번을 부여한다.",
    correctAnswer: "O",
    explanation:
      "ROW_NUMBER()는 윈도우 함수의 일종으로, 결과 집합의 각 행에 대해 OVER 절에 정의된 순서에 따라 고유한 순번을 부여합니다.",
    category: "윈도우 함수",
  },
  {
    id: 37,
    question:
      "SQL에서 RANK() 함수는 동일한 값에 대해 동일한 순위를 부여하고, 다음 순위는 건너뛴다.",
    correctAnswer: "O",
    explanation:
      "RANK() 함수는 동일한 값에 대해 동일한 순위를 부여하고, 다음 순위는 중복된 개수만큼 건너뜁니다. 예를 들어, 1, 2, 2, 4와 같은 순위가 부여됩니다.",
    category: "윈도우 함수",
  },
  {
    id: 38,
    question:
      "SQL에서 DENSE_RANK() 함수는 동일한 값에 대해 동일한 순위를 부여하고, 다음 순위는 건너뛰지 않는다.",
    correctAnswer: "O",
    explanation:
      "DENSE_RANK() 함수는 동일한 값에 대해 동일한 순위를 부여하고, 다음 순위는 건너뛰지 않습니다. 예를 들어, 1, 2, 2, 3과 같은 순위가 부여됩니다.",
    category: "윈도우 함수",
  },
  {
    id: 39,
    question:
      "SQL에서 PARTITION BY 절은 윈도우 함수에서 그룹을 나누는 역할을 한다.",
    correctAnswer: "O",
    explanation:
      "PARTITION BY 절은 윈도우 함수에서 데이터를 그룹화하는 역할을 하며, 각 그룹 내에서 윈도우 함수가 독립적으로 적용됩니다.",
    category: "윈도우 함수",
  },
  {
    id: 40,
    question:
      "SQL에서 EXISTS 연산자는 서브쿼리의 결과가 하나 이상 존재하는지 확인한다.",
    correctAnswer: "O",
    explanation:
      "EXISTS 연산자는 서브쿼리의 결과가 하나 이상 존재하면 TRUE를 반환하고, 그렇지 않으면 FALSE를 반환합니다.",
    category: "서브 쿼리",
  },
  {
    id: 41,
    question:
      "테이블의 주식별자가 다른 테이블의 주식별자에 포함되는 경우 , 두 테이블은 비식별관계이다.",
    correctAnswer: "X",
    explanation:
      "식별 관계는 한 엔터티(또는 테이블)의 주식별자가 다른 엔터티(또는 테이블)의 주식별자에 포함되는 경우를 의미합니다. 이때, 식별자는 외래키로 사용될 뿐만 아니라 해당 테이블의 주식별자(PK)로도 포함되며, 두 테이블 간 관계는 식별 관계가 됩니다. 이러한 관계는 부모-자식 구조뿐만 아니라, 식별자 상호 포함 관계가 있는 모든 엔터티 간에 적용될 수 있습니다.",
    category: "데이터 모델의 이해(관계)",
  },
  {
    id: 42,
    question:
      "엔터티의 주식별자(PK)가 되기 위해서는 유일성,최소성,불변성,희소성 이 네 가지 속성을 만족해야 한다.",
    correctAnswer: "X",
    explanation:
      "엔터티의 주식별자(PK)가 되기 위해 필요한 조건은 유일성, 최소성, 불변성,존재성입니다.",
    category: "데이터 모델의 이해(관계)",
  },
  {
    id: 43,
    question:
      "데이터베이스에서 속성이 가질 수 있는 값의 형태를 정의하는 것을 시스템 카탈로그라고 한다.",
    correctAnswer: "X",
    explanation:
      "속성이 가질 수 있는 값의 형태를 정의하는 것은 **도메인(Domain)**의 개념이며,시스템 카탈로그는 DBMS 내부에서 객체(테이블, 인덱스 등)의 메타데이터를 저장하는 시스템 테이블을 의미합니다..",
    category: "데이터 모델의 이해(속성)",
  },
  {
    id: 44,
    question:
      "파생 속성은 다른 속성으로부터 계산되지만, 설계 속성은 시스템 구현 목적을 위해 추가되는 속성이다.",
    correctAnswer: "O",
    explanation:
      "파생 속성은 기존 데이터를 기반으로 계산되는 값이고, 설계 속성은 업무적 의미와 관계없이 시스템 설계나 관리 목적으로 추가됩니다.",
    category: "데이터 모델의 이해(속성)",
  },
  {
    id: 45,
    question: "설계 속성은 파생 속성과 같이 계산을 통해서 생성된다.",
    correctAnswer: "X",
    explanation:
      "설계 속성은 계산되지 않고, 주로 시스템에서 직접 관리하거나 저장하는 속성입니다. 파생 속성과는 다릅니다.",
    category: "데이터 모델의 이해(속성)",
  },
  {
    id: 46,
    question: "한 개의 엔터티는 두 개 이상의 관계를 가져야한다.",
    correctAnswer: "X",
    explanation: "엔터티는 1개 이상의 관계를 가지면 됩니다.",
    category: "데이터 모델의 이해(엔터티)",
  },
  // 시점에 따른 엔터티 구분 문제(기본,중심,행위)
  // 엔터티의 특징
  {
    id: 47,
    question:
      "엔터티와 엔터티가 1:M 관계의 부모와 자식관계에서 데이터가 부모없이 자식쪽 엔터티의 인스턴스가 먼저 생성될 수 있을 경우 비식별자 관계로 연결해야 한다.",
    correctAnswer: "O",
    explanation:
      "부모 엔터티 없이 자식 엔터티가 먼저 생성될 수 있는 경우, 자식은 부모의 키에 의존하지 않으므로 비식별자 관계로 설계해야 한다.",
    category: "데이터 모델의 이해(관계)",
  },

  {
    id: 48,
    question:
      "본질식별자는 엔터티 내에서 업무적으로 명확히 설명할 수 있는 의미가 부여된 식별자이다",
    correctAnswer: "O",
    explanation:
      "업무에 의해 도출된 의미 있는 속성으로 구성된 식별자를 본질식별자라고 하며, 이는 엔터티 자체의 의미를 내포하고 있다.",
    category: "데이터 모델의 이해(식별자)",
  },
];

export default quizData;
