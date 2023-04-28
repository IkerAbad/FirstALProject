codeunit 50149 "CodeEjemplo"
{

    /*++
    * 1. Función, devuelve el nombre del Customer introduciendo su No.
    */
    procedure RegistroPorClavePrimaria(NoCustomer: Code[20])
    var
        Customer: Record Customer;
    begin
        // Si el número de clave primaria No. se encuentra, devuelve su nombre por pantalla.
        if Customer.get(NoCustomer) then
            Message('El nombre del cliente, con número %1, es %2.', NoCustomer, Customer.Name);
    end;

    /*++
    * 2. Función, tomar el primer Customer y mostrar su nombre.
    */
    procedure PrimerRegistroConjunto()
    var
        Customer: Record Customer;
    begin
        // Si se encuentra el primer Customer, devuelve su nombre por pantalla.
        if Customer.FindFirst() then
            Message('El nombre del primer cliente es %1.', Customer.Name);
    end;

    /*++
    * 3. Función, por No. Customer, ir a su último movimiento y mostrar su Posting date.
    */
    procedure UltimoRegistro(NoCustomer: Code[20])
    var
        Customer: Record Customer;
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
    begin
        // Si encuentra el Customer con No. Customer y su último movimiento, muestra el Posting Date.
        if Customer.get(NoCustomer) and CustomerLedgerEntry.FindLast() then
            Message('Del cliente %1, el "Posting Date" de su último movimiento es el %2.', NoCustomer, CustomerLedgerEntry."Posting Date");
    end;

    /*++
    * 4. Función, recorrer los “Detailed Cust. Ledg. Entry” con un No. cliente,
    * sumar su importe (Amount) en una variable y mostrarla al final en un mensaje.
    */
    procedure BuclesRegistros(NoCustomer: Code[20])
    var
        Total: Decimal;
        Customer: Record Customer;
        DetailedCustomerLedgerEntry: Record "Detailed Cust. Ledg. Entry";
    begin
        // Si encuentra el Customer con No. Customer y recorre la tabla "Detailed Cust. Ledg. Entry", luego suma la columna Amount del Customer y muestra el Total.
        if Customer.get(NoCustomer) then
            repeat
                Total := Total + DetailedCustomerLedgerEntry.Amount;
            until DetailedCustomerLedgerEntry.Next = 0;
        Message('El cantidad total de la columna "Amount", del Customer %1, es %2 €.', NoCustomer, Total);
    end;

    /*
    * 5. Función, hacer una query sobre los “Detailed Cust. Ledg. Entry” de Customer.
    * Recorrer los “Detailed Cust. Ledg. Entry” con un No. cliente, sumar su importe (Amount) en una variable y mostrarla al final en un mensaje.
    */
    procedure FuncionQuery(NoCustomer: Code[20])
    var
        QuerySumBalance: Query SumBalance;
        DetailedCustomerLedgerEntry: Record "Detailed Cust. Ledg. Entry";
        Customer: Record Customer;

    begin
        QuerySumBalance.Open();
        //QuerySumBalance.No_
        //QuerySumBalance.Close();
    end;

    /*++
    * 6. Función, filtrar a todos los Customer con Country Code vacío,recorrerlos
    * y sacar un mensaje con el contador final de cuantos Customers resultan.
    */
    procedure Filtros()
    var
        Customer: Record Customer;
    begin
        // Filtra los campos vacíos de Country Code
        Customer.SetRange("Country/Region Code", '');
        Message('Customers que tienen el Country Code vacío: %1.', Customer.Count());
    end;

    /*++
    * 7. Función, como en la función anterior con mensaje final, mostrar los filtros de ese registro.
    */
    procedure MostrarFiltros()
    var
        Customer: Record Customer;
    begin
        // Creamos un filtro y lo mostrarmos por pantalla
        Customer.SetRange("Country/Region Code", '');
        Message('Filtros activos:\%1', Customer.GetFilters);

    end;

    /*++
    * 8. Función, crea nueva tabla Copy Customer (Customer Copy), Campos No. Y Name.
    * Recorrer Customer y crear en la nueva tabla los registros.
    */
    procedure ManipularDatos1()
    var
        CustomerCopy: Record "Customer Copy";
        // Messages
        CustomerInserted: Label 'Customer no: %1 inserted.';
        CustomerExists: Label 'Customer no: %1 already exists.';
    begin
        // Añadimos los siguientes datos a la tabla Customer Copy
        // Si ejecutamos esta función por segunda vez, nos saltará un error "The record in table Customer Copy already exists"
        CustomerCopy.Init();
        CustomerCopy."No." := '40000';
        CustomerCopy.Name := 'ParaEliminar4';
        if CustomerCopy.Insert() then
            Message(CustomerInserted, CustomerCopy."No.")
        else
            Message(CustomerExists, CustomerCopy."No.");
    end;

    /* ++
    * 9. Función, crear el campo “Name 2” en la nueva tabla.
    * Recorrer customer y actualizar en Customer Copy ese campo “Name 2”.
    */
    procedure ModificarRegistros()
    var
        Customer: Record Customer;
        CustomerCopy: Record "Customer Copy";
    begin
        // Buscar cliente
        Customer.Find('-');

        // Mostrar cliente
        Message('%1, %2, %3', Customer."No.", Customer.Name, Customer."Name 2");

        // Modificar name 2 de cliente
        Customer."Name 2" := 'Nombre 2 Modificado';
        Customer.Modify;

        // Mostrar name 2 modificado
        Message('%1, %2, %3', Customer."No.", Customer.Name, Customer."Name 2");
    end;

    /*
    * 10. Función, crear en la nueva tabla Fecha alta, Fecha modificación,
    * Usuario. Hacer que cada vez que se modifica o inserta estos campos se rellenen automáticamente.
    */
    procedure ManipularDatos2()
    var
        CustomerCopy: Record "Customer Copy";
    begin
        CustomerCopy."Fecha alta" := CurrentDateTime;
        CustomerCopy."Fecha modificación" := CurrentDateTime;
    end;

    /*++
    * 11. Función, recorrer todos los Customers, calcular Balance y 
    * mostrar el total de Balance de todos los Customers en mensaje.
    */
    procedure CamposCalculados()
    var
        Total: Decimal;
        Customer: Record Customer;
    begin
        if Customer.FindSet() then
            repeat
                Customer.Calcfields("Balance (LCY)");
                Total := Total + Customer."Balance (LCY)";
            until Customer.Next() = 0;
        Message('El balance total de todos los clientes es %1 €.', Total);
    end;

    /*++
    * 12. Función, con el Item 1000 filtrar en Item Ledger Entry por Item,
    * sumar su quantity sin recorrer este registro y mostrarlo en mensaje.
    */
    procedure FuncionCALCSUMS(ItemNo: Code[20])
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin

        // Filtramos por item
        ItemLedgerEntry.SetFilter("Item No.", ItemNo);

        //Sumamos su Quantity con la función CALCSUMS
        ItemLedgerEntry.CalcSums(Quantity);

        // Imprimimos su valor
        Message('El total de la columna Quantity, de los productos con número "%1", es %2.', ItemNo, ItemLedgerEntry.Quantity);

    end;

    /*--
    * 13. Función, sacar un error con la instrucción FieldErrorf.
    * Si al recorrer Item vemos alguno Blocked, recorrer los registros Item.
    *Con un Testfield comprobar que todos los Item tienen Sales unit of Measure.
    */
    procedure FuncionFIELDERROR()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry."Item No." := '';
        ItemLedgerEntry.FieldError("Item No.", 'is not valid');
    end;

    /*++
    * 14. Función, diferencia en entre fieldCaption y FieldName. ¿Por qué es importante?
    */
    /*
    * FieldCaption permite la funcionalidad de tener múltiples lenguajes, tanto ahora como en el futuro. Se debe usar FieldCaption en vez de FieldName
    */


    /*++
    * 15. Función, recorrer Customer, con Country/Region Code vacío y borrarlos en Customer Copy.
    */
    procedure Borrado()
    var
        Total: Decimal;
        Customer: Record Customer;
        CustomerCopy: Record "Customer Copy";
    begin
        Customer.SetRange("Country/Region Code", '');
        if Customer.FindSet() then
            repeat
                if (CustomerCopy."No." = Customer."No.") then
                    CustomerCopy.Delete();
                if (CustomerCopy."No." = Customer."No.") then
                    Total := Total + 1;
            until Customer.Next() = 0;

        Message('Líneas eliminadas: %1', Total);
        //CustomerCopy.DeleteAll();
    end;

    /*++
    * 16. Función, por No. Product, mostrar el número de movimientos de ese Product.
    */
    procedure Laboratorio(ItemNo: Code[20])
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        // Filtramos el "Item No", por nuestro No de Product introducido.
        ItemLedgerEntry.SetFilter("Item No.", ItemNo);

        // Pintamos el resultado de contar los movimientos con ese filtro
        Message('Número de movimientos del producto %1: %2 movimientos.', ItemNo, ItemLedgerEntry.Count());
    end;

    /*
    * 17. Función, añadir en la tabla "Customer Copy" unos campos nuevos, "Post Code" y "City".
    * Cuando se rellene campo "Post Code" se grabe en "City".
    * La primera City de la tabla "Post Code", donde "Code" sea igual al "Post Code" introducido.
    */
    procedure FuncionTriggers(NoCustomer: Code[20])
    var
        CustomerCopy: Record "Customer Copy";
    begin
        CustomerCopy.City := CustomerCopy."Post Code";
    end;


    var
    /*
        Total: Decimal;
        Customer: Record Customer;
        CustomerCopy: Record "Customer Copy";
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        DetailedCustomerLedgerEntry: Record "Detailed Cust. Ledg. Entry";
        QuerySumBalance: Query SumBalance;
        ItemLedgerEntry: Record "Item Ledger Entry";

        // Messages
        CustomerInserted: Label 'Customer no: %1 inserted.';
        CustomerExists: Label 'Customer no: %1 already exists.';
*/

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