/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_states_2 (
    input clk,
    input rst,
    input p1right,
    input p2right,
    input p3right,
    input p4right,
    input p1opp,
    input p2opp,
    input p3opp,
    input p4opp,
    input p1left,
    input p2left,
    input p3left,
    input p4left,
    input startPress,
    output reg startLED,
    output reg [7:0] count,
    output reg p1led,
    output reg p2led,
    output reg p3led,
    output reg p4led,
    output reg rise,
    output reg [4:0] scoreP1,
    output reg [4:0] scoreP2,
    output reg [4:0] scoreP3,
    output reg [4:0] scoreP4,
    output reg [0:0] draw,
    output reg ticking,
    output reg boom,
    output reg testOut
  );
  
  
  
  wire [1-1:0] M_button_conditioner_start_out;
  reg [1-1:0] M_button_conditioner_start_in;
  button_conditioner_11 button_conditioner_start (
    .clk(clk),
    .in(M_button_conditioner_start_in),
    .out(M_button_conditioner_start_out)
  );
  wire [1-1:0] M_edge_detector_start_out;
  reg [1-1:0] M_edge_detector_start_in;
  edge_detector_12 edge_detector_start (
    .clk(clk),
    .in(M_edge_detector_start_in),
    .out(M_edge_detector_start_out)
  );
  wire [5-1:0] M_counter_value;
  wire [1-1:0] M_counter_out;
  wire [26-1:0] M_counter_firstOut;
  reg [1-1:0] M_counter_rst;
  custom_counter_13 counter (
    .clk(clk),
    .rst(M_counter_rst),
    .value(M_counter_value),
    .out(M_counter_out),
    .firstOut(M_counter_firstOut)
  );
  wire [2-1:0] M_my_get_winner_winnerIs;
  wire [1-1:0] M_my_get_winner_foundWinner;
  wire [1-1:0] M_my_get_winner_draw;
  reg [1-1:0] M_my_get_winner_rst;
  reg [5-1:0] M_my_get_winner_score_1;
  reg [5-1:0] M_my_get_winner_score_2;
  reg [5-1:0] M_my_get_winner_score_3;
  reg [3-1:0] M_my_get_winner_aluMuxIn;
  get_winner_14 my_get_winner (
    .clk(clk),
    .rst(M_my_get_winner_rst),
    .score_1(M_my_get_winner_score_1),
    .score_2(M_my_get_winner_score_2),
    .score_3(M_my_get_winner_score_3),
    .aluMuxIn(M_my_get_winner_aluMuxIn),
    .winnerIs(M_my_get_winner_winnerIs),
    .foundWinner(M_my_get_winner_foundWinner),
    .draw(M_my_get_winner_draw)
  );
  wire [3-1:0] M_p1_buttonPress;
  reg [1-1:0] M_p1_left;
  reg [1-1:0] M_p1_opp;
  reg [1-1:0] M_p1_right;
  player_15 p1 (
    .clk(clk),
    .rst(rst),
    .left(M_p1_left),
    .opp(M_p1_opp),
    .right(M_p1_right),
    .buttonPress(M_p1_buttonPress)
  );
  wire [3-1:0] M_p2_buttonPress;
  reg [1-1:0] M_p2_left;
  reg [1-1:0] M_p2_opp;
  reg [1-1:0] M_p2_right;
  player_15 p2 (
    .clk(clk),
    .rst(rst),
    .left(M_p2_left),
    .opp(M_p2_opp),
    .right(M_p2_right),
    .buttonPress(M_p2_buttonPress)
  );
  wire [3-1:0] M_p3_buttonPress;
  reg [1-1:0] M_p3_left;
  reg [1-1:0] M_p3_opp;
  reg [1-1:0] M_p3_right;
  player_15 p3 (
    .clk(clk),
    .rst(rst),
    .left(M_p3_left),
    .opp(M_p3_opp),
    .right(M_p3_right),
    .buttonPress(M_p3_buttonPress)
  );
  wire [3-1:0] M_p4_buttonPress;
  reg [1-1:0] M_p4_left;
  reg [1-1:0] M_p4_opp;
  reg [1-1:0] M_p4_right;
  player_15 p4 (
    .clk(clk),
    .rst(rst),
    .left(M_p4_left),
    .opp(M_p4_opp),
    .right(M_p4_right),
    .buttonPress(M_p4_buttonPress)
  );
  wire [3-1:0] M_myBlink_blink;
  blink_19 myBlink (
    .clk(clk),
    .rst(rst),
    .blink(M_myBlink_blink)
  );
  wire [1-1:0] M_my_uart_tx_tx;
  wire [1-1:0] M_my_uart_tx_busy;
  reg [1-1:0] M_my_uart_tx_block;
  reg [8-1:0] M_my_uart_tx_data;
  reg [1-1:0] M_my_uart_tx_new_data;
  uart_tx_20 my_uart_tx (
    .clk(clk),
    .rst(rst),
    .block(M_my_uart_tx_block),
    .data(M_my_uart_tx_data),
    .new_data(M_my_uart_tx_new_data),
    .tx(M_my_uart_tx_tx),
    .busy(M_my_uart_tx_busy)
  );
  localparam IDLE_states = 4'd0;
  localparam P1_states = 4'd1;
  localparam P2_states = 4'd2;
  localparam P3_states = 4'd3;
  localparam P4_states = 4'd4;
  localparam P1BOOM_states = 4'd5;
  localparam P2BOOM_states = 4'd6;
  localparam P3BOOM_states = 4'd7;
  localparam P4BOOM_states = 4'd8;
  localparam P1WIN_states = 4'd9;
  localparam P2WIN_states = 4'd10;
  localparam P3WIN_states = 4'd11;
  localparam P4WIN_states = 4'd12;
  localparam DRAW_states = 4'd13;
  localparam TEST_states = 4'd14;
  
  reg [3:0] M_states_d, M_states_q = IDLE_states;
  reg [4:0] M_score_p1_d, M_score_p1_q = 1'h0;
  reg [4:0] M_score_p2_d, M_score_p2_q = 1'h0;
  reg [4:0] M_score_p3_d, M_score_p3_q = 1'h0;
  reg [4:0] M_score_p4_d, M_score_p4_q = 1'h0;
  reg [4:0] M_hold_p1_d, M_hold_p1_q = 1'h0;
  reg [4:0] M_hold_p2_d, M_hold_p2_q = 1'h0;
  reg [4:0] M_hold_p3_d, M_hold_p3_q = 1'h0;
  reg [4:0] M_hold_p4_d, M_hold_p4_q = 1'h0;
  reg [25:0] M_aluMux_d, M_aluMux_q = 1'h0;
  reg [1:0] M_loser_d, M_loser_q = 1'h0;
  reg [0:0] M_test_d, M_test_q = 1'h0;
  
  always @* begin
    M_states_d = M_states_q;
    M_hold_p3_d = M_hold_p3_q;
    M_score_p3_d = M_score_p3_q;
    M_hold_p2_d = M_hold_p2_q;
    M_score_p4_d = M_score_p4_q;
    M_loser_d = M_loser_q;
    M_hold_p1_d = M_hold_p1_q;
    M_test_d = M_test_q;
    M_hold_p4_d = M_hold_p4_q;
    M_aluMux_d = M_aluMux_q;
    M_score_p2_d = M_score_p2_q;
    M_score_p1_d = M_score_p1_q;
    
    count = M_counter_value;
    rise = M_counter_out;
    draw = 1'h0;
    M_p1_left = p1left;
    M_p1_opp = p1opp;
    M_p1_right = p1right;
    M_p2_left = p2left;
    M_p2_opp = p2opp;
    M_p2_right = p2right;
    M_p3_left = p3left;
    M_p3_opp = p3opp;
    M_p3_right = p3right;
    M_p4_left = p4left;
    M_p4_opp = p4opp;
    M_p4_right = p4right;
    p1led = 1'h0;
    p2led = 1'h0;
    p3led = 1'h0;
    p4led = 1'h0;
    scoreP1 = M_score_p1_q;
    scoreP2 = M_score_p2_q;
    scoreP3 = M_score_p3_q;
    scoreP4 = M_score_p4_q;
    M_my_get_winner_score_1 = 4'h0;
    M_my_get_winner_score_2 = 4'h0;
    M_my_get_winner_score_3 = 4'h0;
    M_my_get_winner_aluMuxIn = 3'h0;
    ticking = 1'h0;
    boom = 1'h0;
    startLED = 1'h0;
    M_button_conditioner_start_in = startPress;
    M_edge_detector_start_in = M_button_conditioner_start_out;
    M_counter_rst = 1'h0;
    M_my_get_winner_rst = 1'h0;
    M_my_uart_tx_block = 1'h0;
    M_my_uart_tx_new_data = 1'h0;
    M_my_uart_tx_data = 1'h0;
    testOut = M_test_q;
    if (M_edge_detector_start_out == 1'h1) begin
      M_test_d = M_test_q + 1'h1;
      M_my_uart_tx_new_data = 1'h1;
      M_my_uart_tx_data = 7'h61;
    end
    
    case (M_states_q)
      IDLE_states: begin
        M_states_d = IDLE_states;
        M_my_get_winner_rst = 1'h1;
        M_counter_rst = 1'h1;
        startLED = 1'h1;
        M_score_p1_d = 1'h0;
        M_score_p2_d = 1'h0;
        M_score_p3_d = 1'h0;
        M_score_p4_d = 1'h0;
        M_hold_p1_d = 1'h0;
        M_hold_p2_d = 1'h0;
        M_hold_p3_d = 1'h0;
        M_hold_p4_d = 1'h0;
        M_aluMux_d = 1'h0;
        M_loser_d = 1'h0;
        if (M_edge_detector_start_out == 1'h1) begin
          M_states_d = P1_states;
        end
      end
      P1_states: begin
        if (M_counter_value == 1'h0) begin
          M_states_d = P1BOOM_states;
        end
        if (M_hold_p1_q >= 3'h3) begin
          M_states_d = P1BOOM_states;
        end
        if (M_counter_firstOut == 26'h3ffffff) begin
          M_score_p1_d = M_score_p1_q + 1'h1;
          M_hold_p1_d = M_hold_p1_q + 1'h1;
        end
        if (M_counter_value < 3'h5) begin
          ticking = M_myBlink_blink[0+0-:1];
        end else begin
          if (M_counter_value < 4'hf) begin
            ticking = M_myBlink_blink[1+0-:1];
          end else begin
            ticking = M_myBlink_blink[2+0-:1];
          end
        end
        M_hold_p2_d = 1'h0;
        M_hold_p4_d = 1'h0;
        M_hold_p3_d = 1'h0;
        p1led = 1'h1;
        p2led = 1'h0;
        p3led = 1'h0;
        p4led = 1'h0;
        if (M_p1_buttonPress == 3'h1) begin
          M_states_d = P2_states;
        end
        if (M_p1_buttonPress == 3'h2) begin
          M_states_d = P3_states;
        end
        if (M_p1_buttonPress == 3'h4) begin
          M_states_d = P4_states;
        end
      end
      P2_states: begin
        if (M_counter_value < 3'h5) begin
          ticking = M_myBlink_blink[0+0-:1];
        end else begin
          if (M_counter_value < 4'hf) begin
            ticking = M_myBlink_blink[1+0-:1];
          end else begin
            ticking = M_myBlink_blink[2+0-:1];
          end
        end
        if (M_counter_value == 1'h0) begin
          M_states_d = P2BOOM_states;
        end
        if (M_hold_p2_q >= 3'h3) begin
          M_states_d = P2BOOM_states;
        end
        if (M_counter_firstOut == 26'h3ffffff) begin
          M_score_p2_d = M_score_p2_q + 1'h1;
          M_hold_p2_d = M_hold_p2_q + 1'h1;
        end
        M_hold_p1_d = 1'h0;
        M_hold_p3_d = 1'h0;
        M_hold_p4_d = 1'h0;
        p1led = 1'h0;
        p2led = 1'h1;
        p3led = 1'h0;
        p4led = 1'h0;
        if (M_p2_buttonPress == 3'h1) begin
          M_states_d = P3_states;
        end
        if (M_p2_buttonPress == 3'h2) begin
          M_states_d = P4_states;
        end
        if (M_p2_buttonPress == 3'h4) begin
          M_states_d = P1_states;
        end
      end
      P3_states: begin
        if (M_counter_value < 3'h5) begin
          ticking = M_myBlink_blink[0+0-:1];
        end else begin
          if (M_counter_value < 4'hf) begin
            ticking = M_myBlink_blink[1+0-:1];
          end else begin
            ticking = M_myBlink_blink[2+0-:1];
          end
        end
        if (M_counter_value == 1'h0) begin
          M_states_d = P3BOOM_states;
        end
        if (M_hold_p3_q >= 3'h3) begin
          M_states_d = P3BOOM_states;
        end
        if (M_counter_firstOut == 26'h3ffffff) begin
          M_score_p3_d = M_score_p3_q + 1'h1;
          M_hold_p3_d = M_hold_p3_q + 1'h1;
        end
        M_hold_p1_d = 1'h0;
        M_hold_p2_d = 1'h0;
        M_hold_p4_d = 1'h0;
        p1led = 1'h0;
        p2led = 1'h0;
        p3led = 1'h1;
        p4led = 1'h0;
        if (M_p3_buttonPress == 3'h1) begin
          M_states_d = P4_states;
        end
        if (M_p3_buttonPress == 3'h2) begin
          M_states_d = P1_states;
        end
        if (M_p3_buttonPress == 3'h4) begin
          M_states_d = P2_states;
        end
      end
      P4_states: begin
        if (M_counter_value < 3'h5) begin
          ticking = M_myBlink_blink[0+0-:1];
        end else begin
          if (M_counter_value < 4'hf) begin
            ticking = M_myBlink_blink[1+0-:1];
          end else begin
            ticking = M_myBlink_blink[2+0-:1];
          end
        end
        if (M_counter_value == 1'h0) begin
          M_states_d = P4BOOM_states;
        end
        if (M_hold_p4_q >= 3'h3) begin
          M_states_d = P4BOOM_states;
        end
        if (M_counter_firstOut == 26'h3ffffff) begin
          M_score_p4_d = M_score_p4_q + 1'h1;
          M_hold_p4_d = M_hold_p4_q + 1'h1;
        end
        M_hold_p1_d = 1'h0;
        M_hold_p2_d = 1'h0;
        M_hold_p3_d = 1'h0;
        p1led = 1'h0;
        p2led = 1'h0;
        p3led = 1'h0;
        p4led = 1'h1;
        if (M_p4_buttonPress == 3'h1) begin
          M_states_d = P1_states;
        end
        if (M_p4_buttonPress == 3'h2) begin
          M_states_d = P2_states;
        end
        if (M_p4_buttonPress == 3'h4) begin
          M_states_d = P3_states;
        end
      end
      P1BOOM_states: begin
        M_states_d = P1BOOM_states;
        boom = 1'h1;
        M_loser_d = 2'h0;
        p1led = 1'h1;
        p2led = 1'h0;
        p3led = 1'h0;
        p4led = 1'h0;
        M_aluMux_d = M_aluMux_q + 1'h1;
        M_my_get_winner_score_1 = M_score_p2_q;
        M_my_get_winner_score_2 = M_score_p3_q;
        M_my_get_winner_score_3 = M_score_p4_q;
        M_my_get_winner_aluMuxIn = M_aluMux_q[23+2-:3];
        if (M_my_get_winner_draw == 1'h1) begin
          M_states_d = DRAW_states;
        end
        if (M_my_get_winner_foundWinner == 1'h1) begin
          
          case (M_my_get_winner_winnerIs)
            2'h1: begin
              M_states_d = P2WIN_states;
            end
            2'h2: begin
              M_states_d = P3WIN_states;
            end
            2'h3: begin
              M_states_d = P4WIN_states;
            end
          endcase
        end
      end
      P2BOOM_states: begin
        M_states_d = P2BOOM_states;
        boom = 1'h1;
        M_loser_d = 2'h1;
        p1led = 1'h0;
        p2led = 1'h1;
        p3led = 1'h0;
        p4led = 1'h0;
        M_aluMux_d = M_aluMux_q + 1'h1;
        M_my_get_winner_score_1 = M_score_p3_q;
        M_my_get_winner_score_2 = M_score_p4_q;
        M_my_get_winner_score_3 = M_score_p1_q;
        M_my_get_winner_aluMuxIn = M_aluMux_q[23+2-:3];
        if (M_my_get_winner_draw == 1'h1) begin
          M_states_d = DRAW_states;
        end
        if (M_my_get_winner_foundWinner == 1'h1) begin
          
          case (M_my_get_winner_winnerIs)
            2'h1: begin
              M_states_d = P3WIN_states;
            end
            2'h2: begin
              M_states_d = P4WIN_states;
            end
            2'h3: begin
              M_states_d = P1WIN_states;
            end
          endcase
        end
      end
      P3BOOM_states: begin
        M_states_d = P3BOOM_states;
        boom = 1'h1;
        M_loser_d = 2'h2;
        p1led = 1'h0;
        p2led = 1'h0;
        p3led = 1'h1;
        p4led = 1'h0;
        M_aluMux_d = M_aluMux_q + 1'h1;
        M_my_get_winner_score_1 = M_score_p4_q;
        M_my_get_winner_score_2 = M_score_p1_q;
        M_my_get_winner_score_3 = M_score_p2_q;
        M_my_get_winner_aluMuxIn = M_aluMux_q[23+2-:3];
        if (M_my_get_winner_draw == 1'h1) begin
          M_states_d = DRAW_states;
        end
        if (M_my_get_winner_foundWinner == 1'h1) begin
          
          case (M_my_get_winner_winnerIs)
            2'h1: begin
              M_states_d = P4WIN_states;
            end
            2'h2: begin
              M_states_d = P1WIN_states;
            end
            2'h3: begin
              M_states_d = P2WIN_states;
            end
          endcase
        end
      end
      P4BOOM_states: begin
        M_states_d = P4BOOM_states;
        boom = 1'h1;
        M_loser_d = 2'h3;
        p1led = 1'h0;
        p2led = 1'h0;
        p3led = 1'h0;
        p4led = 1'h1;
        M_aluMux_d = M_aluMux_q + 1'h1;
        M_my_get_winner_score_1 = M_score_p1_q;
        M_my_get_winner_score_2 = M_score_p2_q;
        M_my_get_winner_score_3 = M_score_p3_q;
        M_my_get_winner_aluMuxIn = M_aluMux_q[23+2-:3];
        if (M_my_get_winner_draw == 1'h1) begin
          M_states_d = DRAW_states;
        end
        if (M_my_get_winner_foundWinner == 1'h1) begin
          
          case (M_my_get_winner_winnerIs)
            2'h1: begin
              M_states_d = P1WIN_states;
            end
            2'h2: begin
              M_states_d = P2WIN_states;
            end
            2'h3: begin
              M_states_d = P3WIN_states;
            end
          endcase
        end
      end
      P1WIN_states: begin
        M_states_d = P1WIN_states;
        p1led = 1'h1;
        
        case (M_loser_q)
          2'h1: begin
            p2led = M_myBlink_blink[0+0-:1];
          end
          2'h2: begin
            p3led = M_myBlink_blink[0+0-:1];
          end
          2'h3: begin
            p4led = M_myBlink_blink[0+0-:1];
          end
        endcase
        if (M_edge_detector_start_out == 1'h1) begin
          M_states_d = IDLE_states;
        end
      end
      P2WIN_states: begin
        M_states_d = P2WIN_states;
        p2led = 1'h1;
        
        case (M_loser_q)
          2'h0: begin
            p1led = M_myBlink_blink[0+0-:1];
          end
          2'h2: begin
            p3led = M_myBlink_blink[0+0-:1];
          end
          2'h3: begin
            p4led = M_myBlink_blink[0+0-:1];
          end
        endcase
        if (M_edge_detector_start_out == 1'h1) begin
          M_states_d = IDLE_states;
        end
      end
      P3WIN_states: begin
        M_states_d = P3WIN_states;
        p3led = 1'h1;
        
        case (M_loser_q)
          2'h0: begin
            p1led = M_myBlink_blink[0+0-:1];
          end
          2'h1: begin
            p2led = M_myBlink_blink[0+0-:1];
          end
          2'h3: begin
            p4led = M_myBlink_blink[0+0-:1];
          end
        endcase
        if (M_edge_detector_start_out == 1'h1) begin
          M_states_d = IDLE_states;
        end
      end
      P4WIN_states: begin
        M_states_d = P4WIN_states;
        p4led = 1'h1;
        
        case (M_loser_q)
          2'h0: begin
            p1led = M_myBlink_blink[0+0-:1];
          end
          2'h1: begin
            p2led = M_myBlink_blink[0+0-:1];
          end
          2'h2: begin
            p3led = M_myBlink_blink[0+0-:1];
          end
        endcase
        if (M_edge_detector_start_out == 1'h1) begin
          M_states_d = IDLE_states;
        end
      end
      DRAW_states: begin
        draw = 1'h1;
        M_states_d = DRAW_states;
        startLED = M_myBlink_blink[1+0-:1];
        p1led = M_myBlink_blink[1+0-:1];
        p2led = M_myBlink_blink[1+0-:1];
        p3led = M_myBlink_blink[1+0-:1];
        p4led = M_myBlink_blink[1+0-:1];
        if (M_edge_detector_start_out == 1'h1) begin
          M_states_d = IDLE_states;
        end
      end
      TEST_states: begin
        M_score_p1_d = M_counter_value;
        M_score_p2_d = M_counter_value;
        M_score_p3_d = M_counter_value;
        M_score_p4_d = M_counter_value;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_score_p1_q <= 1'h0;
      M_score_p2_q <= 1'h0;
      M_score_p3_q <= 1'h0;
      M_score_p4_q <= 1'h0;
      M_hold_p1_q <= 1'h0;
      M_hold_p2_q <= 1'h0;
      M_hold_p3_q <= 1'h0;
      M_hold_p4_q <= 1'h0;
      M_aluMux_q <= 1'h0;
      M_loser_q <= 1'h0;
      M_test_q <= 1'h0;
      M_states_q <= 1'h0;
    end else begin
      M_score_p1_q <= M_score_p1_d;
      M_score_p2_q <= M_score_p2_d;
      M_score_p3_q <= M_score_p3_d;
      M_score_p4_q <= M_score_p4_d;
      M_hold_p1_q <= M_hold_p1_d;
      M_hold_p2_q <= M_hold_p2_d;
      M_hold_p3_q <= M_hold_p3_d;
      M_hold_p4_q <= M_hold_p4_d;
      M_aluMux_q <= M_aluMux_d;
      M_loser_q <= M_loser_d;
      M_test_q <= M_test_d;
      M_states_q <= M_states_d;
    end
  end
  
endmodule
