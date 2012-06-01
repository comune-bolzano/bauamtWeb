<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>bauamtWeb</title>
		<style type="text/css" media="screen">
			#menu {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 14em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #menu {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#menu ul {
				font-size: 1.1em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#menu h1 {
			    color: black;
				text-transform: uppercase;
				font-size: 1.3em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#page-body {
					display: none;
				}

				#menu {
					margin: 0 1em 1em;
				}

				#menu h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#menu" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="menu" role="menu">
			<h1><g:message code="menu" default="Menu" /></h1>
			<ul>
			  <li class="controller"><g:link controller="Bauakte">${message(code: 'bauakte.menu', default: 'Ricerca pratiche')}</g:link></li>
			  <li class="controller"><g:link controller="Sitzungen">${message(code: 'sitzungen.menu', default: 'Commissione edilizia')}</g:link></li>		  
			</ul>
			<br/>
		</div>
		<div id="page-body" role="about">
			<h1>Welcome to ...</h1>
			<p>.......</p>
		</div>
	</body>
</html>
