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

      self.RequiresAuthentication;

      self.Post('/Employee',(req, res, routeDate) -> begin

        var empl := req.Bind<Employee>;
        if(assigned(empl))then
        begin
          Console.WriteLine($'{empl.Id} {empl.Name}');
        end;

        res.StatusCode := 204;
        exit Task.CompletedTask;

      end);

      self.Delete('/Employee',(request, response, routeData) -> begin

      end);

    end;
  end;

end.