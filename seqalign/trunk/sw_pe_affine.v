module sw_pe_affine(clk,
             i_rst,
				 o_rst,
             i_data,
             i_preload,
             i_left_m,
				 i_left_i,
             i_high,
             i_vld,
             i_local,
             o_right_m,
				 o_right_i,
				 o_high,
             o_vld,
             o_data,
             start);

localparam
    SCORE_WIDTH = 11,   //score width
    N_A = 2'b00,        //nucleotide "A"
    N_G = 2'b01,        //nucleotide "G"
    N_T = 2'b10,        //nucleotide "T"
    N_C = 2'b11,        //nucleotide "C"
    INS_START = 3,            //insertion penalty
    INS_CONT  = 1,            //
    DEL_START = 3,            //deletion penalty
    DEL_CONT  = 1,
    TB_UP = 2'b00,      //"UP" traceback pointer
    TB_DIAG = 2'b01,    //"DIAG" traceback pointer
    TB_LEFT = 2'b10,    //"LEFT" traceback pointer
	 GOPEN = 12,
	 GEXT = 4;

input  wire clk;                        //input clock                   
input  wire i_rst;                      //input reset
output reg  o_rst;                      //output reset
input  wire [1:0] i_data;               //database sequence being streamed in
input  wire [1:0] i_preload;            //fixed character assigned to this node query
input  wire [SCORE_WIDTH-1:0] i_left_m;             //connection to left neighbor cell for M matrix, the wire length is 11 bits long? the previous score max = 2047
input  wire [SCORE_WIDTH-1:0] i_left_i;				//connection to left neighbor cell for I matrix, same here 11 bits? previous score is 2047
input  wire i_vld;                              //valid data coming from neighbor
just one bit?
input  wire i_local;			//=1 if local alignment, =0 if global alignment
this is just a input to caompute local or global
input  wire start;                               //designate that you're on the left edge of the array this is just for the first PE?
input  wire [SCORE_WIDTH-1:0] i_high;		//input of highest score from neighbor
used for local alignmnets this is the input
output reg [SCORE_WIDTH-1:0] o_right_m;            //output of score from t-1 for M matrix , i think the matrix is 11*11
output reg [SCORE_WIDTH-1:0] o_right_i;				//output of score for t-1 for I matrix same here the matrix is 11*11
output reg [SCORE_WIDTH-1:0] o_high;		//output of currently highest score
this is the output you give out
output reg  o_vld;                              //tells neighbor data is valid
output reg [1:0] o_data; //database sequence begin streamed out



parameter LENGTH=48;      //what length is this?
parameter LOGLENGTH = 6;    //what is this log length?

reg [1:0] state;        //just state counter

reg [SCORE_WIDTH-1:0] l_diag_score_m; //diagonal scores? of M
reg [SCORE_WIDTH-1:0] l_diag_score_i; //diagonal score of I?

wire [SCORE_WIDTH-1:0] right_m_nxt; // next right M?
wire [SCORE_WIDTH-1:0] right_i_nxt; // next right I?
wire [SCORE_WIDTH-1:0] left_open; // what is all this? open?
wire [SCORE_WIDTH-1:0] left_ext; // what is this? ext? left
wire [SCORE_WIDTH-1:0] up_open; //what is up_open?
wire [SCORE_WIDTH-1:0] up_ext; //what is ext?
wire [SCORE_WIDTH-1:0] left_max; //is it like input left_max
wire [SCORE_WIDTH-1:0] up_max; //is it like output upmax
wire [SCORE_WIDTH-1:0] rightmax; // 
wire [SCORE_WIDTH-1:0] start_left;

reg [SCORE_WIDTH-1:0] match; // aah what are all this 11 bit wires?
wire [SCORE_WIDTH-1:0] max_score_a; // what is a?
wire [SCORE_WIDTH-1:0] max_score_b; // what is b?
wire [SCORE_WIDTH-1:0] left_score; // left scores scores?
wire [SCORE_WIDTH-1:0] up_score; // up scores?
wire [SCORE_WIDTH-1:0] diag_score; // diagonal scores?
wire [SCORE_WIDTH-1:0] neutral_score; // neutral scores?

wire [SCORE_WIDTH-1:0] left_score_b; // what the hell is b


//compute new score options

assign neutral_score = 11'b10000000000; // these are scores?

assign start_left = (state==2'b01) ? (l_diag_score_m - GOPEN) : (l_diag_score_m - GEXT);

assign left_open = i_left_m  - GOPEN; // gap opening score
assign left_ext  = i_left_i  - GEXT; // gap extention score
assign up_open   = o_right_m - GOPEN; //
assign up_ext    = o_right_i - GEXT;
assign left_max  = start ? start_left : ((left_open > left_ext) ? left_open : left_ext);
assign up_max    = (up_open   > up_ext)   ? up_open   : up_ext;

assign right_m_nxt = match + ((l_diag_score_m > l_diag_score_i) ? l_diag_score_m : l_diag_score_i);	//next m score
assign right_i_nxt = (left_max > up_max) ? left_max : up_max;

always@(posedge clk)
	o_rst <= i_rst;

always@*
    case({i_data[1:0],i_preload[1:0]})
//this is the match-score lookup table: +5 for a match, -4 for a mismatch
        {N_A,N_A}:match = 11'b101;	//+5
        {N_A,N_G}:match = 11'h7fc;	//-4
        {N_A,N_T}:match = 11'h7fc;
        {N_A,N_C}:match = 11'h7fc;
        {N_G,N_A}:match = 11'h7fc;
        {N_G,N_G}:match = 11'b101;
        {N_G,N_T}:match = 11'h7fc;
        {N_G,N_C}:match = 11'h7fc;
        {N_T,N_A}:match = 11'h7fc;
        {N_T,N_G}:match = 11'h7fc;
        {N_T,N_T}:match = 11'b101;
        {N_T,N_C}:match = 11'h7fc;
        {N_C,N_A}:match = 11'h7fc;
        {N_C,N_G}:match = 11'h7fc;
        {N_C,N_T}:match = 11'h7fc;
        {N_C,N_C}:match = 11'b101;
    endcase

//just propagate the valid signal
always@(posedge clk)
    if (i_rst==1'b1)
        o_vld <= 1'b0;
    else
        o_vld <= i_vld;           


//This continuously calculates the highest score to pass through the block
assign rightmax = (right_m_nxt > right_i_nxt) ? right_m_nxt : right_i_nxt;


always@(posedge clk)
begin
	if (i_rst==1'b1)
		o_high <= neutral_score;		//reset to "0"
	else if (i_vld==1'b1)
		o_high <= (o_high > rightmax) ? ( (o_high > i_high) ? o_high : i_high) : ((rightmax > i_high) ? rightmax : i_high);
end

always@(posedge clk) begin
       if (i_rst==1'b1) begin
								//This is where we initialize the matrix
                        o_right_m <= i_local ? neutral_score : (i_left_m - (start ? GOPEN : GEXT));	//init m matrix
                        o_right_i <= i_local ? neutral_score : (i_left_i - (start ? GOPEN : GEXT));	//init i matrix
			o_data[1:0] <= 2'b00;
                        l_diag_score_m <= start ? neutral_score : (i_local ? neutral_score : i_left_m);
			l_diag_score_i <= start ? neutral_score : (i_local ? neutral_score : i_left_i);
                      end
       else if (i_vld==1'b1) begin
                           o_data[1:0] <= i_data[1:0];
                           o_right_m <= (i_local ? ((right_m_nxt > neutral_score) ? right_m_nxt : neutral_score) : right_m_nxt);
			   o_right_i <= (i_local ? ((right_i_nxt > neutral_score) ? right_i_nxt : neutral_score) : right_i_nxt);
			   l_diag_score_m <= start ?  (i_local ? neutral_score : (l_diag_score_m - GEXT)) : i_left_m ;
			   l_diag_score_i <= start ?  (i_local ? neutral_score : (l_diag_score_i - GEXT)) : i_left_i ;									
                        end
                     end

always@(posedge clk) begin //this is the internal state diagram
    if (i_rst)          //keep checking for input reset
        state <= 2'b00; // update my internal state to 00
    else begin
       case(state[1:0]) // check for my current state and update
			 2'b00:state[1:0] <= 2'b01;				              //reset state if I am in 00 then make me 01, reset state
          2'b01:if (i_vld==1'b1)        state[1:0] <= 2'b10;     //INIT state // if I am in 01 and valid is high then I am in score state
          2'b10:if (i_vld==1'b0)        state[1:0] <= 2'b01;     //SCORE state   - i_vld must be held high from the start of the query sequence to the end of it
          2'b11:if (i_rst)              state[1:0] <= 2'b00;     //END state // end of calculation
       endcase
        end
    end
endmodule