<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<%
	String boardid=request.getParameter("boardid");
	if(boardid==null) boardid="1";

%>
<% 
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null||pageNum==""){
		pageNum="1";}
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try{
		BoardDBBean dbPro=BoardDBBean.getInstance();
		BoardDataBean article=dbPro.getArticle(num,boardid,"content");
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		
		%>
	

<body><center><h2 class="w3-wide w3-center">글 내용 보기</h2>

<div class="container w3-responsive">
<table class="w3-table w3-bordered  w3-striped" style="width: 80%; ">

<tr height="30" >
<td width="125" align="center"><b>글번호</b></td>
<td width="125" align="center"><%=article.getNum() %></td>
<td width="125" align="center"><b>조회수</b></td>
<td width="125" align="center"><%= article.getReadcount()%></td>
</tr>

<tr height="30">
<td width="125" align="center"><b>작성자</b></td>
<td width="125" align="center"><%=article.getWriter() %></td>
<td width="125" align="center"><b>작성일</b></td>
<td width="125" align="center"><%= sdf.format(article.getReg_date())%></td>
</tr>

<tr height="30">
<td width="125" align="center"><b>글제목</b></td>
<td width="375" align="center" colspan="3"><%= article.getSubject()%></td></tr>

<tr height="30">
<td width="125" align="center"><b>글내용</b></td>
<td width="375" align="left" colspan="3"><pre><%= article.getContent() %></pre></td></tr>

<tr height="30">
<td colspan="4" class="w3-center">
<input type="button" class="w3-button w3-hover-black" value="수정" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="w3-button w3-hover-black" value="삭제" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="w3-button w3-hover-black" value="답글쓰기" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&pageNum=<%=pageNum%>'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="w3-button w3-hover-black" value="목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
</td></tr></table>

<% }catch(Exception e){} %>


</div>
</center>

</body>
</html>