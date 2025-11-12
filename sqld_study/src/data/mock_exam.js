export const exam1 = [
  {
    question:
      "데이터베이스에서 약한 개체(weak entity)를 가장 잘 설명한 것은 무엇인가?",
    explanation:
      "약한 개체는 자신의 기본 키가 없고 다른 개체의 외래 키에 의존하는 개체를 말합니다. 식별 관계(identifying relationship)를 통해 강한 개체에 의존적입니다.",
    options: [
      "단 하나의 속성만을 가진 개체",
      "항상 다른 개체와 일대일 관계를 가지는 개체",
      "어떤 속성에도 NULL 값을 가질 수 없는 개체",
      "자체 기본 키가 없고 다른 개체의 외래 키에 의존하는 개체 (식별 관계)",
    ],
    answer: 3,
  },
  {
    question:
      "부분 함수 종속성을 제거하는 정규형은 무엇인가? (비기본 속성이 전체 기본 키에 종속되도록 보장)",
    explanation:
      "제2정규형(2NF)은 부분 함수 종속성을 제거하여 모든 비기본 속성이 기본 키 전체에 종속되도록 합니다.",
    options: [
      "제1정규형 (1NF)",
      "제2정규형 (2NF)",
      "제3정규형 (3NF)",
      "보이스-코드 정규형 (BCNF)",
    ],
    answer: 1,
  },
  {
    question:
      "ER 다이어그램에서 세 개의 개체 타입을 포함하는 관계는 무엇으로 알려져 있는가?",
    explanation:
      "3개의 개체 타입을 연결하는 관계를 삼항 관계(Ternary relationship)라고 합니다.",
    options: ["단항 관계", "이항 관계", "삼항 관계", "N항 관계 (N > 3)"],
    answer: 2,
  },
  {
    question: "어떤 유형의 속성이 제1정규형(1NF) 정의를 위반하는가?",
    explanation:
      "1NF는 모든 속성이 원자값을 가져야 함을 요구합니다. 다중값 속성(Multi-valued attribute)은 이를 위반합니다.",
    options: [
      "복합 속성",
      "다중값 속성",
      "단일값(원자적) 속성",
      "외래 키 속성",
    ],
    answer: 1,
  },
  {
    question: "두 개체 간 다대다 관계를 가장 잘 설명한 문장은 무엇인가?",
    explanation:
      "다대다 관계는 한 개체의 여러 인스턴스가 다른 개체의 여러 인스턴스와 관련될 수 있는 관계입니다.",
    options: [
      "양쪽 개체 집합의 각 개체가 다른 집합의 여러 개체와 관련될 수 있음",
      "한 집합의 각 개체가 다른 집합의 정확히 한 개체와만 관련됨",
      "양쪽 집합의 각 개체가 다른 집합의 정확히 한 개체와만 관련됨",
      "한 집합의 개체가 다른 집합의 어떤 개체와도 관련되지 않음",
    ],
    answer: 0,
  },
  {
    question: "다음 중 대리 키(surrogate key)의 예는 무엇인가?",
    explanation:
      "대리 키는 비즈니스 의미와 무관하게 시스템에서 생성한 키로, 주로 자동 증가 숫자 ID가 사용됩니다.",
    options: [
      "기본 키로 사용되는 자동 생성 숫자 ID (예: 시퀀스 번호)",
      "키로 사용되는 고객의 사회 보장 번호",
      "여러 의미 있는 열의 조합",
      "매일 값이 변경되는 열",
    ],
    answer: 0,
  },
  {
    question:
      "관계형 데이터베이스에서 연결 테이블(associative/junction table)의 목적은 무엇인가?",
    explanation:
      "연결 테이블은 두 개체 간의 다대다 관계를 구현하기 위해 사용됩니다.",
    options: [
      "애플리케이션 로그를 저장하기 위해",
      "기본 키에 대한 참조 무결성을 강제하기 위해",
      "두 개체 간의 다대다 관계를 구현하기 위해",
      "변경 이력을 보관하기 위해",
    ],
    answer: 2,
  },
  {
    question:
      "두 개체 간 다대다 관계를 구현하는 데 필요한 최소 테이블 수는 몇 개인가?",
    explanation:
      "다대다 관계를 구현하려면 두 개의 기본 테이블과 하나의 연결 테이블이 필요하므로 최소 3개의 테이블이 필요합니다.",
    options: ["2", "3", "4", "5"],
    answer: 1,
  },
  {
    question: "관계형 데이터베이스에서 외래 키는 무엇인가?",
    explanation:
      "외래 키는 한 테이블의 속성 또는 속성 집합으로, 다른 테이블의 기본 키를 참조합니다.",
    options: [
      "한 테이블에서 다른 테이블의 기본 키를 참조하는 속성 또는 속성 집합",
      "동일한 테이블 내에서 행을 고유하게 식별하는 키",
      "테이블에서 중복 값을 허용하는 키",
      "여러 열로 구성된 키",
    ],
    answer: 0,
  },
  {
    question:
      "보이스-코드 정규형(BCNF)은 관계 내 모든 함수적 종속성에 대해 무엇을 요구하는가?",
    explanation:
      "BCNF는 모든 함수적 종속성에서 왼쪽 항이 해당 관계의 수퍼키(후보 키)여야 함을 요구합니다.",
    options: [
      "왼쪽 항이 관계의 수퍼키(후보 키)여야 함",
      "모든 속성이 기본 키에 종속되어야 함",
      "반복 그룹이 없어야 함",
      "비기본 속성이 다른 비기본 속성에 종속되지 않아야 함",
    ],
    answer: 0,
  },
  {
    question:
      "다음 중 모든 행을 빠르게 제거하고 개별 삭제를 기록하지 않고 저장 공간을 재설정하는 SQL 명령은 무엇인가?",
    explanation:
      "TRUNCATE TABLE은 테이블의 모든 행을 빠르게 제거하고 저장 공간을 재설정하며, 개별 삭제 작업을 기록하지 않습니다.",
    options: [
      "DELETE FROM table_name;",
      "TRUNCATE TABLE table_name;",
      "DROP TABLE table_name;",
      "REMOVE * FROM table_name;",
    ],
    answer: 1,
  },
  {
    question:
      '다음 중 Oracle에서 기존 "Employees" 테이블에 "age"(NUMBER 타입) 새 열을 추가하는 올바른 SQL 문은 무엇인가?',
    explanation:
      "Oracle에서 열을 추가할 때는 ALTER TABLE 테이블명 ADD (열명 데이터타입) 구문을 사용합니다.",
    options: [
      "ALTER TABLE Employees ADD (age NUMBER);",
      "ALTER TABLE Employees ADD COLUMN age NUMBER;",
      "ALTER Employees ADD age NUMBER;",
      "ALTER TABLE Employees ADD age INT;",
    ],
    answer: 0,
  },
  {
    question: "SQL 쿼리에서 SELECT DISTINCT를 사용하면 어떤 효과가 있는가?",
    explanation:
      "SELECT DISTINCT는 결과 집합에서 중복된 행을 제거하고 고유한 행만 반환합니다.",
    options: [
      "고유한 행만 반환 (중복 제거)",
      "결과 집합을 오름차순으로 정렬",
      "NULL 값을 제거할 수 있음",
      "각 행을 복제함",
    ],
    answer: 0,
  },
  {
    question:
      "주어진 테이블에서 다음 쿼리의 결과는 무엇인가?\n\nSELECT Region, SUM(Amount) AS Total\nFROM Orders\nGROUP BY Region;",
    diagram: {
      type: "table",
      columns: ["OrderID", "Region", "Amount"],
      rows: [
        [1, "East", 100],
        [2, "West", 200],
        [3, "East", 150],
      ],
    },
    explanation:
      "GROUP BY 절은 Region별로 행을 그룹화하고, SUM 함수로 각 Region의 Amount 합계를 계산합니다.",
    options: [
      "Region: East, Total: 250\nRegion: West, Total: 200",
      "Region: East, Total: 150\nRegion: West, Total: 300",
      "Region: East, Total: 100\nRegion: West, Total: 200",
      "Region: East, Total: 250\nRegion: West, Total: 0",
    ],
    answer: 0,
  },
  {
    question:
      "주어진 테이블에서 다음 쿼리는 무엇을 반환하는가?\n\nSELECT Category, COUNT(*) AS Cnt\nFROM Items\nGROUP BY Category\nHAVING SUM(Value) > 25;",
    diagram: {
      type: "table",
      columns: ["Category", "Value"],
      rows: [
        ["A", 10],
        ["A", 20],
        ["B", 15],
      ],
    },
    explanation:
      "HAVING 절은 그룹화된 결과를 필터링합니다. Category A의 Value 합계는 30(>25)이고 B는 15이므로 A만 반환됩니다.",
    options: ["Category: A", "Category: B", "Category: A and B", "No rows"],
    answer: 0,
  },
  {
    question:
      "Students(ID, Name)와 Scores(Stud_ID, Score) 테이블이 주어졌을 때 다음 쿼리의 결과는 무엇인가?\n\nSELECT s.ID, s.Name, sc.Score\nFROM Students s JOIN Scores sc ON s.ID = sc.Stud_ID;",
    diagram: {
      type: "tables",
      tables: [
        {
          name: "Students",
          columns: ["ID", "Name"],
          rows: [
            [1, "Alice"],
            [2, "Bob"],
            [3, "Carol"],
          ],
        },
        {
          name: "Scores",
          columns: ["Stud_ID", "Score"],
          rows: [
            [1, 90],
            [1, 85],
            [3, 75],
          ],
        },
      ],
    },
    explanation:
      "INNER JOIN은 두 테이블에서 일치하는 행만 반환합니다. ID 2(Bob)는 Scores에 없으므로 결과에 포함되지 않습니다.",
    options: [
      "ID: 1, Name: Alice, Score: 90\nID: 1, Name: Alice, Score: 85\nID: 3, Name: Carol, Score: 75",
      "ID: 1, Name: Alice, Score: 90\nID: 2, Name: Bob, Score: 85\nID: 3, Name: Carol, Score: 75",
      "ID: 1, Name: Alice, Score: 90\nID: 1, Name: Alice, Score: 85",
      "ID: 3, Name: Carol, Score: 75",
    ],
    answer: 0,
  },
  {
    question:
      "다음 중 왼쪽 테이블의 모든 행과 오른쪽 테이블의 일치하는 행을 반환하며, 일치하지 않는 경우 NULL을 삽입하는 SQL JOIN은 무엇인가?",
    explanation:
      "LEFT OUTER JOIN은 왼쪽 테이블의 모든 행을 보존하고 오른쪽 테이블에서 일치하지 않는 행에는 NULL을 반환합니다.",
    options: [
      "LEFT OUTER JOIN",
      "RIGHT OUTER JOIN",
      "INNER JOIN",
      "CROSS JOIN",
    ],
    answer: 0,
  },
  {
    question:
      "테이블 A에 2행, 테이블 B에 3행이 있다면 A와 B의 CROSS JOIN은 몇 행을 반환하는가?",
    explanation:
      "CROSS JOIN은 두 테이블의 카티션 곱을 반환하므로 2(A) * 3(B) = 6행이 반환됩니다.",
    options: ["2", "3", "5", "6"],
    answer: 3,
  },
  {
    question: "SQL에서 ANY 키워드는 어떤 다른 키워드와 동의어인가?",
    explanation:
      "ANY는 SOME과 동의어로, 하위 쿼리에서 하나 이상의 값이 조건을 만족하면 TRUE를 반환합니다.",
    options: ["ALL", "SOME", "ANY", "SINGULAR"],
    answer: 1,
  },
  {
    question:
      "주어진 테이블에서 다음 쿼리의 결과는 무엇인가?\n\nSELECT p.ProjectID\nFROM Projects p\nWHERE p.DeptID > ALL (SELECT DeptID FROM Departments WHERE Budget < 1500);",
    diagram: {
      type: "tables",
      tables: [
        {
          name: "Projects",
          columns: ["ProjectID", "DeptID"],
          rows: [
            [1, 10],
            [2, 20],
            [3, 10],
          ],
        },
        {
          name: "Departments",
          columns: ["DeptID", "Budget"],
          rows: [
            [10, 1000],
            [20, 2000],
          ],
        },
      ],
    },
    explanation:
      "ALL은 하위 쿼리의 모든 값보다 커야 합니다. Budget < 1500인 부서는 DeptID 10뿐이므로 DeptID > 10인 프로젝트는 ProjectID 2뿐입니다.",
    options: ["2", "1", "3", "No rows"],
    answer: 0,
  },
  {
    question:
      "다음 중 SQL에서 UNION과 UNION ALL의 차이를 설명한 것은 무엇인가?",
    explanation:
      "UNION은 중복 행을 제거한 결과를 반환하고, UNION ALL은 중복을 포함한 모든 행을 반환합니다.",
    options: [
      "UNION은 결과 집합 간 중복 행을 제거; UNION ALL은 중복 포함",
      "UNION은 중복 포함; UNION ALL은 중복 제거",
      "둘 다 중복 제거",
      "둘 다 중복 포함",
    ],
    answer: 0,
  },
  {
    question:
      "다음 중 현재 트랜잭션에서 마지막 COMMIT 이후의 모든 변경 사항을 취소하는 SQL 문은 무엇인가?",
    explanation:
      "ROLLBACK은 현재 트랜잭션의 모든 변경 사항을 취소하고 데이터베이스를 이전 상태로 되돌립니다.",
    options: ["ABORT", "ROLLBACK", "UNDO", "CANCEL TRANSACTION"],
    answer: 1,
  },
  {
    question:
      "다음 중 테이블에 대한 권한을 사용자에게 부여하는 SQL 문은 무엇인가?",
    explanation:
      "GRANT 문은 특정 권한을 사용자 또는 역할에 부여하는 데 사용됩니다.",
    options: [
      "GRANT SELECT ON table_name TO user;",
      "ENABLE PRIVILEGES ON table_name TO user;",
      "ALLOW PRIVILEGES ON table_name TO user;",
      "SET GRANTS FOR user ON table_name;",
    ],
    answer: 0,
  },
  {
    question:
      "주어진 테이블에서 다음 쿼리의 결과는 무엇인가?\n\nSELECT Name, RANK() OVER (ORDER BY Salary DESC) AS rnk FROM Employees;",
    diagram: {
      type: "table",
      columns: ["Name", "Salary"],
      rows: [
        ["Bob", 200],
        ["Alice", 100],
        ["Charlie", 200],
        ["David", 150],
      ],
    },
    explanation:
      "RANK() 함수는 동일한 값에 대해 같은 순위를 부여하고 다음 순위를 건너뜁니다. 200이 두 명이므로 1위, 다음 150은 3위, 100은 4위입니다.",
    options: [
      "Bob 1\nCharlie 1\nDavid 3\nAlice 4",
      "Bob 1\nCharlie 2\nDavid 3\nAlice 4",
      "Bob 1\nCharlie 1\nDavid 2\nAlice 3",
      "Bob 1\nCharlie 1\nDavid 3\nAlice 3",
    ],
    answer: 0,
  },
  {
    question:
      "주어진 테이블에서 다음 쿼리의 결과는 무엇인가?\n\nSELECT Student, Score, LAG(Score, 1, 0) OVER (PARTITION BY Student ORDER BY Score) AS prev_score\nFROM Scores;",
    diagram: {
      type: "table",
      columns: ["Student", "Score"],
      rows: [
        ["Stu1", 50],
        ["Stu1", 60],
        ["Stu1", 70],
        ["Stu2", 80],
        ["Stu2", 100],
      ],
    },
    explanation:
      "LAG 함수는 현재 행보다 앞선 행의 값을 가져옵니다. PARTITION BY Student로 학생별로 그룹화하고, 첫 행의 경우 이전 값이 없으므로 기본값 0을 반환합니다.",
    options: [
      "Stu1 50 0\nStu1 60 50\nStu1 70 60\nStu2 80 0\nStu2 100 80",
      "Stu1 50 0\nStu1 60 0\nStu1 70 0\nStu2 80 0\nStu2 100 0",
      "Stu1 50 50\nStu1 60 60\nStu1 70 70\nStu2 80 80\nStu2 100 100",
      "Stu1 50 0\nStu1 60 50\nStu1 70 60\nStu2 80 0\nStu2 100 0",
    ],
    answer: 0,
  },
  {
    question: "다음 중 SQL 집계 함수는 무엇인가?",
    explanation:
      "COUNT는 행의 수를 세는 집계 함수입니다. 다른 옵션들은 문자열 함수입니다.",
    options: ["COUNT", "UPPER", "CONCAT", "LENGTH"],
    answer: 0,
  },
  {
    question:
      "주어진 테이블에서 다음 쿼리의 결과는 무엇인가?\n\nSELECT val FROM A WHERE val NOT IN (SELECT val FROM B);",
    diagram: {
      type: "tables",
      tables: [
        { name: "A", columns: ["val"], rows: [[1], [2], [3]] },
        { name: "B", columns: ["val"], rows: [[2], [3]] },
      ],
    },
    explanation:
      "NOT IN은 하위 쿼리 결과에 없는 값을 선택합니다. B 테이블에 없는 A의 값은 1뿐입니다.",
    options: ["1", "2", "3", "No rows"],
    answer: 0,
  },
  {
    question: "SQL에서 WHERE 절의 EXISTS 조건은 어떤 경우에 TRUE를 반환하는가?",
    explanation:
      "EXISTS는 하위 쿼리가 하나 이상의 행을 반환하면 TRUE를 반환합니다.",
    options: [
      "하위 쿼리가 하나 이상의 행을 반환할 때",
      "하위 쿼리가 행을 반환하지 않을 때",
      "하위 쿼리의 어떤 열이 NULL일 때",
      "메인 쿼리에 DISTINCT가 있을 때",
    ],
    answer: 0,
  },
  {
    question:
      "다음 중 SQL에서 패턴 매칭에 사용되는 연산자는 무엇인가? (예: 'A%'와 같은 값 찾기)",
    explanation:
      "LIKE 연산자는 문자열 패턴 매칭에 사용되며, '%'는 여러 문자, '_'는 단일 문자 와일드카드로 사용됩니다.",
    options: ["=", "<>", "LIKE", "IN"],
    answer: 2,
  },
  {
    question:
      "SQL에서 ORDER BY에 ASC 또는 DESC를 지정하지 않을 때 기본 정렬 순서는 무엇인가?",
    explanation:
      "ORDER BY 절에 방향을 지정하지 않으면 기본적으로 오름차순(ASC)으로 정렬됩니다.",
    options: [
      "오름차순 (ASC)",
      "내림차순 (DESC)",
      "데이터베이스에 따라 다름",
      "보장된 순서 없음",
    ],
    answer: 0,
  },
  {
    question: "다음 SQL 표현식의 결과는 무엇인가: COALESCE(NULL, 'A', 'B')?",
    explanation:
      "COALESCE 함수는 NULL이 아닌 첫 번째 인수를 반환합니다. 여기서는 'A'가 첫 번째 NULL이 아닌 값입니다.",
    options: ["NULL", "A", "B", "Error"],
    answer: 1,
  },
  {
    question: "다음 중 유효한 SQL 비교 연산자가 아닌 것은 무엇인가?",
    explanation:
      "DIFFERENT는 표준 SQL 비교 연산자가 아닙니다. 대신 <> 또는 !=를 사용합니다.",
    options: ["LIKE", "BETWEEN", "DIFFERENT", "IN"],
    answer: 2,
  },
  {
    question: "새 트랜잭션을 명시적으로 시작하는 SQL 문은 무엇인가?",
    explanation:
      "BEGIN TRANSACTION은 새 트랜잭션을 명시적으로 시작하는 표준 SQL 문입니다.",
    options: [
      "BEGIN TRANSACTION;",
      "START TRANSACTION;",
      "INIT TRANSACTION;",
      "SET TRANSACTION;",
    ],
    answer: 0,
  },
  {
    question:
      "Oracle SQL에서 두 문자열 값을 연결하는 데 사용되는 연산자는 무엇인가?",
    explanation:
      "Oracle에서는 문자열 연결에 || 연산자를 사용합니다. 다른 DBMS에서는 +나 CONCAT 함수를 사용할 수 있습니다.",
    options: ["||", "+", "&", "CONCAT"],
    answer: 0,
  },
  {
    question: "쿼리 결과 집합을 정렬하는 데 사용되는 SQL 절은 무엇인가?",
    explanation: "ORDER BY 절은 결과 집합을 지정된 열 기준으로 정렬합니다.",
    options: ["ORDER BY", "GROUP BY", "SORT BY", "HAVING"],
    answer: 0,
  },
  {
    question:
      "테이블 정의와 모든 데이터를 데이터베이스에서 제거하는 SQL 문은 무엇인가?",
    explanation:
      "DROP TABLE은 테이블 구조와 데이터를 완전히 삭제합니다. DELETE나 TRUNCATE는 데이터만 삭제합니다.",
    options: [
      "DELETE TABLE table_name;",
      "DROP TABLE table_name;",
      "TRUNCATE TABLE table_name;",
      "REMOVE TABLE table_name;",
    ],
    answer: 1,
  },
  {
    question:
      "현재 트랜잭션을 종료하고 모든 변경 사항을 영구적으로 만드는 SQL 문은 무엇인가?",
    explanation:
      "COMMIT은 현재 트랜잭션의 모든 변경 사항을 영구적으로 적용합니다.",
    options: ["SAVEPOINT", "ROLLBACK", "COMMIT", "SET TRANSACTION"],
    answer: 2,
  },
  {
    question: "CREATE TABLE 문에서 DEFAULT 키워드는 무엇을 하는가?",
    explanation:
      "DEFAULT는 열에 값이 제공되지 않을 때 사용할 기본값을 지정합니다.",
    options: [
      "값이 제공되지 않을 때 열의 기본값 지정",
      "열을 기본 키로 선언",
      "열 별칭 할당",
      "열이 NULL이 될 수 없음을 나타냄",
    ],
    answer: 0,
  },
  {
    question:
      "테이블 A와 테이블 B 간의 FULL OUTER JOIN에 대한 설명으로 옳은 것은 무엇인가?",
    explanation:
      "FULL OUTER JOIN은 양쪽 테이블의 모든 행을 반환하며, 일치하지 않는 열에는 NULL을 삽입합니다.",
    options: [
      "A와 B의 모든 행을 반환하고, 일치하지 않는 열에는 NULL을 삽입",
      "A와 B에서 일치하는 행만 반환",
      "A의 모든 행을 반환하지만 B의 행은 반환하지 않음",
      "항상 빈 집합을 반환",
    ],
    answer: 0,
  },
  {
    question:
      "두 SELECT 쿼리의 결과 집합을 중복을 포함해 결합하는 SQL 연산자는 무엇인가?",
    explanation:
      "UNION ALL은 두 결과 집합을 결합하며 중복 행을 제거하지 않습니다.",
    options: ["UNION", "INTERSECT", "UNION ALL", "EXCEPT"],
    answer: 2,
  },
  {
    question:
      "Oracle 데이터베이스(및 많은 다른 데이터베이스)의 기본 트랜잭션 격리 수준은 무엇인가?",
    explanation:
      "대부분의 데이터베이스(오라클 포함)는 기본 격리 수준으로 Read Committed를 사용합니다.",
    options: [
      "Read Uncommitted",
      "Read Committed",
      "Repeatable Read",
      "Serializable",
    ],
    answer: 1,
  },
  {
    question: "SQL에서 NULL 값은 다음 중 무엇을 나타내는가?",
    explanation:
      "NULL은 알려지지 않았거나 존재하지 않는 데이터를 나타냅니다. 0이나 빈 문자열과는 다릅니다.",
    options: [
      "숫자 0",
      "빈 문자열",
      "알려지지 않았거나 누락된 데이터",
      "데이터의 끝",
    ],
    answer: 2,
  },
  {
    question: "테이블의 기존 행을 수정하는 SQL 문은 무엇인가?",
    explanation: "UPDATE 문은 테이블의 기존 행을 수정하는 데 사용됩니다.",
    options: ["MODIFY", "CHANGE", "UPDATE", "ALTER"],
    answer: 2,
  },
  {
    question:
      "주어진 테이블에서 다음 쿼리의 결과는 무엇인가?\n\nSELECT COUNT(*) AS total_rows, COUNT(B) AS non_null_B\nFROM T;",
    diagram: {
      type: "table",
      columns: ["A", "B"],
      rows: [
        [1, 10],
        [2, null],
        [null, 20],
      ],
    },
    explanation:
      "COUNT(*)는 NULL 포함 모든 행을 세고, COUNT(열명)은 해당 열의 NULL이 아닌 값만 셉니다.",
    options: [
      "total_rows=3, non_null_B=2",
      "total_rows=3, non_null_B=1",
      "total_rows=2, non_null_B=2",
      "total_rows=2, non_null_B=1",
    ],
    answer: 0,
  },
  {
    question: "다음 SQL 표현식은 무엇을 하는가: CAST( '123' AS NUMBER )?",
    explanation:
      "CAST는 데이터 유형을 변환합니다. 이 경우 문자열 '123'을 숫자 값으로 변환합니다.",
    options: [
      "문자열 '123'을 숫자 값으로 변환",
      "숫자 123을 문자열로 변환",
      "123을 가장 가까운 정수로 반올림",
      "오류 발생",
    ],
    answer: 0,
  },
  {
    question:
      "다음 절 중 SUM이나 COUNT 같은 집계 함수를 포함할 수 없는 것은 무엇인가?",
    explanation:
      "WHERE 절은 행 단위로 필터링하므로 집계 함수를 사용할 수 없습니다. 집계 결과 필터링에는 HAVING을 사용합니다.",
    options: ["WHERE", "GROUP BY", "HAVING", "SELECT"],
    answer: 0,
  },
  {
    question: "다음 중 표준 SQL 키워드가 아닌 것은 무엇인가?",
    explanation:
      "SEARCH는 표준 SQL 키워드가 아닙니다. 나머지는 모두 기본 SQL 명령어입니다.",
    options: ["SELECT", "JOIN", "DELETE", "SEARCH"],
    answer: 3,
  },
  {
    question: "SQL에서 숫자 값 사이에 사용된 '+' 연산자는 무엇을 수행하는가?",
    explanation:
      "숫자 값 사이의 + 연산자는 수학적 덧셈을 수행합니다. 문자열 연결은 DBMS에 따라 ||나 CONCAT을 사용합니다.",
    options: ["문자열 연결", "덧셈", "곱셈", "논리 AND"],
    answer: 1,
  },
  {
    question: "SQL 표현식 SUBSTR('HELLO', 2, 3)의 결과는 무엇인가?",
    explanation:
      "SUBSTR은 문자열의 일부를 추출합니다. 2번째 위치('E')부터 3문자를 추출하면 'ELL'이 됩니다.",
    options: ["HEL", "ELL", "LLO", "Error"],
    answer: 1,
  },
  {
    question:
      "두 쿼리의 결과 집합에서 공통된 행만 반환하는 SQL 연산자는 무엇인가?",
    explanation: "INTERSECT는 두 결과 집합의 교집합(공통 행)을 반환합니다.",
    options: ["UNION", "INTERSECT", "EXCEPT", "ALL"],
    answer: 1,
  },
];

export const exam2 = [
  {
    question:
      "데이터베이스 테이블에서 기본 키(Primary Key)와 고유 키(Unique Key)의 차이점은 무엇인가요?",
    options: [
      "기본 키는 NULL을 허용하지 않지만, 고유 키는 하나의 NULL 값을 허용할 수 있습니다",
      "고유 키는 중복 값을 가질 수 없지만 기본 키는 가질 수 있습니다",
      "차이가 없으며 동일합니다",
      "기본 키는 숫자 열에만 사용됩니다",
    ],
    answer: 0,
    해설: "기본 키는 행을 고유하게 식별하는 데 사용되며 NULL 값을 허용하지 않습니다. 고유 키도 중복 값을 허용하지 않지만, 대부분의 DBMS에서 하나의 NULL 값을 허용합니다. 기본 키는 테이블당 하나만 지정 가능하지만 고유 키는 여러 개 생성할 수 있습니다.",
  },
  {
    question:
      "어떤 정규형이 비키 속성이 기본 키에 이행적으로 종속되는 것을 방지하나요?",
    options: [
      "제2정규형(2NF)",
      "제3정규형(3NF)",
      "제4정규형(4NF)",
      "제1정규형(1NF)",
    ],
    answer: 1,
    해설: "제3정규형(3NF)은 이행 종속성(Transitive Dependency)을 제거하는 정규화 단계입니다. 즉, 비주요 속성이 기본 키가 아닌 다른 비주요 속성에 종속되는 경우를 제거합니다. 예를 들어 [학생ID] → [학과] → [학과사무실] 관계에서 학과사무실 정보를 별도 테이블로 분리해야 합니다.",
  },
  {
    question: "데이터베이스에서 복합 키(Composite Key)란 무엇인가요?",
    options: [
      "여러 열의 조합으로 행을 고유하게 식별하는 키",
      "기본 키이면서 외래 키인 키",
      "중복 값을 허용하는 키",
      "텍스트 타입만으로 구성된 키",
    ],
    answer: 0,
    해설: "복합 키는 두 개 이상의 컬럼을 조합하여 고유성을 보장하는 키입니다. 예를 들어, 수강 신청 시스템에서 [학생ID, 강좌ID] 조합으로 복합 키를 구성할 수 있습니다. 단일 컬럼으로는 고유성을 보장할 수 없을 때 사용됩니다.",
  },
  {
    question:
      "관계형 데이터베이스에서 참조 무결성(Referential Integrity)이 보장하는 것은 무엇인가요?",
    options: [
      "외래 키 값은 참조 테이블의 기본 키 값과 일치하거나 NULL이어야 함",
      "모든 컬럼에 UNIQUE 제약이 있어야 함",
      "각 테이블에 최소 하나의 기본 키가 있어야 함",
      "모든 기본 키는 정수형이어야 함",
    ],
    answer: 0,
    해설: "참조 무결성은 외래 키가 참조하는 테이블에 존재하는 값만을 가질 수 있도록 제한합니다. 예를 들어 주문 테이블의 고객ID는 반드시 고객 테이블에 존재하는 ID여야 합니다. ON DELETE CASCADE나 ON DELETE SET NULL 옵션으로 삭제 동작을 제어할 수 있습니다.",
  },
  {
    question:
      "데이터 모델링에서 카디널리티 비율(Cardinality Ratio)이 설명하는 것은 무엇인가요?",
    options: [
      "한 엔터티 인스턴스가 다른 엔터티 인스턴스와 연결될 수 있는/필요한 수량 관계",
      "관계에 참여하는 엔터티의 총 수",
      "속성이 테이블에 저장되는 방식",
      "테이블의 물리적 저장 크기",
    ],
    answer: 0,
    해설: "카디널리티는 엔터티 간의 수적 관계를 나타내며, 1:1(일대일), 1:N(일대다), M:N(다대다) 등의 유형이 있습니다. 예를 들어 '한 학생은 여러 강의를 수강할 수 있고, 한 강의는 여러 학생이 수강할 수 있다'는 M:N 관계입니다.",
  },
  {
    question:
      "테이블에 복합 기본 키(A, B)가 있고, 비키 속성 C가 A에만 종속될 때 이를 무엇이라고 하나요?",
    options: ["이행 종속성", "부분 종속성", "완전 종속성", "다중값 종속성"],
    answer: 1,
    해설: "부분 종속성(Partial Dependency)은 복합 키의 일부에만 종속되는 현상으로, 제2정규형(2NF)에서 제거해야 합니다. 예를 들어 [주문번호, 상품코드]가 복합 키일 때 [주문일자]가 [주문번호]에만 종속되는 경우가 해당됩니다.",
  },
  {
    question: "다중값 속성(Multi-valued Attribute)에 대한 설명으로 옳은 것은?",
    options: [
      "단일 엔터티 인스턴스에 대해 여러 값을 가질 수 있는 속성",
      "복합 속성(Composite Attribute)과 동일한 개념",
      "1NF를 만족시키기 위해 반드시 필요한 속성",
      "단 하나의 값만 가질 수 있는 속성",
    ],
    answer: 0,
    해설: "다중값 속성은 하나의 엔터티가 여러 값을 가질 수 있는 속성입니다. 예를 들어 한 사람이 여러 전화번호를 가질 수 있는 경우입니다. 이러한 속성은 일반적으로 별도의 테이블로 분리하거나 배열 타입으로 저장합니다.",
  },
  {
    question:
      "다음 중 데이터베이스 정규화의 일반적인 결과가 아닌 것은 무엇인가요?",
    options: [
      "쿼리 성능 향상",
      "데이터 중복 감소",
      "갱신 이상(Update Anomaly) 감소",
      "데이터 무결성 단순화",
    ],
    answer: 0,
    해설: "정규화는 과도하게 수행될 경우 조인 연산이 증가하여 쿼리 성능이 저하될 수 있습니다. 정규화의 주요 목적은 데이터 중복 제거, 무결성 향상, 갱신 이상 방지 등에 있으며, 성능 향상은 일반적으로 정규화의 직접적인 목적이 아닙니다.",
  },
  {
    question:
      "까마귀발 표기법(Crow's Foot Notation)으로 된 ER 다이어그램에서 까마귀발 기호가 나타내는 것은 무엇인가요?",
    options: [
      "관계의 '다수' 측면",
      "관계의 '단일' 측면",
      "0 또는 1의 관계 측면",
      "필수 참여를 나타냄",
    ],
    answer: 0,
    해설: "까마귀발 표기법에서 까마귀발 기호(세 개의 갈래선)는 '다수'를 의미합니다. 예를 들어 '학과 1 : N 학생' 관계에서 학생 쪽에 까마귀발이 표시됩니다. 이 표기법은 데이터 모델링 도구에서 널리 사용됩니다.",
  },
  {
    question: "슈퍼키(Superkey)를 가장 잘 정의한 것은 무엇인가요?",
    options: [
      "레코드를 고유하게 식별할 수 있는 속성들의 집합(최소성은 필요 없음)",
      "외래 키와 짝을 이루는 기본 키",
      "정확히 두 개의 속성으로 구성된 키",
      "기본 키에 포함되지 않은 속성",
    ],
    answer: 0,
    해설: "슈퍼키는 행을 고유하게 식별할 수 있는 속성들의 집합으로, 최소성을 만족하지 않아도 됩니다. 후보키(Candidate Key)는 최소성을 만족하는 슈퍼키이며, 기본 키는 이 중 선택된 하나의 키입니다. 예를 들어 [사원ID], [사원ID, 주민번호] 모두 슈퍼키입니다.",
  },
  {
    question:
      "다음 중 OrderID와 CustomerID 컬럼을 가진 Orders 테이블을 생성하는 올바른 SQL 문은 무엇인가요? (CustomerID는 Customers 테이블의 CustomerID를 참조하는 외래 키)",
    options: [
      "CREATE TABLE Orders (OrderID NUMBER PRIMARY KEY, CustomerID NUMBER, FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));",
      "CREATE TABLE Orders (OrderID NUMBER, CustomerID NUMBER, PRIMARY KEY (OrderID), FOREIGN KEY (CustomerID) References Customers);",
      "CREATE TABLE Orders (OrderID NUMBER PRIMARY KEY, CustomerID NUMBER, FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));",
      "CREATE Orders (OrderID NUMBER PRIMARY KEY, CustomerID NUMBER, FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));",
    ],
    answer: 0,
    해설: "올바른 테이블 생성 문법은 CREATE TABLE 문으로 시작하며, 외래 키 제약 조건은 REFERENCES 키워드와 함께 참조 테이블과 컬럼을 명시해야 합니다. 첫 번째 옵션이 정확한 문법을 따르고 있습니다.",
  },
  {
    question:
      "Employees 테이블에서 급여(salary)가 5000 미만인 모든 행을 삭제하는 SQL 문은 무엇인가요?",
    options: [
      "DELETE Employees WHERE salary < 5000;",
      "DELETE * FROM Employees WHERE salary < 5000;",
      "DELETE FROM Employees WHERE salary < 5000;",
      "REMOVE FROM Employees WHERE salary < 5000;",
    ],
    answer: 2,
    해설: "표준 SQL에서 행 삭제 문법은 'DELETE FROM 테이블명 WHERE 조건'입니다. 세 번째 옵션이 올바른 문법이며, 첫 번째 옵션은 FROM이 누락되었고, 네 번째 옵션은 REMOVE라는 존재하지 않는 키워드를 사용했습니다.",
  },
  {
    question: "어떤 유형의 JOIN이 두 테이블에서 매칭되는 행만 반환하나요?",
    options: [
      "INNER JOIN",
      "LEFT OUTER JOIN",
      "RIGHT OUTER JOIN",
      "FULL OUTER JOIN",
    ],
    answer: 0,
    해설: "INNER JOIN(내부 조인)은 조인 조건을 만족하는 행만 결과에 포함시킵니다. OUTER JOIN(외부 조인)은 조건을 만족하지 않아도 한쪽 테이블의 모든 행을 포함시킬 수 있습니다.",
  },
  {
    question:
      "SQL에서 컬럼 X를 기준으로 결과를 내림차순 정렬하기 위해 사용하는 절은 무엇인가요?",
    options: [
      "ORDER BY X DESC",
      "GROUP BY X DESC",
      "SORT BY X DESC",
      "ORDER BY X ASC",
    ],
    answer: 0,
    해설: "정렬은 ORDER BY 절로 수행하며, DESC는 내림차순, ASC는 오름차순(기본값)을 지정합니다. GROUP BY는 정렬이 아닌 그룹화에 사용되며, SORT BY는 표준 SQL 키워드가 아닙니다.",
  },
  {
    question:
      "GROUP BY를 사용한 SELECT 쿼리에서 GROUP BY 절에 어떤 컬럼들이 포함되어야 하나요?",
    options: [
      "SELECT 절에 나열된 비집계 컬럼 모두",
      "모든 컬럼(집계 여부 상관없이)",
      "집계된 컬럼만",
      "어떤 컬럼도 포함되지 않아도 됨",
    ],
    answer: 0,
    해설: "GROUP BY 절에는 SELECT 절에 사용된 비집계(non-aggregated) 컬럼이 모두 포함되어야 합니다. 예를 들어 'SELECT dept, AVG(salary) FROM employees GROUP BY dept'에서 dept는 GROUP BY에 필수입니다.",
  },
  {
    question:
      "트랜잭션 내에서 'S1'이라는 이름의 세이브포인트를 생성하는 SQL 문은 무엇인가요?",
    options: [
      "SAVEPOINT S1;",
      "MARK TRANSACTION S1;",
      "SAVE TRANS S1;",
      "CREATE SAVEPOINT S1;",
    ],
    answer: 0,
    해설: "세이브포인트 생성은 'SAVEPOINT 세이브포인트명' 문법을 사용합니다. 이를 통해 트랜잭션의 중간 지점을 저장하고, 필요시 ROLLBACK TO SAVEPOINT 명령으로 해당 지점까지 롤백할 수 있습니다.",
  },
  {
    question:
      "Oracle에서 'seq1'이라는 이름의 시퀀스 객체를 생성하는 SQL 문은 무엇인가요?",
    options: [
      "CREATE SEQUENCE seq1;",
      "NEW SEQUENCE seq1;",
      "DECLARE SEQUENCE seq1;",
      "MAKE SEQUENCE seq1;",
    ],
    answer: 0,
    해설: "Oracle에서 시퀀스 생성은 CREATE SEQUENCE 문을 사용합니다. 추가 옵션으로 INCREMENT BY, START WITH, MAXVALUE 등을 지정할 수 있습니다. 시퀀스는 주로 기본 키 값을 자동 생성할 때 사용됩니다.",
  },
  {
    question:
      "Oracle SQL에서 첫 번째 쿼리에는 있지만 두 번째 쿼리에는 없는 행을 반환하는 연산자는 무엇인가요?",
    options: ["UNION", "INTERSECT", "MINUS", "EXCEPT"],
    answer: 2,
    해설: "MINUS 연산자는 Oracle에서 차집합을 구할 때 사용합니다. 다른 DBMS에서는 EXCEPT를 사용하기도 합니다. UNION은 합집합, INTERSECT는 교집합을 반환합니다.",
  },
  {
    question: "SQL에서 상관 서브쿼리(Correlated Subquery)란 무엇인가요?",
    options: [
      "외부 쿼리의 컬럼을 참조하며 외부 쿼리의 각 행에 대해 실행되는 서브쿼리",
      "JOIN과 동일한 기능을 하는 서브쿼리",
      "여러 컬럼을 반환할 수 있는 서브쿼리",
      "반드시 집계 함수를 사용해야 하는 서브쿼리",
    ],
    answer: 0,
    해설: "상관 서브쿼리는 외부 쿼리의 값을 참조하며, 외부 쿼리의 각 행에 대해 한 번씩 실행됩니다. 예를 들어 'SELECT name FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees WHERE dept = e.dept)'에서 e.dept가 상관 관계를 만듭니다.",
  },
  {
    question:
      "기존 테이블 'Source'의 모든 행을 'Target' 테이블로 복사하는 SQL 문은 무엇인가요?",
    options: [
      "SELECT * INTO Target FROM Source;",
      "INSERT INTO Target SELECT * FROM Source;",
      "COPY Source TO Target;",
      "MERGE INTO Target USING Source;",
    ],
    answer: 1,
    해설: "표준 SQL에서는 INSERT INTO ... SELECT ... 문으로 테이블 복사가 가능합니다. 첫 번째 옵션은 일부 DBMS(SQL Server)에서 사용되지만 표준이 아닙니다. MERGE는 조건에 따라 삽입/갱신을 수행합니다.",
  },
  {
    question:
      "다음 LEFT JOIN 쿼리의 결과는 무엇인가요?\nSELECT A.id, B.name\nFROM A LEFT JOIN B ON A.id = B.id;",
    diagram: {
      type: "tables",
      tables: [
        {
          name: "A",
          columns: ["id", "val"],
          rows: [
            [1, 100],
            [2, 200],
          ],
        },
        {
          name: "B",
          columns: ["id", "name"],
          rows: [
            [1, "X"],
            [3, "Y"],
          ],
        },
      ],
    },
    options: [
      "id=1, name=X\nid=2, name=NULL",
      "id=1, name=X\nid=3, name=Y",
      "id=2, name=X\nid=3, name=Y",
      "id=1, name=X\nid=2, name=Y",
    ],
    answer: 0,
    해설: "LEFT JOIN은 왼쪽 테이블(A)의 모든 행을 포함하며, 오른쪽 테이블(B)에 매칭되는 행이 없으면 NULL로 채웁니다. A 테이블의 id=2는 B에 없으므로 name은 NULL이 됩니다.",
  },
  {
    question: "외래 키에 정의된 ON DELETE CASCADE 절의 기능은 무엇인가요?",
    options: [
      "부모 행이 삭제될 때 자식 행도 자동 삭제됨",
      "자식 행이 존재하면 부모 행 삭제를 방지함",
      "부모 삭제 시 자식 외래 키를 NULL로 설정함",
      "외래 키 컬럼에 인덱스를 생성함",
    ],
    answer: 0,
    해설: "ON DELETE CASCADE는 참조 무결성 유지를 위해 부모 삭제 시 관련 자식도 함께 삭제합니다. 예를 들어 '주문' 테이블이 '고객'을 참조할 때, 고객 삭제 시 해당 고객의 모든 주문이 자동 삭제됩니다.",
  },
  {
    question: "COALESCE(NULL, 1, 2)의 결과는 무엇인가요?",
    options: ["NULL", "1", "2", "Error"],
    answer: 1,
    해설: "COALESCE 함수는 인자 중 첫 번째 NULL이 아닌 값을 반환합니다. Oracle의 NVL과 유사하지만, 여러 인자를 처리할 수 있습니다. 데이터 변환 시 NULL 처리를 위해 자주 사용됩니다.",
  },
  {
    question:
      "계층적 쿼리의 결과는 무엇인가요?\nSELECT EmpID, LEVEL FROM Employees\nSTART WITH ManagerID IS NULL\nCONNECT BY PRIOR EmpID = ManagerID;",
    diagram: {
      type: "table",
      columns: ["EmpID", "ManagerID"],
      rows: [
        [1, null],
        [2, 1],
        [3, 1],
        [4, 2],
      ],
    },
    options: [
      "EmpID=1, Level=1\nEmpID=2, Level=2\nEmpID=3, Level=2\nEmpID=4, Level=3",
      "EmpID=1, Level=1\nEmpID=2, Level=2\nEmpID=3, Level=3\nEmpID=4, Level=4",
      "EmpID=1, Level=1\nEmpID=2, Level=1\nEmpID=3, Level=1\nEmpID=4, Level=1",
      "EmpID=4, Level=3\nEmpID=3, Level=2\nEmpID=2, Level=2\nEmpID=1, Level=1",
    ],
    answer: 0,
    해설: "이 Oracle 계층 쿼리는 조직도를 조회합니다. START WITH는 루트 노드(ManagerID가 NULL)를 지정하고, CONNECT BY는 부모-자식 관계를 정의합니다. LEVEL은 루트에서의 깊이를 나타냅니다.",
  },
  {
    question: "SQL에서 조건부 로직(if-then-else)을 구현하는 구문은 무엇인가요?",
    options: [
      "CASE WHEN ... THEN ... ELSE ... END",
      "DECODE",
      "IF ... THEN ... END IF",
      "SWITCH",
    ],
    answer: 0,
    해설: "CASE 표현식은 표준 SQL의 조건부 로직 처리 방식입니다. Oracle의 DECODE 함수도 유사하지만 표준이 아니며 기능이 제한적입니다. PL/SQL의 IF 문과 혼동하지 않도록 주의해야 합니다.",
  },
  {
    question: "Oracle의 NVL(NULL, 'default') 함수 결과는 무엇인가요?",
    options: ["NULL", "default", "'' (empty string)", "Error"],
    answer: 1,
    해설: "NVL 함수는 첫 번째 인자가 NULL이면 두 번째 인자를 반환합니다. 데이터 표시 시 NULL 대신 기본값을 제공할 때 유용합니다. NVL2는 NULL 여부에 따라 다른 값을 반환하는 확장 함수입니다.",
  },
  {
    question: "LENGTH('Hello') 함수의 결과는 무엇인가요?",
    options: ["4", "5", "6", "Error"],
    answer: 1,
    해설: "LENGTH 함수는 문자열의 문자 수를 반환합니다. 'Hello'는 5글자이므로 5가 반환됩니다. 바이트 수를 원하면 LENGTHB를 사용합니다. 공백도 문자로 포함됩니다.",
  },
  {
    question: "사용자에게 부여된 권한을 회수하는 SQL 문은 무엇인가요?",
    options: [
      "REVOKE SELECT ON table_name FROM user;",
      "REMOVE PRIVILEGE ON table_name FROM user;",
      "DENY SELECT ON table_name TO user;",
      "CANCEL GRANT ON table_name",
    ],
    answer: 0,
    해설: "권한 회수는 REVOKE 명령으로 수행합니다. DENY는 SQL Server의 특수 명령어이며, 다른 옵션들은 올바른 SQL 문법이 아닙니다. GRANT와 짝을 이루는 보안 명령어입니다.",
  },
  {
    question: "SQL의 WITH 절의 용도는 무엇인가요?",
    options: [
      "하나의 쿼리 내에서 여러 번 참조 가능한 공통 테이블 표현(CTE) 정의",
      "임시 테이블 삭제",
      "SELECT 문 반복 실행",
      "트랜잭션 커밋",
    ],
    answer: 0,
    해설: "WITH 절(Common Table Expression)은 복잡한 쿼리를 모듈화할 때 유용합니다. 재귀적 쿼리에도 사용되며, 가독성과 성능 향상을 기대할 수 있습니다. 서브쿼리 대체 용도로 자주 사용됩니다.",
  },
  {
    question: "Oracle의 SYSDATE 함수가 반환하는 것은 무엇인가요?",
    options: [
      "현재 시스템 날짜와 시간",
      "현재 날짜 부분만",
      "시간대를 포함한 현재 타임스탬프",
      "현재 연도만",
    ],
    answer: 0,
    해설: "SYSDATE는 서버의 현재 날짜와 시간을 DATE 타입으로 반환합니다. 시간대 정보는 포함하지 않으며, 정밀도는 초 단위까지입니다. CURRENT_TIMESTAMP는 시간대 정보를 포함합니다.",
  },
  {
    question:
      "두 쿼리 결과에 공통으로 존재하는 행만 반환하는 SQL 연산자는 무엇인가요?",
    options: ["UNION", "INTERSECT", "MINUS", "CROSS JOIN"],
    answer: 1,
    해설: "INTERSECT 연산자는 두 쿼리 결과의 교집합을 반환합니다. UNION은 합집합, MINUS(Oracle)/EXCEPT는 차집합, CROSS JOIN은 카티션 곱을 생성합니다.",
  },
  {
    question: "Oracle의 MERGE 문은 무엇을 수행하나요?",
    options: [
      "소스 테이블을 기준으로 타겟 테이블에 삽입 또는 갱신(Upsert)",
      "두 SELECT 쿼리 결과를 결합",
      "테이블에서 중복 행 제거",
      "두 테이블을 뷰로 병합",
    ],
    answer: 0,
    해설: "MERGE 문은 조건에 따라 INSERT 또는 UPDATE를 수행하는 'Upsert' 작업에 사용됩니다. 데이터 웨어하우스의 ETL 프로세스에서 자주 활용되며, WHEN MATCHED와 WHEN NOT MATCHED 절로 동작을 제어합니다.",
  },
  {
    question: "Oracle의 REPLACE('Hello', 'H', 'J') 함수 결과는 무엇인가요?",
    options: ["Jello", "Hello", "JelloHello", "Error"],
    answer: 0,
    해설: "REPLACE 함수는 첫 번째 인자에서 두 번째 인자를 찾아 세 번째 인자로 치환합니다. 대소문자를 구분하며, 여러 번 출현하면 모두 치환됩니다. 정규식 처리는 REGEXP_REPLACE를 사용합니다.",
  },
  {
    question:
      "테이블은 여러 UNIQUE 제약을 가질 수 있지만 기본 키는 하나만 가질 수 있다는 주장은 옳은가요?",
    options: [
      "True",
      "False",
      "복합 고유 키일 때만",
      "고유 키는 기본 키여야 함",
    ],
    answer: 0,
    해설: "한 테이블에 여러 UNIQUE 제약을 정의할 수 있지만, PRIMARY KEY는 테이블당 하나만 허용됩니다. UNIQUE는 NULL을 허용할 수 있지만, PRIMARY KEY는 NULL을 허용하지 않습니다.",
  },
  {
    question:
      "컬럼 값이 특정 조건(예: col > 0)을 만족하도록 강제하는 SQL 제약은 무엇인가요?",
    options: ["CHECK", "UNIQUE", "PRIMARY KEY", "REFERENCES"],
    answer: 0,
    해설: "CHECK 제약은 도메인 무결성을 보장하기 위해 조건을 지정합니다. 예를 들어 'CHECK (salary > 0)'는 급여가 양수임을 보장합니다. 복잡한 조건도 표현 가능하지만 성능에 영향을 줄 수 있습니다.",
  },
  {
    question: "Oracle SQL에서 두 문자열을 연결하는 연산자는 무엇인가요?",
    options: ["||", "&&", "^", "+"],
    answer: 0,
    해설: "Oracle에서는 || 연산자로 문자열을 연결합니다. CONCAT 함수도 사용 가능하지만 두 개 인자만 처리합니다. 다른 DBMS에서는 +를 사용하기도 합니다(예: SQL Server).",
  },
  {
    question: "SQL에서 5 + NULL 표현식의 결과는 무엇인가요?",
    options: ["NULL", "5", "0", "Error"],
    answer: 0,
    해설: "NULL과의 모든 산술 연산 결과는 NULL입니다. 이를 'NULL 전파'라고 합니다. NULL 처리를 위해 NVL, COALESCE, NULLIF 등의 함수를 사용해야 합니다.",
  },
  {
    question:
      "명시적인 ON 절 없이 동일한 이름의 컬럼으로 자동 조인하는 JOIN 유형은 무엇인가요?",
    options: ["NATURAL JOIN", "CROSS JOIN", "SELF JOIN", "INNER JOIN"],
    answer: 0,
    해설: "NATURAL JOIN은 동일한 이름의 컬럼을 기준으로 암시적 조인을 수행합니다. 편리하지만 예기치 않은 컬럼이 조인에 사용될 수 있어 주의가 필요합니다. 일반적으로 명시적 조인을 권장합니다.",
  },
  {
    question:
      "다음 GROUP BY 쿼리의 결과는 무엇인가요?\nSELECT Category, COUNT(*) AS CountVal\nFROM Items\nGROUP BY Category;",
    diagram: {
      type: "table",
      columns: ["Category", "Value"],
      rows: [
        ["A", 10],
        ["A", 20],
        ["B", 15],
      ],
    },
    options: [
      "Category: A, CountVal: 2\nCategory: B, CountVal: 1",
      "Category: A, CountVal: 3\nCategory: B, CountVal: 2",
      "Category: A, CountVal: 1\nCategory: B, CountVal: 2",
      "Category: A, CountVal: 2\nCategory: B, CountVal: 2",
    ],
    answer: 0,
    해설: "GROUP BY는 지정된 컬럼 값별로 행을 그룹화합니다. 카테고리 A는 2개 행, B는 1개 행이 있으므로 각각 2와 1이 반환됩니다. COUNT(*)는 NULL을 포함한 행 수를 셉니다.",
  },
  {
    question:
      "HAVING 절을 사용한 쿼리의 결과는 무엇인가요?\nSELECT Category FROM Items GROUP BY Category HAVING SUM(Value) > 25;",
    diagram: {
      type: "table",
      columns: ["Category", "Value"],
      rows: [
        ["A", 10],
        ["A", 20],
        ["B", 15],
      ],
    },
    options: ["A", "B", "A and B", "None"],
    answer: 0,
    해설: "HAVING은 그룹화 후 집계 결과를 필터링합니다. 카테고리 A의 합계는 30(10+20), B는 15이므로 조건(>25)을 만족하는 A만 반환됩니다. WHERE는 그룹화 전 행을 필터링합니다.",
  },
  {
    question:
      "부서별 평균 급여를 계산하기 위해 빈칸에 들어갈 집계 함수는 무엇인가요?\nSELECT Dept, _____(Salary) FROM Employees GROUP BY Dept;",
    options: ["SUM", "AVG", "COUNT", "MAX"],
    answer: 1,
    해설: "AVG 함수는 평균을 계산합니다. SUM은 합계, COUNT는 행 수, MAX는 최대값을 반환합니다. NULL 값은 집계에서 제외되며, AVG는 NULL을 제외한 값의 평균을 계산합니다.",
  },
  {
    question: "다음 중 SQL 집계 함수가 아닌 것은 무엇인가요?",
    options: ["COUNT", "AVG", "MAX", "UPPER"],
    answer: 3,
    해설: "UPPER는 문자열을 대문자로 변환하는 스칼라 함수입니다. 나머지는 모두 집계 함수로, GROUP BY와 함께 사용됩니다. DISTINCT와 결합해 고유값만 집계할 수도 있습니다(예: COUNT(DISTINCT dept)).",
  },
  {
    question: "다음 중 데이터 조작 언어(DML) 명령어는 무엇인가요?",
    options: ["SELECT", "UPDATE", "GRANT", "CREATE"],
    answer: 1,
    해설: "DML은 데이터 조작을 위한 명령어로 SELECT(검색), INSERT(삽입), UPDATE(수정), DELETE(삭제)가 있습니다. GRANT는 DCL(데이터 제어 언어), CREATE는 DDL(데이터 정의 언어)에 속합니다.",
  },
  {
    question:
      "다음 중 Oracle에서 지원하지 않으며 MINUS로 대체되는 SQL 키워드는 무엇인가요?",
    options: ["EXCEPT", "INTERSECT", "UNION", "CROSS"],
    answer: 0,
    해설: "EXCEPT는 SQL 표준의 차집합 연산자이지만 Oracle에서는 MINUS를 사용합니다. 기능은 동일합니다. 다른 DBMS(예: SQL Server, PostgreSQL)에서는 EXCEPT를 지원합니다.",
  },
  {
    question: "COUNT(DISTINCT column_name)의 용도는 무엇인가요?",
    options: [
      "중복 포함 전체 행 수 계산",
      "컬럼의 고유값 개수 계산",
      "NULL 제외 행 수 계산",
      "컬럼 수 계산",
    ],
    answer: 1,
    해설: "COUNT(DISTINCT)는 컬럼의 중복을 제거한 고유값 수를 셉니다. 예를 들어 'COUNT(DISTINCT dept)'는 부서 종류 수를 반환합니다. NULL은 계산에서 제외됩니다.",
  },
  {
    question:
      "여러 인자 중 첫 번째 NULL이 아닌 값을 반환하는 SQL 함수는 무엇인가요?",
    options: ["NVL", "COALESCE", "DECODE", "TO_CHAR"],
    answer: 1,
    해설: "COALESCE는 표준 SQL 함수로 여러 인자를 받아 첫 번째 NULL이 아닌 값을 반환합니다. Oracle의 NVL은 인자 2개만 처리하며, NVL2는 NULL 여부에 따라 다른 값을 반환합니다.",
  },
  {
    question:
      "SQL에서 'value BETWEEN 1 AND 5' 조건이 포함하는 값은 무엇인가요?",
    options: ["1, 2, 3, 4", "2, 3, 4", "1, 5", "1, 2, 3, 4, 5"],
    answer: 3,
    해설: "BETWEEN은 범위의 양쪽 끝을 포함합니다. 'value BETWEEN 1 AND 5'는 value >= 1 AND value <= 5와 동일합니다. 날짜 범위 검색 시에도 유용하게 사용됩니다.",
  },
  {
    question: "LIKE 조건에서 'A%' 패턴은 무엇과 일치하나요?",
    options: [
      "'A'로 시작하는 모든 문자열",
      "'A'로 끝나는 모든 문자열",
      "'A'를 포함하는 모든 문자열",
      "어떤 문자열과도 일치하지 않음",
    ],
    answer: 0,
    해설: "LIKE의 '%'는 0개 이상의 문자를 의미합니다. 'A%'는 'Apple', 'A', 'A123' 등과 일치합니다. '_'는 단일 문자 와일드카드입니다. 대소문자 구분은 DB 설정에 따릅니다.",
  },
  {
    question: "SQL에서 LIKE 조건의 패턴 '_B_'는 다음 중 무엇과 일치합니까?",
    options: [
      "두 번째 문자가 'B'인 임의의 세 글자 문자열",
      "'B'로 시작하는 모든 문자열",
      "'B'로 끝나는 모든 문자열",
      "일치하는 문자열 없음",
    ],
    answer: 0,
  },
  {
    question:
      "어떤 SQL 열 제약 조건이 해당 열이 NULL 값을 가질 수 없도록 보장합니까?",
    options: ["NOT NULL", "UNIQUE", "PRIMARY KEY", "CHECK"],
    answer: 0,
  },
];
