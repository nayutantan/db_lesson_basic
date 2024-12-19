Q1
 create table departments(
    department_id INT unsigned PRIMARY KEY auto_increment,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

Q2
 ALTER TABLE people ADD department_id INT unsigned AFTER email;

Q3
 MariaDB [db_lesson]> INSERT INTO departments (name)
     VALUES
     ('営業'),
     ('開発'),
     ('経理'),
     ('人事'),
     ('情報システム')
     ;

     INSERT INTO people (name, email, department_id, age, gender)
     VALUES
     ('シナモン', 'cinamon@jp', 1, 20, 1),
     ('ミルク', 'milk@jp', 1, 5, 1),
     ('モカ', 'moka@jp', 1, 20, 2),
     ('カプチーノ', 'cappucci@jp', 2, 20, 1),
     ('シフォン', 'sifon@jp', 2 ,20, 2),
     ('エスプレッソ', 'esupule@jp', 2, 20 ,1),
     ('ココ', 'coco@jp', 2, 10 , 1),
     ('ナッツ', 'nattu@jp', 3, 10, 1),
     ('コルネ','korune@jp', 4, 7, 1),
     ('ポロン', 'poron@jp', 5, 20, 2);

     INSERT INTO reports (person_id, content)
     VALUES
     (7,'遠い空の雲の上で生まれた、白いこいぬの男のコ。'),
     (8,'しなもんのようにいつか空を飛びたいと思っている。'),
     (9,'おしゃれでおしゃべりな優しいみんなのお姉さん的存在。'),
     (10,'のんびり屋さんで食いしん坊'),
     (11,'いつも元気いっぱいなムードメーカー。'),
     (12,'ワンちゃんコンテストで優勝したこともある、おぼっちゃま。'),
     (13,'カプチーノの双子の弟。お調子者のお兄さん。'),
     (14,'カプチーノの双子の弟。食いしん坊で寝坊助の弟。'),
     (15,'ユニコーンの男のコ。時空の旅人。'),
     (16,'コルネに乗ってやってきた謎のこいぬの女のコ。');

Q4
 UPDATE people SET department_id = '1' WHERE person_id in (1,2,3,4,5,6);

Q5
 年齢の降順で男性の名前と年齢を取得してください。
SELECT
  name,age
FROM
  people
where
  gender = 1
ORDER BY
  age desc;

Q6
テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

  カラム名`name`, `email`, `age`を選択（SELECT）し、FROM`people`でどのテーブルの中のカラムかを確定する。
  WHEREの`department_id` = 1で、department_idというカラムの値が1に該当する情報だけを指定して確認することができ、
  さらにORDER BY `created_at`;で指定のカラムで並び順を昇順or降順で表示出来る。

Q7
 20代の女性と40代の男性の名前一覧を取得してください。
SELECT
  name
FROM
  people
WHERE
  (gender=2)&(age BETWEEN 20 AND 29)or(gender=1)&(age BETWEEN 40 AND 49);

Q8
営業部に所属する人だけを年齢の昇順で取得してください。
SELECT
  name
FROM
  people
WHERE
  department_id=1
ORDER BY age ASC;

Q9
 開発部に所属している女性の平均年齢を取得してください。

SELECT AVG(age)
FROM people
WHERE
  department_id=2 and gender=2;

Q10
 名前と部署名とその人が提出した日報の内容を同時に取得してください。（日報を提出していない人は含めない）
 SELECT people.name, reports.content, departments.name
 FROM people
 INNER JOIN
    reports
    ON
      people.person_id = reports.person_id
INNER JOIN
  departments
  ON people.department_id = departments.department_id;

Q11
 日報を一つも提出していない人の名前一覧を取得してください。
SELECT people.name, reports.content
 FROM people
LEFT OUTER JOIN
  reports
    ON
      people.person_id = reports.person_id
 WHERE
   reports.content IS NULL;
