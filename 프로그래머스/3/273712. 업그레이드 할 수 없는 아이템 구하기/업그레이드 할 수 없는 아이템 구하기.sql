-- 코드를 작성해주세요
SELECT i.item_id
     , i.item_name
     , i.rarity
FROM item_info AS i
LEFT JOIN item_tree AS t ON i.item_id = t.parent_item_id
WHERE t.parent_item_id IS NULL
ORDER BY i.item_id DESC;