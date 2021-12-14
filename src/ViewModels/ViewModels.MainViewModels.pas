unit ViewModels.MainViewModels;

interface

uses
  DataObjects.WebInfos,
  Models.DataCommunicationModels,
  System.SysUtils,
  System.Classes,
  Data.Bind.ObjectScope,
  Data.Bind.Components;

type
  /// <summary>サンプルViewModelクラス。</summary>
  TMainViewModel = class(TDataModule)
    BindSource: TPrototypeBindSource;
    /// <summary>CreateAdapterイベント</summary>
    /// <param name="Sender">通知元のオブジェクト。</param>
    /// <param name="ABindSourceAdapter">Adapter。</param>
    procedure BindSourceCreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
  private
    /// <summary>Web情報。</summary>
    WebInfo: TWebInfo;
  public
    /// <summary>コンストラクター。</summary>
    /// <param name="AOwner">オーナーコンポーネント。</param>
    constructor Create(AOwner: TComponent); override;
    /// <summary>デストラクター。</summary>
    destructor Destroy; override;
    /// <summary>コンテンツを取得する。</summary>
    procedure GetContent;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TMainViewModel.BindSourceCreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
begin
  // ①データ保持用インスタンスを生成。
  WebInfo := TWebInfo.Create;
  WebInfo.URL := 'https://www.nakamurakko.net';
  WebInfo.Content := '';

  // ②TObjectBindSourceAdapterのインスタンスを生成。
  ABindSourceAdapter := TObjectBindSourceAdapter<TWebInfo>.Create(Self, WebInfo, False);

  // ③AutoEdit、AutoPostをTrueに設定。
  ABindSourceAdapter.AutoEdit := True;
  ABindSourceAdapter.AutoPost := True;
end;

constructor TMainViewModel.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TMainViewModel.Destroy;
begin
  FreeAndNil(WebInfo);

  inherited;
end;

procedure TMainViewModel.GetContent;
begin
  BindSource.Refresh;

  // Modelのクラスメソッドを使用してコンテンツを文字列で取得。
  WebInfo.Content := TDataCommunicationModel.GetContent(WebInfo.URL);

  BindSource.Refresh;
end;

end.
