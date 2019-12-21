module maq_s(
	input maqs_clock,
	input maqs_reset,
	input maqs_enable,
	output logic [3:0] maqs_uni,
	output logic [2:0] maqs_dez,
	output logic maqs_add_min
);


always_ff @(posedge maqs_clock) begin
	if (!maqs_reset) begin
		maqs_uni <= 4'd0;
		maqs_dez <= 3'd0;
	end
	
	else if (maqs_enable) begin
		if (maqs_dez == 3'd1 & maqs_uni == 4'd3) begin //mudar para d5 e d9
			maqs_uni <= 4'd0;
			maqs_dez <= 3'd0;
		end
		
		else begin
			maqs_uni <= maqs_uni + 4'd1;
			
			if (maqs_uni == 4'd3) begin //mudar para d9
				maqs_uni <= 4'd0;
				maqs_dez <= maqs_dez + 3'd1;
			end	
			
		end
	end
end
		
		
always_comb
	maqs_add_min <= (maqs_dez == 3'd1 & maqs_uni == 4'd3); //mudar para d5 e d9


endmodule
