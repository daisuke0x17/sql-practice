-- messagesテーブルのidが1のレコードのmessageを「こんにちはこんにちは」に変更しましょう。
UPDATE
    messages
SET
    message = 'こんにちはこんにちは'
WHERE
    id = 1
