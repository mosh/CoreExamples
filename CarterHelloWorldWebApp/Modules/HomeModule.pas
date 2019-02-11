namespace CarterHelloWorldWebApp.Modules;

uses
  Carter,
  Carter.ModelBinding,
  Carter.Request,
  Carter.Response,
  HelloWorldWebApp.Services, System.Threading.Tasks;

type
  Employee = public class
  public
    property Id:Integer;
    property Name:String;
  end;

  HelloModule = public class(CarterModule)

  private
    _someService:SomeService;
  public

    constructor(someService:SomeService);
    begin

      self._someService := someService;


      self.Get('/', (req, res, routeData) -> begin
          await res.WriteAsync('Hello from Carter!');
        end);

      self.Get('/Health', (req, res, routeData) -> begin
        await res.WriteAsync('Health!');
      end);

      self.Before := (ctx) -> begin
          Console.WriteLine('Before in module!');

          exit Task.FromResult(true);
        end;

      self.After := (ctx) -> begin
            Console.WriteLine('After in module!');
            exit Task.CompletedTask;
        end;

    end;

  end;

end.