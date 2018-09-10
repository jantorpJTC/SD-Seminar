page 123456700 "CSD Seminar Setup"
{
    PageType = Card;
    SourceTable = "CSD Seminar Setup";
    caption = 'Seminar Setup';
    InsertAllowed=false;
    DeleteAllowed=false;
    UsageCategory=Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Seminar Nos.";"Seminar Nos.")
                {

                }
                field("Seminar Registration Nos.";"Seminar Registration Nos.")
                {

                }

                field("Posted Seminar Reg. Nos.";"Posted Seminar Reg. Nos.")
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    trigger OnOpenPage();
    begin
        if not get then begin
            init;
            Insert;
        end;

    end;
    
}