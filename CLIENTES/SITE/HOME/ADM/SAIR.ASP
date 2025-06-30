<%
For each a in Request.Cookies
	Response.Cookies(a) = ""
Next
%><script>window.close()</script>