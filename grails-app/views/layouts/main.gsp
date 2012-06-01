<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="${message(code: 'application.title.label', default: 'Pratiche edilizie online')}" /></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'style2_acc.css')}" type="text/css">
	<link rel="stylesheet"	href="${resource(dir: 'css', file: 'style2_urbanistica_acc.css')}" type="text/css">
	
	<g:layoutHead />
	<r:layoutResources />
</head>
<body>
<%-- 	<div id="appLogo" role="banner">
 	      <img  height="90"  src="${resource(dir: 'images', file: 'bauamtWeb.jpeg')}" alt="bauamtWeb"/>
		  <h1>Pratiche edilizie online <g:meta name="app.version"/></h1>
		</div>
		
		<div class="alignright" >
	       <g:switchLanguage  />
        </div>
		
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
        <r:layoutResources />
--%>

	<div id="containerInside">
		<div id="header">
			<a name="top" class="goTop"></a>
			<div id="headerLogo">
				<div class="leftDiv">
					<h1>
						<a href="#main_content" class="skip" title="Salta ai contenuti della pagina">Vai ai contenuti della pagina</a> 
						<a href="http://www.comune.bolzano.it/homepage.jsp"	title="Citt&agrave; di Bolzano / Stadt Bozen - Torna alla pagina di presentazione">
						   <img src="${resource(dir: 'images', file: 'stemma_comune_nuovo.gif')}" width="133" height="60" alt="Citt&agrave; di Bolzano / Stadt Bozen - Torna alla pagina di presentazione" />
						</a>
					</h1>
				</div>
				<div class="rightDivPad">
					<g:switchLanguage  />				
				</div>
				<div class="end">&nbsp;</div>
			</div>

<div class="headerServizio02" style="padding:0.7em 0.3em;">
	<div>
		<div class="leftDivHeader"> 
			<h1>${message(code: 'application.label', default: 'Bauakte online')}</h1>
		</div>
		<div class="end"> </div>
	</div>
</div>
		<div id="headerMenuContainer">
			<div id="headerMenu">
				<div id="headerMenu02">
					<ul>
						<li><g:link class="${params.controller == 'bauakte' ? 'selected' : 'none'}" controller="Bauakte">${message(code: 'bauakte.menu', default: 'Bauakte suchen')}</g:link></li>
					    <li><g:link class="${params.controller == 'sitzungen' ? 'selected' : 'none'}" controller="Sitzungen">${message(code: 'sitzungen.menu', default: 'Baukomission')}</g:link></li>		  
					</ul>
				</div>
			</div>
		</div>

		<div id="headerPath">
			<ul>
				<li class="first"><a class="none" href="${message(code: 'default.homepage', default: 'http://www.gemeinde.bozen.it')}/homepage.jsp" title="homepage">Home</a></li>
				<li class="first"><span>&gt;</span>&nbsp;<a class="none" href="${message(code: 'default.homepage', default: 'http://www.gemeinde.bozen.it')}/urb_default.jsp?ID_LINK=199&area=18" title="homepage">${message(code: 'default.button.territorio.label', default: 'Territorium und Urbanistik ')}</a></li>
				<li class="selected"><span>&gt;</span>&nbsp;<a class="none" href="${createLink(uri: '/')}" title="homepage">${message(code: 'application.label', default: 'Bauakte ')}</a></li>
			</ul>
		</div>
		<div class="spacer"></div>
	</div>
		<div id="main">
			<div id="mainCenterPoll"></div>
			<div id="mainCenterContext">
				<a name="main_content" title="Contenuto principale"></a>		        
		        
		        <g:layoutBody/>

			</div>
			<div id="mainCenterGoTop">
<%--			<a href="#top"> <img src="images/top_grigio.gif" width="20" height="13" alt="Torna ad inizio pagina" title="Torna ad inizio pagina" /> --%>
			</div>
		</div>
		<div class="end" />
		<div id="footer">
			<div id="footerCredits">
				<div class="centerDiv100">&copy; 1999-2012 ${message(code: 'bolzano.messaggio', default: 'Stadt Bozen ')}</div>
			</div>
		</div>
	</div>

	<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	<g:javascript library="application"/>
			
	
	
    <r:layoutResources />

</body>
</html>