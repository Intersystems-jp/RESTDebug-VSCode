Class Simple.REST Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/test1" Method="POST" Call="test1POST" Cors="true"/>
</Routes>
}

Parameter CHARSET = "utf-8";

Parameter CONTENTTYPE = "application/json";

Parameter CONVERTINPUTSTREAM = 1;

ClassMethod test1POST() As %Status [ Language = objectscript ]
{
	#dim ex As %Exception.AbstractException
	#dim %request As %CSP.Request
	set status=$$$OK
	try {
		//hang 20
		//クエリパラメータ
		set moji=$get(%request.Data("a",1))
		//Bodyの中身
		set body=%request.Content.Read()

		set returnjson={}
		set returnjson.BodyText=body
		do returnjson.%ToJSON()
	}
	catch ex {
		set status=ex.AsStatus()
	}
	quit status
}

}
