
<%@ page import="it.bolzano.comune.bauamtWeb.Bauakte" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bauakte.label', default: 'Bauakte')}" />
		
		<g:javascript library="jquery" />
		<r:require module="jquery-ui"/>
			
	</head>
	<body>
		<a href="#list-bauakte" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<%--
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		 --%>
		
		<div id="NuovaRic" style="display:${bauakteInstanceList.asBoolean() == false ? 'none' : 'block'}">
		<a href="#" onclick="javascript:document.getElementById('InputForm').style.display='block';document.getElementById('NuovaRic').style.display='none'";>Esegui nuova ricerca</a>
		</div>
		
		<div id="InputForm" style="display:${bauakteInstanceList.asBoolean() == false ? 'block' : 'none'}">
		<g:form  name="queryForm"  method="post" action="list">
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
		</div>
		
		<div id="list-bauakte" class="content scaffold-list" role="main">
			<h1><g:message code="bauakte.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn params="${params.findAll{it.value}}"  property="sortingNummer" title="${message(code: 'bauakte.baNummer.label', default: 'Ba Nummer')}" />
					
						<g:sortableColumn params="${params.findAll{it.value}}" property="eingangsdatum" title="${message(code: 'bauakte.eingangsdatum.label', default: 'Eingangsdatum')}" />
											
						<th><g:message code="bauakte.verwaltungsaktId.label" default="Verwaltungsakt" /></th>
						
						<th><g:message code="vie.descr.label" default="Standort" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${bauakteInstanceList}" status="i" var="bauakteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bauakteInstance.id}">${fieldValue(bean: bauakteInstance, field: "baNummer")}</g:link></td>
					
						<td><g:formatDate date="${bauakteInstance.eingangsdatum}" /></td>
					
						<td>${fieldValue(bean: bauakteInstance, field: "verwaltungsakt"+localeSuffix())}</td>
						
						<td>
						  <g:if test="${bauakteInstance?.indirizzo}">						  
							<g:each in="${bauakteInstance.indirizzo}" var="d" status="ind" >
							    <g:if test="${ind > 0}">,</g:if>
							    ${fieldValue(bean: d, field: "indirizzo${localeSuffix()}")}								  
							</g:each>
						  </g:if>  
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
			    (${bauakteInstanceTotal+' '+entityName})
				<g:paginate  params="${params.findAll{it.value}}"  total="${bauakteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
