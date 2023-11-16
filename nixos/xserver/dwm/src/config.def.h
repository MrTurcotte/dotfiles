static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int snap      = 32;	/* snap pixel */
static const int swallowfloating    = 1;        /* 1 means swallow floating windows by default */
static const unsigned int gappih    = 15;	/* horiz inner gap between windows */
static const unsigned int gappiv    = 15;	/* vert inner gap between windows */
static const unsigned int gappoh    = 15;	/* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 15;	/* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
/* */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
/* */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int splitstatus        = 1;        /* 1 for split status items */
static const char *splitdelim        = ";";       /* Character used for separating status */
static const int horizpadbar        = 0;        /* horizontal padding for statusbar */
static const int vertpadbar         = 5;        /* vertical padding for statusbar */
static const char *fonts[]          = { /*"-*-helvetica-bold-r-normal--20-140-*-*-*-*-iso8859-*",*/ "Liberation:size=14", "JoyPixels:pixelsize=14", "NotoColorEmoji:pixelsize=14:antialias=true:autohint=true" };
static const char dmenufont[]       = "Liberation:size=14";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char col_night1[]	    = "#2E3440";
static const char col_night2[]      = "#3B4252";
static const char col_night3[]      = "#434C5E";
static const char col_night4[]      = "#4C566A";
static const char col_snow1[]      = "#d8dee9";
static const char col_snow2[]      = "#e5e9f0";
static const char col_snow3[]      = "#eceff4";
static const char col_frost1[]      = "#8fbcbb";
static const char col_frost2[]      = "#88c0d0";
static const char col_frost3[]      = "#81a1c1";
static const char col_frost4[]      = "#5e81ac";
static const char col_aurorared[]      = "#bf616a";
static const char col_auroraorange[]      = "#d087700";
static const char col_aurorayellow[]      = "#ebcb8b";
static const char col_auroragreen[]      = "#a3be8c";
static const char col_auroraviolet[]      = "#b48ead";
static const char *colors[][3]      = {
        /*               fg         bg         border   
        [SchemeNorm] = { col_snow1, col_night1, col_night4 },
        [SchemeSel]  = { col_snow3, col_frost4,  col_frost3  },
*/
        [SchemeNorm] = { col_snow1, col_night1, col_night1 },
        [SchemeSel]  = { col_night2, col_snow2, col_snow3 },


};
/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
        { "Gimp",    NULL,     NULL,           0,         1,          0,           0,        -1 },
        { "Firefox", NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
        { "St",      NULL,     NULL,           0,         0,          1,           0,        -1 },
        { "Alacritty", NULL,   NULL,           0,         0,          1,           0,        -1 },
        { NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */

/*	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 }, */
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 0; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
/* #define MODKEY Mod4Mask */
#define SUPER Mod4Mask
#define ALT Mod1Mask
#define SHIFT ShiftMask
#define CTRL ControlMask
#define TAGKEYS(KEY,TAG) \
	{ SUPER,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ SUPER|CTRL,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ SUPER|SHIFT,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ SUPER|CTRL|SHIFT, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *rofi[] = { "rofi", "-show", "drun", "-show-icons", NULL};
static const char *termcmd[]  = { "alacritty", NULL };
static const char *browser[]  = { "firefox", NULL };
static const char *voldown[] = { "pactl", "set-sink-volume", "0", "-5%", NULL };
static const char *volup[] = { "pactl", "set-sink-volume", "0", "+5%", NULL };
static const char *volmute[] = { "pactl", "set-sink-mute", "0", "toggle", NULL };
static const char *wallpaper[] = { "nitrogen", "--set-zoom-fill", "--random", "/home/dave/Wallpapers", NULL };
static const char *brightnessdown[] = { "brightnessctl", "s", "+10%", NULL };
static const char *brightnessup[] = { "brightnessctl", "s", "10%-", NULL };
static const char *writer[] = { "libreoffice", NULL };
static const char *screenshot[] = { "flameshot", "gui", NULL };
static const char *screensave[] = { "flameshot", "screen", NULL };
static const char *screencopy[] = { "flameshot", "screen", "-c", NULL };
static const char *killdwm[] = { "pkill", "-u", "1000", NULL }; /*"sh", "/home/dave/.dwm/killdwm.sh", NULL }; */
static const char *beeper[] = { "appimage-run", "Applications/beeper.AppImage", NULL };
static const char *slock[] = { "slock", NULL };


static const Key keys[] = {
	/* modifier                     key        function        argument */
/* SPAWNS */
	{ SUPER,                       XK_p,      spawn,          {.v = rofi } },
	{ SUPER,                       XK_t,      spawn,          {.v = termcmd } },
	{ SUPER,                       XK_b,      spawn,          {.v = browser } },
	{ SUPER|SHIFT,		       XK_w,	  spawn, 	  {.v = writer } },
	{ SUPER,		       XK_m,	  spawn, 	  {.v = beeper } },
	{ CTRL|ALT,		       XK_q,      spawn,	  {.v = killdwm } },
	{ CTRL|ALT,		       XK_l, 	  spawn,	  {.v = slock } },
/* SCREENSHOTS */
	{ NULL,			       XK_Print,  spawn,	  {.v = screenshot } },
        { ALT,                            XK_Print,  spawn,          {.v = screensave } },
        { CTRL,                            XK_Print,  spawn,          {.v = screencopy } },

/* Wallpaper Switch and Brightness */
	{ SUPER,                       XK_w,	  spawn,          {.v = wallpaper } },
       	{ SUPER,                       XK_F6,     spawn,          {.v = brightnessdown } },
       	{ SUPER,                       XK_F5,     spawn,          {.v = brightnessup } },
/* VOLUME */
	{ SUPER, 		       XK_F2,	  spawn, 	  {.v = voldown } },
	{ SUPER,                       XK_F3,     spawn,          {.v = volup } },
	{ SUPER, 		       XK_F1,	  spawn, 	  {.v = volmute } },
/* Window Focus/Size */
	{ SUPER,                       XK_j,      focusstack,     {.i = +1 } },
	{ SUPER,                       XK_h,      focusstack,     {.i = -1 } },
	/*{ SUPER,                       XK_i,      incnmaster,     {.i = +1 } },
	{ SUPER,                       XK_d,      incnmaster,     {.i = -1 } }, */
	{ SUPER,                       XK_k,      setmfact,       {.f = -0.05} },
	{ SUPER,                       XK_l,      setmfact,       {.f = +0.05} },
/* GAPS */
	{ SUPER|ALT,                   XK_h,      incrgaps,       {.i = +1 } },
	{ SUPER|ALT,                   XK_l,      incrgaps,       {.i = -1 } },
	{ SUPER|ALT|SHIFT,  	       XK_h,      incrogaps,      {.i = +1 } },
	{ SUPER|ALT|SHIFT,             XK_l,      incrogaps,      {.i = -1 } },
	{ SUPER|ALT|CTRL,              XK_h,      incrigaps,      {.i = +1 } },
	{ SUPER|ALT|CTRL,              XK_l,      incrigaps,      {.i = -1 } },
	{ SUPER|ALT,                   XK_0,      togglegaps,     {0} },
	{ SUPER|ALT|SHIFT,             XK_0,      defaultgaps,    {0} },
	{ SUPER,                       XK_y,      incrihgaps,     {.i = +1 } },
	{ SUPER,                       XK_o,      incrihgaps,     {.i = -1 } },
	{ SUPER|CTRL,                  XK_y,      incrivgaps,     {.i = +1 } },
	{ SUPER|CTRL,                  XK_o,      incrivgaps,     {.i = -1 } },
	{ SUPER|ALT,                   XK_y,      incrohgaps,     {.i = +1 } },
	{ SUPER|ALT,                   XK_o,      incrohgaps,     {.i = -1 } },
	{ SUPER|SHIFT,                 XK_y,      incrovgaps,     {.i = +1 } },
	{ SUPER|SHIFT,                 XK_o,      incrovgaps,     {.i = -1 } },
/* Window Actions */
	{ SUPER,                       XK_Return, zoom,           {0} },
/*	{ SUPER,                       XK_Tab,    view,           {0} },  */ /* view last tab */
	{ SUPER,                       XK_q,      killclient,     {0} },
	{ SUPER|SHIFT,                 XK_Return, setlayout,      {.v = &layouts[0]} },
	{ SUPER,                       XK_i,      setlayout,      {.v = &layouts[1]} },
	{ SUPER,                       XK_u,      setlayout,      {.v = &layouts[2]} },
	{ SUPER,                       XK_space,  setlayout,      {0} },
	{ SUPER|SHIFT,                 XK_space,  togglefloating, {0} },
	{ SUPER,                       XK_0,      view,           {.ui = ~0 } },
	{ SUPER|SHIFT,                 XK_0,      tag,            {.ui = ~0 } },
/*	{ SUPER,                       XK_comma,  focusmon,       {.i = -1 } },
	{ SUPER,                       XK_period, focusmon,       {.i = +1 } },
	{ SUPER|SHIFT,                 XK_comma,  tagmon,         {.i = -1 } },
	{ SUPER|SHIFT,                 XK_period, tagmon,         {.i = +1 } },
*/	{ CTRL|ALT,		       XK_Right,  view_adjacent,  {.i = +1 } },
	{ CTRL|ALT,		       XK_Left,   view_adjacent,  {.i = -1 } },
	TAGKEYS(                       XK_1,                      0)
	TAGKEYS(                       XK_2,                      1)
	TAGKEYS(                       XK_3,                      2)
	TAGKEYS(                       XK_4,                      3)
	TAGKEYS(                       XK_5,                      4)
	TAGKEYS(                       XK_6,                      5)
	TAGKEYS(                       XK_7,                      6)
	TAGKEYS(                       XK_8,                      7)
	TAGKEYS(                       XK_9,                      8)
/*	{ CTRL|ALT,                    XK_BackSpace, quit,        {0} },*/
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         SUPER,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         SUPER,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         SUPER,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            SUPER,         Button1,        tag,            {0} },
	{ ClkTagBar,            SUPER,         Button3,        toggletag,      {0} },
};

