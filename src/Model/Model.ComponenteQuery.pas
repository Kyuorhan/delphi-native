unit Model.ComponenteQuery;

interface

  uses
  System.SysUtils,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Phys.SQLite,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Interfaces.Conexao,
  Model.Conexao,
  Interfaces.ComponenteQuery;

  type
   TQuery = class(TInterfacedObject,iQuery)
     private
       FParent : iConexao;
       FQuery  : TFDQuery;
     public
     constructor create(Parent : iConexao);
     destructor destroy; override;
       class function New(aParent : iConexao) : iQuery;
       function Dataset : TFDQuery;
   end;

implementation

{ TQuery }

constructor TQuery.create(Parent: iConexao);
begin
 FParent := Parent;
  FQuery := TFDQuery.Create(nil);

  if not Assigned(FParent) then
    FParent := TConexao.New;

  FQuery.Connection := TFDConnection(FParent.Conexao);
end;

function TQuery.Dataset: TFDQuery;
begin
  Result := FQuery;
end;

destructor TQuery.destroy;
begin
  freeandnil(FQuery);
  inherited;
end;

class function TQuery.New(aParent: iConexao): iQuery;
begin
  Result := Self.Create(aParent);
end;

end.
