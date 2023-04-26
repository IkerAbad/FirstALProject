query 50149 SumBalance
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.") { }
            column(Name; Name) { }
            //dataitem(Detailed_Cust_Ledg_Entry,"Detailed Cust. Ledg. Entry")
            //{
            //DataItemLink = "Amount" = Customer."Amount","No." = Customer."No.","Name" = Customer."Name";
            column(Sum_Amount; Amount) { Method = sum; }
            //}
        }
    }
}