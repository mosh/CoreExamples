namespace ServerlessLambdaLibrary;

uses
  System,
  Amazon.Lambda.Core,
  Amazon.Lambda.APIGatewayEvents;

type

  // https://aws.amazon.com/blogs/compute/developing-net-core-aws-lambda-functions/

  [assembly: LambdaSerializer(typeOf(Amazon.Lambda.Serialization.Json.JsonSerializer))]
  Functions = public class(LambdaFunctionsBase)

  public

    method Get(request:APIGatewayProxyRequest; context:ILambdaContext):APIGatewayProxyResponse;
    begin
      var obj := new class(Message := 'Hello World');
      exit CreateResponse(obj);
    end;

  end;
end.