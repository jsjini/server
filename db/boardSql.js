// 조회(전체)
let boardList = 
`SELECT no
        , title
        , writer
        , content
        , created_date
        , updated_date
        , (select count(bno) from t_comment_board where t_comment_board.bno = t_board_board.no) as count
FROM t_board_board
ORDER BY 1`;

// 조회(단건)
let boardInfo = 
`SELECT no
        , title
        , writer
        , content
        , created_date
        , updated_date
FROM t_board_board
WHERE no = ?`;

// 등록
let boardInsert = 
`INSERT INTO t_board_board
SET ?`; 

// 수정
let boardUpdateAll = 
`UPDATE t_board_board
SET ?
WHERE no = ?`;

// 댓글 조회
let commentList = 
`select content, 
        writer, 
        created_date
from    t_comment_board
where   bno = ?`

module.exports = {
    boardList,
    boardInfo,
    boardInsert,
    boardUpdateAll,
    commentList
}