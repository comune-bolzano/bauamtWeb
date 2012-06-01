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
			   $('#pf').removeAttr("disabled");
			   $('#ped').removeAttr("disabled");
			   $('#pm').removeAttr("disabled");
			} else {
			   $('#pf').attr("disabled", true);
			   $('#ped').attr("disabled", true);
			   $('#pm').attr("disabled", true);
			}
		   });
	            
	      $('#cognomeRichiedente').keyup(function() {		
			if ($('#cognomeRichiedente').val() != '')	{
			   $('#nomeRichiedente').removeAttr("disabled");
			} else {
			   $('#nomeRichiedente').attr("disabled", true);
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
	<g:select  name="tipoPratica" from="${it.bolzano.comune.bauamtWeb.TipoPratica.list(sort: "beschreibung"+localeSuffix())}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="beschreibung${localeSuffix()}" optionKey="id" value="${params.tipoPratica}" class="many-to-one" />
</div>
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
<div class="fieldcontain">
	<label for="tipoOpera"> <g:message code="bauakte.artId.label" default="Tipo opera" />
	</label>
	<g:select name="tipoOpera" from="${it.bolzano.comune.bauamtWeb.TipoOpera.list(sort: "beschreibung"+localeSuffix())}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="beschreibung${localeSuffix()}" optionKey="id" value="${params.tipoOpera}" class="many-to-one" />
</div>
<div class="fieldcontain">
	<label for="sedeOpera"> <g:message code="vie.descr.label" default="Sede opera" />
	</label>
	<g:select name="sedeOpera" from="${it.bolzano.comune.bauamtWeb.Vie.list(sort: "descr"+localeSuffix())}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="descr${localeSuffix()}" optionKey="id" value="${params.sedeOpera}" class="many-to-one" />
	<g:message code="vie.civico.label" default="Civico" /> <g:textField  type="number" name="civico" size="5" maxlength="10" value="${params.civico}" />
	<g:textField type="number" name="barra" size="5" maxlength="5" value="${params.barra}" />
</div>
<div class="fieldcontain">
	<label for="comuneCatastale"> <g:message code="comuniCatastali.label" default="Comune catastale" />
	</label>
	<g:select name="comuneCatastale" from="${it.bolzano.comune.bauamtWeb.ComuniCatastali.list(sort: "beschreibung"+localeSuffix())}" noSelection="${['': message(code: 'default.select', default: 'Select one ...')]}"
		optionValue="beschreibung${localeSuffix()}" optionKey="id" value="${params.comuneCatastale}" class="many-to-one" />
</div>
<div class="fieldcontain">
	<label for="pf"> <g:message code="bauakte.particelle.label" default="Particelle catastali" />	
	</label>
	<g:textField disabled="${!params.comuneCatastale ? 'true' :'false'}" name="pf" size="5" maxlength="10" value="${params.pf}" />
	<g:message code="ped.label" default="Ped" />
	<g:textField disabled="${!params.comuneCatastale ? 'true' :'false'}" name="ped" size="5" maxlength="10" value="${params.ped}" />
	<g:message code="pm.label" default="Ped" />
	<g:textField disabled="${!params.comuneCatastale ? 'true' :'false'}" name="pm" size="5" maxlength="10" value="${params.pm}" />
</div>
<div class="fieldcontain">
	<label for="cognomeRichiedente"> <g:message code="detailPers.richiedente.label" default="Richiedente" />
	</label>
	<g:textField name="cognomeRichiedente" maxlength="50" value="${params.cognomeRichiedente}" />
	<g:message code="detailPers.richiedenteNome.label" default="Nome"/> 
	<g:textField disabled="${!params.cognome ? 'true' :'false'}" name="nomeRichiedente" maxlength="50" value="${params.nomeRichiedente}" />
</div>
<div class="fieldcontain">
	<label for="cognomeProgettista"> <g:message code="detailPers.progettista.label" default="Progettista" />
	</label>
	<g:textField name="cognomeProgettista" maxlength="50" value="${params.cognomeProgettista}" />
	<g:message code="detailPers.progettistaNome.label" default="Nome"/>
	<g:textField disabled="${!params.cognome ? 'true' :'false'}" name="nomeProgettista" maxlength="50" value="${params.nomeProgettista}" />
</div>

