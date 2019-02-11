namespace CarterDataWebApp.Repositories;

uses
  CarterDataWebApp.Models,
  Dapper,
  System.Collections.Generic,
  System.Linq,
  System.Threading.Tasks;

type

  SailedRepository = public class(AWSPostgresRepository)
  private
  protected
  public

    method GetAll:Task<sequence of Sailed>;
    begin
      using connection := BuildConnection do
      begin
        exit await connection.QueryAsync<Sailed>('select * from "Sailed"');
      end;
    end;

    method Get(id:Integer):Task<Sailed>;
    begin
      using connection := BuildConnection do
      begin
        var results :=  await connection.QueryAsync<Sailed>('select * from "Sailed" where "Id"=@id', new class(id := id));
        exit results.FirstOrDefault;
      end;
    end;

  end;

end.