package it.bolzano.comune.bauamtWeb

import grails.converters.*

abstract class BaseController {
	
    static allowedMethods = [list: ['GET', 'POST'], show: "GET"]

    def model
	
    protected def getDefaultDateFormat() {
        message(code: "default.date.format", default: 'dd/MM/yyyy')
    }  
	 
    protected def getModelName() {
        model.metaClass.theClass.toString().tokenize('.').last()
    }
	
    protected def uncapitalize (String value) {
        value[0].toLowerCase() + value.substring(1)
    }
  
    protected def getModelLabel() {
        uncapitalize(getModelName()) + '.label'
    }	

    protected def getModelXmlKey() {
        uncapitalize(getModelName())
    }
	
    protected def getInstanceListKey() {
        uncapitalize(getModelName()) + 'InstanceList'
    }
	
    protected def getInstanceTotalKey() {
        uncapitalize(getModelName()) + 'InstanceTotal'
    }

    protected def getInstanceKey() {
        uncapitalize(getModelName()) + 'Instance'
    }
	
    def index() {
        redirect(action: "list", params: params)
    }
	
    protected def doList(params) {
        model.list(params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)				
        def retvalue = doList(params)
        def tot = (retvalue ? retvalue?.getTotalCount() : 0) 
		
        withFormat {
            html {[(getInstanceListKey()): retvalue, (getInstanceTotalKey()): tot]}
            xml { render retvalue as XML }
            json { render retvalue as JSON }
        }
    }

    protected def doFind(params) {
        model.findById(params.id)
    }	
	
    def show() {
        def retvalue
        if(params.id && model.exists(params.id)){
            retvalue = doFind(params)
        }
        if (retvalue) {
            withFormat {
                html { [(getInstanceKey()): retvalue] }
                xml { render retvalue as XML }
                json { render retvalue as JSON }
            }
        }
    }
}
