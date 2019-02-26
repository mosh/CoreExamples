namespace CarterDataWebApp.Modules;

uses
  Carter,
  Carter.Request,
  Carter.Response,
  DataAccessLibrary.Repositories;

type
  DataModule = public class(CarterModule)
  private
    _repository:SailedRepository;
  public


    constructor (repository:SailedRepository);
    begin
      inherited constructor;

      _repository := repository;

      self.Get('/Sailed', (request, response, routeData) -> begin
        var results := await _repository.GetAll;
        exit response.AsJson(results);
      end);

      self.Get('/Sailed/{id:int}', (request, response, routeData) -> begin

        var id := routeData.As<Integer>("id");

        var results := await _repository.Get(id);
        exit response.AsJson(results);
      end);

    end;
  end;

end.