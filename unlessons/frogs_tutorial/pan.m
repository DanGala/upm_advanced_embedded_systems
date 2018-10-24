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
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!(!((((((((rocks[0]==2)&&(rocks[1]==2))&&(rocks[2]==2))&&(rocks[3]==0))&&(rocks[4]==1))&&(rocks[5]==1))&&(rocks[6]==1)))))] (6:0:0 - 1)
		
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
		reached[1][1] = 1;
		if (!( !( !((((((((now.rocks[0]==2)&&(now.rocks[1]==2))&&(now.rocks[2]==2))&&(now.rocks[3]==0))&&(now.rocks[4]==1))&&(now.rocks[5]==1))&&(now.rocks[6]==1))))))
			continue;
		/* merge: assert(!(!(!((((((((rocks[0]==2)&&(rocks[1]==2))&&(rocks[2]==2))&&(rocks[3]==0))&&(rocks[4]==1))&&(rocks[5]==1))&&(rocks[6]==1))))))(0, 2, 6) */
		reached[1][2] = 1;
		spin_assert( !( !( !((((((((now.rocks[0]==2)&&(now.rocks[1]==2))&&(now.rocks[2]==2))&&(now.rocks[3]==0))&&(now.rocks[4]==1))&&(now.rocks[5]==1))&&(now.rocks[6]==1))))), " !( !( !((((((((rocks[0]==2)&&(rocks[1]==2))&&(rocks[2]==2))&&(rocks[3]==0))&&(rocks[4]==1))&&(rocks[5]==1))&&(rocks[6]==1)))))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[1][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC frogs */
	case 5: // STATE 1 - frogs.pml:8 - [(((rocks[0]==1)&&(rocks[1]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!(((now.rocks[0]==1)&&(now.rocks[1]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - frogs.pml:9 - [rocks[0] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[0];
		now.rocks[0] = 0;
#ifdef VAR_RANGES
		logval("rocks[0]", now.rocks[0]);
#endif
		;
		/* merge: rocks[1] = 1(102, 3, 102) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[1];
		now.rocks[1] = 1;
#ifdef VAR_RANGES
		logval("rocks[1]", now.rocks[1]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 7: // STATE 5 - frogs.pml:11 - [((((rocks[0]==1)&&(rocks[1]>0))&&(rocks[2]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((now.rocks[0]==1)&&(now.rocks[1]>0))&&(now.rocks[2]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - frogs.pml:12 - [rocks[0] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[0];
		now.rocks[0] = 0;
#ifdef VAR_RANGES
		logval("rocks[0]", now.rocks[0]);
#endif
		;
		/* merge: rocks[2] = 1(102, 7, 102) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[2];
		now.rocks[2] = 1;
#ifdef VAR_RANGES
		logval("rocks[2]", now.rocks[2]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 9: // STATE 9 - frogs.pml:14 - [(((rocks[1]==1)&&(rocks[2]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!(((now.rocks[1]==1)&&(now.rocks[2]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 10 - frogs.pml:15 - [rocks[1] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[1];
		now.rocks[1] = 0;
#ifdef VAR_RANGES
		logval("rocks[1]", now.rocks[1]);
#endif
		;
		/* merge: rocks[2] = 1(102, 11, 102) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[2];
		now.rocks[2] = 1;
#ifdef VAR_RANGES
		logval("rocks[2]", now.rocks[2]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 11: // STATE 13 - frogs.pml:17 - [((((rocks[1]==1)&&(rocks[2]>0))&&(rocks[3]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((now.rocks[1]==1)&&(now.rocks[2]>0))&&(now.rocks[3]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 14 - frogs.pml:18 - [rocks[1] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[1];
		now.rocks[1] = 0;
#ifdef VAR_RANGES
		logval("rocks[1]", now.rocks[1]);
#endif
		;
		/* merge: rocks[3] = 1(102, 15, 102) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[3];
		now.rocks[3] = 1;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 13: // STATE 17 - frogs.pml:20 - [(((rocks[2]==1)&&(rocks[3]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!(((now.rocks[2]==1)&&(now.rocks[3]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 18 - frogs.pml:21 - [rocks[2] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[2];
		now.rocks[2] = 0;
#ifdef VAR_RANGES
		logval("rocks[2]", now.rocks[2]);
#endif
		;
		/* merge: rocks[3] = 1(102, 19, 102) */
		reached[0][19] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[3];
		now.rocks[3] = 1;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 15: // STATE 21 - frogs.pml:23 - [((((rocks[2]==1)&&(rocks[3]>0))&&(rocks[4]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		if (!((((now.rocks[2]==1)&&(now.rocks[3]>0))&&(now.rocks[4]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 22 - frogs.pml:24 - [rocks[2] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[2];
		now.rocks[2] = 0;
#ifdef VAR_RANGES
		logval("rocks[2]", now.rocks[2]);
#endif
		;
		/* merge: rocks[4] = 1(102, 23, 102) */
		reached[0][23] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[4];
		now.rocks[4] = 1;
#ifdef VAR_RANGES
		logval("rocks[4]", now.rocks[4]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 17: // STATE 25 - frogs.pml:26 - [(((rocks[3]==1)&&(rocks[4]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!(((now.rocks[3]==1)&&(now.rocks[4]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 26 - frogs.pml:27 - [rocks[3] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[3];
		now.rocks[3] = 0;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: rocks[4] = 1(102, 27, 102) */
		reached[0][27] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[4];
		now.rocks[4] = 1;
#ifdef VAR_RANGES
		logval("rocks[4]", now.rocks[4]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 19: // STATE 29 - frogs.pml:29 - [((((rocks[3]==1)&&(rocks[4]>0))&&(rocks[5]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][29] = 1;
		if (!((((now.rocks[3]==1)&&(now.rocks[4]>0))&&(now.rocks[5]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 30 - frogs.pml:30 - [rocks[3] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[3];
		now.rocks[3] = 0;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: rocks[5] = 1(102, 31, 102) */
		reached[0][31] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[5];
		now.rocks[5] = 1;
#ifdef VAR_RANGES
		logval("rocks[5]", now.rocks[5]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 21: // STATE 33 - frogs.pml:32 - [(((rocks[4]==1)&&(rocks[5]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][33] = 1;
		if (!(((now.rocks[4]==1)&&(now.rocks[5]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 34 - frogs.pml:33 - [rocks[4] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][34] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[4];
		now.rocks[4] = 0;
#ifdef VAR_RANGES
		logval("rocks[4]", now.rocks[4]);
#endif
		;
		/* merge: rocks[5] = 1(102, 35, 102) */
		reached[0][35] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[5];
		now.rocks[5] = 1;
#ifdef VAR_RANGES
		logval("rocks[5]", now.rocks[5]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 23: // STATE 37 - frogs.pml:35 - [((((rocks[4]==1)&&(rocks[5]>0))&&(rocks[6]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][37] = 1;
		if (!((((now.rocks[4]==1)&&(now.rocks[5]>0))&&(now.rocks[6]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 38 - frogs.pml:36 - [rocks[4] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][38] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[4];
		now.rocks[4] = 0;
#ifdef VAR_RANGES
		logval("rocks[4]", now.rocks[4]);
#endif
		;
		/* merge: rocks[6] = 1(102, 39, 102) */
		reached[0][39] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[6];
		now.rocks[6] = 1;
#ifdef VAR_RANGES
		logval("rocks[6]", now.rocks[6]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 25: // STATE 41 - frogs.pml:38 - [(((rocks[5]==1)&&(rocks[6]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][41] = 1;
		if (!(((now.rocks[5]==1)&&(now.rocks[6]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 42 - frogs.pml:39 - [rocks[5] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[5];
		now.rocks[5] = 0;
#ifdef VAR_RANGES
		logval("rocks[5]", now.rocks[5]);
#endif
		;
		/* merge: rocks[6] = 1(102, 43, 102) */
		reached[0][43] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[6];
		now.rocks[6] = 1;
#ifdef VAR_RANGES
		logval("rocks[6]", now.rocks[6]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 27: // STATE 45 - frogs.pml:41 - [((((rocks[1]==1)&&(rocks[2]>0))&&(rocks[3]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][45] = 1;
		if (!((((now.rocks[1]==1)&&(now.rocks[2]>0))&&(now.rocks[3]==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 46 - frogs.pml:42 - [rocks[1] = 0] (0:102:4 - 1)
		IfNotBlocked
		reached[0][46] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[1];
		now.rocks[1] = 0;
#ifdef VAR_RANGES
		logval("rocks[1]", now.rocks[1]);
#endif
		;
		/* merge: rocks[3] = 1(102, 47, 102) */
		reached[0][47] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[3];
		now.rocks[3] = 1;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 29: // STATE 49 - frogs.pml:44 - [(((rocks[0]==0)&&(rocks[1]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][49] = 1;
		if (!(((now.rocks[0]==0)&&(now.rocks[1]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 50 - frogs.pml:45 - [rocks[0] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][50] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[0];
		now.rocks[0] = 2;
#ifdef VAR_RANGES
		logval("rocks[0]", now.rocks[0]);
#endif
		;
		/* merge: rocks[1] = 0(102, 51, 102) */
		reached[0][51] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[1];
		now.rocks[1] = 0;
#ifdef VAR_RANGES
		logval("rocks[1]", now.rocks[1]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 31: // STATE 53 - frogs.pml:47 - [((((rocks[0]==0)&&(rocks[1]>0))&&(rocks[2]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][53] = 1;
		if (!((((now.rocks[0]==0)&&(now.rocks[1]>0))&&(now.rocks[2]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 54 - frogs.pml:48 - [rocks[0] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[0];
		now.rocks[0] = 2;
#ifdef VAR_RANGES
		logval("rocks[0]", now.rocks[0]);
#endif
		;
		/* merge: rocks[2] = 0(102, 55, 102) */
		reached[0][55] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[2];
		now.rocks[2] = 0;
#ifdef VAR_RANGES
		logval("rocks[2]", now.rocks[2]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 33: // STATE 57 - frogs.pml:50 - [(((rocks[1]==0)&&(rocks[2]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][57] = 1;
		if (!(((now.rocks[1]==0)&&(now.rocks[2]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 58 - frogs.pml:51 - [rocks[1] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][58] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[1];
		now.rocks[1] = 2;
#ifdef VAR_RANGES
		logval("rocks[1]", now.rocks[1]);
#endif
		;
		/* merge: rocks[2] = 0(102, 59, 102) */
		reached[0][59] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[2];
		now.rocks[2] = 0;
#ifdef VAR_RANGES
		logval("rocks[2]", now.rocks[2]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 35: // STATE 61 - frogs.pml:53 - [((((rocks[1]==0)&&(rocks[2]>0))&&(rocks[3]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][61] = 1;
		if (!((((now.rocks[1]==0)&&(now.rocks[2]>0))&&(now.rocks[3]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 62 - frogs.pml:54 - [rocks[1] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][62] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[1];
		now.rocks[1] = 2;
#ifdef VAR_RANGES
		logval("rocks[1]", now.rocks[1]);
#endif
		;
		/* merge: rocks[3] = 0(102, 63, 102) */
		reached[0][63] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[3];
		now.rocks[3] = 0;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 37: // STATE 65 - frogs.pml:56 - [(((rocks[2]==0)&&(rocks[3]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][65] = 1;
		if (!(((now.rocks[2]==0)&&(now.rocks[3]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 66 - frogs.pml:57 - [rocks[2] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][66] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[2];
		now.rocks[2] = 2;
#ifdef VAR_RANGES
		logval("rocks[2]", now.rocks[2]);
#endif
		;
		/* merge: rocks[3] = 0(102, 67, 102) */
		reached[0][67] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[3];
		now.rocks[3] = 0;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 39: // STATE 69 - frogs.pml:59 - [((((rocks[2]==0)&&(rocks[3]>0))&&(rocks[4]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][69] = 1;
		if (!((((now.rocks[2]==0)&&(now.rocks[3]>0))&&(now.rocks[4]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 70 - frogs.pml:60 - [rocks[2] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][70] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[2];
		now.rocks[2] = 2;
#ifdef VAR_RANGES
		logval("rocks[2]", now.rocks[2]);
#endif
		;
		/* merge: rocks[4] = 0(102, 71, 102) */
		reached[0][71] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[4];
		now.rocks[4] = 0;
#ifdef VAR_RANGES
		logval("rocks[4]", now.rocks[4]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 41: // STATE 73 - frogs.pml:62 - [(((rocks[3]==0)&&(rocks[4]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][73] = 1;
		if (!(((now.rocks[3]==0)&&(now.rocks[4]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 74 - frogs.pml:63 - [rocks[3] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][74] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[3];
		now.rocks[3] = 2;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: rocks[4] = 0(102, 75, 102) */
		reached[0][75] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[4];
		now.rocks[4] = 0;
#ifdef VAR_RANGES
		logval("rocks[4]", now.rocks[4]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 43: // STATE 77 - frogs.pml:65 - [((((rocks[3]==0)&&(rocks[4]>0))&&(rocks[5]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][77] = 1;
		if (!((((now.rocks[3]==0)&&(now.rocks[4]>0))&&(now.rocks[5]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 78 - frogs.pml:66 - [rocks[3] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][78] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[3];
		now.rocks[3] = 2;
#ifdef VAR_RANGES
		logval("rocks[3]", now.rocks[3]);
#endif
		;
		/* merge: rocks[5] = 0(102, 79, 102) */
		reached[0][79] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[5];
		now.rocks[5] = 0;
#ifdef VAR_RANGES
		logval("rocks[5]", now.rocks[5]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 45: // STATE 81 - frogs.pml:68 - [(((rocks[4]==0)&&(rocks[5]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][81] = 1;
		if (!(((now.rocks[4]==0)&&(now.rocks[5]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 82 - frogs.pml:69 - [rocks[4] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][82] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[4];
		now.rocks[4] = 2;
#ifdef VAR_RANGES
		logval("rocks[4]", now.rocks[4]);
#endif
		;
		/* merge: rocks[5] = 0(102, 83, 102) */
		reached[0][83] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[5];
		now.rocks[5] = 0;
#ifdef VAR_RANGES
		logval("rocks[5]", now.rocks[5]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 47: // STATE 85 - frogs.pml:71 - [((((rocks[4]==0)&&(rocks[5]>0))&&(rocks[6]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][85] = 1;
		if (!((((now.rocks[4]==0)&&(now.rocks[5]>0))&&(now.rocks[6]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 86 - frogs.pml:72 - [rocks[4] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][86] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[4];
		now.rocks[4] = 2;
#ifdef VAR_RANGES
		logval("rocks[4]", now.rocks[4]);
#endif
		;
		/* merge: rocks[6] = 0(102, 87, 102) */
		reached[0][87] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[6];
		now.rocks[6] = 0;
#ifdef VAR_RANGES
		logval("rocks[6]", now.rocks[6]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 49: // STATE 89 - frogs.pml:74 - [(((rocks[5]==0)&&(rocks[6]==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][89] = 1;
		if (!(((now.rocks[5]==0)&&(now.rocks[6]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 90 - frogs.pml:75 - [rocks[5] = 2] (0:102:4 - 1)
		IfNotBlocked
		reached[0][90] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.rocks[5];
		now.rocks[5] = 2;
#ifdef VAR_RANGES
		logval("rocks[5]", now.rocks[5]);
#endif
		;
		/* merge: rocks[6] = 0(102, 91, 102) */
		reached[0][91] = 1;
		(trpt+1)->bup.ovals[1] = now.rocks[6];
		now.rocks[6] = 0;
#ifdef VAR_RANGES
		logval("rocks[6]", now.rocks[6]);
#endif
		;
		/* merge: .(goto)(102, 94, 102) */
		reached[0][94] = 1;
		;
		/* merge: i = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 51: // STATE 95 - frogs.pml:80 - [i = 0] (0:102:2 - 24)
		IfNotBlocked
		reached[0][95] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: i = 0(102, 96, 102) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 52: // STATE 97 - frogs.pml:80 - [((i<=6))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][97] = 1;
		if (!((((P0 *)this)->i<=6)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 98 - frogs.pml:81 - [printf('%d',rocks[i])] (0:0:0 - 1)
		IfNotBlocked
		reached[0][98] = 1;
		Printf("%d", now.rocks[ Index(((P0 *)this)->i, 7) ]);
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 99 - frogs.pml:80 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][99] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("frogs:i", ((P0 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 55: // STATE 105 - frogs.pml:83 - [printf('\\n')] (0:106:0 - 3)
		IfNotBlocked
		reached[0][105] = 1;
		Printf("\n");
		/* merge: .(goto)(0, 107, 106) */
		reached[0][107] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 56: // STATE 109 - frogs.pml:86 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][109] = 1;
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

