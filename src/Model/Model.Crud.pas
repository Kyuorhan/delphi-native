unit Model.Crud;

interface

  uses
    Data.DB,
    System.SysUtils,
    Vcl.Forms,
    Vcl.Dialogs,
    Interfaces.Crud,
    Interfaces.ComponenteQuery,
    Controller.ComponenteQuery,
    Winapi.Windows,
    Vcl.Controls;

  type
   TSQLQuery = class(TInterfacedObject,iSQLOpen,iSQLInsert,iSQLUpdate,iSQLDelete,iSQLCancelar)
     private
       FQuery : iQuery;
     public
     Constructor Create;
     destructor destroy; override;
       class function NewOpen : iSQLOpen;
       class function NewInert : iSQLInsert;
       class function NewUpdate : iSQLUpdate; overload;
       class function NewDelete : iSQLDelete; overload;
       class function NewCancelar : iSQLCancelar; overload;

       function _Open(aTabela : string; aDataSource : TDataSource) : iSQLOpen; overload;
       function _Open(aTabela : string; aParam : String; aDataSource : TDataSource) : iSQLOpen; overload;
       function _Insert(aTabela : String; aDataSource : TDataSource) : iSQLInsert;
       function _Update : iSQLUpdate;
       function _Delete(aTabela : string; aParam : String) : iSQLDelete;
       function _Cancelar(aDataSource : TDataSource) : iSQLCancelar;
   end;

implementation

{ TSQLQuery }

constructor TSQLQuery.Create;
begin
  FQuery := TControllerComponenteQuery.New.Query;
end;

destructor TSQLQuery.destroy;
begin
  inherited;
end;

function TSQLQuery._Open(aTabela: string; aDataSource: TDataSource): iSQLOpen;
begin
  Result := Self;
  FQuery.Dataset.SQL.Clear;
  FQuery.Dataset.SQL.Add('select * from ' + aTabela);
  aDataSource.DataSet := FQuery.Dataset;
  FQuery.Dataset.Open();
end;

function TSQLQuery._Open(aTabela, aParam: String;aDataSource: TDataSource): iSQLOpen;
begin
  Result := Self;
  FQuery.Dataset.SQL.Clear;
  FQuery.Dataset.SQL.Add('select * from ' + aTabela + 'where descricao = ' + aParam);
  aDataSource.DataSet := FQuery.Dataset;
  FQuery.Dataset.Open();
end;

function TSQLQuery._Insert(aTabela: String; aDataSource : TDataSource): iSQLInsert;
begin
  Result := Self;

  FQuery.Dataset.SQL.Clear;
  FQuery.Dataset.SQL.Add('select * from ' + aTabela);
  aDataSource.DataSet := FQuery.Dataset;
  FQuery.Dataset.Open();

  FQuery.Dataset.Fields[0].AutoGenerateValue := arDefault;
  FQuery.Dataset.Fields[0].ProviderFlags := [pfInWhere, pfInKey];
  FQuery.Dataset.Fields[0].ReadOnly := true;
//  FQuery.Dataset.Fields[0].AutoIncrementSeed := 1;
//  FQuery.Dataset.Fields[0].AutoIncrementStep := 1;
  FQuery.Dataset.Fields[0].Required := true;

  FQuery.DataSet.Insert;
end;

function TSQLQuery._Update: iSQLUpdate;
begin
  Result := Self;
  if FQuery.Dataset.State in [dsInsert, dsEdit] then
      FQuery.Dataset.Post;
end;

function TSQLQuery._Cancelar(aDataSource: TDataSource): iSQLCancelar;
begin
  Result := Self;
    FQuery.Dataset.Cancel;
end;

function TSQLQuery._Delete(aTabela : string; aParam : String) : iSQLDelete;
begin
  if Application.MessageBox(PChar ('Deseja realmente excluir o registro ???'),'Aten??o', MB_YesNo + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    Result := Self;
    FQuery.Dataset.SQL.Clear;
    FQuery.Dataset.SQL.Add('select * from ' + aTabela + ' where codigo = ' + aParam);
    FQuery.Dataset.Open();
      FQuery.Dataset.Delete;
  end
   else
     Abort
end;

class function TSQLQuery.NewOpen: iSQLOpen;
begin
  Result := Self.Create;
end;

class function TSQLQuery.NewInert: iSQLInsert;
begin
  Result := Self.Create;
end;

class function TSQLQuery.NewCancelar: iSQLCancelar;
begin
  Result := Self.Create;
end;

class function TSQLQuery.NewUpdate: iSQLUpdate;
begin
  Result := Self.Create;
end;

class function TSQLQuery.NewDelete: iSQLDelete;
begin
  Result := Self.Create;
end;

end.
