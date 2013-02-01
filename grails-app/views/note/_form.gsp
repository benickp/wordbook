<%@ page import="com.abc.wordbook.Note" %>

<g:hiddenField name="user.id" value="${noteInstance?.user?.id}"/>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'title', 'error')} required">
	<g:textField name="title" value="${noteInstance?.title}" style="width:100%;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'url', 'error')} required">
	URL: <g:textField name="url" value="${noteInstance?.url}" style="width:100%;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'content', 'error')} required">
<ckeditor:editor name="content" height="500px" width="100%">
${noteInstance?.content}
</ckeditor:editor>
	
</div>
