<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<%
    response.setHeader("Cache-Control","no-cache");   
    response.setHeader("Pragma","no-cache");   
    response.setDateHeader ("Expires", -10);   
%>
	<div class="accordion" id="menu-bar">
		<c:set var="menuList" value="${fns:getMenuList()}"/>
		<c:set var="firstMenu" value="true"/>
		<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
			<c:if test="${menu.parent.id eq '1' && menu.isShow eq '1'}">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle accordion-listMenu1" data-toggle="collapse" data-parent="#menu-bar div.mCSB_container" data-href="#collapse-${menu.id}" href="#collapse-${menu.id}" title="${menu.remarks}">
							<i class="icon-${not empty menu.icon ? menu.icon : 'tasks'}"></i>
							<span>${menu.name}</span>
							<!-- 
								<i class="icon-chevron-${not empty firstMenu && firstMenu ? 'down' : 'right'} " style='opacity: 0;'></i>
							 -->
						</a>
					</div>
					<div id="collapse-${menu.id}" class="accordion-body collapse ${not empty firstMenu && firstMenu ? 'in' : ''}">
						<div class="accordion-inner">
							<ul class="nav nav-list nav-listMenu2">
								<c:forEach items="${menuList}" var="menu2">
									<c:if test="${menu2.parent.id eq menu.id && menu2.isShow eq '1'}">
										<li>
											<a data-href=".menu3-${menu2.id}" class="accordion-listMenu2"
											   href="${fn:indexOf(menu2.href,	 '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}"
											   target="${not empty menu2.target ? menu2.target : 'mainFrame'}" data-title="${menu2.nickname}"  >
												<span>${menu2.name}</span>
												<i>&nbsp;</i>
												<%--<i class="icon-${not empty menu2.icon ? menu2.icon : 'circle-arrow-right'}"></i>--%>
											</a>
											<ul class="nav nav-list nav-listMenu3  hide" style="margin:0;padding-right:0;">
												<c:forEach items="${menuList}" var="menu3">
													<c:if test="${menu3.parent.id eq menu2.id && menu3.isShow eq '1'}">
														<li class="menu3-${menu2.id} hide">
															<a href="${fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '/404'}"
															   target="${not empty menu3.target ? menu3.target : 'mainFrame'}" data-title="${menu3.nickname}">
																<%--<i class="icon-${not empty menu3.icon ? menu3.icon : 'circle-arrow-right'}"></i>--%>
																<span>${menu3.name}</span>
															</a>
														</li>
													</c:if>
												</c:forEach>
											</ul>
										</li>
										<c:set var="firstMenu" value="false"/>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
