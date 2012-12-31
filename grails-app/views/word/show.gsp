
<%@ page import="com.abc.wordbook.Word" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'word.label', default: 'Word')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-word" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-word" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list word">
			
				<g:if test="${wordInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="word.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:link controller="note" action="show" id="${wordInstance?.note?.id}">${wordInstance?.note?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wordInstance?.word}">
				<li class="fieldcontain">
					<span id="word-label" class="property-label"><g:message code="word.word.label" default="Word" /></span>
					
						<span class="property-value" aria-labelledby="word-label"><g:fieldValue bean="${wordInstance}" field="word"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wordInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="word.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="wordCategory" action="show" id="${wordInstance?.category?.id}">${wordInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wordInstance?.translation}">
				<li class="fieldcontain">
					<span id="translation-label" class="property-label"><g:message code="word.translation.label" default="Translation" /></span>
					
						<span class="property-value" aria-labelledby="translation-label"><g:fieldValue bean="${wordInstance}" field="translation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wordInstance?.definitionSentence}">
				<li class="fieldcontain">
					<span id="definitionSentence-label" class="property-label"><g:message code="word.definitionSentence.label" default="Definition Sentence" /></span>
					
						<span class="property-value" aria-labelledby="definitionSentence-label"><g:fieldValue bean="${wordInstance}" field="definitionSentence"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wordInstance?.exampleSentence}">
				<li class="fieldcontain">
					<span id="exampleSentence-label" class="property-label"><g:message code="word.exampleSentence.label" default="Example Sentence" /></span>
					
						<span class="property-value" aria-labelledby="exampleSentence-label"><g:fieldValue bean="${wordInstance}" field="exampleSentence"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wordInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="word.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${wordInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${wordInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="word.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${wordInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${wordInstance?.id}" />
					<g:link class="edit" action="edit" id="${wordInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
