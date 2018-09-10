pageextension 123456700 "CSD ResourceCardExt" extends "Resource Card"
{
    // CSD1.00 - 2018-02-01 D.E.Veloper
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }

            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
            {

            }


        }

        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;

                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {

                }
            }
        }



    }



    trigger OnAfterGetRecord();
    begin

        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);
    end;
    

    var
        [InDataSet]
        ShowMaxField: Boolean;
}