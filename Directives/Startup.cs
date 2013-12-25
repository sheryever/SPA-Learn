using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Directives.Startup))]
namespace Directives
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
