namespace ServerlessLambdaLibrary;

uses
  Amazon.Lambda.APIGatewayEvents,
  NewtonSoft.Json,
  System.Collections.Generic,
  System.Net;

type

  LambdaFunctionsBase = public class
  protected
    method CreateResponse(someObject:Object):APIGatewayProxyResponse;
    begin

      var statusCode := iif(assigned(someObject), Integer(HttpStatusCode.OK), Integer(HttpStatusCode.InternalServerError));

      var body := iif(assigned(someObject),JsonConvert.SerializeObject(someObject), String.Empty);

      var headers := new Dictionary<String,String>;
      headers.add('Content-Type','application/json');
      headers.add('Access-Control-Allow-Origin','*');

      exit new APIGatewayProxyResponse( StatusCode := statusCode, Body := body, Headers := headers);
    end;
  end;

end.