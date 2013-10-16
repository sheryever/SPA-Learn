using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Practice.App_Start
{
    public static class WebApiConfig
    {
        private const string _WebApiPrefix = "api";
        public static string WebApiExecutionPath = String.Format("{0}", _WebApiPrefix);

        public static void Register(HttpConfiguration config)
        {
            var basicRouteTemplate = string.Format("{0}/{1}", WebApiExecutionPath, "{controller}");

            // Controller Only
            // To handle routes like `/api/VTRouting`
            config.Routes.MapHttpRoute(
                name: "ControllerOnly",
                routeTemplate: basicRouteTemplate//"{0}/{controller}"
            );

            // Controller with ID
            // To handle routes like `/api/VTRouting/1`
            config.Routes.MapHttpRoute(
                name: "ControllerAndId",
                routeTemplate: string.Format("{0}/{1}", basicRouteTemplate, "{id}"),
                defaults: null,
                constraints: new { id = @"^\d+$" } // Only integers 
            );

            // Controllers with Actions
            // To handle routes like `/api/VTRouting/route`
            config.Routes.MapHttpRoute(
                name: "ControllerAndAction",
                routeTemplate: string.Format("{0}/{1}", basicRouteTemplate, "{action}")
            );

            // Controllers with Actions
            // To handle routes like `/api/VTRouting/route`
            config.Routes.MapHttpRoute(
                name: "Controller,ActionAndId",
                routeTemplate: string.Format("{0}/{1}", basicRouteTemplate, "{action}/{id}")
            );

            /*
            // Controller Only
            // To handle routes like `/api/VTRouting`
            config.Routes.MapHttpRoute(
                name: "ControllerOnly",
                routeTemplate: "api/{controller}"
            );

            // Controller with ID
            // To handle routes like `/api/VTRouting/1`
            config.Routes.MapHttpRoute(
                name: "ControllerAndId",
                routeTemplate: "api/{controller}/{id}",
                defaults: null,
                constraints: new { id = @"^\d+$" } // Only integers 
            );

            // Controllers with Actions
            // To handle routes like `/api/VTRouting/route`
            config.Routes.MapHttpRoute(
                name: "ControllerAndAction",
                routeTemplate: "api/{controller}/{action}"
            );

            // Controllers with Actions
            // To handle routes like `/api/VTRouting/route`
            config.Routes.MapHttpRoute(
                name: "Controller,ActionAndId",
                routeTemplate: "api/{controller}/{action}/{id}"
            );*/

            // To disable tracing in your application, please comment out or remove the following line of code
            // For more information, refer to: http://www.asp.net/web-api
            // TraceConfig.Register(config);
        }
    }
}