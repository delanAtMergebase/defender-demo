<html>
<head>
	<title>MergeBase Target App - Add participant</title>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h1>All Participants</h1>
	</div>
	<div class="row-fluid">
		<div class="span3">
			<ul class="nav nav-tabs nav-stacked">
				<@s.url id="listpeopleurl" action="list-people" />
				<li class="active"><@s.a href="%{listpeopleurl}">List all participants</@s.a></li>
				<@s.url id="editpersonurl" action="edit-person" />
				<li><@s.a href="%{editpersonurl}">Edit participants</@s.a></li>
				<@s.url id="newpersonurl" action="new-person" method="input" />
				<li><@s.a href="%{newpersonurl}">Create a new participant</@s.a></li>
			</ul>
		</div>
		<div class="span9">

			<p>There are ${peopleCount} participants...</p>

			<table class="table table-striped table-bordered table-hover table-condensed">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Last Name</th>
				</tr>
			<#list people as person>
				<tr>
					<td>${person.id?html}</td>
					<td>${person.name?html}</td>
					<td>${person.lastName?html}</td>
				</tr>
			</#list>
			</table>
		</div>
	</div>
</div>
</body>
</html>
