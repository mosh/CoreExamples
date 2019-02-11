namespace CarterHelloWorldWebApp.Modules;

uses
  Carter,
  Carter.ModelBinding,
  Carter.Request,
  Carter.Response,
  System.Threading.Tasks;

type
  SecureModule = public class(CarterModule)
  private
  protected
  public
    constructor;
    begin
      self.Post('/Employee',(req, res, routeDate) -> begin

        var empl := req.Bind<Employee>;
        if(assigned(empl))then
        begin

        end;

        res.StatusCode := 204;
        exit Task.CompletedTask;

      end);

      self.Delete('/Employee',(request, response, routeData) -> begin

      end);

      self.Before := (ctx) -> begin

        var authorized := false;

        Console.WriteLine('Before in module!');

        if(ctx.Request.Headers.ContainsKey('token'))then
        begin
          var value := ctx.Request.Headers['token'];
          Console.WriteLine($'Token value is {value}');
          authorized := true;
        end;

        exit Task.FromResult(authorized);
      end;

      self.After := (ctx) -> begin
        Console.WriteLine('After in module!');
        exit Task.CompletedTask;
      end;


    end;
  end;

end.