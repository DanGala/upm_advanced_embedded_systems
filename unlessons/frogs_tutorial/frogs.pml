ltl spec {
  [] (!((rocks[0] == 2) && (rocks[1] == 2) && (rocks[2] == 2) && (rocks[3] == 0) && (rocks[4] == 1) && (rocks[5] == 1) && (rocks[6] == 1)))
}

int rocks[7] = {1,1,1,0,2,2,2};

active proctype frogs () {
  do
  :: if
    :: ((rocks[0] == 1) && (rocks[1] == 0)) -> atomic {
      rocks[0] = 0; rocks[1] = 1;
    }
    :: ((rocks[0] == 1) && (rocks[1] > 0) && (rocks[2] == 0)) -> atomic {
      rocks[0] = 0; rocks[2] = 1;
    }
    :: ((rocks[1] == 1) && (rocks[2] == 0)) -> atomic {
      rocks[1] = 0; rocks[2] = 1;
    }
    :: ((rocks[1] == 1) && (rocks[2] > 0) && (rocks[3] == 0)) -> atomic {
      rocks[1] = 0; rocks[3] = 1;
    }
    :: ((rocks[2] == 1) && (rocks[3] == 0)) -> atomic {
      rocks[2] = 0; rocks[3] = 1;
    }
    :: ((rocks[2] == 1) && (rocks[3] > 0) && (rocks[4] == 0)) -> atomic {
      rocks[2] = 0; rocks[4] = 1;
    }
    :: ((rocks[3] == 1) && (rocks[4] == 0)) -> atomic {
      rocks[3] = 0; rocks[4] = 1;
    }
    :: ((rocks[3] == 1) && (rocks[4] > 0) && (rocks[5] == 0)) -> atomic {
      rocks[3] = 0; rocks[5] = 1;
    }
    :: ((rocks[4] == 1) && (rocks[5] == 0)) -> atomic {
      rocks[4] = 0; rocks[5] = 1;
    }
    :: ((rocks[4] == 1) && (rocks[5] > 0) && (rocks[6] == 0)) -> atomic {
      rocks[4] = 0; rocks[6] = 1;
    }
    :: ((rocks[5] == 1) && (rocks[6] == 0)) -> atomic {
      rocks[5] = 0; rocks[6] = 1;
    }
    :: ((rocks[1] == 1) && (rocks[2] > 0) && (rocks[3] == 0)) -> atomic {
      rocks[1] = 0; rocks[3] = 1;
    }
    :: ((rocks[0] == 0) && (rocks[1] == 2)) -> atomic {
      rocks[0] = 2; rocks[1] = 0;
    }
    :: ((rocks[0] == 0) && (rocks[1] > 0) && (rocks[2] == 2)) -> atomic {
      rocks[0] = 2; rocks[2] = 0;
    }
    :: ((rocks[1] == 0) && (rocks[2] == 2)) -> atomic {
      rocks[1] = 2; rocks[2] = 0;
    }
    :: ((rocks[1] == 0) && (rocks[2] > 0) && (rocks[3] == 2)) -> atomic {
      rocks[1] = 2; rocks[3] = 0;
    }
    :: ((rocks[2] == 0) && (rocks[3] == 2)) -> atomic {
      rocks[2] = 2; rocks[3] = 0;
    }
    :: ((rocks[2] == 0) && (rocks[3] > 0) && (rocks[4] == 2)) -> atomic {
      rocks[2] = 2; rocks[4] = 0;
    }
    :: ((rocks[3] == 0) && (rocks[4] == 2)) -> atomic {
      rocks[3] = 2; rocks[4] = 0;
    }
    :: ((rocks[3] == 0) && (rocks[4] > 0) && (rocks[5] == 2)) -> atomic {
      rocks[3] = 2; rocks[5] = 0;
    }
    :: ((rocks[4] == 0) && (rocks[5] == 2)) -> atomic {
      rocks[4] = 2; rocks[5] = 0;
    }
    :: ((rocks[4] == 0) && (rocks[5] > 0) && (rocks[6] == 2)) -> atomic {
      rocks[4] = 2; rocks[6] = 0;
    }
    :: ((rocks[5] == 0) && (rocks[6] == 2)) -> atomic {
      rocks[5] = 2; rocks[6] = 0;
    }
  fi;

  int i;
  for (i: 0 .. 6) {
    printf("%d", rocks[i])
  };
  printf("\n");

  od
}
