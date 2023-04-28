query 50149 SumBalance
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.") { }
            column(Name; Name) { }
            dataitem(Detailed_Cust__Ledg__Entry; "Detailed Cust. Ledg. Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                column(Sum_Amount; Amount) { Method = sum; }
            }
        }
    }
}