<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <% request.setCharacterEncoding("utf-8"); %>
     <%
    String boardid=request.getParameter("boardid");
    if(boardid==null){
    	boardid="1";
    }
    String pageNum=request.getParameter("pageNum");
    if(pageNum==null||pageNum==""){
		pageNum="1";}
	
    int num=Integer.parseInt(request.getParameter("num"));
	String passwd=request.getParameter("passwd");
	
	BoardDBBean dbPro=BoardDBBean.getInstance();
	int check=dbPro.deleteArticle(num,passwd,boardid);
	if(check==1){
		%>
		<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum %>">
		<% }else{ %>
		<script>
alert("비밀번호가 맞지 않습니다");
history.go(-1);		//바로 전 화면으로 이동(updateForm.jsp)
</script><%} %>
		
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

</body>
</html>