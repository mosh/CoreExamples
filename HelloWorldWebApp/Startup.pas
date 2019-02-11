namespace HelloWorldWebApp;

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Threading.Tasks,
  Microsoft.AspNetCore.Builder,
  Microsoft.AspNetCore.Hosting,
  Microsoft.AspNetCore.Http,
  Microsoft.Extensions.DependencyInjection;


type

  Startup = public class
  public
    method ConfigureServices(services:IServiceCollection);
    begin

    end;

    method Configure(app:IApplicationBuilder; env:IHostingEnvironment);
    begin
      if(env.IsDevelopment)then
      begin
        app.UseDeveloperExceptionPage;
      end;

      app.Run((context) ->
        begin
          await context.Response.WriteAsync('Hello World!');
        end);
    end;

  end;

end.