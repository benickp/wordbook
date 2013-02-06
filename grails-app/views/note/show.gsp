
<%@ page import="com.abc.wordbook.Note" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-note" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-note" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list note">
			
				<g:if test="${noteInstance?.title}">
				<li class="fieldcontain">
					<span style="font-size: 18px;font-weight: bold;">
						<g:fieldValue bean="${noteInstance}" field="title"/>
					</span>
				</li>
				</g:if>
				<g:if test="${noteInstance?.dateCreated}">
				<li class="fieldcontain2">
						<span style="font-size: 11px;color: gray;">Created : <g:fieldValue bean="${noteInstance}" field="dateCreated"/></span>
						<span style="font-size: 11px;padding-left : 10px;color: gray;">Modified :  <g:fieldValue bean="${noteInstance}" field="lastUpdated"/></span>
				</li>
				</g:if>
				<g:if test="${noteInstance?.url}">
				<li class="fieldcontain">
					
						URL:  ${noteInstance.url}
						
					
				</li>
				</g:if>
				<g:if test="${noteInstance?.content}">
				<li class="fieldcontain">
					
						${noteInstance.content.decodeHTML()}
						
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${noteInstance?.id}" />
					<g:link class="edit" action="edit" id="${noteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="create" controller="word" action="create" params='[noteId:"${noteInstance?.id}"]'>New Word</g:link>
				</fieldset>
			</g:form>
			
		</div>
		<g:javascript src="jquery.highlight.js" />
		<g:javascript>	
			$(document).ready(function() {
				var wordArray = new Array();
				<g:each status="i" var="word" in="${noteInstance.words}">
					wordArray[${i}] = "${word.word}";
				</g:each>
				$("body p").highlight(wordArray);
			 });
		</g:javascript>
	</body>
</html>
