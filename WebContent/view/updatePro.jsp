<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("utf-8"); %>
     
     <%
     String boardid=request.getParameter("boardid");
     if(boardid==null) boardid="1";
     String pageNum=request.getParameter("pageNum");
     if(pageNum==null||pageNum==""){pageNum="1";}
     %>
     <jsp:useBean id="article" class="board.BoardDataBean">
<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% System.out.println(article); %>

<%

BoardDBBean dbPro = BoardDBBean.getInstance(); 

	int chk=dbPro.updateArticle(article);
	

%>

<%
	if(chk==1){
	
	%>
	<meta http-equiv="Refresh" content="0;url=content.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>">
	
	<%}else{ %>
		<script>
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);		//바로 전 화면으로 이동(updateForm.jsp)
		</script>
	<%} %>




</body>
</html>