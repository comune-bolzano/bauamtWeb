package it.bolzano.comune

import org.springframework.web.servlet.support.RequestContextUtils as RCU

class LanguageTagLib {

	// extract the current locale
	public String getLocale(def httpRequest) {
		def supportedLocales = ["it", "de"]
		def locale = RCU.getLocale(httpRequest).toString()
		if (locale in supportedLocales)
			return locale
		else
			return "it"
	}
	
	def localeSuffix = {
		def suffix = getLocale(request) == 'it' ? 'It' : 'De'
		out << suffix
	}

	//Create a tag to switch between the locales.
	def switchLanguage = { attrs ->
		def langCode = getLocale(request) == 'it' ? 'de' : 'it'
		def langText = langCode == 'it' ? 'Italiano' : 'Deutsch'			
		out << '<a href="' + request.forwardURI + '?lang=' + langCode + '">' + langText + '</a>'	
	}
}
