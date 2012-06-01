<g:javascript src="jquery.ui.datepicker-${localeSuffix().toLowerCase()}.js"/>
<g:javascript>
//Associa automaticamente agli input type=date il calendario jQueryUi 
$(document).ready(function()
	    {
	      $(':input[type=datex]').each(function(index, value) {
	          $(this).datepicker({dateFormat: '${message(code: "jsDateFormat", default: "dd/mm/yy")}', 
	              showButtonPanel: false });          
	      });
	    })
</g:javascript>	    

<div class="fieldcontain">
	<label for="idSeduta"> <g:message code="sitzungen.id.label" default="Numero/anno seduta" />
	</label>
	<g:select name="idSeduta" from="${it.bolzano.comune.bauamtWeb.Sitzungen.list()}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="nummer" optionKey="id" value="${params.idSeduta}" class="many-to-one" />
</div>
<div class="fieldcontain">
	<label for="daDataSeduta"> <g:message code="sitzungen.sitzDatum.label" default="Data seduta" />
	</label>
	<g:field type="datex" maxlength="10" name="daDataSeduta" value="${params.daDataSeduta}" /> <g:message code="al.label" default="al" />  
	<g:field type="datex" maxlength="10" name="aDataSeduta" value="${params.aDataSeduta}" />
</div>

