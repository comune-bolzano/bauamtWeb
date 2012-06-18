<g:javascript src="jquery.ui.datepicker-${localeSuffix().toLowerCase()}.js"/>
<g:javascript>
//Associa automaticamente agli input type=date il calendario jQueryUi 
$(document).ready(function()
	    {	
	      $(':input[type=datex]').each(function(index, value) {
	          $(this).datepicker({dateFormat: '${message(code: "jsDateFormat", default: "dd/mm/yy")}', 
	              showButtonPanel: false});                             
	      });	
	      
	      $('#comuneCatastale').change(function() {		
			if ($('#comuneCatastale').val() != '')	{
			   $('#tipoParticella').removeAttr("disabled");
			   $('#numParticella').removeAttr("disabled");
			   $('#pm').removeAttr("disabled");
                           $('#sub').removeAttr("disabled");
			} else {
			   $('#tipoParticella').attr("disabled", true);
			   $('#numParticella').attr("disabled", true);
			   $('#pm').attr("disabled", true);
                           $('#sub').attr("disabled", true);
			}
		   });
	            
	      $('#sedeOpera').change(function() {		
			if ($('#sedeOpera').val() != '')  {
			   $('#civico').removeAttr("disabled");
                           $('#barra').removeAttr("disabled");
			} else {
			   $('#civico').attr("disabled", true);
                           $('#barra').attr("disabled", true);
			}
		   });

	      $('#cognomeProgettista').keyup(function() {		
			if ($('#cognomeProgettista').val() != '')	{
			   $('#nomeProgettista').removeAttr("disabled");
			} else {
			   $('#nomeProgettista').attr("disabled", true);
			}
		   });

	    })
</g:javascript>	    

<div class="fieldcontain">
	<label for="tipoPratica"> <g:message code="bauakte.verwaltungsaktId.label" default="Tipo pratica" />
	</label>
	<g:select  name="tipoPratica" from="${it.bolzano.comune.bauamtWeb.TipoPratica.list(sort: "id")}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="beschreibung${localeSuffix()}" optionKey="id" value="${params.tipoPratica}" class="many-to-one" />
</div>
<br/>
<div class="fieldcontain">
	<label for="baNummer"> <g:message code="bauakte.baNummer.label" default="Numero/anno pratica" />
	</label>
	<g:textField name="baNummer" maxlength="11" value="${params.baNummer}" />
</div>
<div class="fieldcontain">
	<label for="daDataPresentazione"> <g:message code="bauakte.eingangsdatum.label" default="Data presentazione" />
	</label>
	<g:field type="datex" maxlength="10" name="daDataPresentazione" value="${params.daDataPresentazione}" /> <g:message code="al.label" default="al" />  
	<g:field type="datex" maxlength="10" name="aDataPresentazione" value="${params.aDataPresentazione}"/>
</div>
<br/>
<div class="fieldcontain">
	<label for="archivnr"> <g:message code="bauakte.archivnr.label" default="Numero/anno provvedimento" />
	</label>
	<g:textField name="archivnr" maxlength="11" value="${params.archivnr}" />
</div>
<div class="fieldcontain">
	<label for="daDataDeterminazione"> <g:message code="detailDocumente.dokumentdatum.label" default="Data determinazione" />
	</label>
	<g:field type="datex" maxlength="10" name="daDataDeterminazione" value="${params.daDataDeterminazione}" /> <g:message code="al.label" default="al" />  
	<g:field type="datex" maxlength="10" name="aDataDeterminazione" value="${params.aDataDeterminazione}"/>
</div>
<br/>
<div class="fieldcontain">
	<label for="sedeOpera"> <g:message code="vie.descr.label" default="Sede opera" />
	</label>
	<g:select name="sedeOpera" from="${it.bolzano.comune.bauamtWeb.Vie.list(sort: "descr"+localeSuffix())}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="descr${localeSuffix()}" optionKey="id" value="${params.sedeOpera}" class="many-to-one" />
</div>
<div class="fieldcontain">
	<label for="sedeOpera"> <g:message code="vie.civico.label" default="Civico" /> 
	</label>
        <g:textField disabled="${!params.sedeOpera ? 'true' :'false'}" type="number" name="civico" size="5" maxlength="10" value="${params.civico}" />/
	<g:select disabled="${!params.sedeOpera ? 'true' :'false'}" name="barra" from="${'A'..'Z'}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		  value="${params.barra}" class="many-to-one" />
</div>                  
<br/>
<div class="fieldcontain">
	<label for="comuneCatastale"> <g:message code="comuniCatastali.label" default="Comune catastale" />
	</label>
	<g:select name="comuneCatastale" from="${it.bolzano.comune.bauamtWeb.ComuniCatastali.list(sort: "beschreibung"+localeSuffix())}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="beschreibung${localeSuffix()}" optionKey="id" value="${params.comuneCatastale}" class="many-to-one" />
</div>
<div class="fieldcontain">
	<label for="pf"> <g:message code="bauakte.particelle.label" default="Particelle catastali" />	
	</label> 
	<g:select disabled="${!params.comuneCatastale ? 'true' :'false'}"  name="tipoParticella" from="${it.bolzano.comune.bauamtWeb.TipoParticelle.list()}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="beschreibung${localeSuffix()}" optionKey="id" value="${params.tipoParticella}" class="many-to-one" />
	<g:textField disabled="${!params.comuneCatastale ? 'true' :'false'}" name="numParticella" size="5" maxlength="10" value="${params.numParticella}" />        
	<g:message code="sub.label" default="Sub" />
	<g:textField disabled="${!params.comuneCatastale ? 'true' :'false'}" name="sub" size="5" maxlength="10" value="${params.sub}" />
	<g:message code="pm.label" default="Pm" />
	<g:textField disabled="${!params.comuneCatastale ? 'true' :'false'}" name="pm" size="5" maxlength="10" value="${params.pm}" />
</div>
<br/>
<div class="fieldcontain">
	<label for="cognomeRichiedente"> <g:message code="detailPers.richiedente.label" default="Richiedente" />
	</label>
	<g:textField name="cognomeRichiedente" maxlength="50" value="${params.cognomeRichiedente}" />
	<g:message code="detailPers.richiedenteNome.label" default="Nome"/> 
	<g:textField disabled="${!params.cognomeRichiedente ? 'true' :'false'}" name="nomeRichiedente" maxlength="50" value="${params.nomeRichiedente}" />
</div>
<div class="fieldcontain">
	<label for="cognomeProgettista"> <g:message code="detailPers.progettista.label" default="Progettista" />
	</label>
	<g:textField name="cognomeProgettista" maxlength="50" value="${params.cognomeProgettista}" />
	<g:message code="detailPers.progettistaNome.label" default="Nome"/>
	<g:textField disabled="${!params.cognomeProgettista ? 'true' :'false'}" name="nomeProgettista" maxlength="50" value="${params.nomeProgettista}" />
</div>

