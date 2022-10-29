$(function(){
    $("#btnLogin").click(function(){
        member_id=$("#member_id").val();
        var member_pwd=$("#member_pwd").val();
        if(member_id == ""){
            alert("아이디를 입력하세요");
            $("#userid").focus(); //입력포커스 이동

            return; //함수 종료
        }
        if(member_pwd==""){
            alert("비밀번호를 입력하세요");
            $("#member_pwd").focus();
            return;
        }
        //폼 내부의 데이터를 전송할 주소
        document.form1.action= "${path}/member/login_check.do";
        document.form1.submit(); //제출
    });
});
