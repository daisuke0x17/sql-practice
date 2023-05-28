# SQLの基本を解説！データベース操作の学ぼう！〜VTuberと学習〜<!-- omit in toc -->
## 目次<!-- omit in toc -->
- [資料](#資料)
- [データベース](#データベース)
  - [データベースの種類](#データベースの種類)
- [リレーショナルDB](#リレーショナルdb)
- [SQL](#sql)
  - [CREATE TABLE](#create-table)
  - [主キー](#主キー)
  - [ユニーク制約](#ユニーク制約)
  - [外部キー](#外部キー)
  - [INSERT](#insert)
  - [SELECT](#select)
  - [JOIN](#join)
  - [UPDATE](#update)
  - [DELETE](#delete)

## 資料
- [動画](https://youtu.be/WSYFuq6jbzo)

## データベース
- データの蓄積・管理に特化したシステム
- 略称をDB

### データベースの種類
- リレーショナルDB
- グラフDB
- 時系列DB
- ドキュメント指向型DB

## リレーショナルDB
- 行 = レコード
- 列 = カラム
- スキーマ = テーブルのグループ、テーブルの構造情報
  - 文脈によって意味が若干変化する

## SQL
> **Note** <!-- Note / Warning -->
> リレーショナルDBを操作するための言語

- RDB製品（特徴やSQLの文法が少し違う）
  - Oracle Database
  - MySQL
  - PostgresSQL
  - DB2

**※SQLでは英字の大文字と小文字を区別しない**

### CREATE TABLE
```sql
CREATE TABLE テーブル名(
    カラム名1 カラムの型,
    カラム名2 カラムの型,
    ︙
)
;
```

### 主キー
- レコードを一意に特定できるキー
- 主キーのカラムは欠損が許されない
  - Not null

```sql
CREATE TABLE テーブル名(
    カラム名1 カラムの型 PRIMARY KEY,
    カラム名2 カラムの型,
    ︙
)
;
```

### ユニーク制約
- 重複した値が入らないカラム

```sql
CREATE TABLE テーブル名(
    カラム名1 カラムの型,
    カラム名2 カラムの型 UNIQUE,
    ︙
)
;
```

### 外部キー
- 他のテーブルのユニーク制約があるカラム（PKも含む）のデータを持っているカラム
- Nullable

```sql
CREATE TABLE テーブル名(
    カラム名1 カラムの型,
    カラム名2 カラムの型,
    ︙
CONSTRAIN 外部キーの名前
    FOREIGN KEY （外部キーのカラム名）
        REFERENCES
            参照先のテーブル名（参照先のカラム名）
)
;
```

### INSERT
- データを登録

```sql
INSERT INTO テーブル名
    (カラム名1,カラム名2, ...)
VALUES
    (カラム1の値, カラム2の値, ...),
    (カラム1の値, カラム2の値, ...),
    ︙
;
```

### SELECT
- データを抽出

```sql
SELECT
    カラム名1,
    カラム名2,
    ︙
FROM
    テーブル名
WHERE
    条件
;
```

- 条件
  - aがb1からb2の間
    -  `a BETWEEN b1 AND b2`
 -  aがb1, b2, b3, ... のどれかに含まれる
    -  `a IN (b1, b2, b3, ...)`

### JOIN
- テーブルを結合
  - 内部結合：INNER JOIN
  - 左外部結合：LEFT OUTER JOIN
  - 右外部結合：RIGHT OUTER JOIN
  - 完全外部結合：FULL OUTER JOIN

> **Note** <!-- Note / Warning -->
> 集合論で考えると難しくないので、DBも集合であることを意識する！

![image](https://storage.googleapis.com/zenn-user-upload/c8ea0982dbb5-20220824.png)
参考文献：https://zenn.dev/umi_mori/books/331c0c9ef9e5f0/viewer/c34b50

### UPDATE
- 値の更新

```sql
UPDATE
    テーブル名
SET
    カラム名1 = 新しい値,
    カラム名2 = 新しい値,
    ︙
WHERE
    条件
;
```

### DELETE
- レコードの削除

```sql
DELETE
FROM
    テーブル名
WHERE
    条件
;
```
