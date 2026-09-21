class alarm_clock_ip_agent_config extends uvm_object;

        //factory registration
        `uvm_object_utils(alarm_clock_ip_agent_config)

        //configurable parameters

        uvm_active_passive_enum is_active = UVM_ACTIVE;
        virtual alarm_clock_if vif;

        uvm_event_pool event_pool;

        // Standard UVM Methods like constructor
        extern function new(string name="");

endclass:alarm_clock_ip_agent_config

//-----------------  constructor new method  -------------------//
//Add code for new()

function alarm_clock_ip_agent_config :: new(string name = "");
        super.new(name);
endfunction
