namespace CarterHelloWorldWebApp.Models;

uses
  System.Security.Claims;

type
  MyIdentity = public class(ClaimsIdentity)
  public
    property IsAuthenticated: Boolean read begin
      exit true;
    end; override;
  end;
end.