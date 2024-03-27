<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title> MergeBase Target App - Upload Multiple Photos</title>
</head>

<body>

<div class="container">
	<div class="page-header">
		<h1>Upload Multiple Photos</h1>
	</div>

	<div class="row-fluid">
		<div class="span12">

			<s:form action="doMultipleUploadUsingList" method="POST" enctype="multipart/form-data">
				<s:file label="File (1)" name="upload" />
				<s:file label="File (2)" name="upload" />
				<s:file label="FIle (3)" name="upload" />
				<s:submit cssClass="btn btn-primary"/>
			</s:form>

		</div>
	</div>
</div>

</body>
</html>