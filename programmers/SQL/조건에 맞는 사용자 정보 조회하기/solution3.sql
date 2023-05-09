# JOIN 방법
SELECT USER_ID, NICKNAME,
    CONCAT_WS(' ', 
        CITY,
        STREET_ADDRESS1,
        STREET_ADDRESS2
    ) AS '전체주소',
    CONCAT_WS('-', 
        LEFT(TLNO, 3),
        SUBSTR(TLNO, 4, 4),
        RIGHT(TLNO, 4)
    ) AS '전화번호'
FROM USED_GOODS_USER
    JOIN USED_GOODS_BOARD
        ON USER_ID = WRITER_ID
GROUP BY USER_ID
HAVING 3 <= COUNT(USER_ID)
ORDER BY USER_ID DESC