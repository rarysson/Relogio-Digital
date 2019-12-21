module sistema(
	input clock,
	input reset,
	output logic [6:0] uni_seg,
	output logic [6:0] dez_seg,
	output logic [6:0] uni_min,
	output logic [6:0] dez_min,
	output logic [6:0] uni_hor,
	output logic [6:0] dez_hor
);


logic enable1hz;


enable_1hz habilitador(
	.enable_clock(clock),
	.enable_reset(reset),
	.enable_pulseout(enable1hz)
);


logic [3:0] bcd_uni_seg;
logic [2:0] bcd_dez_seg;
logic add_min;


maq_s maqs_display_seg(
	.maqs_clock(clock),
	.maqs_reset(reset),
	.maqs_enable(enable1hz),
	.maqs_uni(bcd_uni_seg),
	.maqs_dez(bcd_dez_seg),
	.maqs_add_min(add_min)
);


bcd_7seg display_uni_seg(
	.bcd_display_in(bcd_uni_seg),
	.bcd_display_out(uni_seg)
);


bcd_7seg display_dez_seg(
	.bcd_display_in({1'b0, bcd_dez_seg}),
	.bcd_display_out(dez_seg)
);


logic [3:0] bcd_uni_min;
logic [2:0] bcd_dez_min;
logic add_hor;


maq_m maqm_display_min(
	.maqm_clock(clock),
	.maqm_reset(reset),
	.maqm_enable(enable1hz),
	.maqm_add_min(add_min),
	.maqm_uni(bcd_uni_min),
	.maqm_dez(bcd_dez_min),
	.maqm_add_hor(add_hor)
);


bcd_7seg display_uni_min(
	.bcd_display_in(bcd_uni_min),
	.bcd_display_out(uni_min)
);


bcd_7seg display_dez_min(
	.bcd_display_in({1'b0, bcd_dez_min}),
	.bcd_display_out(dez_min)
);


logic [3:0] bcd_uni_hor;
logic [1:0] bcd_dez_hor;


maq_h maqh_display_hor(
	.maqh_clock(clock),
	.maqh_reset(reset),
	.maqh_enable(enable1hz),
	.maqh_add(add_hor),
	.maqh_uni(bcd_uni_hor),
	.maqh_dez(bcd_dez_hor)
);


bcd_7seg display_uni_hor(
	.bcd_display_in(bcd_uni_hor),
	.bcd_display_out(uni_hor)
);


bcd_7seg display_dez_hor(
	.bcd_display_in({2'd0, bcd_dez_hor}),
	.bcd_display_out(dez_hor)
);


endmodule
