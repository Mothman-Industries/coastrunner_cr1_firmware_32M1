#ifndef a4910_h
	#define a4910_h

	#define A4910_DIAG_vect  (PCINT15_vect) //Diag output from A4910
	
	void a4910_init(void);

	void a4910_disable(void);
	void a4910_enable(void);

#endif
