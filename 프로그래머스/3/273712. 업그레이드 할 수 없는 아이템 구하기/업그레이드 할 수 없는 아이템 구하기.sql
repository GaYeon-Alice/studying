-- 코드를 작성해주세요
SELECT
    ITEM_ID
    , ITEM_NAME
    , RARITY
FROM
    ITEM_INFO
WHERE
    ITEM_ID IN (
        -- 업그레이드가 불가능한 아이템 선택
        SELECT
            C.ITEM_ID
        FROM
            ITEM_TREE AS C
        LEFT JOIN
            ITEM_TREE AS P
        ON
            C.ITEM_ID = P.PARENT_ITEM_ID
        WHERE
            P.PARENT_ITEM_ID IS NULL
    )
ORDER BY
    ITEM_ID DESC;