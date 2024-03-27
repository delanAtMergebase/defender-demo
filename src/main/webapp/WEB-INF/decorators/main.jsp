<!DOCTYPE html>
<%@ page
		language="java"
		contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8" %>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	// Calculate the view sources url
	String sourceUrl = request.getContextPath()+"/viewSource.action";
	com.opensymphony.xwork2.ActionInvocation inv = com.opensymphony.xwork2.ActionContext.getContext().getActionInvocation();
	org.apache.struts2.dispatcher.mapper.ActionMapping mapping = org.apache.struts2.ServletActionContext.getActionMapping();
	if (inv != null) {
		try {
			com.opensymphony.xwork2.util.location.Location loc = inv.getProxy().getConfig().getLocation();
			sourceUrl += "?config="+(loc != null ? loc.getURI()+":"+loc.getLineNumber() : "");
		} catch (Exception e) {
			sourceUrl += "?config=";
		}
		sourceUrl += "&className="+inv.getProxy().getConfig().getClassName();

		if (inv.getResult() != null && inv.getResult() instanceof org.apache.struts2.dispatcher.StrutsResultSupport) {
			sourceUrl += "&page="+mapping.getNamespace()+"/"+((org.apache.struts2.dispatcher.StrutsResultSupport)inv.getResult()).getLastFinalLocation();
		}
	} else {
		sourceUrl += "?page="+request.getServletPath();
	}
%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<meta name="description" content="Struts2 Showcase for Apache Struts Project">
	<meta name="author" content="The Apache Software Foundation">

	<title><decorator:title default="Struts2 Showcase"/></title>

	<link href="<s:url value='/styles/bootstrap.css' encode='false' includeParams='none'/>" rel="stylesheet"
	      type="text/css" media="all">
	<link href="<s:url value='/styles/bootstrap-responsive.css' encode='false' includeParams='none'/>" rel="stylesheet"
	      type="text/css" media="all">
	<link href="<s:url value='/styles/main.css' encode='false' includeParams='none'/>" rel="stylesheet" type="text/css"
	      media="all"/>

	<script src="<s:url value='/js/jquery-1.8.2.min.js' encode='false' includeParams='none'/>"></script>
	<script src="<s:url value='/js/bootstrap.min.js' encode='false' includeParams='none'/>"></script>
	<script type="text/javascript">
		$(function () {
			$('.dropdown-toggle').dropdown();
			var alerts = $('ul.alert').wrap('<div />');
			alerts.prepend('<a class="close" data-dismiss="alert" href="#">&times;</a>');
			alerts.alert();
		});
	</script>

	<!-- Prettify -->
	<link href="<s:url value='/styles/prettify.css' encode='false' includeParams='none'/>" rel="stylesheet">
	<script src="<s:url value='/js/prettify.js' encode='false' includeParams='none'/>"></script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<decorator:head/>
</head>

<body id="page-home" onload="prettyPrint();">

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container-fluid">
			<div class="nav-collapse">
				<ul class="nav">
					<li><s:a value="/index.action"><i class="icon-home"></i>Home</s:a></li>
					<li>
						<s:a action="person!list" namespace="person">Employee Manager</s:a>
					</li>
					<li><s:a value="/interactive/index.action">Interactive Demo</s:a></li>
					<li>

					</li>
				</ul>

			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>

<decorator:body/>


<hr>

<footer id="footer" class="footer" style="margin-left: 10px;margin-right:10px;">
	<div class="pull-right">
		<div>
			<s:action var="dateAction" name="date" namespace="/" executeResult="true"/>
		</div>
		<!-- end branding -->

		<div>
			<a href="http://struts.apache.org/2.x/">
				<img src="<s:url value='/img/struts-power.gif' encode='false' includeParams='none'/>"
				     alt="Powered by Struts"/>
			</a>
		</div>
		<!-- end search -->
	</div>

	<div class="pull-left">
		MergeBase Software 2024
	</div>
</footer>
</body>
</html>
