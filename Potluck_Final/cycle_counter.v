// ============================================================
// cycle_counter.v
//
// Counts the number of clk cycles between
//   • rising edge of rst_p  (connect to level-high ap_start)
//   • rising edge of freeze_p (connect to level-high ap_done)
//
// The very cycle where rst_p rises IS included in the tally
// by initialising count to 1 on that edge.
//
// Typical block-diagram wiring:
//   clk      -> ap_clk
//   rst_p    -> dbg_ap_start   (level signal, not a pulse)
//   freeze_p -> dbg_ap_done    (level signal, not a pulse)
//   count    -> VIO or AXI-GPIO
//   valid    -> VIO or AXI-GPIO (optional)
//
// ============================================================
`timescale 1 ns / 1 ps
module cycle_counter #(
    parameter integer WIDTH = 64          // counter width
)(
    input  wire              clk,         // same clock domain as the kernel
    input  wire              rst_p,       // level-high with ap_start
    input  wire              freeze_p,    // *pulse* or level-high with ap_done
    output reg  [WIDTH-1:0]  count  = 0,  // tallied cycles
    output reg               valid  = 0   // goes high one cycle after ap_done
);
    // --------------------------------------------------------------------
    // Rising-edge detectors for rst_p  (ap_start)  and freeze_p (ap_done)
    // --------------------------------------------------------------------
    reg rst_d;    /* synthesis syn_keep = 1 */
    reg freeze_d; /* synthesis syn_keep = 1 */

    wire rst_edge    =  rst_p   & ~rst_d;    // ap_start ↑
    wire freeze_edge =  freeze_p & ~freeze_d; // ap_done  ↑  (may be 1-cycle)

    // Latched “freeze” flag – once high, remains high until next rst_edge
    reg freeze = 1'b1;

    always @(posedge clk) begin
        //-----------------------------------------------------------------
        // 1-cycle delays for both edge detectors
        //-----------------------------------------------------------------
        rst_d    <= rst_p;
        freeze_d <= freeze_p;

        //-----------------------------------------------------------------
        // (1) New kernel started?  → clear & begin counting at 1
        //-----------------------------------------------------------------
        if (rst_edge) begin
            count  <= {{(WIDTH-1){1'b0}}, 1'b1};   // include the first busy cycle
            valid  <= 1'b0;
            freeze <= 1'b0;                        // re-enable counter
        end

        //-----------------------------------------------------------------
        // (2) Still busy? keep counting
        //-----------------------------------------------------------------
        else if (!freeze) begin
            count <= count + 1'b1;

            // ap_done just asserted (even for a single clock)? → latch result
            if (freeze_edge) begin
                freeze <= 1'b1;  // permanently freeze the counter
                valid  <= 1'b1;  // mark value as valid
            end
        end
        //-----------------------------------------------------------------
        // Once “freeze” is set we stay here, holding the final value.
        //-----------------------------------------------------------------
    end
endmodule
