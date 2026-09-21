class alarm_clock_display_agent_config extends uvm_object;

        //factory registration
        `uvm_object_utils(alarm_clock_display_agent_config)

        //configurable parameters


        virtual alarm_clock_if vif;

        rand bit[5:0]ref_time;

        uvm_event_pool event_pool;

        // Standard UVM Methods like constructor
        extern function new(string name ="");
        int no_of_data_collected;

endclass:alarm_clock_display_agent_config

//-----------------  constructor new method  -------------------//
//Add code for new()

function alarm_clock_display_agent_config :: new(string name ="");
        super.new(name);
endfunction

