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

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'word', 'error')} required">
	<label for="word">
		<g:message code="word.word.label" default="Word" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="word" required="" value="${wordInstance?.word}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="word.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.abc.wordbook.WordCategory.list()}" optionKey="id" required="" value="${wordInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'translation', 'error')} required">
	<label for="translation">
		<g:message code="word.translation.label" default="Translation" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="translation" required="" value="${wordInstance?.translation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'definitionSentence', 'error')} ">
	<label for="definitionSentence">
		<g:message code="word.definitionSentence.label" default="Definition Sentence" />
		
	</label>
	<g:textField name="definitionSentence" value="${wordInstance?.definitionSentence}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'exampleSentence', 'error')} required">
	<label for="exampleSentence">
		<g:message code="word.exampleSentence.label" default="Example Sentence" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="exampleSentence" required="" value="${wordInstance?.exampleSentence}"/>
</div>

