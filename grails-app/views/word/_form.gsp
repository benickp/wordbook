<%@ page import="com.abc.wordbook.Word" %>

<g:if test="${wordInstance?.note}">
<g:hiddenField name="note.id" value="${wordInstance?.note?.id}"/>
<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="word.note.label" default="Note" />
	</label>
	${wordInstance?.note?.title}
</div>
</g:if>
<g:else>
<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="word.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="note" name="note.id" from="${com.abc.wordbook.Note.list()}" optionKey="id" required="" value="${wordInstance?.note?.id}" class="many-to-one"/>
</div>
</g:else>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="word.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${wordInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'translation', 'error')} ">
	<label for="translation">
		<g:message code="word.translation.label" default="Translation" />
		
	</label>
	<g:textField name="translation" value="${wordInstance?.translation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'function', 'error')} ">
	<label for="function">
		<g:message code="word.function.label" default="Function" />
		
	</label>
	<g:select name="function" from="${wordInstance.constraints.function.inList}" value="${wordInstance?.function}" valueMessagePrefix="word.function" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'definitionSentence', 'error')} ">
	<label for="definitionSentence">
		<g:message code="word.definitionSentence.label" default="Definition Sentence" />
		
	</label>
	<g:textField name="definitionSentence" value="${wordInstance?.definitionSentence}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'exampleSentence', 'error')} ">
	<label for="exampleSentence">
		<g:message code="word.exampleSentence.label" default="Example Sentence" />
		
	</label>
	<g:textField name="exampleSentence" value="${wordInstance?.exampleSentence}"/>
</div>



