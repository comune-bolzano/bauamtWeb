<%@ page import="it.bolzano.comune.bauamtWeb.Bauakte" %>
<%@ page import="it.bolzano.comune.bauamtWeb.Sitzungen" %>
<%@ page import="it.bolzano.comune.bauamtWeb.BauakteSitzungen" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sitzung.label', default: 'Sitzung')}" />
	</head>
	<body>
		<a href="#show-sitzungen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<%--
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		 --%>
		<div id="show-sitzungen" class="content scaffold-show" role="main">
			<h1>
			   <g:message code="${message(code: 'default.show.label', default: 'Sitzung')}" args="[entityName]" />
				<g:if test="${sitzungenInstance?.nummer}">
 				   <g:fieldValue bean="${sitzungenInstance}" field="nummer" /> - 
 				   <g:formatDate date="${sitzungenInstance.sitzDatum}" />
				</g:if>			
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<tbody>
				<g:each in="${sitzungenInstance.bauakteSitzungen}" status="i" var="bs">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">					    
					    
					    <td>
					      ${i+1}
					    </td>
					    
					    <td>
					       <g:set var="persona" value="true"></g:set>
						   <g:each in="${bs.bauAkt.persone}" var="per">
						      <g:if test="${per.kennungId == 1 && persona}">
						           <g:set var="persona" value=""></g:set>
	    					       <b><g:fieldValue bean="${per}" field="antragsteller"/></b></br> 	    					      
						      </g:if>   						       
						   </g:each>     
	    					      
					       <g:fieldValue bean="${bs.bauAkt}" field="art${localeSuffix()}"/></br>
					       <g:fieldValue bean="${bs.bauAkt}" field="beschreibung${localeSuffix()}"/></br>
						   <g:each in="${bs.bauAkt.zone}" status="z" var="zona">
						      <g:if test="${z == 0}">					       
					    	      <g:fieldValue bean="${zona}" field="beschreibung${localeSuffix()}"/>
						      </g:if>   						       
						   </g:each>     
					    </td>
					    
						<td>
						   <g:fieldValue bean="${bs.bauAkt}" field="verantwortlicher"/></br>
					       <g:fieldValue bean="${bs.bauAkt}" field="verwaltungsakt${localeSuffix()}"/>						   
						</td>

						<td>
						   <g:fieldValue bean="${bs}" field="entschluss${localeSuffix()}"/><br/>
						</td>

						<td>
						   <g:each in="${bs.bauAkt.indirizzo}" status="y" var="ind">
						      <g:if test="${y == 0}">
						         <g:fieldValue bean="${ind}" field="indirizzo${localeSuffix()}"/>
						      </g:if>   						       
						   </g:each>     
						</td>
					
						<td>
						    <g:formatDate date="${bs.bauAkt.eingangsdatum}" /><br/>
						   	<g:link action="show" controller="Bauakte" id="${bs.bauAkt.id}">${fieldValue(bean: bs.bauAkt, field: "baNummer")}</g:link>						    
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>

			<g:form>
				<fieldset class="pagination">
				    <input class="buttons" type="button" value="Indietro" onclick="javascript:history.back()"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
