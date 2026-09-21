package alarm_clock_pkg;

        import uvm_pkg::*;
        int no_of_trans =1;

        `include "uvm_macros.svh"

        `include "alarm_clock_ip_agent_config.sv"
        `include "alarm_clock_display_agent_config.sv"
        `include "alarm_clock_env_config.sv"

        `include "alarm_clock_trans.sv"
        `include "alarm_clock_ip_driver.sv"
        `include "alarm_clock_ip_monitor.sv"
        `include "alarm_clock_ip_agent.sv"
        `include "alarm_clock_ip_seq.sv"

        `include "alarm_clock_display_trans.sv"
        `include "alarm_clock_display_monitor.sv"
        `include "alarm_clock_display_agent.sv"


        `include "alarm_clock_scoreboard.sv"
        `include "alarm_clock_env.sv"

        `include "alarm_clock_test.sv"

endpackage
