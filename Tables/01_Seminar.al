table 123456701 "CSD Seminar"
{
    caption = 'Seminar';

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate();
            begin
                if "No." <> xrec."No." then begin
                    SeminarSetup.Get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;

            end;
        }
        field(20; Name; Text[50])
        {
            Caption = 'Name';
            trigger OnValidate();
            begin
                if("Search Name" = uppercase(xRec.Name)) or
                   ("Search Name" = '') then
                    "Search Name" := name;

            end;
        }

        field(30; "Seminar Duration"; Decimal)
        {
            caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }

        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }

        field(60; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(70; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
        }
        field(80; "Last Date Modified"; date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(90; Comment; Boolean)
        {
            caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Seminar Price"; Decimal)
        {
            caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; code[10])
        {
            caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate();
            begin
                if(xRec."Gen. Prod. Posting Group" <>
                "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup
                     (GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",
                     GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;

            end;
        }
        field(120; "VAT Prod. Posting Group"; code[10])
        {
            caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(130; "No. Series"; Code[10])
        {
            Editable = false;
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }



    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key1; "Search Name")
        {

        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xrec."No. Series",
             0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    begin
        //CommentLine.Reset;
        //CommentLine.SetRange("Table Name", CommentLine."Table Name"::Seminar);
        //CommentLine.SetRange("No.","No.");
        //CommentLine.DeleteAll
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := Today;

    end;

}