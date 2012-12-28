<%@ page import="com.abc.wordbook.Note" %>



<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="note.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${noteInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="note.content.label" default="Content" />
	</label>
	
<ckeditor:editor name="content" height="400px" width="80%">
${noteInstance?.content}
</ckeditor:editor>
	
</div>
