/*---------------------------------------------------------------------------*
 *  tstsmtp.d - LIBERO dialog data definitions for tstsmtp.c.                *
 *  Generated by LIBERO 2.4 on 11 Oct, 2010, 17:15.                          *
 *  Schema file used: smtschm.c.                                             *
 *---------------------------------------------------------------------------*/

/*- Symbolic constants and event numbers ------------------------------------*/

#define _LR_STOP                        0xFFFFL
#define _LR_NULL_EVENT                  -2
#define _LR_NULL_STATE                  -1
#define terminate_event                 -1
#define error_event                     0
#define ok_event                        1
#define shutdown_event                  2
#define _LR_STATE_after_init            0
#define _LR_STATE_sending_message       1
#define _LR_STATE_end                   2
#define _LR_STATE_defaults              3
#define _LR_defaults_state              3


/*- Function prototypes and macros ------------------------------------------*/

#ifndef MODULE
#define MODULE  static void             /*  Libero dialog modules            */
#endif

MODULE initialise_the_thread        (THREAD *thread);
MODULE send_msg_to_smtp             (THREAD *thread);
MODULE display_ok                   (THREAD *thread);
MODULE display_error                (THREAD *thread);
MODULE kill_all                     (THREAD *thread);
MODULE terminate_the_thread         (THREAD *thread);

#define the_next_event              _the_next_event
#define the_exception_event         _the_exception_event
#define the_external_event          _the_external_event
#define exception_raised            _exception_raised
#define io_completed                _io_completed


/*- Static areas shared by all threads --------------------------------------*/

static word _LR_nextst [4][3] =
{
    { 0,1,0 },
    { 2,2,0 },
    { 0,2,0 },
    { 0,0,3 }
};

static word _LR_action [4][3] =
{
    { 0,1,0 },
    { 3,2,0 },
    { 0,4,0 },
    { 0,0,5 }
};

#if (defined (SMT_PROFILE))
static word _LR_count [5];
static long _LR_time  [5];
static word _LR_flow  [4][3];
#endif

static word _LR_offset [] =
{
    0,
    0,
    2,
    4,
    6,
    9
};

static word _LR_vector [] =
{
    0,_LR_STOP,
    1,_LR_STOP,
    2,_LR_STOP,
    3,4,_LR_STOP,
    4,_LR_STOP
};

static HOOK *_LR_module [5] = {
    send_msg_to_smtp,
    display_ok,
    display_error,
    kill_all,
    terminate_the_thread
};

#if (defined (DEBUG))
static char *_LR_mname [5] =
{
     "Send-Msg-To-Smtp",
     "Display-Ok",
     "Display-Error",
     "Kill-All",
     "Terminate-The-Thread"
};

static char *_LR_sname [4] =
{
     "After-Init",
     "Sending-Message",
     "End",
     "Defaults"
};

static char *_LR_ename [3] =
{
     "Error-Event",
     "Ok-Event",
     "Shutdown-Event"
};
#else
static char *_LR_mname [5] =
{
     "0",
     "1",
     "2",
     "3",
     "4"
};

static char *_LR_sname [4] =
{
     "0",
     "1",
     "2",
     "3"
};

static char *_LR_ename [3] =
{
     "0",
     "1",
     "2"
};
#endif