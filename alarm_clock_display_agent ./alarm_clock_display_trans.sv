class alarm_clock_display_trans extends uvm_sequence_item;

        //factory registration
        `uvm_object_utils(alarm_clock_display_trans)
        //transaction class properties

        bit[3:0]display_ls_min;
        bit[3:0]display_ms_min;
        bit[3:0]display_ls_hr;
        bit[3:0]display_ms_hr;
        bit[3:0]alarm_ls_min;
        bit[3:0]alarm_ms_min;
        bit[3:0]alarm_ls_hr;
        bit[3:0]alarm_ms_hr;

        bit sound_alarm;


        // Standard UVM Methods like constructor,post_randomize
        extern function new(string name = "alarm_clock_display_trans");
        extern function void do_print(uvm_printer printer);
endclass:alarm_clock_display_trans

//-----------------  constructor new method  -------------------//
//Add code for new()

function  alarm_clock_display_trans :: new(string name = "alarm_clock_display_trans");
        super.new(name);
endfunction

function void  alarm_clock_display_trans::do_print (uvm_printer printer);
        super.do_print(printer);
        //                   string name                                bitstream value                 size       radix for printing
        printer.print_field( "display_ls_min",                  this.display_ls_min,     4,              UVM_DEC        );
        printer.print_field( "display_ms_min",                  this.display_ms_min,     4,              UVM_DEC        );
        printer.print_field( "display_ls_hr",                   this.display_ls_hr,      4,              UVM_DEC        );
        printer.print_field( "display_ms_hr",                   this.display_ms_hr,      4,              UVM_DEC        );
        printer.print_field( "alarm_ls_min",                    this.alarm_ls_min,       4,              UVM_DEC        );
        printer.print_field( "alarm_ms_min",                    this.alarm_ms_min,       4,              UVM_DEC        );
        printer.print_field( "alarm_ls_hr",                     this.alarm_ls_hr,        4,              UVM_DEC        );
        printer.print_field( "alarm_ms_hr",                     this.alarm_ms_hr,        4,              UVM_DEC        );

        printer.print_field( "sound alarm",                     this.sound_alarm,        1,              UVM_DEC        );

endfunction
