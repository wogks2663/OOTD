<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
	<section class="writebox1" >
		<div class="writer1">
            <span  name="id" class="id" >${ sessionScope.m_id } 님,<br/>
							안녕하세요!</span><br/><br/><br/>
         </div><br/><br/>
		<div class="bookmark-content" >
			<c:if test="${ not empty bookMarkList }">
				<div class="bookmark-cont_wrap">
			 		<div class="bookmark-product_wrap">	
			 			<div class="bookmark-product" style="position: relative; height: 2120px;">
			 				<c:forEach var="o" items="${bookMarkList}" varStatus="status">	
								<div class="bookmark-box">
	 								<a href="boardDetail.mvc?no=${ o.ootdNo }" >
	 									<img src="upload/${o.listImg }"onerror="this.src='images/noimg.jpg'" class="bookmark-ad"  />
	 								</a>
	 							</div>
							</c:forEach>
			 			</div>
			 		</div>
			 	</div>
	 		</c:if>
	 		<c:if test="${ empty bookMarkList }">
				<div class="bookmark-cont_wrap">
			 		<div class="bookmark-product_wrap">	
			 			<div class="bookmark-product" style="position: relative; height: 2120px;">
			 				북마크를 추가해 주세요!!
			 			</div>
			 		</div>
			 	</div>
	 		</c:if>
		</div>
	</section>
</article>
