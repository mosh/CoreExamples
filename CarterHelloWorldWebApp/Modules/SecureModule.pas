namespace CarterHelloWorldWebApp.Modules;

uses
  Carter,
  Carter.ModelBinding,
  Carter.Request,
  Carter.Response,
  CarterHelloWorldWebApp.Models,
  System.Threading.Tasks;

type
  SecureModule = public class(CarterModule)
  private
  protected
  public
    constructor;
    begin

      self.RequiresAuthentication;

      self.Get('/Who', (req, res, routeDate) -> begin
          await res.WriteAsync('You are !');
        end);

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