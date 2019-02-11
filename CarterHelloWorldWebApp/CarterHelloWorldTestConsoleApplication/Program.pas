namespace CarterHelloWorldTestConsoleApplication;

uses
  Newtonsoft.Json,
  System.Linq, System.Net.Http;

type
  Program = class
  public
    class method Main(args: array of String): Int32;
    begin
      var client := new HttpClient;

      var requestUri := new Uri('http://localhost:5060/employee');
      var jsonContent := JsonConvert.SerializeObject(new class (Id:=1, Name := 'John'));
      var content := new StringContent(jsonContent);

      client.DefaultRequestHeaders.Add('token','123');

      var response := client.PostAsync(requestUri, content).Result;

    end;
  end;

end.