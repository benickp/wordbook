<%@ page import="com.abc.wordbook.Word" %>



<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'word', 'error')} ">
	<label for="word">
		<g:message code="word.word.label" default="Word" />
		
	</label>
	<g:textField name="word" value="${wordInstance?.word}"/>
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
	<g:textArea name="definitionSentence" value="${wordInstance?.definitionSentence}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'exampleSentence', 'error')} ">
	<label for="exampleSentence">
		<g:message code="word.exampleSentence.label" default="Example Sentence" />
		
	</label>
	<g:textArea name="exampleSentence" value="${wordInstance?.exampleSentence}" rows="5" cols="50"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="word.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="note" name="note.id" from="${com.abc.wordbook.Note.list()}" optionKey="id" required="" value="${wordInstance?.note?.id}" class="many-to-one"/>
</div>

