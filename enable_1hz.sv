module enable_1hz(
	input enable_clock,
	input enable_reset,
	output logic enable_pulseout
);


logic [25:0] contador;


always_ff @(posedge enable_clock)
	if (!enable_reset)
		contador <= 26'd0;
	else
		if (contador == 26'd1) //mudar para d49999999
			contador <= 26'd0;
		else
			contador <= contador + 26'd1;
			
always_comb
	enable_pulseout <= (contador == 26'd1); //mudar para d49999999
	
endmodule
