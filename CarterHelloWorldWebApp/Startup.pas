﻿namespace CarterHelloWorldWebApp;

uses
  Carter,
  CarterHelloWorldWebApp.Models,
  CarterHelloWorldWebApp.Modules,
  CarterHelloWorldWebApp.Services,
  System,
  System.Collections.Generic,
  System.Linq,
  System.Reflection,
  System.Threading.Tasks,
  Microsoft.AspNetCore.Builder,
  Microsoft.AspNetCore.Hosting,
  Microsoft.AspNetCore.Http,
  Microsoft.Extensions.DependencyInjection,
  Microsoft.Extensions.DependencyModel, System.Security.Claims;


type



  Startup = public class
  private
    method GetOptions:CarterOptions;
    begin
      exit new CarterOptions(ctx -> self.GetBeforeHook(ctx), ctx -> self.GetAfterHook(ctx)/*, new OpenApiOptions(addresses)*/);
    end;

    method  GetBeforeHook(ctx:HttpContext):Task<Boolean>;
    begin
      ctx.Request.Headers['HOWDY'] := 'FOLKS';

      if(ctx.Request.Headers.ContainsKey('token'))then
      begin
        var value := ctx.Request.Headers['token'];
        Console.WriteLine($'Token value is {value}');

        var identity := new MyIdentity();
        identity.AddClaim(new Claim(ClaimTypes.Name,'Mr Smith'));

        ctx.User := new ClaimsPrincipal;
        ctx.User.AddIdentity(identity);

      end;


      exit Task.FromResult(true);
    end;

    method GetAfterHook(ctx:HttpContext):Task;
    begin
      Console.WriteLine('We hit a route!');
      exit Task.CompletedTask;
    end;

  public
    method ConfigureServices(services:IServiceCollection);
    begin

      services.AddSingleton<SomeService>;

      services.AddCarter(nil, c -> method begin
          c.WithModule<SecureModule>;
          c.WithModule<HomeModule>;
        end);

    end;

    method Configure(app:IApplicationBuilder);
    begin
      app.UseCarter(GetOptions);
    end;


  end;

end.