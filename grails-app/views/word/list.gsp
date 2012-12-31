
<%@ page import="com.abc.wordbook.Word" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'word.label', default: 'Word')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-word" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-word" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="word" title="${message(code: 'word.word.label', default: 'Word')}" />
					
						<th><g:message code="word.category.label" default="Category" /></th>
					
						<g:sortableColumn property="translation" title="${message(code: 'word.translation.label', default: 'Translation')}" />
					
						<g:sortableColumn property="definitionSentence" title="${message(code: 'word.definitionSentence.label', default: 'Definition Sentence')}" />
					
						<g:sortableColumn property="exampleSentence" title="${message(code: 'word.exampleSentence.label', default: 'Example Sentence')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'word.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${wordInstanceList}" status="i" var="wordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${wordInstance.id}">${fieldValue(bean: wordInstance, field: "word")}</g:link></td>
					
						<td>${fieldValue(bean: wordInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: wordInstance, field: "translation")}</td>
					
						<td>${fieldValue(bean: wordInstance, field: "definitionSentence")}</td>
					
						<td>${fieldValue(bean: wordInstance, field: "exampleSentence")}</td>
					
						<td><g:formatDate date="${wordInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${wordInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
