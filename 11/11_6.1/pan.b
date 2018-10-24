	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM spec */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC entorno */

	case 6: // STATE 1
		;
		now.arm = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 2
		;
		now.presence = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 3
		;
		now.arm = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 4
		;
		now.arm = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 5
		;
		now.presence = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 6
		;
		now.presence = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 13: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC alarm_fsm */

	case 14: // STATE 1
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 16: // STATE 4
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		
	case 17: // STATE 11
		goto R999;

	case 18: // STATE 7
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 20: // STATE 15
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 22: // STATE 21
		;
		now.state = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 28
		;
		p_restor(II);
		;
		;
		goto R999;
	}

