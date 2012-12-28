<%@ page import="com.abc.wordbook.Note" %>



<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'title', 'error')} ">
	<g:textField name="title" value="${noteInstance?.title}" style="width:100%;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'content', 'error')} ">
<ckeditor:editor name="content" height="500px" width="100%">
${noteInstance?.content}
</ckeditor:editor>
	
</div>
