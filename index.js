const express=require('express');

const app=express();

// 요청이 오면 메시지 출력
app.get('/',(req,res)=>{
    res.send('test in Docker!!!');
});

// 8080포트에 백엔드 서버 구동
app.listen(8080,()=>console.log('server is running!!'));

