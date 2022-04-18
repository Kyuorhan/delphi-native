unit Controller.Crud;

interface

  uses
    Interfaces.Controller.Crud,
    Interfaces.Crud,
    Model.Crud;

  type
   TControllerCrud = class(TInterfacedObject, iControllerCrud)
     private
     public
     Constructor Create;
     Destructor Destroy; override;
     class function New : iControllerCrud;
       function _OpenSQL : iSQLOpen;
       function _InsertSQL : iSQLInsert;
       function _UpdateSQL : iSQLUpdate;
       function _DeleteSQL : iSQLDelete;
       function _CancelSQL : iSQLCancelar;
   end;

implementation

{ TControllerCrud }

constructor TControllerCrud.Create;
begin

end;

destructor TControllerCrud.Destroy;
begin

  inherited;
end;

function TControllerCrud._OpenSQL: iSQLOpen;
begin
  result := TSQLQuery.NewOpen;
end;

function TControllerCrud._InsertSQL: iSQLInsert;
begin
  result := TSQLQuery.NewInert;
end;

function TControllerCrud._UpdateSQL: iSQLUpdate;
begin
  result := TSQLQuery.NewUpdate;
end;

function TControllerCrud._DeleteSQL: iSQLDelete;
begin
  result := TSQLQuery.NewDelete;
end;

function TControllerCrud._CancelSQL: iSQLCancelar;
begin
  result := TSQLQuery.NewCancelar;
end;

class function TControllerCrud.New: iControllerCrud;
begin
  result := Self.Create;
end;

end.
