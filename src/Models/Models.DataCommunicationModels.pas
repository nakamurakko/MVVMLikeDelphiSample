unit Models.DataCommunicationModels;

interface

uses
  System.SysUtils,
  IdIOHandler,
  IdSSLOpenSSL,
  IdHTTP,
  IdCompressorZLib;

type
  /// <summary>データ通信用Model。</summary>
  TDataCommunicationModel = class
  public
    /// <summary>コンテンツを取得する。</summary>
    /// <param name="URL">URL文字列。</param>
    /// <returns>コンテンツの文字列を返す。</returns>
    class function GetContent(URL: string): string;
  end;

implementation

class function TDataCommunicationModel.GetContent(URL: string): string;
var
  http: TIdHTTP;
  sslIoHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := '';

  http := TIdHTTP.Create;
  sslIoHandler := TIdSSLIOHandlerSocketOpenSSL.Create(http);
  try
    sslIoHandler.SSLOptions.SSLVersions := [sslvTLSv1_1, sslvTLSv1_2];
    sslIoHandler.SSLOptions.Method := sslvTLSv1_2;

    http.IOHandler := sslIoHandler;

    http.Compressor := TIdCompressorZLib.Create(http);

    http.HandleRedirects := True;

    Result := http.Get(URL);
  finally
    FreeAndNil(http);
  end;
end;

end.
