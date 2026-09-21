`timescale 1ns/1ns
module top;

        import uvm_pkg::*;
        import alarm_clock_pkg::*;

        `include "uvm_macros.svh"

        bit clock;
        alarm_clock_if alarm_if(clock);

        always

        #1953125 clock = ~clock;

        alarm_clock_top DUV (.clock(clock),
                            .key(alarm_if.key),
                                                .reset(alarm_if.reset),
                                                .time_button(alarm_if.time_button),
                                                .alarm_button(alarm_if.alarm_button),
                                                .fastwatch(alarm_if.fast_watch),
                                                .ms_hour(alarm_if.display_ms_hr),
                                                .ls_hour(alarm_if.display_ls_hr),
                                                .ms_minute(alarm_if.display_ms_min),
                                                .ls_minute(alarm_if.display_ls_min),
                                                .alarm_sound(alarm_if.sound_alarm));

        bind DUV.fsm1 fsm_assertions FSM_ASSERTION (
    clock,
    reset,
    one_second,
    time_button,
    alarm_button,
    key,
    load_new_a,
    show_a,
    show_new_time,
    load_new_c,
    shift,
    reset_count,
    pre_state,
    next_state,
    time_out
);
        initial
                begin

                        `ifdef VCS
                        $fsdbDumpSVA(0,top);
                        $fsdbDumpvars(0, top);
                        `endif

                        uvm_config_db#(virtual alarm_clock_if)::set(null,"uvm_test_top","vif",alarm_if);
                        run_test();
                end

endmodule
