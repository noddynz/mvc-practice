using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Lunch2Go.Startup))]
namespace Lunch2Go
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
