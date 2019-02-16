namespace CarterDataWebApp;

uses
  Newtonsoft.Json,
  System.Collections.Generic,
  System.IO,
  System.Reflection;

type
  Connections = public class

  public
    class method LoadConnections(filename:String):Dictionary<String,Connection>;
    begin

      var rootFolder := Path.GetDirectoryName(value);

      var fullFilename := Path.Combine(rootFolder,filename);

      var items := new Dictionary<String,Connection>;

      if(File.Exists(filename)) then
      begin
        var json := File.ReadAllText(filename);

        var list := JsonConvert.DeserializeObject<List<Connection>>(json);

        for each item in list do
          begin
          items.Add(item.Name,item);
          end;

      end
      else
      begin
        raise new Exception('connections file not found');
      end;
      exit items;
    end;

  end;

end.