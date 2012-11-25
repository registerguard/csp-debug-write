# CSP Debug Write

### Display the names and values of all variables in the local variable environment, including private variables.

---

#### EXAMPLES

**Before:**

```html
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Testing custom:rg:debug RULE</title>
<meta name="description" content="">
<meta name="keywords" content="">
</head>
<body>

<custom:rg:debug:write this prehtml head body="2" posthtml />

<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis elit dapibus eros ornare et venenatis turpis fermentum. Integer dictum, ipsum a dapibus gravida, arcu lorem blandit eros, sit amet commodo est sapien in velit. In hac habitasse platea dictumst. Sed lorem tortor, cursus accumsan iaculis sit amet, gravida eu nisl. Suspendisse potenti. Quisque in bibendum mauris. Pellentesque aliquet, velit eu congue placerat, metus nibh ornare neque, et lacinia libero odio at nunc. Curabitur lobortis consequat purus nec vulputate. Integer condimentum ullamcorper dictum. Nam eget nulla tortor. In eros nisl, lacinia ac ultrices ac, pulvinar vitae mi. Sed luctus, ipsum eu mollis venenatis, massa leo hendrerit elit, non dignissim lorem risus at quam. Curabitur cursus tincidunt nibh, at egestas nisl tempus ut. Cras condimentum dui a leo sodales vehicula.</p>

</body>
</html>
```

**After:**

```html
<pre>
---------- PREHTML ----------
%CSPsc=1
%request=&lt;OBJECT REFERENCE&gt;[1@%CSP.Request]
%response=&lt;OBJECT REFERENCE&gt;[2@%CSP.Response]
%session=&lt;OBJECT REFERENCE&gt;[3@%CSP.Session]
&lt;Private variables&gt;
label=&quot;prehtml&quot;
currIO=&quot;UTF8&quot;
---------- PREHTML ----------
</pre>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Testing custom:rg:debug RULE</title>
<meta name="description" content="">
<meta name="keywords" content="">
<pre>
---------- HEAD ----------
%CSPsc=1
%request=&lt;OBJECT REFERENCE&gt;[1@%CSP.Request]
%response=&lt;OBJECT REFERENCE&gt;[2@%CSP.Response]
%session=&lt;OBJECT REFERENCE&gt;[3@%CSP.Session]
&lt;Private variables&gt;
label=&quot;head&quot;
currIO=&quot;UTF8&quot;
---------- HEAD ----------
</pre>

</head>
<body>

<a class="drs" href="#">&nbsp;<span><b>&lt;custom:rg:debug:write this="" prehtml="" head="" body="2" posthtml=""&gt;</b></span></a>

<pre>
---------- THIS ----------
%CSPsc=1
%request=&lt;OBJECT REFERENCE&gt;[1@%CSP.Request]
%response=&lt;OBJECT REFERENCE&gt;[2@%CSP.Response]
%session=&lt;OBJECT REFERENCE&gt;[3@%CSP.Session]
Timers=1
Timers(1)=&quot;	��z��0T�$^��&quot;
Timers(1,&quot;Attributes&quot;)=&quot;this=&quot;&quot; prehtml=&quot;&quot; head=&quot;&quot; body=&quot;2&quot; posthtml=&quot;&quot;&quot;
&lt;Private variables&gt;
label=&quot;this&quot;
currIO=&quot;UTF8&quot;
---------- THIS ----------
</pre>
<a class="dre" href="#">&nbsp;<span><b>&lt;/custom:rg:debug:write this="" prehtml="" head="" body="2" posthtml=""&gt;</b><br>Elapsed: .000592<br>Globals: 3<br>Lines: 51</span></a>


<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis elit dapibus eros ornare et venenatis turpis fermentum. Integer dictum, ipsum a dapibus gravida, arcu lorem blandit eros, sit amet commodo est sapien in velit. In hac habitasse platea dictumst. Sed lorem tortor, cursus accumsan iaculis sit amet, gravida eu nisl. Suspendisse potenti. Quisque in bibendum mauris. Pellentesque aliquet, velit eu congue placerat, metus nibh ornare neque, et lacinia libero odio at nunc. Curabitur lobortis consequat purus nec vulputate. Integer condimentum ullamcorper dictum. Nam eget nulla tortor. In eros nisl, lacinia ac ultrices ac, pulvinar vitae mi. Sed luctus, ipsum eu mollis venenatis, massa leo hendrerit elit, non dignissim lorem risus at quam. Curabitur cursus tincidunt nibh, at egestas nisl tempus ut. Cras condimentum dui a leo sodales vehicula.</p>

<pre>
---------- BODY ----------
%CSPsc=1
%mmmu1=&quot;&quot;
%mmmu2=&quot;&quot;
%request=&lt;OBJECT REFERENCE&gt;[1@%CSP.Request]
%response=&lt;OBJECT REFERENCE&gt;[2@%CSP.Response]
%session=&lt;OBJECT REFERENCE&gt;[3@%CSP.Session]
Timers=0
gRequestId=82529110
ruleError=&quot;&quot;
&lt;Private variables&gt;
label=&quot;body&quot;
currIO=&quot;UTF8&quot;
---------- BODY ----------
</pre>

</body>
</html>
<pre>
---------- POSTHTML ----------
%CSPsc=1
%mmmu1=&quot;&quot;
%mmmu2=&quot;&quot;
%request=&lt;OBJECT REFERENCE&gt;[1@%CSP.Request]
%response=&lt;OBJECT REFERENCE&gt;[2@%CSP.Response]
%session=&lt;OBJECT REFERENCE&gt;[3@%CSP.Session]
Timers=0
gRequestId=82529110
ruleError=&quot;&quot;
&lt;Private variables&gt;
label=&quot;posthtml&quot;
currIO=&quot;UTF8&quot;
---------- POSTHTML ----------
</pre>

```

**See also:** [`test.csp`](https://github.com/registerguard/csp-debug-write/blob/master/write/test.csp).

---

#### INSTALLATION

There's a couple ways (that I can think of) to install this code:

### Copy/paste:

1. Open Studio.
2. Change to the `CMS` namespace.
3. "File" >> "New..." and choose "Caché Class Definition" from "General" tab.
4. Copy/paste the **RAW** contents `custom.rg.debug.Write.cls` into this new file.
5. Save this file as `custom.rg.debug.Write.cls` to your `custom` package, in a sub package called `rg/debug`.
6. Compile.
7. "File" >> "New..." and choose "Caché Server Page" from "CSP File" tab.
8. Copy/paste the **RAW** contents of `custom.rg.debug.WriteRule.csr` into this new file.
9. Save this file as `custom.rg.debug.WriteRule.csr` to the "CSP Files" >> `/csp/cms/customrules` package/folder/location.
10. Compile.

### Import local:

1. Download and unzip this repo to your local machine.
2. Open Studio.
3. Change to the `CMS` namespace.
4. "Tools" >> "Import Local...".
5. Import `custom.rg.debug.Write.xml`, `custom.rg.debug.WriteRule.csr` and check the compile box.

---

#### NOTES:

Non-[DTI](http://www.dtint.com/) customers should emove these lines from `custom.rg.debug.WriteRule.csr`:

```
<csr:class super="dt.common.page.Rule" />
```

```
<script language="cache" runat="compiler">
	do ##this.RenderDTStartTag()
</script>
```

```
<script language="cache" runat="compiler">
	do ##this.RenderDTEndTag()
</script>
```

---

#### LEGAL

Copyright © 2012 [Micky Hulse](http://hulse.me)/[The Register-Guard](http://www.registerguard.com)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.