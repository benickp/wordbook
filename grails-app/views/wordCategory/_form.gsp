<%@ page import="com.abc.wordbook.WordCategory" %>



<div class="fieldcontain ${hasErrors(bean: wordCategoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="wordCategory.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="name" from="${wordCategoryInstance.constraints.name.inList}" required="" value="${wordCategoryInstance?.name}" valueMessagePrefix="wordCategory.name"/>
</div>

