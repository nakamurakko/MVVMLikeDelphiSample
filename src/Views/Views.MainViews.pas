unit Views.MainViews;

interface

uses
  ViewModels.MainViewModels,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,
  System.Math.Vectors,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Memo.Types,
  FMX.Controls3D,
  FMX.Layers3D,
  System.Rtti,
  System.Bindings.Outputs,
  FMX.Bind.Editors,
  Data.Bind.EngExt,
  FMX.Bind.DBEngExt,
  Data.Bind.Components;

type
  /// <summary>�T���v���t�H�[���B(View�N���X)</summary>
  TMainForm = class(TForm)
    HeaderLayout: TLayout;
    URLEdit: TEdit;
    GetContentButton: TButton;
    ClientLayout: TLayout;
    ContntMemo: TMemo;
    BindingsList: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    /// <summary>Get�{�^���N���b�N�B</summary>
    /// <param name="Sender">�ʒm���̃I�u�W�F�N�g�B</param>
    procedure GetContentButtonClick(Sender: TObject);
  private
    /// <summary>ViewModel�ϐ��B</summary>
    ViewModel: TMainViewModel;
  public
    /// <summary>�R���X�g���N�^�[�B</summary>
    /// <param name="AOwner">�I�[�i�[�R���|�[�l���g�B</param>
    constructor Create(AOwner: TComponent); override;
    /// <summary>�f�X�g���N�^�[�B</summary>
    destructor Destroy; override;
  end;

implementation

{$R *.fmx}

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;

  Self.Caption := Application.Title;

  ViewModel := TMainViewModel.Create(Self);
end;

destructor TMainForm.Destroy;
begin
  FreeAndNil(ViewModel);

  inherited;
end;

procedure TMainForm.GetContentButtonClick(Sender: TObject);
begin
  ViewModel.GetContent;
end;

end.
