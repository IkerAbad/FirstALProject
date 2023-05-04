codeunit 50149 "CodeEjemplo"
{

    /*++
    * 1. Función, devuelve el nombre del Customer introduciendo su No.
    */
    procedure RegistroPorClavePrimaria(CustomerNo: Code[20])
    var
        Customer: Record Customer;
    begin
        // Si el número de clave primaria No. se encuentra, devuelve su nombre por pantalla.
        if Customer.get(CustomerNo) then
            // Mensaje por pantalla
            Message(NombreClienteLbl, CustomerNo, Customer.Name);

        /* Justificación
        * Uso el método "Record.get("Clave primaria")" porque devuelve un Record con los datos que tengan esa clave primaria.
        * Este método omite cualquier filtro aplicado, excepto los Security Filters.
        */
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
            // Mensaje por pantalla
            Message(PrimerClienteLbl, Customer.Name);

        /* Justificación
        * Uso el método "Record.FindFirst()" porque devuelve el primer valor que encuentra en la tabla customer, lo primero que lee.
        */
    end;

    /*++
    * 3. Función, por No. Customer, ir a su último movimiento y mostrar su Posting date.
    */
    procedure UltimoRegistro(CustomerNo: Code[20])
    var
        CustomerLedgerEntry: Record "Cust. Ledger Entry";

    begin
        // Filtramos por No de cliente
        CustomerLedgerEntry.SetFilter("Customer No.", CustomerNo);
        // Buscamos el último movimiento
        if CustomerLedgerEntry.FindLast() then
            // Mensaje por pantalla
            Message(UltimoRegistroLbl, CustomerNo, CustomerLedgerEntry."Posting Date");

        /* Justificación
        * Aplico el método "Record.SetFilter("Columna", "Filtro")" porque me filtra, dentro de mi variable, todos los movimientos
        * con esa clave primera de Customer.
        * Una vez aplicado, busca el último movimiento con la función Record.FindLast()
        */
    end;

    /*
    * 4. Función, recorrer los “Detailed Cust. Ledg. Entry” con un No. cliente,
    * sumar su importe (Amount) en una variable y mostrarla al final en un mensaje.
    */

    // SETCURRENTKEY
    // SETRANGE
    procedure BuclesRegistros(CustomerNo: Code[20])
    var
        Total: Decimal;
        DetailedCustomerLedgerEntry: Record "Detailed Cust. Ledg. Entry";

    begin



        /*
                // Bucle que recorre la tabla "Detailed Cust. Ledg. Entry"
                if DetailedCustomerLedgerEntry.FindSet() then
                    repeat
                        // Si encuentra que un dato, en valor de No Cliente, coincide con el No Cliente introducido,
                        // suma su valor Amount y lo guarda en una variable.
                        if DetailedCustomerLedgerEntry."Customer No." = CustomerNo then
                            Total := Total + DetailedCustomerLedgerEntry.Amount;
                    until DetailedCustomerLedgerEntry.Next = 0;
                // Mensaje por pantalla
                Message(CustomerSumAmountLbl, CustomerNo, Total);
        */

        /* Justificación
        * 
        */
    end;

    /*++
    * 5. Función, hacer una query sobre los “Detailed Cust. Ledg. Entry” de Customer.
    * Recorrer los “Detailed Cust. Ledg. Entry” con un No. cliente, sumar su importe (Amount) en una variable y mostrarla al final en un mensaje.
    */
    procedure FuncionQuery(CustomerNo: Code[20])
    var
        QuerySumBalance: Query SumBalance;
        DetailedCustomerLedgerEntry: Record "Detailed Cust. Ledg. Entry";
        Customer: Record Customer;

    begin
        // Filtrar por No Customer
        QuerySumBalance.SETFILTER(QuerySumBalance.No_, CustomerNo);
        // Ejecuta la query
        QuerySumBalance.OPEN;
        // Lee cada fila y muestra un mensaje con los valores de columna.
        // El bucle finaliza cuando no se encuentran más filas.
        WHILE QuerySumBalance.READ DO BEGIN
            MESSAGE('Client Number: %1\Name: %2\Sum Amount: %3', CustomerNo, QuerySumBalance.Name, QuerySumBalance.Sum_Amount);
        END;
        // Cierra la query
        QuerySumBalance.CLOSE;

        /* Justificación
        * 
        */
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
        // Mensaje por pantalla
        Message('Customers que tienen el Country Code vacío: %1.', Customer.Count());

        /* Justificación
        * 
        */
    end;

    /*++
    * 7. Función, como en la función anterior con mensaje final, mostrar los filtros de ese registro.
    */
    procedure MostrarFiltros()
    var
        Customer: Record Customer;
    begin
        // Creamos un filtro, los valores vacíos de la columna "Country/Region Code", y lo mostramos por pantalla
        Customer.SetRange("Country/Region Code", '');
        Message('Filtros activos:\%1', Customer.GetFilters);

        /* Justificación
        * 
        */
    end;

    /*++
    * 8. Función, crea nueva tabla Copy Customer (Customer Copy), Campos No. Y Name.
    * Recorrer Customer y crear en la nueva tabla los registros.
    */
    procedure ManipularDatos1()
    var
        CustomerCopy: Record "Customer Copy";
        // Mensages
        CustomerInserted: Label 'Customer no: %1 inserted.';
        CustomerExists: Label 'Customer no: %1 already exists.';
    begin
        // Añadimos los siguientes datos a la tabla Customer Copy
        // Si ejecutamos esta función por segunda vez, nos saltará un error "The record in table Customer Copy already exists"
        CustomerCopy.Init();
        CustomerCopy."No." := '50000';
        CustomerCopy.Name := 'Iker5';
        if CustomerCopy.Insert() then
            Message(CustomerInserted, CustomerCopy."No.")
        else
            Message(CustomerExists, CustomerCopy."No.");

        /* Justificación
        * 
        */
    end;

    /*++
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
        Message('Nº Cliente: %1\Nombre: %2\Segundo nombre: %3', Customer."No.", Customer.Name, Customer."Name 2");

        // Modificar name 2 de cliente
        Customer."Name 2" := 'Nombre 2 Modificado';
        Customer.Modify;

        // Mostrar name 2 modificado
        Message('Nº Cliente: %1\Nombre: %2\Segundo nombre: %3', Customer."No.", Customer.Name, Customer."Name 2");

        /* Justificación
        * 
        */
    end;

    /*++
    * 10. Función, crear en la nueva tabla Fecha alta, Fecha modificación,
    * Usuario. Hacer que cada vez que se modifica o inserta estos campos se rellenen automáticamente.
    */
    procedure ManipularDatos2()
    var
        CustomerCopy: Record "Customer Copy";
    begin
        // Recorre cada cliente de la tabla "Customer Copy"
        if CustomerCopy.FindSet() then
            repeat
                // Muestra el cliente actual
                Message('Cliente: %1\Fecha alta: %2\Fecha modificación: %3', CustomerCopy.Name, CustomerCopy."Fecha alta", CustomerCopy."Fecha modificación");
                CustomerCopy.Modify(true);
                CustomerCopy.Insert(true);
                // Muestra el cliente modificado
                Message('Cliente: %1\Fecha alta: %2\Fecha modificación: %3', CustomerCopy.Name, CustomerCopy."Fecha alta", CustomerCopy."Fecha modificación");
            until CustomerCopy.Next() = 0;

        /* Justificación
        * 
        */
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
                // Campo calculado
                Customer.Calcfields("Balance (LCY)");
                // Sumatorio
                Total := Total + Customer."Balance (LCY)";
            until Customer.Next() = 0;
        Message('El balance total de todos los clientes es %1 €.', Total);

        /* Justificación
        * 
        */
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

        /* Justificación
        * 
        */
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

        /* Justificación
        * 
        */
    end;

    /*++
    * 14. Función, diferencia en entre fieldCaption y FieldName. ¿Por qué es importante?
    */
    /*
    * FieldCaption permite la funcionalidad de tener múltiples lenguajes, tanto ahora como en el futuro. Se debe usar FieldCaption en vez de FieldName
    */


    /*
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

        /* Justificación
        * 
        */
    end;

    /*
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

        /* Justificación
        * 
        */
    end;

    /*
    * 17. Función, añadir en la tabla "Customer Copy" unos campos nuevos, "Post Code" y "City".
    * Cuando se rellene campo "Post Code" se grabe en "City".
    * La primera City de la tabla "Post Code", donde "Code" sea igual al "Post Code" introducido.
    */
    procedure FuncionTriggers(CustomerNo: Code[20])
    var
        CustomerCopy: Record "Customer Copy";
    begin
        CustomerCopy.City := CustomerCopy."Post Code";

        /* Justificación
        * 
        */
    end;

    var
        NombreClienteLbl: Label 'El nombre del cliente, con número %1, es %2.';
        PrimerClienteLbl: Label 'El nombre del primer cliente es %1.';
        UltimoRegistroLbl: Label 'Del cliente %1, el "Posting Date" de su último movimiento es el %2.';
        CustomerSumAmountLbl: Label 'La cantidad total de la columna "Amount", del Customer %1, es %2 €.';

}