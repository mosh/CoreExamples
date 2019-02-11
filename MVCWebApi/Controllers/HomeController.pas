namespace MVCWebApi;

uses
  System,
  System.Collections.Generic,
  System.Diagnostics,
  System.Linq,
  System.Threading.Tasks,
  Microsoft.AspNetCore.Mvc,
  MVCWebApi.Models
  ;


type

  HomeController = public class(Controller)
  public
    method &Index:IActionResult;
    begin
      exit new JsonResult(new class());
    end;

    [ResponseCache(Duration := 0, Location := ResponseCacheLocation.None, NoStore := true)]
    method Error:IActionResult;
    begin
      exit new JsonResult(new ErrorViewModel(RequestId := iif(assigned(Activity.Current), Activity.Current.Id, HttpContext.TraceIdentifier)));
    end;

  end;

end.