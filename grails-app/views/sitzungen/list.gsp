
<%@ page import="it.bolzano.comune.bauamtWeb.Sitzungen" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sitzungen.label', default: 'Sitzungen')}" />
		
		<g:javascript library="jquery" />
		<r:require module="jquery-ui"/>		
	</head>
	<body>
		<a href="#list-Sitzungen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<%--
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		 --%>
		<g:form method="post" action="list">
			<fieldset class="embedded">
				<g:render template="queryForm"/>
				<div class="fieldcontain">
				  <label for="tipoPratica"> &nbsp;</label>
				  <g:submitButton class="buttons" name="${message(code: 'default.button.query.label', default: 'Suche')}" />
				  &nbsp;				  
				  <g:actionSubmit class="buttons" value="${message(code: 'default.button.reset.label', default: 'Reset')}" action="reset" />
				</div>
			</fieldset>
		</g:form>
				
		<div id="list-Sitzungen" class="content scaffold-list" role="main">
			<h1><g:message code="sitzungen.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn params="${params.findAll{it.value}}" property="nummer" title="${message(code: 'sitzungen.nummer.label', default: 'Nummer der Sitzung')}" />
					
						<g:sortableColumn params="${params.findAll{it.value}}" property="sitzDatum" title="${message(code: 'sitzungen.sitzDatum.label', default: 'Datum')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sitzungenInstanceList}" status="i" var="sitzungenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${sitzungenInstance.id}" >${fieldValue(bean: sitzungenInstance, field: "nummer")}</g:link></td>
					
						<td><g:formatDate date="${sitzungenInstance.sitzDatum}" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
			    (${sitzungenInstanceTotal+' '+entityName})			
				<g:paginate params="${params.findAll{it.value}}" total="${sitzungenInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
