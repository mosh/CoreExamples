namespace MVCWebApi;


uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Threading.Tasks,
  Microsoft.AspNetCore.Builder,
  Microsoft.AspNetCore.Hosting,
  Microsoft.AspNetCore.Http,
  Microsoft.AspNetCore.HttpsPolicy,
  Microsoft.AspNetCore.Mvc,
  Microsoft.Extensions.Configuration,
  Microsoft.Extensions.DependencyInjection;

type
  Startup = public class
  public
      method Startup(configValue:IConfiguration);
      begin
          self.Configuration := configValue;
      end;

      property Configuration:IConfiguration read;

      // This method gets called by the runtime. Use this method to add services to the container.
      method ConfigureServices(services:IServiceCollection);
      begin
          services.Configure<CookiePolicyOptions>(options ->
          begin
              // This lambda determines whether user consent for non-essential cookies is needed for a given request.
              options.CheckConsentNeeded := context -> true;
              options.MinimumSameSitePolicy := SameSiteMode.None;
          end);


          services.AddMvc.SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
      end;

      // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
      method Configure(app:IApplicationBuilder; env:IHostingEnvironment);
      begin
          if (env.IsDevelopment())then
          begin
              app.UseDeveloperExceptionPage();
          end
          else
          begin
              app.UseExceptionHandler('/Home/Error');
              // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
              app.UseHsts();
          end;

          app.UseHttpsRedirection();
          app.UseStaticFiles();
          app.UseCookiePolicy();

          //app.

          app.UseMvc(routes ->
          begin
              routes.MapRoute('default','{controller=Home}/{action=Index}/{id?}');
          end);
      end;

  end;


end.