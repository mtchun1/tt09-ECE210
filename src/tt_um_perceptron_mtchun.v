/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_perceptron_mtchun (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out[6:0] = 0;
  assign uio_oe = 8'b100000000;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, uio_in, 1'b0};

//   wire v_in1[3:0] = ui_in[3:0];
//   wire v_in2[3:0] = ui_in[7:4];
  // Instantiate neuron
  perceptron perceptron1 (.v_in1(ui_in[3:0]), .v_in2(ui_in[7:4]), .clk(clk), .reset_n(rst_n), .state(uo_out), .v_out(uio_out[7]));

endmodule
