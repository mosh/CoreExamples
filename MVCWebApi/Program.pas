namespace MVCWebApi;

uses
  System,
  System.Collections.Generic,
  System.IO,
  System.Linq,
  System.Threading.Tasks,
  Microsoft.AspNetCore,
  Microsoft.AspNetCore.Hosting,
  Microsoft.Extensions.Configuration,
  Microsoft.Extensions.Logging;

type

  Program = class
  public
    class method Main(args: array of String): Int32;
    begin
      CreateWebHostBuilder(args).Build.Run;
    end;

    class method CreateWebHostBuilder(args: array of String):IWebHostBuilder;
    begin
      exit WebHost
        .CreateDefaultBuilder(args)
        .UseUrls('http://localhost:5010')
        .UseStartup<Startup>();
    end;

  end;


end.