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
  /// <summary>�T���v��ViewModel�N���X�B</summary>
  TMainViewModel = class(TDataModule)
    BindSource: TPrototypeBindSource;
    /// <summary>CreateAdapter�C�x���g</summary>
    /// <param name="Sender">�ʒm���̃I�u�W�F�N�g�B</param>
    /// <param name="ABindSourceAdapter">Adapter�B</param>
    procedure BindSourceCreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
  private
    /// <summary>Web���B</summary>
    WebInfo: TWebInfo;
  public
    /// <summary>�R���X�g���N�^�[�B</summary>
    /// <param name="AOwner">�I�[�i�[�R���|�[�l���g�B</param>
    constructor Create(AOwner: TComponent); override;
    /// <summary>�f�X�g���N�^�[�B</summary>
    destructor Destroy; override;
    /// <summary>�R���e���c���擾����B</summary>
    procedure GetContent;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TMainViewModel.BindSourceCreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
begin
  // �@�f�[�^�ێ��p�C���X�^���X�𐶐��B
  WebInfo := TWebInfo.Create;
  WebInfo.URL := 'https://www.nakamurakko.net';
  WebInfo.Content := '';

  // �ATObjectBindSourceAdapter�̃C���X�^���X�𐶐��B
  ABindSourceAdapter := TObjectBindSourceAdapter<TWebInfo>.Create(Self, WebInfo, False);

  // �BAutoEdit�AAutoPost��True�ɐݒ�B
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

  // Model�̃N���X���\�b�h���g�p���ăR���e���c�𕶎���Ŏ擾�B
  WebInfo.Content := TDataCommunicationModel.GetContent(WebInfo.URL);

  BindSource.Refresh;
end;

end.
