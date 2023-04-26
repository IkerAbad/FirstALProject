page 50149 "PageEjemplo"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action("Registro por clave primaria")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.RegistroPorClavePrimaria('10000');
                end;
            }
            action("Primer registro del conjunto")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.PrimerRegistroConjunto();
                end;
            }
            action("Último registro")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.UltimoRegistro('10000');
                end;
            }
            action("Bucles con registros")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.BuclesRegistros('10000');
                end;
            }
            action("Query")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.PrimerRegistroConjunto();
                end;
            }
            action("Filtros")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.Filtros();
                end;
            }
            action("Mostrar filtros")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.MostrarFiltros();
                end;
            }
            action("Manipular datos 1")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.ManipularDatos1();
                end;
            }
            action("Modificar registros")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.ModificarRegistros('10000');
                end;
            }
            action("Borrado")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.Borrado();
                end;
            }
            action("Manipular datos 2")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.ManipularDatos2('10000');
                end;
            }
            action("Campos calculados")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.CamposCalculados('40000');
                end;
            }
            action("CALCSUMS")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.FuncionCALCSUMS('1896-S');
                end;
            }
            action("FIELDERROR")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.FuncionFIELDERROR('10000');
                end;
            }
            action("Triggers")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.FuncionTriggers('10000');
                end;
            }
            action("Laboratorio")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    mycodeunit.Laboratorio('1896-S');
                end;
            }

        }
    }

    var
        mycodeunit: Codeunit CodeEjemplo;
}