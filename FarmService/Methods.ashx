<%@ WebHandler Language="C#" Class="Methods" %>

using System;
using System.IO;
using System.Web;

public class Methods : IHttpHandler {
    public static int Step = 1;
    
    public void ProcessRequest (HttpContext context) {
        string method = context.Request.QueryString["method"];
        if (!String.IsNullOrEmpty(method))
        {
            switch (method)
            {
                case "reset":
                    Step = 1;
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("done");
                    break;
                case "next":
                    string fileName = context.Server.MapPath("~\\xml\\sample" + Step + ".xml");
                    context.Response.ContentType = "text/xml";
                    context.Response.WriteFile(fileName);
                    if (Step < 7)
                        Step++;
                    break;
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}