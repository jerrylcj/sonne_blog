<%@ page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="sonn.enums.MsgType"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>css/mine.css" media="all" />
  </head>

<body>
  <div id="left_page">
      <div id = "profile_pic" class="profile_pic">
	     <!--if the pic's path is empty,use the default path. -->
	     <c:choose>
		      <c:when test="${!empty h_pic_path}">
			      <img src="<%=basePath %>${h_pic_path }" style=""/>
		      </c:when>
		      <c:otherwise>
			       <img src="<%=basePath %>${defulat_path}" style=""/>
		       </c:otherwise>
	      </c:choose>
	      <br>
	      <br>
	      <br>
	      <br>
	      <br>
	                博名:${username }<br>
                           博龄:${blog_age }<br><br>
          <a href = "/RiXiang_blog/head/show.form">点击上传头像</a><br>
	          <c:if test="${!empty userName}"> 	  
	              <a href = "/RiXiang_blog/article/list.form">返回主页</a>
	          </c:if>
       </div>
  </div>
  <div id="my_msgs">
                消息中心：<br>
      <c:forEach items="${msgPage.content}" begin="0" end="15" step="1" var="msg">
          <!-- 如果消息类型为评论 -->
          <div id="msg_line">
               <c:choose> 
                    <c:when test="${empty msg.sender.username}">
                                                                  一名游客在${fn:substring(msg.date,0,16)}评论了你的文章<a href="/RiXiang_blog/msg/show.form?id=${msg.id}">${msg.article.title}</a><br>
                    </c:when>
                    <c:otherwise>
                                                                    用户 ${msg.sender.username}在${fn:substring(msg.date,0,16)}评论了你的文章<a href="/RiXiang_blog/msg/show.form?id=${msg.id}">${msg.article.title}</a><br>
                    </c:otherwise>
                </c:choose>
          </div>
      </c:forEach> 
      <div id = "page_select">   
                           共${msgPage.pageInfo.totalCount}条纪录，当前第${msgPage.pageInfo.currentPage}/${msgPage.pageInfo.totalPage}页，每页${msgPage.pageInfo.everyPage}条纪录
                          <c:choose>
                                    <c:when test = "${msgPage.pageInfo.hasPrePage}">
                                     			<a href="<%=basePath %>mine/show.form?currentPage=1">首页</a>
				                                <a href="<%=basePath %>mine/show.form?currentPage=${msgPage.pageInfo.currentPage-1}">上一页</a>
                                    </c:when>
                                    <c:otherwise>
                                           		   首页
				                                                                                          上一页
                                    </c:otherwise>
                          </c:choose>
                          <c:choose>
                                     <c:when test = "${msgPage.pageInfo.hasNextPage}">
                                                <a href="<%=basePath %>mine/show.form?currentPage=${msgPage.pageInfo.currentPage+1}">下一页</a> 
				                                <a href="<%=basePath %>mine/show.form?currentPage=${msgPage.pageInfo.totalPage}">尾页</a>
                                     </c:when>
                                     <c:otherwise>
                                                                                                                                          下一页
                                                                                                                                            尾页
                                     </c:otherwise>
                          </c:choose>
            </div>
  </div>
  <div id="fans_attention">
        <br>
        <br>
         <p style="font-family:KaiTi">
                                     粉丝关注功能将在不久将来开发出来，还请日向博客亲爱的用户们继续期待！ (..•˘_˘•..)<br>
                                     未来本页面右侧栏将显示关注粉丝、用户头像列表。
        </p>
  </div>
    <script type="text/javascript" src="<%=basePath %>Jquery/jquery-1.3.1.js"></script>
    <script type="text/javascript" src="<%=basePath %>Jquery/jquery.form.js"></script>   
    <title>Sonn Blog</title>
    <script type="text/javascript">
    </script>
</body>
</html>
