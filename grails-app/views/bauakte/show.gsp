
<%@ page import="it.bolzano.comune.bauamtWeb.Bauakte" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bauakte.label', default: 'Bauakte')}" />
	</head>
	<body>
		<a href="#show-bauakte" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<%--
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		 --%>
		<div id="show-bauakte" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bauakte">

				<g:if test="${bauakteInstance?.beschreibungIt}">
				<li class="fieldcontain">
					<span id="beschreibungIt-label" class="property-label"><g:message code="bauakte.beschreibung.label" default="Eingriff / Gegenstand" /></span>
					
						<span class="property-value" aria-labelledby="beschreibungIt-label"><g:fieldValue bean="${bauakteInstance}" field="beschreibung${localeSuffix()}"/></span>
					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.artIt}">
				<li class="fieldcontain">
					<span id="artIt-label" class="property-label"><g:message code="bauakte.artId.label" default="Art" /></span>
					
						<span class="property-value" aria-labelledby="artIt-label"><g:fieldValue bean="${bauakteInstance}" field="art${localeSuffix()}"/></span>
					
				</li>
				</g:if>
						
				<g:if test="${bauakteInstance?.verwaltungsaktIt}">
				<li class="fieldcontain">
					<span id="verwaltungsaktIt-label" class="property-label"><g:message code="bauakte.verwaltungsaktId.label" default="Verwaltungsakt It" /></span>
					
						<span class="property-value" aria-labelledby="verwaltungsaktIt-label"><g:fieldValue bean="${bauakteInstance}" field="verwaltungsakt${localeSuffix()}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bauakteInstance?.baNummer}">
				<li class="fieldcontain">
					<span id="baNummer-label" class="property-label"><g:message code="bauakte.baNummer.label" default="Ba Nummer" /></span>
					
						<span class="property-value" aria-labelledby="baNummer-label"><g:fieldValue bean="${bauakteInstance}" field="baNummer"/></span>
					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.eingangsprotnr}">
				<li class="fieldcontain">
					<span id="eingangsprotnr-label" class="property-label"><g:message code="bauakte.eingangsprotnr.label" default="Eingangsprotnr" /></span>
					
						<span class="property-value" aria-labelledby="eingangsprotnr-label"><g:fieldValue bean="${bauakteInstance}" field="eingangsprotnr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bauakteInstance?.eingangsdatum}">
				<li class="fieldcontain">
					<span id="eingangsdatum-label" class="property-label"><g:message code="bauakte.eingangsdatum.label" default="Eingangsdatum" /></span>
					
						<span class="property-value" aria-labelledby="eingangsdatum-label"><g:formatDate date="${bauakteInstance?.eingangsdatum}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bauakteInstance?.archivnr}">
				<li class="fieldcontain">
					<span id="archivnr-label" class="property-label"><g:message code="bauakte.archivnr.label" default="Provvedimento" /></span>				
			        <span class="property-value" aria-labelledby="archivnr-label"><g:link action="list" params="[archivnr: bauakteInstance.archivnr]">${bauakteInstance.archivnr?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.documenti}">
				<li class="fieldcontain">
						<span id="detailDocumenti-label" class="property-label"><g:message code="bauakte.documenti.label" default="Verfügungsdatum" /></span>					
						<g:each in="${bauakteInstance.documenti}" var="d">
							<span class="property-value" aria-labelledby="detailDocumenti-label" >
							  <g:formatDate date="${d?.dokumentdatum}" />
							</span>
						</g:each>					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.baubeginn}">
				<li class="fieldcontain">
					<span id="baubeginn-label" class="property-label"><g:message code="bauakte.baubeginn.label" default="Baubeginn" /></span>
					
						<span class="property-value" aria-labelledby="baubeginn-label"><g:formatDate date="${bauakteInstance?.baubeginn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bauakteInstance?.bauende}">
				<li class="fieldcontain">
					<span id="bauende-label" class="property-label"><g:message code="bauakte.bauende.label" default="Bauende" /></span>
					
						<span class="property-value" aria-labelledby="bauende-label"><g:formatDate date="${bauakteInstance?.bauende}" /></span>
					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.persone}">
				<li class="fieldcontain">
					
						<g:each in="${bauakteInstance.persone}" var="d">
							<span id="detailPersonen-label" class="property-label"><g:fieldValue bean="${d}" field="beschreibung${localeSuffix()}"/></span>
							<span class="property-value" aria-labelledby="detailPersonen-label">
							  <g:fieldValue bean="${d}" field="antragsteller"/>
							  <g:if test="${d.professioneIt}">
							    (<g:fieldValue bean="${d}" field="professione${localeSuffix()}"/>)
							  </g:if>
							</span>
						</g:each>
					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.indirizzo}">
				<li class="fieldcontain">
						<span id="detailIndirizzo-label" class="property-label"><g:message code="bauakte.indirizzo.label" default="Adresse" /></span>					
						<g:each in="${bauakteInstance.indirizzo}" var="d">
							<span class="property-value" aria-labelledby="detailIndirizzo-label" >
							  <g:fieldValue bean="${d}" field="indirizzo${localeSuffix()}" />
							</span>
						</g:each>
					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.particelle}">
				<li class="fieldcontain">
						<span id="detailParticelle-label" class="property-label"><g:message code="bauakte.particelle.label" default="Particelle" /></span>					
						<g:each in="${bauakteInstance.particelle}" var="d">
							<span class="property-value" aria-labelledby="detailParticelle-label" >
							  <g:fieldValue bean="${d}" field="kgBeschreibung${localeSuffix()}" />
							  <g:fieldValue bean="${d}" field="parztyp${localeSuffix()}" />
							  <g:fieldValue bean="${d}" field="nummer" />
							  <g:if test="${d.materielleanteil}">
							    PM 
							    <g:fieldValue bean="${d}" field="materielleanteil" />
							  </g:if>  								  
							</span>
						</g:each>
					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.bauakteSitzungen}">
				<li class="fieldcontain">
						<span id="detailSedute-label" class="property-label"><g:message code="bauakte.bauakteSitzungen.label" default="Commissione edilizia" /></span>					
						<g:each in="${bauakteInstance.bauakteSitzungen}" var="d">
						    <g:if test="${d.sitzung}">						
								<span class="property-value" aria-labelledby="detailSedute-label">
								  <g:link action="show" id="${d.sitzung.id}"  controller="Sitzungen" >${d.sitzung.nummer?.encodeAsHTML()}</g:link>  
								  <g:formatDate date="${d.sitzung.sitzDatum}" />
								  &nbsp;(<g:fieldValue bean="${d}" field="entscheid${localeSuffix()}"/>)  						
						     	</span>
							</g:if>						     	
						</g:each>					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.statusIt}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="bauakte.status.label" default="Status" /></span>					
					<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${bauakteInstance}" field="status${localeSuffix()}"/></span>					
				</li>
				</g:if>

				<g:if test="${bauakteInstance?.verantwortlicher}">
				<li class="fieldcontain">
					<span id="verantwortlicher-label" class="property-label"><g:message code="bauakte.verantwortlicher.label" default="Verantwortlicher" /></span>
					
						<span class="property-value" aria-labelledby="verantwortlicher-label"><g:fieldValue bean="${bauakteInstance}" field="verantwortlicher"/></span>
					
				</li>
				</g:if>
						
			</ol>
			<g:form>
				<fieldset class="pagination">
				    <input class="buttons" type="button" value="${message(code: 'default.button.indietro.label', default: 'Zurück')}" onclick="javascript:history.back()"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
