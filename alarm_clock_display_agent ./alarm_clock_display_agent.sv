class alarm_clock_display_agent extends uvm_agent;

        //factory registration
        `uvm_component_utils(alarm_clock_display_agent)

        // configuration class handle
        alarm_clock_display_agent_config disp_agt_cfg;

        // monitor  handles
        alarm_clock_display_monitor mon;




        // Standard UVM Methods like constructor,post_randomize
        extern function new(string name ,uvm_component parent);
        extern function void build_phase(uvm_phase phase);

endclass:alarm_clock_display_agent

//-----------------  constructor new method  -------------------//
//Add code for new()

function alarm_clock_display_agent :: new(string name,uvm_component parent);
        super.new(name,parent);
endfunction

function void alarm_clock_display_agent :: build_phase(uvm_phase phase);
        if(!uvm_config_db#(alarm_clock_display_agent_config)::get(this,"","alarm_clock_display_agent_config",disp_agt_cfg))
                `uvm_fatal(get_type_name(),"getting config object failed")
        mon = alarm_clock_display_monitor::type_id::create("mon",this);

endfunction

