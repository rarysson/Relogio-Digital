module maq_m(
	input maqm_clock,
	input maqm_reset,
	input maqm_enable,
	input maqm_add_min,
	output logic [3:0] maqm_uni,
	output logic [2:0] maqm_dez,
	output logic maqm_add_hor
);


always_ff @(posedge maqm_clock) begin
	if (!maqm_reset) begin
		maqm_uni <= 4'd0;
		maqm_dez <= 3'd0;
	end
	
	else if (maqm_enable & maqm_add_min) begin
		if (maqm_dez == 3'd1 & maqm_uni == 4'd2) begin //mudar para d5 e d9
			maqm_uni <= 4'd0;
			maqm_dez <= 3'd0;
		end
		
		else begin
			maqm_uni <= maqm_uni + 4'd1;
			
			if (maqm_uni == 4'd2) begin //mudar para d9
				maqm_uni <= 4'd0;
				maqm_dez <= maqm_dez + 3'd1;
			end
		end
	end
end
		
	
always_comb
	maqm_add_hor <= (maqm_dez == 3'd1 & maqm_uni == 4'd2 & maqm_add_min); //mudar para d5 e d9


endmodule
