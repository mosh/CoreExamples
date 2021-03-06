﻿namespace CarterDataWebApp;

uses
  Carter,
  CarterDataWebApp.Modules,
  CarterDataWebApp.Services,
  DataAccessLibrary,
  DataAccessLibrary.Repositories,
  Moshine.Data,
  System,
  System.Collections.Generic,
  System.Linq,
  System.Reflection,
  System.Threading.Tasks,
  Microsoft.AspNetCore.Builder,
  Microsoft.AspNetCore.Hosting,
  Microsoft.AspNetCore.Http,
  Microsoft.Extensions.DependencyInjection,
  Microsoft.Extensions.DependencyModel;


type

  Startup = public class
  private
    method GetOptions:CarterOptions;
    begin
      exit new CarterOptions(ctx -> self.GetBeforeHook(ctx), ctx -> self.GetAfterHook(ctx));
    end;

    method  GetBeforeHook(ctx:HttpContext):Task<Boolean>;
    begin
      ctx.Request.Headers['HOWDY'] := 'FOLKS';
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

      var connections := Connections.LoadConnections('Connections.Json');

      services.AddSingleton<SailedRepository>(new SailedRepository(connections['PostgresAWS'].Connection)
        withCert(connections['PostgresAWS'].Certificate));

      services.AddSingleton<SomeService>;

      services.AddCarter(nil, c -> method begin
          c.WithModule<DataModule>;
          c.WithModule<HomeModule>;
        end);
    end;

    method Configure(app:IApplicationBuilder);
    begin
      app.UseCarter(GetOptions);
    end;


  end;

end.