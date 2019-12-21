module maq_h(
	input maqh_clock,
	input maqh_reset,
	input maqh_enable,
	input maqh_add,
	output logic [3:0] maqh_uni,
	output logic [2:0] maqh_dez
);


always_ff @(posedge maqh_clock) begin
	if (!maqh_reset) begin
		maqh_uni <= 4'd0;
		maqh_dez <= 3'd0;
	end
	
	else if (maqh_enable & maqh_add) begin
		if (maqh_dez == 3'd2 & maqh_uni == 4'd3) begin
			maqh_uni = 4'd0;
			maqh_dez = 3'd0;
		end
		
		else begin
			maqh_uni <= maqh_uni + 4'd1;
			
			if (maqh_uni == 4'd3) begin //mudar para d9
				maqh_uni <= 4'd0;
				maqh_dez <= maqh_dez + 3'd1;
			end
		end
	end
end


endmodule
