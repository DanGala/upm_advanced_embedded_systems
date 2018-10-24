#define timeout true

ltl spec {
  [] (((state == 0) && [](presence&&arm) -> <>(state == 2)))
}

bit presence;
bit arm;
byte state;

active proctype alarm_fsm () {
  state = 0;
  do
  :: (state == 0) -> atomic {
    if
    :: (!arm) -> state = 1
    else
    :: if
       :: presence -> state = 2
       fi
    fi
  }
  :: (state == 1) -> atomic {
    if
    :: arm -> state = 0
    fi
  }
  :: (state == 2) -> atomic {
    if
    :: (!arm) -> state = 1
    fi
  }
  od
}

active proctype entorno () {
  arm = 0
  presence = 0
  do
  :: if 
    :: arm = 0
    :: arm = 1
    :: presence = 0
    :: presence = 1
     fi;
     printf("state=%d - presence=%d - arm=%d\n", state, presence, arm);
  od
}
