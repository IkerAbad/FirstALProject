codeunit 50149 "CodeEjemplo"
{

    /*++
    * Función, devuelve el nombre del cliente introduciendo su No.
    */
    procedure RegistroPorClavePrimaria(NumeroCliente: Code[20])
    begin
        // Si el número de clave primaria No. se encuentra, devuelve su nombre por pantalla.
        if Cliente.get(NumeroCliente) then
            Message('El nombre del cliente, con número %1, es %2.', NumeroCliente, Cliente.Name);
    end;

    /*++
    * Función, tomar el primer Customer y mostrar su nombre.
    */
    procedure PrimerRegistroConjunto()
    begin
        // Si se encuentra el primer Customer, devuelve su nombre por pantalla.
        if Cliente.FindFirst() then
            Message('El nombre del primer cliente es %1.', Cliente.Name);
    end;

    /*++
    * Función, por No. Customer, ir a su último movimiento y mostrar su Posting date.
    */
    procedure UltimoRegistro(NumeroCliente: Code[20])
    begin
        // Si encuentra el cliente con No. cliente y su último movimiento, muestra el Posting Date.
        if Cliente.get(NumeroCliente) and MovimientosCliente.FindLast() then
            Message('Del cliente %1, el "Posting Date" de su último movimiento es el %2.', NumeroCliente, MovimientosCliente."Posting Date");
    end;

    /*++
    * Función, recorrer los “Detailed Cust. Ledg. Entry” con un No. cliente,
    * sumar su importe (Amount) en una variable y mostrarla al final en un mensaje.
    */
    procedure BuclesRegistros(NumeroCliente: Code[20])
    begin
        // Si encuentra el cliente con No. cliente y recorre la tabla "Detailed Cust. Ledg. Entry", luego suma la columna Amount del cliente y muestra el Total.
        if Cliente.get(NumeroCliente) then
            repeat
                Total := Total + MovimientosClienteDetallada.Amount;
            until MovimientosClienteDetallada.Next = 0;
        Message('El cantidad total de la columna "Amount", del cliente %1, es %2 €.', NumeroCliente, Total);
    end;

    /*
    * Función, hacer una query sobre los “Detailed Cust. Ledg. Entry” de cliente.
    * Recorrerlo igual que en el ejercicio anterior con la tabla y ver las diferencias entre recorrer una query y un record.
    */
    procedure FuncionQuery(NumeroCliente: Code[20])
    begin

    end;

    /*++
    * Función, filtrar a todos los Customer con Country Code vacío,recorrerlos
    * y sacar un mensaje con el contador final de cuantos clientes resultan.
    */
    procedure Filtros()
    begin
        // Filtra los campos vacíos de Country Code
        Cliente.SetRange("Country/Region Code", '');
        Message('Clientes que tienen el Country Code vacío: %1.', Cliente.Count());
    end;

    /*++
    * Función, como en la función anterior con mensaje final, mostrar los filtros de ese registro.
    */
    procedure MostrarFiltros()
    begin
        // Creamos un filtro y lo mostrarmos por pantalla
        Cliente.SetRange("Country/Region Code", '');
        Message('Filtros activos:\%1', Cliente.GetFilters);

    end;

    /*++
    * Función, crea nueva tabla Copia Customer (Customer Copy), Campos No. Y Name.
    * Recorrer Customer y crear en la nueva tabla los registros.
    */
    procedure ManipularDatos1()
    begin
        // Añadimos los siguientes datos a la tabla Customer Copy
        // Si ejecutamos esta función por segunda vez, nos saltará un error "The record in table Customer Copy already exists"
        ClienteCopia.Init();
        ClienteCopia."No." := '0004';
        ClienteCopia.Name := 'Iker4';
        ClienteCopia.Insert();
    end;

    /*
    * Función, crear el campo “Name 2” en la nueva tabla.
    * Recorrer customer y actualizar en Customer Copy ese campo “Name 2”.
    */
    procedure ModificarRegistros(NumeroCliente: Code[20])
    begin
        while ClienteCopia.Find() do begin
            ClienteCopia.Init;
            ClienteCopia."No." := ClienteCopia."No.";
            ClienteCopia.Name := ClienteCopia.Name;
            ClienteCopia."Name 2" := ClienteCopia."Name" + ClienteCopia."Name";
            ClienteCopia.Insert;
        end;

    end;

    /*
    * Función, crear en la nueva tabla Fecha alta, Fecha modificación,
    * Usuario. Hacer que cada vez que se modifica o inserta estos campos se rellenen automáticamente.
    */
    procedure ManipularDatos2(NumeroCliente: Code[20])
    begin

    end;

    /*
    * Función, recorrer todos los clientes, calcular Balance y 
    * mostrar el total de Balance de todos los clientes en mensaje.
    */
    procedure CamposCalculados(NumeroCliente: Code[20])
    begin
        if Cliente.FindSet() then
            repeat
                Total := Total + Cliente.CalcOverdueBalance();
            until Cliente.Next() = 0;
        Message('El balance total de todos los clientes es %1 €., %2', Total, Cliente.CalcOverdueBalance());
    end;

    /*
    * Función, con el Item 1000 filtrar en Item Ledger Entry por Item,
    * sumar su quantity sin recorrer este registro y mostrarlo en mensaje.
    */
    procedure CALCSUMS(NumeroProducto: Decimal)
    begin
        MovimientosProducto.SetFilter("Item No.", '');
        CALCSUMS(MovimientosProducto.Quantity);
        Message('El balance total de todos los clientes es %1 €., %2', Total, Cliente.CalcOverdueBalance());
    end;

    /*
    * Función, sacar un error con la instrucción FieldErrorf.
    * Si al recorrer Item vemos alguno Blocked, recorrer los registros Item.
    *Con un Testfield comprobar que todos los Item tienen Sales unit of Measure.
    */
    procedure FIELDERROR(NumeroCliente: Code[20])
    begin

    end;

    /*
    * Función, diferencia en entre fieldCaption y FieldName. ¿Por qué es importante?
    */
    procedure FIELDCAPTION(NumeroCliente: Code[20])
    begin

    end;

    /*
    * Función, añadir en la tabla "Customer Copy" unos campos nuevos, "Post Code" y "City".
    * Cuando se rellene campo "Post Code" se grabe en "City".
    * La primera City de la tabla "Post Code", donde "Code" sea igual al "Post Code" introducido.
    */
    procedure Triggers(NumeroCliente: Code[20])
    begin


    end;

    /*
    * Función, recorrer Customer, con Country/Region Code vacío y borrarlos en Customer Copy.
    */
    procedure Borrado()
    begin
        Cliente.SetRange("Country/Region Code", '');
        ClienteCopia.DeleteAll();
    end;

    /*++
    * Función, por No. Producto, mostrar el número de movimientos de ese producto.
    */
    procedure Laboratorio(NumeroProducto: Code[20])
    begin
        // Filtramos el "Item No", por nuestro numero de producto introducido.
        MovimientosProducto.SetFilter("Item No.", NumeroProducto);

        // Pintamos el resultado de contar los movimientos con ese filtro
        Message('Número de movimientos del producto %1: %2 movimientos.', NumeroProducto, MovimientosProducto.Count());
    end;

    var
        Total: Decimal;
        Cliente: Record Customer;
        ClienteCopia: Record "Customer Copy";
        MovimientosCliente: Record "Cust. Ledger Entry";
        MovimientosClienteDetallada: Record "Detailed Cust. Ledg. Entry";
        QuerySumBalance: Query SumBalance;
        MovimientosProducto: Record "Item Ledger Entry";


    /*
    trigger OnOpenPage()
        var
        LotAvail: Query "Lot Avail. by Bin";
        begin
            LotAvail.Open;
            while LotAvail.Read do begin
            Rec.Init;
            Rec."Entry No." := Rec."Entry No." + 1;
            Rec."Item No." := LotAvail.Item_No;
            Rec."Location Code" := LotAvail.Location_Code;
            Rec."Bin Code" := LotAvail.Bin_Code;
            Rec.Quantity := LotAvail.Sum_Quantity;
            Rec.Insert;
        end;
    end;
    */
}