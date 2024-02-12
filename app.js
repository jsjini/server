// app.js
// 모듈
require('dotenv').config({ path : './db/dbSetting.env'})
const express = require('express');
const app = express();
const mysql = require('./db.js');

// 미들웨어
// application/json => json 형태
app.use(express.json());
// application/x-www-form-urlencoded => queryString 형태
app.use(express.urlencoded({extended : false}));

// listen 메소드
app.listen(3000, () => {
    console.log('Server Start, http://localhost:3000');
});

// 조회(전체)
app.get('/board', async (req, res) => {
    let list = await mysql.executeQuery('boardList');
    res.json(list);
});

// 조회(단건)
app.get('/board/:no', async (req, res) => {
    let boardNo = req.params.no;
    let info = (await mysql.executeQuery('boardInfo', boardNo))[0];
    res.json(info);
});

// 등록
app.post('/board', async (req, res) => {
    let data = req.body.param;
    let result = await mysql.executeQuery('boardInsert', data);
    res.json(result);
});

// 수정
app.put('/board/:no', async (req, res) => {
    let result = await updateAll(req);
    res.json(result);
});

async function updateAll(request){
    let data = [ selectedInfo(request.body.param), request.params.no];
    let result = await mysql.executeQuery('boardUpdateAll', data);
    return result;
}

function selectedInfo(obj){
    let delData = ["no"];
    let newObj = {};
    let isTargeted = null;
    for(let field in obj){
        isTargeted = false;
        for(let target of delData){
            if(field == target){
                isTargeted = true;
                break;
            }
        }
        // 
        if(!isTargeted){
            newObj[field] = obj[field];
        }
    }
    return newObj;
};

// 댓글 조회
app.get('/comment/:bno', async (req, res) => {
    let bno = req.params.bno;
    let comments = await mysql.executeQuery('commentList', bno);
    res.json(comments);
});