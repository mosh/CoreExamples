namespace CarterDataWebApp.Modules;

uses
  Carter,
  CarterDataWebApp.Services,
  System.Threading.Tasks;

type
  HomeModule = public class(CarterModule)

  private
    _someService:SomeService;
  public

    constructor(someService:SomeService);
    begin

      Console.WriteLine('HelloModule constructor');

      self._someService := someService;

      self.Get('/', (req, res, routeData) -> begin
          await res.WriteAsync('Hello from Carter!');
        end);

      self.Get('/Health', (req, res, routeData) -> begin
        await res.WriteAsync('Health!');
      end);

      self.Before := (ctx) ->
        begin
          Console.WriteLine('Before in module!');
          exit Task.FromResult(true);
        end;

      self.After := (ctx) ->
        begin
            Console.WriteLine('After in module!');
            exit Task.CompletedTask;
        end;

    end;

  end;

end.