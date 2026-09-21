module tb_alarm_clock();

reg clk,
    reset,
    fast_watch,
    alarm_button,
    time_button;

reg [3:0] key;

wire [7:0] display_ms_hr,
           display_ms_min,
           display_ls_hr,
           display_ls_min;

wire sound_alarm;

parameter cycle = 2;


alarm_clock_top DUV(.clock(clk),
                    .reset(reset),
                    .fastwatch(fast_watch),
                    .alarm_button(alarm_button),
                    .time_button(time_button),
                    .key(key),
                    .alarm_sound(sound_alarm),
                    .ms_hour(display_ms_hr),
                    .ls_hour(display_ls_hr),
                    .ms_minute(display_ms_min),
                    .ls_minute(display_ls_min));
 bind DUV.fsm1 fsm_assertions FSM_ASSERTION (
    .clock        (clock),
    .reset        (reset),
    .one_second   (one_second),
    .time_button  (time_button),
    .alarm_button (alarm_button),
    .key          (key),
    .load_new_a   (load_new_a),
    .show_a       (show_a),
    .show_new_time(show_new_time),
    .load_new_c   (load_new_c),
    .shift        (shift),
    .reset_count  (reset_count),
    .pre_state    (pre_state),
    .next_state   (next_state),
    .time_out     (time_out)
);

 //Clock generation logic
 initial
  begin
     clk = 1'b0;
     forever
     #(cycle/2) clk = ~clk;
   end

 //

 //Stimulus logic
 initial
 begin
  // Initialize inputs
  reset = 1;
  fast_watch = 0;
  alarm_button = 0;
  time_button = 0;
  key = 10;

  // Hard reset the design
  #10;
  reset = 0;

  // Set fastwatch to 1 to make counting faster
  fast_watch = 1;
   //Set  key time to current time :11:23
   key = 1;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 1;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 2;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 3;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   time_button = 1;
   @(negedge clk);
   time_button = 0;

   //Set  key time to alarm time :11:30
   key = 1;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 1;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 3;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
   key = 0;
   repeat(3)
   @(negedge clk);
   key = 10;
   @(negedge clk);
    alarm_button = 1;
    repeat(2)
    @(negedge clk);
    alarm_button = 0;

    // Exercise TIME_OUT_CHECK
    key = 7;
    repeat(3)
    @(negedge clk);

    repeat(2560)
    @(negedge clk);

    key = 10;
    @(negedge clk);

   key = 2;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 3;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 5;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 9;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

time_button = 1;
@(negedge clk);
time_button = 0;
 // Wait for 23:59 -> 00:00 boundary
repeat(260)
    @(negedge clk);
// Set current time to 09:59
key = 0;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 9;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 5;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 9;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

time_button = 1;
@(negedge clk);
time_button = 0;

// Wait for 09:59 -> 10:00
repeat(260)
    @(negedge clk);
// Set current time to 00:59
key = 0;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 0;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 5;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

key = 9;
repeat(3) @(negedge clk);
key = 10;
@(negedge clk);

time_button = 1;
@(negedge clk);
time_button = 0;

// Wait for 00:59 -> 01:00
repeat(260)
    @(negedge clk);
// Exercise SHOW_ALARM state
key = 10;
@(negedge clk);

alarm_button = 1;
@(negedge clk);
alarm_button = 0;

repeat(5)
    @(negedge clk);

   $finish;
  end

 initial
  $monitor($time,"\-ns\t MAVEN SILICON : \tDISPLAY_MS_HR =%H >>> DISPLAY_LS_HR =%H>>> DISPLAY_MS_MIN =%H>>> DISPLAY_LS_MIN=%H",display_ms_hr[3:0],display_ls_hr[3:0],display_ms_min[3:0],display_ls_min[3:0]);

