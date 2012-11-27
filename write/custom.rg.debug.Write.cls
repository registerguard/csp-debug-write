/// custom.rg.debug.Write
/// See <code>custom.rg.debug.WriteRule.csr</code> for related code.
/// 
/// @docs https://github.com/registerguard/csp-debug-write
/// @copyright Copyright (c) 2012 Micky Hulse/The Register-Guard.
/// @license Released under the Apache License, Version 2.0.
/// http://www.apache.org/licenses/LICENSE-2.0
/// @version 1.0.0
/// @date Monday, November 24, 2012
Class custom.rg.debug.Write Extends %RegisteredObject
{

/// The <method>all</method> ClassMethod outputs the value of zwrite command with its HTML escaped.
/// 
/// @see https://groups.google.com/d/topic/intersystems-public-cache/-CmAIWmtHdY/discussion
/// 
/// @param label { %String } Used as a label for the output.
/// @param attr { %String } HTML attributes and values to apply to <code>&lt;pre&gt;</code> tag.
ClassMethod all(
	label As %String = "",
	attr As %String = "")
{
	
	; Only write debug info in "debug" exists as a query string in the URI:
	if ($get(%request.Data("debug", 1), 0)) {
		
		; Opening debug info label:
		write !, "<pre", ..attrs(attr), ">", !, "---------- ", $zconvert(label, "U"), " ----------"
		
		; Try to otput debug info:
		try {
			
			; Switch the device's IO to "HTML":
			set currIO = ##class(%SYS.NLS.Device).SetIO("HTML")
			
			; Write debug info:
			zwrite
			
		} catch (e) {
			
			; Display a %Status error code to the CSP Page:
			do ##class(%CSP.Page).ShowError(e.AsStatus())
			
		}
		
		; Do we need to switch back to a previous IO?
		if ($length($get(currIO))) {
			
			; Yep. Change it:
			do ##class(%SYS.NLS.Device).SetIO(currIO)
			
		}
		
		; Closing debug info label:
		write !, "---------- ", $zconvert(label, "U"), " ----------", !, "</pre>", !
		
	}
}

/// The <method>attrs</method> ClassMethod parses delimited attributes for use in an HTML tag.
/// 
/// @param string { %String } Delimited string to parse.
/// @param delim1 { %String } Parent delimeter. Default is ",".
/// @param delim2 { %String } Child delimeter. Default is "|".
/// @private
ClassMethod attrs(
	string As %String = "",
	delim1 As %String = ",",
	delim2 As %String = "|") As %String [ Private ]
{
	
	; Return value:
	set return = ""
	
	; Should we continue?
	if ($length(string)) {
		
		; Leading white space:
		set return = " "
		
		; Loop through the string:
		for i=1:1:$length(string, delim1) {
			
			; Get the attribute set:
			set attribute = $zstrip($piece(string, ",", i), "<>W")
			
			; There should only be one delimeter per set:
			if ($length(attribute, delim2) = 2) {
				
				; Attribute name:
				set key = $zstrip($piece(attribute, "|"), "<>W")
				
				; Attribute value:
				set value = $zstrip($piece(attribute, "|", 2), "<>W")
				
				; Build the attribute string:
				set return = return _ key _ "=""" _ value _ """ "
				
			}
			
		}
		
	}
	
	; Return:
	quit return
}

}
