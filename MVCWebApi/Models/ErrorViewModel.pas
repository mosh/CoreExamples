namespace MVCWebApi.Models;

type
  ErrorViewModel = public class
  public
    property RequestId:String;

    property ShowRequestId:Boolean read begin
      exit not String.IsNullOrEmpty(RequestId);
    end;

  end;
end.