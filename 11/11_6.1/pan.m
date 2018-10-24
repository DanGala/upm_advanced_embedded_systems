#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM spec */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(((!((state==2))&&(presence&&arm))&&(state==0)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!((( !((((int)now.state)==2))&&(((int)now.presence)&&((int)now.arm)))&&(((int)now.state)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 8 - _spin_nvr.tmp:8 - [((!((state==2))&&(presence&&arm)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][8] = 1;
		if (!(( !((((int)now.state)==2))&&(((int)now.presence)&&((int)now.arm)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 13 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC entorno */
	case 6: // STATE 1 - modelo_6.1.pml:35 - [arm = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.arm);
		now.arm = 0;
#ifdef VAR_RANGES
		logval("arm", ((int)now.arm));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 2 - modelo_6.1.pml:36 - [presence = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)now.presence);
		now.presence = 0;
#ifdef VAR_RANGES
		logval("presence", ((int)now.presence));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 3 - modelo_6.1.pml:39 - [arm = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)now.arm);
		now.arm = 0;
#ifdef VAR_RANGES
		logval("arm", ((int)now.arm));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 4 - modelo_6.1.pml:40 - [arm = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = ((int)now.arm);
		now.arm = 1;
#ifdef VAR_RANGES
		logval("arm", ((int)now.arm));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 5 - modelo_6.1.pml:41 - [presence = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = ((int)now.presence);
		now.presence = 0;
#ifdef VAR_RANGES
		logval("presence", ((int)now.presence));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 6 - modelo_6.1.pml:42 - [presence = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		(trpt+1)->bup.oval = ((int)now.presence);
		now.presence = 1;
#ifdef VAR_RANGES
		logval("presence", ((int)now.presence));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 9 - modelo_6.1.pml:44 - [printf('state=%d - presence=%d - arm=%d\\n',state,presence,arm)] (0:0:0 - 5)
		IfNotBlocked
		reached[1][9] = 1;
		Printf("state=%d - presence=%d - arm=%d\n", ((int)now.state), ((int)now.presence), ((int)now.arm));
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 13 - modelo_6.1.pml:46 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC alarm_fsm */
	case 14: // STATE 1 - modelo_6.1.pml:10 - [state = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.state);
		now.state = 0;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 2 - modelo_6.1.pml:12 - [((state==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)now.state)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 3 - modelo_6.1.pml:14 - [(!(arm))] (5:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!( !(((int)now.arm))))
			continue;
		/* merge: state = 1(0, 4, 5) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.state);
		now.state = 1;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 17: // STATE 11 - modelo_6.1.pml:20 - [.(goto)] (0:25:0 - 2)
		IfNotBlocked
		reached[0][11] = 1;
		;
		/* merge: .(goto)(0, 26, 25) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 6 - modelo_6.1.pml:17 - [(presence)] (25:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!(((int)now.presence)))
			continue;
		/* merge: state = 2(25, 7, 25) */
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.state);
		now.state = 2;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: .(goto)(25, 9, 25) */
		reached[0][9] = 1;
		;
		/* merge: .(goto)(25, 11, 25) */
		reached[0][11] = 1;
		;
		/* merge: .(goto)(0, 26, 25) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 19: // STATE 13 - modelo_6.1.pml:21 - [((state==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((int)now.state)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 14 - modelo_6.1.pml:23 - [(arm)] (25:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		if (!(((int)now.arm)))
			continue;
		/* merge: state = 0(25, 15, 25) */
		reached[0][15] = 1;
		(trpt+1)->bup.oval = ((int)now.state);
		now.state = 0;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: .(goto)(25, 17, 25) */
		reached[0][17] = 1;
		;
		/* merge: .(goto)(0, 26, 25) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 21: // STATE 19 - modelo_6.1.pml:26 - [((state==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!((((int)now.state)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 20 - modelo_6.1.pml:28 - [(!(arm))] (25:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		if (!( !(((int)now.arm))))
			continue;
		/* merge: state = 1(25, 21, 25) */
		reached[0][21] = 1;
		(trpt+1)->bup.oval = ((int)now.state);
		now.state = 1;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: .(goto)(25, 23, 25) */
		reached[0][23] = 1;
		;
		/* merge: .(goto)(0, 26, 25) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 23: // STATE 28 - modelo_6.1.pml:32 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

