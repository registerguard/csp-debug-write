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
ClassMethod all(label As %String = "")
{
	if ($get(%request.Data("debug", 1), 0)) {
		write !, "<pre>", !, "---------- ", $zconvert(label, "U"), " ----------"
		try {
			set currIO = ##class(%SYS.NLS.Device).SetIO("HTML")
			zwrite
		} catch (e) {
			do ##class(%CSP.Page).ShowError(e.AsStatus())
		}
		if ($length($get(currIO))) {
			do ##class(%SYS.NLS.Device).SetIO(currIO)
		}
		write !, "---------- ", $zconvert(label, "U"), " ----------", !, "</pre>", !
	}
}

}
