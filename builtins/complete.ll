; ModuleID = 'complete.c'
source_filename = "complete.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._compopt = type { i8*, i32 }
%struct.compspec = type { i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8* }
%struct._compacts = type { i8*, i32, i32 }
%struct._optflags = type { i32, i32, i32, i32 }
%struct._list_of_strings = type { i8**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }

@Carg = internal global i8* null, align 4
@Farg = internal global i8* null, align 4
@Xarg = internal global i8* null, align 4
@Sarg = internal global i8* null, align 4
@Parg = internal global i8* null, align 4
@Warg = internal global i8* null, align 4
@Garg = internal global i8* null, align 4
@loptend = external global %struct.word_list*, align 4
@.str = private unnamed_addr constant [13 x i8] c"_DefaultCmD_\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"_EmptycmD_\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"./complete.def\00", align 1
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"warning: -F option may not work as you expect\00", align 1
@.str.5 = private unnamed_addr constant [46 x i8] c"warning: -C option may not work as you expect\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"compgen\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"+o:DE\00", align 1
@list_opttype = external global i32, align 4
@list_optarg = external global i8*, align 4
@compopts = internal constant [9 x %struct._compopt] [%struct._compopt { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.42, i32 0, i32 0), i32 64 }, %struct._compopt { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.43, i32 0, i32 0), i32 2 }, %struct._compopt { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0), i32 8 }, %struct._compopt { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.45, i32 0, i32 0), i32 4 }, %struct._compopt { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.73, i32 0, i32 0), i32 16 }, %struct._compopt { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.74, i32 0, i32 0), i32 256 }, %struct._compopt { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.46, i32 0, i32 0), i32 32 }, %struct._compopt { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.47, i32 0, i32 0), i32 128 }, %struct._compopt zeroinitializer], align 4
@rl_readline_state = external global i32, align 4
@pcomp_curcs = external global %struct.compspec*, align 4
@.str.8 = private unnamed_addr constant [44 x i8] c"not currently executing completion function\00", align 1
@pcomp_curcmd = external global i8*, align 4
@.str.9 = private unnamed_addr constant [32 x i8] c"%s: no completion specification\00", align 1
@.str.10 = private unnamed_addr constant [35 x i8] c"abcdefgjko:prsuvA:G:W:P:S:X:F:C:DE\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"-p\00", align 1
@.str.13 = private unnamed_addr constant [24 x i8] c"%s: invalid action name\00", align 1
@compacts = internal constant [25 x %struct._compacts] [%struct._compacts { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i32 1, i32 97 }, %struct._compacts { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.17, i32 0, i32 0), i32 2, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18, i32 0, i32 0), i32 4, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19, i32 0, i32 0), i32 8, i32 98 }, %struct._compacts { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0), i32 16, i32 99 }, %struct._compacts { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.21, i32 0, i32 0), i32 32, i32 100 }, %struct._compacts { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.22, i32 0, i32 0), i32 64, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0), i32 128, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0), i32 256, i32 101 }, %struct._compacts { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0), i32 512, i32 102 }, %struct._compacts { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i32 0, i32 0), i32 1024, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.27, i32 0, i32 0), i32 4096, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i32 8192, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i32 0, i32 0), i32 2048, i32 103 }, %struct._compacts { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0), i32 16384, i32 106 }, %struct._compacts { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.31, i32 0, i32 0), i32 32768, i32 107 }, %struct._compacts { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.32, i32 0, i32 0), i32 65536, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.33, i32 0, i32 0), i32 131072, i32 115 }, %struct._compacts { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.34, i32 0, i32 0), i32 262144, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.35, i32 0, i32 0), i32 524288, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0), i32 1048576, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.37, i32 0, i32 0), i32 2097152, i32 0 }, %struct._compacts { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.38, i32 0, i32 0), i32 4194304, i32 117 }, %struct._compacts { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.39, i32 0, i32 0), i32 8388608, i32 118 }, %struct._compacts zeroinitializer], align 4
@.str.14 = private unnamed_addr constant [3 x i8] c"-D\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"-E\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"alias\00", align 1
@.str.17 = private unnamed_addr constant [9 x i8] c"arrayvar\00", align 1
@.str.18 = private unnamed_addr constant [8 x i8] c"binding\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"builtin\00", align 1
@.str.20 = private unnamed_addr constant [8 x i8] c"command\00", align 1
@.str.21 = private unnamed_addr constant [10 x i8] c"directory\00", align 1
@.str.22 = private unnamed_addr constant [9 x i8] c"disabled\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"enabled\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"export\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"file\00", align 1
@.str.26 = private unnamed_addr constant [9 x i8] c"function\00", align 1
@.str.27 = private unnamed_addr constant [10 x i8] c"helptopic\00", align 1
@.str.28 = private unnamed_addr constant [9 x i8] c"hostname\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"group\00", align 1
@.str.30 = private unnamed_addr constant [4 x i8] c"job\00", align 1
@.str.31 = private unnamed_addr constant [8 x i8] c"keyword\00", align 1
@.str.32 = private unnamed_addr constant [8 x i8] c"running\00", align 1
@.str.33 = private unnamed_addr constant [8 x i8] c"service\00", align 1
@.str.34 = private unnamed_addr constant [7 x i8] c"setopt\00", align 1
@.str.35 = private unnamed_addr constant [6 x i8] c"shopt\00", align 1
@.str.36 = private unnamed_addr constant [7 x i8] c"signal\00", align 1
@.str.37 = private unnamed_addr constant [8 x i8] c"stopped\00", align 1
@.str.38 = private unnamed_addr constant [5 x i8] c"user\00", align 1
@.str.39 = private unnamed_addr constant [9 x i8] c"variable\00", align 1
@.str.40 = private unnamed_addr constant [10 x i8] c"complete \00", align 1
@.str.41 = private unnamed_addr constant [7 x i8] c"-o %s \00", align 1
@.str.42 = private unnamed_addr constant [12 x i8] c"bashdefault\00", align 1
@.str.43 = private unnamed_addr constant [8 x i8] c"default\00", align 1
@.str.44 = private unnamed_addr constant [9 x i8] c"dirnames\00", align 1
@.str.45 = private unnamed_addr constant [10 x i8] c"filenames\00", align 1
@.str.46 = private unnamed_addr constant [8 x i8] c"nospace\00", align 1
@.str.47 = private unnamed_addr constant [9 x i8] c"plusdirs\00", align 1
@.str.48 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.49 = private unnamed_addr constant [3 x i8] c"-a\00", align 1
@.str.50 = private unnamed_addr constant [3 x i8] c"-b\00", align 1
@.str.51 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.52 = private unnamed_addr constant [3 x i8] c"-d\00", align 1
@.str.53 = private unnamed_addr constant [3 x i8] c"-e\00", align 1
@.str.54 = private unnamed_addr constant [3 x i8] c"-f\00", align 1
@.str.55 = private unnamed_addr constant [3 x i8] c"-g\00", align 1
@.str.56 = private unnamed_addr constant [3 x i8] c"-j\00", align 1
@.str.57 = private unnamed_addr constant [3 x i8] c"-k\00", align 1
@.str.58 = private unnamed_addr constant [3 x i8] c"-s\00", align 1
@.str.59 = private unnamed_addr constant [3 x i8] c"-u\00", align 1
@.str.60 = private unnamed_addr constant [3 x i8] c"-v\00", align 1
@.str.61 = private unnamed_addr constant [7 x i8] c"-A %s \00", align 1
@.str.62 = private unnamed_addr constant [7 x i8] c"%s %s \00", align 1
@.str.63 = private unnamed_addr constant [3 x i8] c"-G\00", align 1
@.str.64 = private unnamed_addr constant [3 x i8] c"-W\00", align 1
@.str.65 = private unnamed_addr constant [3 x i8] c"-P\00", align 1
@.str.66 = private unnamed_addr constant [3 x i8] c"-S\00", align 1
@.str.67 = private unnamed_addr constant [3 x i8] c"-X\00", align 1
@.str.68 = private unnamed_addr constant [3 x i8] c"-C\00", align 1
@.str.69 = private unnamed_addr constant [3 x i8] c"-F\00", align 1
@.str.70 = private unnamed_addr constant [4 x i8] c"-E\0A\00", align 1
@.str.71 = private unnamed_addr constant [4 x i8] c"-D\0A\00", align 1
@.str.72 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.73 = private unnamed_addr constant [8 x i8] c"noquote\00", align 1
@.str.74 = private unnamed_addr constant [7 x i8] c"nosort\00", align 1
@.str.75 = private unnamed_addr constant [9 x i8] c"compopt \00", align 1
@.str.76 = private unnamed_addr constant [7 x i8] c"+o %s \00", align 1

; Function Attrs: noinline nounwind
define i32 @complete_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %opt_given = alloca i32, align 4
  %rval = alloca i32, align 4
  %acts = alloca i32, align 4
  %copts = alloca i32, align 4
  %cs = alloca %struct.compspec*, align 4
  %oflags = alloca %struct._optflags, align 4
  %l = alloca %struct.word_list*, align 4
  %wl = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @print_all_completions()
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %Eflag = getelementptr inbounds %struct._optflags, %struct._optflags* %oflags, i32 0, i32 3
  store i32 0, i32* %Eflag, align 4
  %Dflag = getelementptr inbounds %struct._optflags, %struct._optflags* %oflags, i32 0, i32 2
  store i32 0, i32* %Dflag, align 4
  %rflag = getelementptr inbounds %struct._optflags, %struct._optflags* %oflags, i32 0, i32 1
  store i32 0, i32* %rflag, align 4
  %pflag = getelementptr inbounds %struct._optflags, %struct._optflags* %oflags, i32 0, i32 0
  store i32 0, i32* %pflag, align 4
  store i32 0, i32* %opt_given, align 4
  store i32 0, i32* %copts, align 4
  store i32 0, i32* %acts, align 4
  store i8* null, i8** @Carg, align 4
  store i8* null, i8** @Farg, align 4
  store i8* null, i8** @Xarg, align 4
  store i8* null, i8** @Sarg, align 4
  store i8* null, i8** @Parg, align 4
  store i8* null, i8** @Warg, align 4
  store i8* null, i8** @Garg, align 4
  store %struct.compspec* null, %struct.compspec** %cs, align 4
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @build_actions(%struct.word_list* %1, %struct._optflags* %oflags, i32* %acts, i32* %copts)
  store i32 %call, i32* %rval, align 4
  %2 = load i32, i32* %rval, align 4
  %cmp1 = icmp eq i32 %2, 258
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %rval, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load i32, i32* %rval, align 4
  %cmp4 = icmp ne i32 %4, 1
  %conv = zext i1 %cmp4 to i32
  store i32 %conv, i32* %opt_given, align 4
  %5 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %5, %struct.word_list** %list.addr, align 4
  %Dflag5 = getelementptr inbounds %struct._optflags, %struct._optflags* %oflags, i32 0, i32 2
  %6 = load i32, i32* %Dflag5, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end3
  %call6 = call %struct.word_desc* @make_bare_word(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %call7 = call %struct.word_list* @make_word_list(%struct.word_desc* %call6, %struct.word_list* null)
  br label %cond.end14

cond.false:                                       ; preds = %if.end3
  %Eflag8 = getelementptr inbounds %struct._optflags, %struct._optflags* %oflags, i32 0, i32 3
  %7 = load i32, i32* %Eflag8, align 4
  %tobool9 = icmp ne i32 %7, 0
  br i1 %tobool9, label %cond.true10, label %cond.false13

cond.true10:                                      ; preds = %cond.false
  %call11 = call %struct.word_desc* @make_bare_word(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  %call12 = call %struct.word_list* @make_word_list(%struct.word_desc* %call11, %struct.word_list* null)
  br label %cond.end

cond.false13:                                     ; preds = %cond.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false13, %cond.true10
  %cond = phi %struct.word_list* [ %call12, %cond.true10 ], [ null, %cond.false13 ]
  br label %cond.end14

cond.end14:                                       ; preds = %cond.end, %cond.true
  %cond15 = phi %struct.word_list* [ %call7, %cond.true ], [ %cond, %cond.end ]
  store %struct.word_list* %cond15, %struct.word_list** %wl, align 4
  %pflag16 = getelementptr inbounds %struct._optflags, %struct._optflags* %oflags, i32 0, i32 0
  %8 = load i32, i32* %pflag16, align 4
  %tobool17 = icmp ne i32 %8, 0
  br i1 %tobool17, label %if.then22, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end14
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp18 = icmp eq %struct.word_list* %9, null
  br i1 %cmp18, label %land.lhs.true, label %if.end32

land.lhs.true:                                    ; preds = %lor.lhs.false
  %10 = load i32, i32* %opt_given, align 4
  %cmp20 = icmp eq i32 %10, 0
  br i1 %cmp20, label %if.then22, label %if.end32

if.then22:                                        ; preds = %land.lhs.true, %cond.end14
  %11 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %tobool23 = icmp ne %struct.word_list* %11, null
  br i1 %tobool23, label %if.then24, label %if.else

if.then24:                                        ; preds = %if.then22
  %12 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %call25 = call i32 @print_cmd_completions(%struct.word_list* %12)
  store i32 %call25, i32* %rval, align 4
  %13 = load %struct.word_list*, %struct.word_list** %wl, align 4
  call void @dispose_words(%struct.word_list* %13)
  %14 = load i32, i32* %rval, align 4
  store i32 %14, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then22
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp26 = icmp eq %struct.word_list* %15, null
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.else
  call void @print_all_completions()
  store i32 0, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %if.else
  br label %if.end30

if.end30:                                         ; preds = %if.end29
  %16 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call31 = call i32 @print_cmd_completions(%struct.word_list* %16)
  store i32 %call31, i32* %retval, align 4
  br label %return

if.end32:                                         ; preds = %land.lhs.true, %lor.lhs.false
  %rflag33 = getelementptr inbounds %struct._optflags, %struct._optflags* %oflags, i32 0, i32 1
  %17 = load i32, i32* %rflag33, align 4
  %tobool34 = icmp ne i32 %17, 0
  br i1 %tobool34, label %if.then35, label %if.end46

if.then35:                                        ; preds = %if.end32
  %18 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %tobool36 = icmp ne %struct.word_list* %18, null
  br i1 %tobool36, label %if.then37, label %if.else39

if.then37:                                        ; preds = %if.then35
  %19 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %call38 = call i32 @remove_cmd_completions(%struct.word_list* %19)
  store i32 %call38, i32* %rval, align 4
  %20 = load %struct.word_list*, %struct.word_list** %wl, align 4
  call void @dispose_words(%struct.word_list* %20)
  %21 = load i32, i32* %rval, align 4
  store i32 %21, i32* %retval, align 4
  br label %return

if.else39:                                        ; preds = %if.then35
  %22 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp40 = icmp eq %struct.word_list* %22, null
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.else39
  call void @progcomp_flush()
  store i32 0, i32* %retval, align 4
  br label %return

if.end43:                                         ; preds = %if.else39
  br label %if.end44

if.end44:                                         ; preds = %if.end43
  %23 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call45 = call i32 @remove_cmd_completions(%struct.word_list* %23)
  store i32 %call45, i32* %retval, align 4
  br label %return

if.end46:                                         ; preds = %if.end32
  %24 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %cmp47 = icmp eq %struct.word_list* %24, null
  br i1 %cmp47, label %land.lhs.true49, label %if.end55

land.lhs.true49:                                  ; preds = %if.end46
  %25 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp50 = icmp eq %struct.word_list* %25, null
  br i1 %cmp50, label %land.lhs.true52, label %if.end55

land.lhs.true52:                                  ; preds = %land.lhs.true49
  %26 = load i32, i32* %opt_given, align 4
  %tobool53 = icmp ne i32 %26, 0
  br i1 %tobool53, label %if.then54, label %if.end55

if.then54:                                        ; preds = %land.lhs.true52
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end55:                                         ; preds = %land.lhs.true52, %land.lhs.true49, %if.end46
  %call56 = call %struct.compspec* @compspec_create()
  store %struct.compspec* %call56, %struct.compspec** %cs, align 4
  %27 = load i32, i32* %acts, align 4
  %28 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %actions = getelementptr inbounds %struct.compspec, %struct.compspec* %28, i32 0, i32 1
  store i32 %27, i32* %actions, align 4
  %29 = load i32, i32* %copts, align 4
  %30 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %30, i32 0, i32 2
  store i32 %29, i32* %options, align 4
  %31 = load i8*, i8** @Garg, align 4
  %tobool57 = icmp ne i8* %31, null
  br i1 %tobool57, label %cond.true58, label %cond.false62

cond.true58:                                      ; preds = %if.end55
  %32 = load i8*, i8** @Garg, align 4
  %call59 = call i32 @strlen(i8* %32)
  %add = add i32 1, %call59
  %call60 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 422)
  %33 = load i8*, i8** @Garg, align 4
  %call61 = call i8* @strcpy(i8* %call60, i8* %33)
  br label %cond.end63

cond.false62:                                     ; preds = %if.end55
  br label %cond.end63

cond.end63:                                       ; preds = %cond.false62, %cond.true58
  %cond64 = phi i8* [ %call61, %cond.true58 ], [ null, %cond.false62 ]
  %34 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %globpat = getelementptr inbounds %struct.compspec, %struct.compspec* %34, i32 0, i32 3
  store i8* %cond64, i8** %globpat, align 4
  %35 = load i8*, i8** @Warg, align 4
  %tobool65 = icmp ne i8* %35, null
  br i1 %tobool65, label %cond.true66, label %cond.false71

cond.true66:                                      ; preds = %cond.end63
  %36 = load i8*, i8** @Warg, align 4
  %call67 = call i32 @strlen(i8* %36)
  %add68 = add i32 1, %call67
  %call69 = call i8* @sh_xmalloc(i32 %add68, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 423)
  %37 = load i8*, i8** @Warg, align 4
  %call70 = call i8* @strcpy(i8* %call69, i8* %37)
  br label %cond.end72

cond.false71:                                     ; preds = %cond.end63
  br label %cond.end72

cond.end72:                                       ; preds = %cond.false71, %cond.true66
  %cond73 = phi i8* [ %call70, %cond.true66 ], [ null, %cond.false71 ]
  %38 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %words = getelementptr inbounds %struct.compspec, %struct.compspec* %38, i32 0, i32 4
  store i8* %cond73, i8** %words, align 4
  %39 = load i8*, i8** @Parg, align 4
  %tobool74 = icmp ne i8* %39, null
  br i1 %tobool74, label %cond.true75, label %cond.false80

cond.true75:                                      ; preds = %cond.end72
  %40 = load i8*, i8** @Parg, align 4
  %call76 = call i32 @strlen(i8* %40)
  %add77 = add i32 1, %call76
  %call78 = call i8* @sh_xmalloc(i32 %add77, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 424)
  %41 = load i8*, i8** @Parg, align 4
  %call79 = call i8* @strcpy(i8* %call78, i8* %41)
  br label %cond.end81

cond.false80:                                     ; preds = %cond.end72
  br label %cond.end81

cond.end81:                                       ; preds = %cond.false80, %cond.true75
  %cond82 = phi i8* [ %call79, %cond.true75 ], [ null, %cond.false80 ]
  %42 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %prefix = getelementptr inbounds %struct.compspec, %struct.compspec* %42, i32 0, i32 5
  store i8* %cond82, i8** %prefix, align 4
  %43 = load i8*, i8** @Sarg, align 4
  %tobool83 = icmp ne i8* %43, null
  br i1 %tobool83, label %cond.true84, label %cond.false89

cond.true84:                                      ; preds = %cond.end81
  %44 = load i8*, i8** @Sarg, align 4
  %call85 = call i32 @strlen(i8* %44)
  %add86 = add i32 1, %call85
  %call87 = call i8* @sh_xmalloc(i32 %add86, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 425)
  %45 = load i8*, i8** @Sarg, align 4
  %call88 = call i8* @strcpy(i8* %call87, i8* %45)
  br label %cond.end90

cond.false89:                                     ; preds = %cond.end81
  br label %cond.end90

cond.end90:                                       ; preds = %cond.false89, %cond.true84
  %cond91 = phi i8* [ %call88, %cond.true84 ], [ null, %cond.false89 ]
  %46 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %suffix = getelementptr inbounds %struct.compspec, %struct.compspec* %46, i32 0, i32 6
  store i8* %cond91, i8** %suffix, align 4
  %47 = load i8*, i8** @Farg, align 4
  %tobool92 = icmp ne i8* %47, null
  br i1 %tobool92, label %cond.true93, label %cond.false98

cond.true93:                                      ; preds = %cond.end90
  %48 = load i8*, i8** @Farg, align 4
  %call94 = call i32 @strlen(i8* %48)
  %add95 = add i32 1, %call94
  %call96 = call i8* @sh_xmalloc(i32 %add95, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 426)
  %49 = load i8*, i8** @Farg, align 4
  %call97 = call i8* @strcpy(i8* %call96, i8* %49)
  br label %cond.end99

cond.false98:                                     ; preds = %cond.end90
  br label %cond.end99

cond.end99:                                       ; preds = %cond.false98, %cond.true93
  %cond100 = phi i8* [ %call97, %cond.true93 ], [ null, %cond.false98 ]
  %50 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %funcname = getelementptr inbounds %struct.compspec, %struct.compspec* %50, i32 0, i32 7
  store i8* %cond100, i8** %funcname, align 4
  %51 = load i8*, i8** @Carg, align 4
  %tobool101 = icmp ne i8* %51, null
  br i1 %tobool101, label %cond.true102, label %cond.false107

cond.true102:                                     ; preds = %cond.end99
  %52 = load i8*, i8** @Carg, align 4
  %call103 = call i32 @strlen(i8* %52)
  %add104 = add i32 1, %call103
  %call105 = call i8* @sh_xmalloc(i32 %add104, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 427)
  %53 = load i8*, i8** @Carg, align 4
  %call106 = call i8* @strcpy(i8* %call105, i8* %53)
  br label %cond.end108

cond.false107:                                    ; preds = %cond.end99
  br label %cond.end108

cond.end108:                                      ; preds = %cond.false107, %cond.true102
  %cond109 = phi i8* [ %call106, %cond.true102 ], [ null, %cond.false107 ]
  %54 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %command = getelementptr inbounds %struct.compspec, %struct.compspec* %54, i32 0, i32 8
  store i8* %cond109, i8** %command, align 4
  %55 = load i8*, i8** @Xarg, align 4
  %tobool110 = icmp ne i8* %55, null
  br i1 %tobool110, label %cond.true111, label %cond.false116

cond.true111:                                     ; preds = %cond.end108
  %56 = load i8*, i8** @Xarg, align 4
  %call112 = call i32 @strlen(i8* %56)
  %add113 = add i32 1, %call112
  %call114 = call i8* @sh_xmalloc(i32 %add113, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 428)
  %57 = load i8*, i8** @Xarg, align 4
  %call115 = call i8* @strcpy(i8* %call114, i8* %57)
  br label %cond.end117

cond.false116:                                    ; preds = %cond.end108
  br label %cond.end117

cond.end117:                                      ; preds = %cond.false116, %cond.true111
  %cond118 = phi i8* [ %call115, %cond.true111 ], [ null, %cond.false116 ]
  %58 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %filterpat = getelementptr inbounds %struct.compspec, %struct.compspec* %58, i32 0, i32 10
  store i8* %cond118, i8** %filterpat, align 4
  store i32 0, i32* %rval, align 4
  %59 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %tobool119 = icmp ne %struct.word_list* %59, null
  br i1 %tobool119, label %cond.true120, label %cond.false121

cond.true120:                                     ; preds = %cond.end117
  %60 = load %struct.word_list*, %struct.word_list** %wl, align 4
  br label %cond.end122

cond.false121:                                    ; preds = %cond.end117
  %61 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  br label %cond.end122

cond.end122:                                      ; preds = %cond.false121, %cond.true120
  %cond123 = phi %struct.word_list* [ %60, %cond.true120 ], [ %61, %cond.false121 ]
  store %struct.word_list* %cond123, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end122
  %62 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool124 = icmp ne %struct.word_list* %62, null
  br i1 %tobool124, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %63 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %63, i32 0, i32 1
  %64 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word125 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %64, i32 0, i32 0
  %65 = load i8*, i8** %word125, align 4
  %66 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %call126 = call i32 @progcomp_insert(i8* %65, %struct.compspec* %66)
  %cmp127 = icmp eq i32 %call126, 0
  br i1 %cmp127, label %if.then129, label %if.end130

if.then129:                                       ; preds = %for.body
  store i32 1, i32* %rval, align 4
  br label %if.end130

if.end130:                                        ; preds = %if.then129, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end130
  %67 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %67, i32 0, i32 0
  %68 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %68, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %69 = load %struct.word_list*, %struct.word_list** %wl, align 4
  call void @dispose_words(%struct.word_list* %69)
  %70 = load i32, i32* %rval, align 4
  store i32 %70, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then54, %if.end44, %if.then42, %if.then37, %if.end30, %if.then28, %if.then24, %if.then2, %if.then
  %71 = load i32, i32* %retval, align 4
  ret i32 %71
}

; Function Attrs: noinline nounwind
define internal void @print_all_completions() #0 {
entry:
  call void @progcomp_walk(i32 (%struct.bucket_contents*)* @print_compitem)
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @build_actions(%struct.word_list* %list, %struct._optflags* %flagp, i32* %actp, i32* %optp) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %flagp.addr = alloca %struct._optflags*, align 4
  %actp.addr = alloca i32*, align 4
  %optp.addr = alloca i32*, align 4
  %opt = alloca i32, align 4
  %ind = alloca i32, align 4
  %opt_given = alloca i32, align 4
  %acts = alloca i32, align 4
  %copts = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store %struct._optflags* %flagp, %struct._optflags** %flagp.addr, align 4
  store i32* %actp, i32** %actp.addr, align 4
  store i32* %optp, i32** %optp.addr, align 4
  store i32 0, i32* %copts, align 4
  store i32 0, i32* %acts, align 4
  store i32 0, i32* %opt_given, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.10, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 1, i32* %opt_given, align 4
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 114, label %sw.bb
    i32 112, label %sw.bb1
    i32 97, label %sw.bb5
    i32 98, label %sw.bb6
    i32 99, label %sw.bb8
    i32 100, label %sw.bb10
    i32 101, label %sw.bb12
    i32 102, label %sw.bb14
    i32 103, label %sw.bb16
    i32 106, label %sw.bb18
    i32 107, label %sw.bb20
    i32 115, label %sw.bb22
    i32 117, label %sw.bb24
    i32 118, label %sw.bb26
    i32 111, label %sw.bb28
    i32 65, label %sw.bb33
    i32 67, label %sw.bb41
    i32 68, label %sw.bb42
    i32 69, label %sw.bb46
    i32 70, label %sw.bb50
    i32 71, label %sw.bb51
    i32 80, label %sw.bb52
    i32 83, label %sw.bb53
    i32 87, label %sw.bb54
    i32 88, label %sw.bb55
    i32 -99, label %sw.bb56
  ]

sw.bb:                                            ; preds = %while.body
  %2 = load %struct._optflags*, %struct._optflags** %flagp.addr, align 4
  %tobool = icmp ne %struct._optflags* %2, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb
  %3 = load %struct._optflags*, %struct._optflags** %flagp.addr, align 4
  %rflag = getelementptr inbounds %struct._optflags, %struct._optflags* %3, i32 0, i32 1
  store i32 1, i32* %rflag, align 4
  br label %sw.epilog

if.else:                                          ; preds = %sw.bb
  call void @sh_invalidopt(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0))
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %while.body
  %4 = load %struct._optflags*, %struct._optflags** %flagp.addr, align 4
  %tobool2 = icmp ne %struct._optflags* %4, null
  br i1 %tobool2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %sw.bb1
  %5 = load %struct._optflags*, %struct._optflags** %flagp.addr, align 4
  %pflag = getelementptr inbounds %struct._optflags, %struct._optflags* %5, i32 0, i32 0
  store i32 1, i32* %pflag, align 4
  br label %sw.epilog

if.else4:                                         ; preds = %sw.bb1
  call void @sh_invalidopt(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0))
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.bb5:                                           ; preds = %while.body
  %6 = load i32, i32* %acts, align 4
  %or = or i32 %6, 1
  store i32 %or, i32* %acts, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %while.body
  %7 = load i32, i32* %acts, align 4
  %or7 = or i32 %7, 8
  store i32 %or7, i32* %acts, align 4
  br label %sw.epilog

sw.bb8:                                           ; preds = %while.body
  %8 = load i32, i32* %acts, align 4
  %or9 = or i32 %8, 16
  store i32 %or9, i32* %acts, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %while.body
  %9 = load i32, i32* %acts, align 4
  %or11 = or i32 %9, 32
  store i32 %or11, i32* %acts, align 4
  br label %sw.epilog

sw.bb12:                                          ; preds = %while.body
  %10 = load i32, i32* %acts, align 4
  %or13 = or i32 %10, 256
  store i32 %or13, i32* %acts, align 4
  br label %sw.epilog

sw.bb14:                                          ; preds = %while.body
  %11 = load i32, i32* %acts, align 4
  %or15 = or i32 %11, 512
  store i32 %or15, i32* %acts, align 4
  br label %sw.epilog

sw.bb16:                                          ; preds = %while.body
  %12 = load i32, i32* %acts, align 4
  %or17 = or i32 %12, 2048
  store i32 %or17, i32* %acts, align 4
  br label %sw.epilog

sw.bb18:                                          ; preds = %while.body
  %13 = load i32, i32* %acts, align 4
  %or19 = or i32 %13, 16384
  store i32 %or19, i32* %acts, align 4
  br label %sw.epilog

sw.bb20:                                          ; preds = %while.body
  %14 = load i32, i32* %acts, align 4
  %or21 = or i32 %14, 32768
  store i32 %or21, i32* %acts, align 4
  br label %sw.epilog

sw.bb22:                                          ; preds = %while.body
  %15 = load i32, i32* %acts, align 4
  %or23 = or i32 %15, 131072
  store i32 %or23, i32* %acts, align 4
  br label %sw.epilog

sw.bb24:                                          ; preds = %while.body
  %16 = load i32, i32* %acts, align 4
  %or25 = or i32 %16, 4194304
  store i32 %or25, i32* %acts, align 4
  br label %sw.epilog

sw.bb26:                                          ; preds = %while.body
  %17 = load i32, i32* %acts, align 4
  %or27 = or i32 %17, 8388608
  store i32 %or27, i32* %acts, align 4
  br label %sw.epilog

sw.bb28:                                          ; preds = %while.body
  %18 = load i8*, i8** @list_optarg, align 4
  %call29 = call i32 @find_compopt(i8* %18)
  store i32 %call29, i32* %ind, align 4
  %19 = load i32, i32* %ind, align 4
  %cmp30 = icmp slt i32 %19, 0
  br i1 %cmp30, label %if.then31, label %if.end

if.then31:                                        ; preds = %sw.bb28
  %20 = load i8*, i8** @list_optarg, align 4
  call void @sh_invalidoptname(i8* %20)
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb28
  %21 = load i32, i32* %ind, align 4
  %arrayidx = getelementptr inbounds [9 x %struct._compopt], [9 x %struct._compopt]* @compopts, i32 0, i32 %21
  %optflag = getelementptr inbounds %struct._compopt, %struct._compopt* %arrayidx, i32 0, i32 1
  %22 = load i32, i32* %optflag, align 4
  %23 = load i32, i32* %copts, align 4
  %or32 = or i32 %23, %22
  store i32 %or32, i32* %copts, align 4
  br label %sw.epilog

sw.bb33:                                          ; preds = %while.body
  %24 = load i8*, i8** @list_optarg, align 4
  %call34 = call i32 @find_compact(i8* %24)
  store i32 %call34, i32* %ind, align 4
  %25 = load i32, i32* %ind, align 4
  %cmp35 = icmp slt i32 %25, 0
  br i1 %cmp35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %sw.bb33
  %call37 = call i8* @libintl_gettext(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.13, i32 0, i32 0))
  %26 = load i8*, i8** @list_optarg, align 4
  call void (i8*, ...) @builtin_error(i8* %call37, i8* %26)
  store i32 258, i32* %retval, align 4
  br label %return

if.end38:                                         ; preds = %sw.bb33
  %27 = load i32, i32* %ind, align 4
  %arrayidx39 = getelementptr inbounds [25 x %struct._compacts], [25 x %struct._compacts]* @compacts, i32 0, i32 %27
  %actflag = getelementptr inbounds %struct._compacts, %struct._compacts* %arrayidx39, i32 0, i32 1
  %28 = load i32, i32* %actflag, align 4
  %29 = load i32, i32* %acts, align 4
  %or40 = or i32 %29, %28
  store i32 %or40, i32* %acts, align 4
  br label %sw.epilog

sw.bb41:                                          ; preds = %while.body
  %30 = load i8*, i8** @list_optarg, align 4
  store i8* %30, i8** @Carg, align 4
  br label %sw.epilog

sw.bb42:                                          ; preds = %while.body
  %31 = load %struct._optflags*, %struct._optflags** %flagp.addr, align 4
  %tobool43 = icmp ne %struct._optflags* %31, null
  br i1 %tobool43, label %if.then44, label %if.else45

if.then44:                                        ; preds = %sw.bb42
  %32 = load %struct._optflags*, %struct._optflags** %flagp.addr, align 4
  %Dflag = getelementptr inbounds %struct._optflags, %struct._optflags* %32, i32 0, i32 2
  store i32 1, i32* %Dflag, align 4
  br label %sw.epilog

if.else45:                                        ; preds = %sw.bb42
  call void @sh_invalidopt(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0))
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.bb46:                                          ; preds = %while.body
  %33 = load %struct._optflags*, %struct._optflags** %flagp.addr, align 4
  %tobool47 = icmp ne %struct._optflags* %33, null
  br i1 %tobool47, label %if.then48, label %if.else49

if.then48:                                        ; preds = %sw.bb46
  %34 = load %struct._optflags*, %struct._optflags** %flagp.addr, align 4
  %Eflag = getelementptr inbounds %struct._optflags, %struct._optflags* %34, i32 0, i32 3
  store i32 1, i32* %Eflag, align 4
  br label %sw.epilog

if.else49:                                        ; preds = %sw.bb46
  call void @sh_invalidopt(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0))
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.bb50:                                          ; preds = %while.body
  %35 = load i8*, i8** @list_optarg, align 4
  store i8* %35, i8** @Farg, align 4
  br label %sw.epilog

sw.bb51:                                          ; preds = %while.body
  %36 = load i8*, i8** @list_optarg, align 4
  store i8* %36, i8** @Garg, align 4
  br label %sw.epilog

sw.bb52:                                          ; preds = %while.body
  %37 = load i8*, i8** @list_optarg, align 4
  store i8* %37, i8** @Parg, align 4
  br label %sw.epilog

sw.bb53:                                          ; preds = %while.body
  %38 = load i8*, i8** @list_optarg, align 4
  store i8* %38, i8** @Sarg, align 4
  br label %sw.epilog

sw.bb54:                                          ; preds = %while.body
  %39 = load i8*, i8** @list_optarg, align 4
  store i8* %39, i8** @Warg, align 4
  br label %sw.epilog

sw.bb55:                                          ; preds = %while.body
  %40 = load i8*, i8** @list_optarg, align 4
  store i8* %40, i8** @Xarg, align 4
  br label %sw.epilog

sw.bb56:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb55, %sw.bb54, %sw.bb53, %sw.bb52, %sw.bb51, %sw.bb50, %if.then48, %if.then44, %sw.bb41, %if.end38, %if.end, %sw.bb26, %sw.bb24, %sw.bb22, %sw.bb20, %sw.bb18, %sw.bb16, %sw.bb14, %sw.bb12, %sw.bb10, %sw.bb8, %sw.bb6, %sw.bb5, %if.then3, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %41 = load i32, i32* %acts, align 4
  %42 = load i32*, i32** %actp.addr, align 4
  store i32 %41, i32* %42, align 4
  %43 = load i32, i32* %copts, align 4
  %44 = load i32*, i32** %optp.addr, align 4
  store i32 %43, i32* %44, align 4
  %45 = load i32, i32* %opt_given, align 4
  %tobool57 = icmp ne i32 %45, 0
  %cond = select i1 %tobool57, i32 0, i32 1
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %sw.default, %sw.bb56, %if.else49, %if.else45, %if.then36, %if.then31, %if.else4, %if.else
  %46 = load i32, i32* %retval, align 4
  ret i32 %46
}

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.word_desc* @make_bare_word(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @print_cmd_completions(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %l = alloca %struct.word_list*, align 4
  %cs = alloca %struct.compspec*, align 4
  %ret = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %ret, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 1
  %3 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %3, i32 0, i32 0
  %4 = load i8*, i8** %word1, align 4
  %call = call %struct.compspec* @progcomp_search(i8* %4)
  store %struct.compspec* %call, %struct.compspec** %cs, align 4
  %5 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %tobool2 = icmp ne %struct.compspec* %5, null
  br i1 %tobool2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %6 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 1
  %7 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word4, align 4
  %9 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %call5 = call i32 @print_one_completion(i8* %8, %struct.compspec* %9)
  br label %if.end

if.else:                                          ; preds = %for.body
  %call6 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i32 0, i32 0))
  %10 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word7 = getelementptr inbounds %struct.word_list, %struct.word_list* %10, i32 0, i32 1
  %11 = load %struct.word_desc*, %struct.word_desc** %word7, align 4
  %word8 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %11, i32 0, i32 0
  %12 = load i8*, i8** %word8, align 4
  call void (i8*, ...) @builtin_error(i8* %call6, i8* %12)
  store i32 1, i32* %ret, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 0
  %14 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %14, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load i32, i32* %ret, align 4
  %call9 = call i32 @sh_chkwrite(i32 %15)
  ret i32 %call9
}

declare void @dispose_words(%struct.word_list*) #1

; Function Attrs: noinline nounwind
define internal i32 @remove_cmd_completions(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %l = alloca %struct.word_list*, align 4
  %ret = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %ret, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 1
  %3 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %3, i32 0, i32 0
  %4 = load i8*, i8** %word1, align 4
  %call = call i32 @progcomp_remove(i8* %4)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %call2 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i32 0, i32 0))
  %5 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %5, i32 0, i32 1
  %6 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word4, align 4
  call void (i8*, ...) @builtin_error(i8* %call2, i8* %7)
  store i32 1, i32* %ret, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 0
  %9 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %9, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %ret, align 4
  ret i32 %10
}

declare void @progcomp_flush() #1

declare void @builtin_usage() #1

declare %struct.compspec* @compspec_create() #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i32 @progcomp_insert(i8*, %struct.compspec*) #1

; Function Attrs: noinline nounwind
define i32 @compgen_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %rval = alloca i32, align 4
  %acts = alloca i32, align 4
  %copts = alloca i32, align 4
  %cs = alloca %struct.compspec*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %word = alloca i8*, align 4
  %matches = alloca i8**, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %copts, align 4
  store i32 0, i32* %acts, align 4
  store i8* null, i8** @Carg, align 4
  store i8* null, i8** @Farg, align 4
  store i8* null, i8** @Xarg, align 4
  store i8* null, i8** @Sarg, align 4
  store i8* null, i8** @Parg, align 4
  store i8* null, i8** @Warg, align 4
  store i8* null, i8** @Garg, align 4
  store %struct.compspec* null, %struct.compspec** %cs, align 4
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @build_actions(%struct.word_list* %1, %struct._optflags* null, i32* %acts, i32* %copts)
  store i32 %call, i32* %rval, align 4
  %2 = load i32, i32* %rval, align 4
  %cmp1 = icmp eq i32 %2, 258
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %rval, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load i32, i32* %rval, align 4
  %cmp4 = icmp eq i32 %4, 1
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  store i32 0, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end3
  %5 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %5, %struct.word_list** %list.addr, align 4
  %6 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end6
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word7 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 1
  %8 = load %struct.word_desc*, %struct.word_desc** %word7, align 4
  %tobool8 = icmp ne %struct.word_desc* %8, null
  br i1 %tobool8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word9 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word9, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word10, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.end6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %11, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i32 0, i32 0), %cond.false ]
  store i8* %cond, i8** %word, align 4
  %12 = load i8*, i8** @Farg, align 4
  %tobool11 = icmp ne i8* %12, null
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %cond.end
  %call13 = call i8* @libintl_gettext(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call13)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %cond.end
  %13 = load i8*, i8** @Carg, align 4
  %tobool15 = icmp ne i8* %13, null
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end14
  %call17 = call i8* @libintl_gettext(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.5, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call17)
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end14
  %call19 = call %struct.compspec* @compspec_create()
  store %struct.compspec* %call19, %struct.compspec** %cs, align 4
  %14 = load i32, i32* %acts, align 4
  %15 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %actions = getelementptr inbounds %struct.compspec, %struct.compspec* %15, i32 0, i32 1
  store i32 %14, i32* %actions, align 4
  %16 = load i32, i32* %copts, align 4
  %17 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %17, i32 0, i32 2
  store i32 %16, i32* %options, align 4
  %18 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %refcount = getelementptr inbounds %struct.compspec, %struct.compspec* %18, i32 0, i32 0
  store i32 1, i32* %refcount, align 4
  %19 = load i8*, i8** @Garg, align 4
  %tobool20 = icmp ne i8* %19, null
  br i1 %tobool20, label %cond.true21, label %cond.false25

cond.true21:                                      ; preds = %if.end18
  %20 = load i8*, i8** @Garg, align 4
  %call22 = call i32 @strlen(i8* %20)
  %add = add i32 1, %call22
  %call23 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 709)
  %21 = load i8*, i8** @Garg, align 4
  %call24 = call i8* @strcpy(i8* %call23, i8* %21)
  br label %cond.end26

cond.false25:                                     ; preds = %if.end18
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false25, %cond.true21
  %cond27 = phi i8* [ %call24, %cond.true21 ], [ null, %cond.false25 ]
  %22 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %globpat = getelementptr inbounds %struct.compspec, %struct.compspec* %22, i32 0, i32 3
  store i8* %cond27, i8** %globpat, align 4
  %23 = load i8*, i8** @Warg, align 4
  %tobool28 = icmp ne i8* %23, null
  br i1 %tobool28, label %cond.true29, label %cond.false34

cond.true29:                                      ; preds = %cond.end26
  %24 = load i8*, i8** @Warg, align 4
  %call30 = call i32 @strlen(i8* %24)
  %add31 = add i32 1, %call30
  %call32 = call i8* @sh_xmalloc(i32 %add31, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 710)
  %25 = load i8*, i8** @Warg, align 4
  %call33 = call i8* @strcpy(i8* %call32, i8* %25)
  br label %cond.end35

cond.false34:                                     ; preds = %cond.end26
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false34, %cond.true29
  %cond36 = phi i8* [ %call33, %cond.true29 ], [ null, %cond.false34 ]
  %26 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %words = getelementptr inbounds %struct.compspec, %struct.compspec* %26, i32 0, i32 4
  store i8* %cond36, i8** %words, align 4
  %27 = load i8*, i8** @Parg, align 4
  %tobool37 = icmp ne i8* %27, null
  br i1 %tobool37, label %cond.true38, label %cond.false43

cond.true38:                                      ; preds = %cond.end35
  %28 = load i8*, i8** @Parg, align 4
  %call39 = call i32 @strlen(i8* %28)
  %add40 = add i32 1, %call39
  %call41 = call i8* @sh_xmalloc(i32 %add40, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 711)
  %29 = load i8*, i8** @Parg, align 4
  %call42 = call i8* @strcpy(i8* %call41, i8* %29)
  br label %cond.end44

cond.false43:                                     ; preds = %cond.end35
  br label %cond.end44

cond.end44:                                       ; preds = %cond.false43, %cond.true38
  %cond45 = phi i8* [ %call42, %cond.true38 ], [ null, %cond.false43 ]
  %30 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %prefix = getelementptr inbounds %struct.compspec, %struct.compspec* %30, i32 0, i32 5
  store i8* %cond45, i8** %prefix, align 4
  %31 = load i8*, i8** @Sarg, align 4
  %tobool46 = icmp ne i8* %31, null
  br i1 %tobool46, label %cond.true47, label %cond.false52

cond.true47:                                      ; preds = %cond.end44
  %32 = load i8*, i8** @Sarg, align 4
  %call48 = call i32 @strlen(i8* %32)
  %add49 = add i32 1, %call48
  %call50 = call i8* @sh_xmalloc(i32 %add49, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 712)
  %33 = load i8*, i8** @Sarg, align 4
  %call51 = call i8* @strcpy(i8* %call50, i8* %33)
  br label %cond.end53

cond.false52:                                     ; preds = %cond.end44
  br label %cond.end53

cond.end53:                                       ; preds = %cond.false52, %cond.true47
  %cond54 = phi i8* [ %call51, %cond.true47 ], [ null, %cond.false52 ]
  %34 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %suffix = getelementptr inbounds %struct.compspec, %struct.compspec* %34, i32 0, i32 6
  store i8* %cond54, i8** %suffix, align 4
  %35 = load i8*, i8** @Farg, align 4
  %tobool55 = icmp ne i8* %35, null
  br i1 %tobool55, label %cond.true56, label %cond.false61

cond.true56:                                      ; preds = %cond.end53
  %36 = load i8*, i8** @Farg, align 4
  %call57 = call i32 @strlen(i8* %36)
  %add58 = add i32 1, %call57
  %call59 = call i8* @sh_xmalloc(i32 %add58, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 713)
  %37 = load i8*, i8** @Farg, align 4
  %call60 = call i8* @strcpy(i8* %call59, i8* %37)
  br label %cond.end62

cond.false61:                                     ; preds = %cond.end53
  br label %cond.end62

cond.end62:                                       ; preds = %cond.false61, %cond.true56
  %cond63 = phi i8* [ %call60, %cond.true56 ], [ null, %cond.false61 ]
  %38 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %funcname = getelementptr inbounds %struct.compspec, %struct.compspec* %38, i32 0, i32 7
  store i8* %cond63, i8** %funcname, align 4
  %39 = load i8*, i8** @Carg, align 4
  %tobool64 = icmp ne i8* %39, null
  br i1 %tobool64, label %cond.true65, label %cond.false70

cond.true65:                                      ; preds = %cond.end62
  %40 = load i8*, i8** @Carg, align 4
  %call66 = call i32 @strlen(i8* %40)
  %add67 = add i32 1, %call66
  %call68 = call i8* @sh_xmalloc(i32 %add67, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 714)
  %41 = load i8*, i8** @Carg, align 4
  %call69 = call i8* @strcpy(i8* %call68, i8* %41)
  br label %cond.end71

cond.false70:                                     ; preds = %cond.end62
  br label %cond.end71

cond.end71:                                       ; preds = %cond.false70, %cond.true65
  %cond72 = phi i8* [ %call69, %cond.true65 ], [ null, %cond.false70 ]
  %42 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %command = getelementptr inbounds %struct.compspec, %struct.compspec* %42, i32 0, i32 8
  store i8* %cond72, i8** %command, align 4
  %43 = load i8*, i8** @Xarg, align 4
  %tobool73 = icmp ne i8* %43, null
  br i1 %tobool73, label %cond.true74, label %cond.false79

cond.true74:                                      ; preds = %cond.end71
  %44 = load i8*, i8** @Xarg, align 4
  %call75 = call i32 @strlen(i8* %44)
  %add76 = add i32 1, %call75
  %call77 = call i8* @sh_xmalloc(i32 %add76, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 715)
  %45 = load i8*, i8** @Xarg, align 4
  %call78 = call i8* @strcpy(i8* %call77, i8* %45)
  br label %cond.end80

cond.false79:                                     ; preds = %cond.end71
  br label %cond.end80

cond.end80:                                       ; preds = %cond.false79, %cond.true74
  %cond81 = phi i8* [ %call78, %cond.true74 ], [ null, %cond.false79 ]
  %46 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %filterpat = getelementptr inbounds %struct.compspec, %struct.compspec* %46, i32 0, i32 10
  store i8* %cond81, i8** %filterpat, align 4
  store i32 1, i32* %rval, align 4
  %47 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %48 = load i8*, i8** %word, align 4
  %call82 = call %struct._list_of_strings* @gen_compspec_completions(%struct.compspec* %47, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i8* %48, i32 0, i32 0, i32* null)
  store %struct._list_of_strings* %call82, %struct._list_of_strings** %sl, align 4
  %49 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %cmp83 = icmp eq %struct._list_of_strings* %49, null
  br i1 %cmp83, label %land.lhs.true85, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end80
  %50 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %50, i32 0, i32 2
  %51 = load i32, i32* %list_len, align 4
  %cmp84 = icmp eq i32 %51, 0
  br i1 %cmp84, label %land.lhs.true85, label %if.end90

land.lhs.true85:                                  ; preds = %lor.lhs.false, %cond.end80
  %52 = load i32, i32* %copts, align 4
  %and = and i32 %52, 64
  %tobool86 = icmp ne i32 %and, 0
  br i1 %tobool86, label %if.then87, label %if.end90

if.then87:                                        ; preds = %land.lhs.true85
  %53 = load i8*, i8** %word, align 4
  %call88 = call i8** @bash_default_completion(i8* %53, i32 0, i32 0, i32 0, i32 0)
  store i8** %call88, i8*** %matches, align 4
  %54 = load i8**, i8*** %matches, align 4
  %call89 = call %struct._list_of_strings* @completions_to_stringlist(i8** %54)
  store %struct._list_of_strings* %call89, %struct._list_of_strings** %sl, align 4
  %55 = load i8**, i8*** %matches, align 4
  call void @strvec_dispose(i8** %55)
  br label %if.end90

if.end90:                                         ; preds = %if.then87, %land.lhs.true85, %lor.lhs.false
  %56 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %cmp91 = icmp eq %struct._list_of_strings* %56, null
  br i1 %cmp91, label %land.lhs.true95, label %lor.lhs.false92

lor.lhs.false92:                                  ; preds = %if.end90
  %57 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len93 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %57, i32 0, i32 2
  %58 = load i32, i32* %list_len93, align 4
  %cmp94 = icmp eq i32 %58, 0
  br i1 %cmp94, label %land.lhs.true95, label %if.end101

land.lhs.true95:                                  ; preds = %lor.lhs.false92, %if.end90
  %59 = load i32, i32* %copts, align 4
  %and96 = and i32 %59, 2
  %tobool97 = icmp ne i32 %and96, 0
  br i1 %tobool97, label %if.then98, label %if.end101

if.then98:                                        ; preds = %land.lhs.true95
  %60 = load i8*, i8** %word, align 4
  %call99 = call i8** @rl_completion_matches(i8* %60, i8* (i8*, i32)* @rl_filename_completion_function)
  store i8** %call99, i8*** %matches, align 4
  %61 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  call void @strlist_dispose(%struct._list_of_strings* %61)
  %62 = load i8**, i8*** %matches, align 4
  %call100 = call %struct._list_of_strings* @completions_to_stringlist(i8** %62)
  store %struct._list_of_strings* %call100, %struct._list_of_strings** %sl, align 4
  %63 = load i8**, i8*** %matches, align 4
  call void @strvec_dispose(i8** %63)
  br label %if.end101

if.end101:                                        ; preds = %if.then98, %land.lhs.true95, %lor.lhs.false92
  %64 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %tobool102 = icmp ne %struct._list_of_strings* %64, null
  br i1 %tobool102, label %if.then103, label %if.end111

if.then103:                                       ; preds = %if.end101
  %65 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list104 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %65, i32 0, i32 0
  %66 = load i8**, i8*** %list104, align 4
  %tobool105 = icmp ne i8** %66, null
  br i1 %tobool105, label %land.lhs.true106, label %if.end110

land.lhs.true106:                                 ; preds = %if.then103
  %67 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len107 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %67, i32 0, i32 2
  %68 = load i32, i32* %list_len107, align 4
  %tobool108 = icmp ne i32 %68, 0
  br i1 %tobool108, label %if.then109, label %if.end110

if.then109:                                       ; preds = %land.lhs.true106
  store i32 0, i32* %rval, align 4
  %69 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  call void @strlist_print(%struct._list_of_strings* %69, i8* null)
  br label %if.end110

if.end110:                                        ; preds = %if.then109, %land.lhs.true106, %if.then103
  %70 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  call void @strlist_dispose(%struct._list_of_strings* %70)
  br label %if.end111

if.end111:                                        ; preds = %if.end110, %if.end101
  %71 = load %struct.compspec*, %struct.compspec** %cs, align 4
  call void @compspec_dispose(%struct.compspec* %71)
  %72 = load i32, i32* %rval, align 4
  store i32 %72, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end111, %if.then5, %if.then2, %if.then
  %73 = load i32, i32* %retval, align 4
  ret i32 %73
}

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare %struct._list_of_strings* @gen_compspec_completions(%struct.compspec*, i8*, i8*, i32, i32, i32*) #1

declare i8** @bash_default_completion(i8*, i32, i32, i32, i32) #1

declare %struct._list_of_strings* @completions_to_stringlist(i8**) #1

declare void @strvec_dispose(i8**) #1

declare i8** @rl_completion_matches(i8*, i8* (i8*, i32)*) #1

declare i8* @rl_filename_completion_function(i8*, i32) #1

declare void @strlist_dispose(%struct._list_of_strings*) #1

declare void @strlist_print(%struct._list_of_strings*, i8*) #1

declare void @compspec_dispose(%struct.compspec*) #1

; Function Attrs: noinline nounwind
define i32 @compopt_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %opts_on = alloca i32, align 4
  %opts_off = alloca i32, align 4
  %opts = alloca i32*, align 4
  %opt = alloca i32, align 4
  %oind = alloca i32, align 4
  %ret = alloca i32, align 4
  %Dflag = alloca i32, align 4
  %Eflag = alloca i32, align 4
  %l = alloca %struct.word_list*, align 4
  %wl = alloca %struct.word_list*, align 4
  %cs = alloca %struct.compspec*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %Dflag, align 4
  store i32 0, i32* %Eflag, align 4
  store i32 0, i32* %opts_off, align 4
  store i32 0, i32* %opts_on, align 4
  store i32 0, i32* %ret, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* @list_opttype, align 4
  %cmp1 = icmp eq i32 %1, 45
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  br label %cond.end

cond.false:                                       ; preds = %while.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32* [ %opts_on, %cond.true ], [ %opts_off, %cond.false ]
  store i32* %cond, i32** %opts, align 4
  %2 = load i32, i32* %opt, align 4
  switch i32 %2, label %sw.default [
    i32 111, label %sw.bb
    i32 68, label %sw.bb4
    i32 69, label %sw.bb5
    i32 -99, label %sw.bb6
  ]

sw.bb:                                            ; preds = %cond.end
  %3 = load i8*, i8** @list_optarg, align 4
  %call2 = call i32 @find_compopt(i8* %3)
  store i32 %call2, i32* %oind, align 4
  %4 = load i32, i32* %oind, align 4
  %cmp3 = icmp slt i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb
  %5 = load i8*, i8** @list_optarg, align 4
  call void @sh_invalidoptname(i8* %5)
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb
  %6 = load i32, i32* %oind, align 4
  %arrayidx = getelementptr inbounds [9 x %struct._compopt], [9 x %struct._compopt]* @compopts, i32 0, i32 %6
  %optflag = getelementptr inbounds %struct._compopt, %struct._compopt* %arrayidx, i32 0, i32 1
  %7 = load i32, i32* %optflag, align 4
  %8 = load i32*, i32** %opts, align 4
  %9 = load i32, i32* %8, align 4
  %or = or i32 %9, %7
  store i32 %or, i32* %8, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %cond.end
  store i32 1, i32* %Dflag, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %cond.end
  store i32 1, i32* %Eflag, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %cond.end
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %cond.end
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb5, %sw.bb4, %if.end
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %10 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %10, %struct.word_list** %list.addr, align 4
  %11 = load i32, i32* %Dflag, align 4
  %tobool = icmp ne i32 %11, 0
  br i1 %tobool, label %cond.true7, label %cond.false10

cond.true7:                                       ; preds = %while.end
  %call8 = call %struct.word_desc* @make_bare_word(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %call9 = call %struct.word_list* @make_word_list(%struct.word_desc* %call8, %struct.word_list* null)
  br label %cond.end18

cond.false10:                                     ; preds = %while.end
  %12 = load i32, i32* %Eflag, align 4
  %tobool11 = icmp ne i32 %12, 0
  br i1 %tobool11, label %cond.true12, label %cond.false15

cond.true12:                                      ; preds = %cond.false10
  %call13 = call %struct.word_desc* @make_bare_word(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  %call14 = call %struct.word_list* @make_word_list(%struct.word_desc* %call13, %struct.word_list* null)
  br label %cond.end16

cond.false15:                                     ; preds = %cond.false10
  br label %cond.end16

cond.end16:                                       ; preds = %cond.false15, %cond.true12
  %cond17 = phi %struct.word_list* [ %call14, %cond.true12 ], [ null, %cond.false15 ]
  br label %cond.end18

cond.end18:                                       ; preds = %cond.end16, %cond.true7
  %cond19 = phi %struct.word_list* [ %call9, %cond.true7 ], [ %cond17, %cond.end16 ]
  store %struct.word_list* %cond19, %struct.word_list** %wl, align 4
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp20 = icmp eq %struct.word_list* %13, null
  br i1 %cmp20, label %land.lhs.true, label %if.end34

land.lhs.true:                                    ; preds = %cond.end18
  %14 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %cmp21 = icmp eq %struct.word_list* %14, null
  br i1 %cmp21, label %if.then22, label %if.end34

if.then22:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %15, 16384
  %cmp23 = icmp eq i32 %and, 0
  br i1 %cmp23, label %if.then25, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then22
  %16 = load %struct.compspec*, %struct.compspec** @pcomp_curcs, align 4
  %cmp24 = icmp eq %struct.compspec* %16, null
  br i1 %cmp24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %lor.lhs.false, %if.then22
  %call26 = call i8* @libintl_gettext(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.8, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call26)
  store i32 1, i32* %retval, align 4
  br label %return

if.end27:                                         ; preds = %lor.lhs.false
  %17 = load %struct.compspec*, %struct.compspec** @pcomp_curcs, align 4
  store %struct.compspec* %17, %struct.compspec** %cs, align 4
  %18 = load i32, i32* %opts_on, align 4
  %cmp28 = icmp eq i32 %18, 0
  br i1 %cmp28, label %land.lhs.true29, label %if.end33

land.lhs.true29:                                  ; preds = %if.end27
  %19 = load i32, i32* %opts_off, align 4
  %cmp30 = icmp eq i32 %19, 0
  br i1 %cmp30, label %if.then31, label %if.end33

if.then31:                                        ; preds = %land.lhs.true29
  %20 = load i8*, i8** @pcomp_curcmd, align 4
  %21 = load %struct.compspec*, %struct.compspec** %cs, align 4
  call void @print_compopts(i8* %20, %struct.compspec* %21, i32 1)
  %22 = load i32, i32* %ret, align 4
  %call32 = call i32 @sh_chkwrite(i32 %22)
  store i32 %call32, i32* %retval, align 4
  br label %return

if.end33:                                         ; preds = %land.lhs.true29, %if.end27
  %23 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %24 = load i32, i32* %opts_on, align 4
  call void @pcomp_set_compspec_options(%struct.compspec* %23, i32 %24, i32 1)
  %25 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %26 = load i32, i32* %opts_off, align 4
  call void @pcomp_set_compspec_options(%struct.compspec* %25, i32 %26, i32 0)
  %27 = load i32, i32* %opts_on, align 4
  call void @pcomp_set_readline_variables(i32 %27, i32 1)
  %28 = load i32, i32* %opts_off, align 4
  call void @pcomp_set_readline_variables(i32 %28, i32 0)
  %29 = load i32, i32* %ret, align 4
  store i32 %29, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %land.lhs.true, %cond.end18
  %30 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %tobool35 = icmp ne %struct.word_list* %30, null
  br i1 %tobool35, label %cond.true36, label %cond.false37

cond.true36:                                      ; preds = %if.end34
  %31 = load %struct.word_list*, %struct.word_list** %wl, align 4
  br label %cond.end38

cond.false37:                                     ; preds = %if.end34
  %32 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  br label %cond.end38

cond.end38:                                       ; preds = %cond.false37, %cond.true36
  %cond39 = phi %struct.word_list* [ %31, %cond.true36 ], [ %32, %cond.false37 ]
  store %struct.word_list* %cond39, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end38
  %33 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool40 = icmp ne %struct.word_list* %33, null
  br i1 %tobool40, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %34 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 1
  %35 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word41 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %35, i32 0, i32 0
  %36 = load i8*, i8** %word41, align 4
  %call42 = call %struct.compspec* @progcomp_search(i8* %36)
  store %struct.compspec* %call42, %struct.compspec** %cs, align 4
  %37 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %cmp43 = icmp eq %struct.compspec* %37, null
  br i1 %cmp43, label %if.then44, label %if.end48

if.then44:                                        ; preds = %for.body
  %call45 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i32 0, i32 0))
  %38 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word46 = getelementptr inbounds %struct.word_list, %struct.word_list* %38, i32 0, i32 1
  %39 = load %struct.word_desc*, %struct.word_desc** %word46, align 4
  %word47 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %39, i32 0, i32 0
  %40 = load i8*, i8** %word47, align 4
  call void (i8*, ...) @builtin_error(i8* %call45, i8* %40)
  store i32 1, i32* %ret, align 4
  br label %for.inc

if.end48:                                         ; preds = %for.body
  %41 = load i32, i32* %opts_on, align 4
  %cmp49 = icmp eq i32 %41, 0
  br i1 %cmp49, label %land.lhs.true50, label %if.end55

land.lhs.true50:                                  ; preds = %if.end48
  %42 = load i32, i32* %opts_off, align 4
  %cmp51 = icmp eq i32 %42, 0
  br i1 %cmp51, label %if.then52, label %if.end55

if.then52:                                        ; preds = %land.lhs.true50
  %43 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word53 = getelementptr inbounds %struct.word_list, %struct.word_list* %43, i32 0, i32 1
  %44 = load %struct.word_desc*, %struct.word_desc** %word53, align 4
  %word54 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %44, i32 0, i32 0
  %45 = load i8*, i8** %word54, align 4
  %46 = load %struct.compspec*, %struct.compspec** %cs, align 4
  call void @print_compopts(i8* %45, %struct.compspec* %46, i32 1)
  br label %for.inc

if.end55:                                         ; preds = %land.lhs.true50, %if.end48
  %47 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %48 = load i32, i32* %opts_on, align 4
  call void @pcomp_set_compspec_options(%struct.compspec* %47, i32 %48, i32 1)
  %49 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %50 = load i32, i32* %opts_off, align 4
  call void @pcomp_set_compspec_options(%struct.compspec* %49, i32 %50, i32 0)
  br label %for.inc

for.inc:                                          ; preds = %if.end55, %if.then52, %if.then44
  %51 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %51, i32 0, i32 0
  %52 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %52, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %53 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %tobool56 = icmp ne %struct.word_list* %53, null
  br i1 %tobool56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %for.end
  %54 = load %struct.word_list*, %struct.word_list** %wl, align 4
  call void @dispose_words(%struct.word_list* %54)
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %for.end
  %55 = load i32, i32* %ret, align 4
  store i32 %55, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end58, %if.end33, %if.then31, %if.then25, %sw.default, %sw.bb6, %if.then
  %56 = load i32, i32* %retval, align 4
  ret i32 %56
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @find_compopt(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [9 x %struct._compopt], [9 x %struct._compopt]* @compopts, i32 0, i32 %0
  %optname = getelementptr inbounds %struct._compopt, %struct._compopt* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %optname, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %3 to i32
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [9 x %struct._compopt], [9 x %struct._compopt]* @compopts, i32 0, i32 %4
  %optname3 = getelementptr inbounds %struct._compopt, %struct._compopt* %arrayidx2, i32 0, i32 0
  %5 = load i8*, i8** %optname3, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %7 = load i8*, i8** %name.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [9 x %struct._compopt], [9 x %struct._compopt]* @compopts, i32 0, i32 %8
  %optname8 = getelementptr inbounds %struct._compopt, %struct._compopt* %arrayidx7, i32 0, i32 0
  %9 = load i8*, i8** %optname8, align 4
  %call = call i32 @strcmp(i8* %7, i8* %9)
  %cmp9 = icmp eq i32 %call, 0
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %i, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare void @sh_invalidoptname(i8*) #1

declare void @builtin_help() #1

; Function Attrs: noinline nounwind
define internal void @print_compopts(i8* %cmd, %struct.compspec* %cs, i32 %full) #0 {
entry:
  %cmd.addr = alloca i8*, align 4
  %cs.addr = alloca %struct.compspec*, align 4
  %full.addr = alloca i32, align 4
  %copts = alloca i32, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  store i32 %full, i32* %full.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.75, i32 0, i32 0))
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %0, i32 0, i32 2
  %1 = load i32, i32* %options, align 4
  store i32 %1, i32* %copts, align 4
  %2 = load i32, i32* %full.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.else50

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %3 = load i32, i32* %copts, align 4
  %and = and i32 %3, 64
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %do.body
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.42, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %do.body
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.42, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body5

do.body5:                                         ; preds = %do.end
  %4 = load i32, i32* %copts, align 4
  %and6 = and i32 %4, 2
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.else10

if.then8:                                         ; preds = %do.body5
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.43, i32 0, i32 0))
  br label %if.end12

if.else10:                                        ; preds = %do.body5
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.43, i32 0, i32 0))
  br label %if.end12

if.end12:                                         ; preds = %if.else10, %if.then8
  br label %do.end13

do.end13:                                         ; preds = %if.end12
  br label %do.body14

do.body14:                                        ; preds = %do.end13
  %5 = load i32, i32* %copts, align 4
  %and15 = and i32 %5, 8
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %if.then17, label %if.else19

if.then17:                                        ; preds = %do.body14
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0))
  br label %if.end21

if.else19:                                        ; preds = %do.body14
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0))
  br label %if.end21

if.end21:                                         ; preds = %if.else19, %if.then17
  br label %do.end22

do.end22:                                         ; preds = %if.end21
  br label %do.body23

do.body23:                                        ; preds = %do.end22
  %6 = load i32, i32* %copts, align 4
  %and24 = and i32 %6, 4
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %if.then26, label %if.else28

if.then26:                                        ; preds = %do.body23
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.45, i32 0, i32 0))
  br label %if.end30

if.else28:                                        ; preds = %do.body23
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.45, i32 0, i32 0))
  br label %if.end30

if.end30:                                         ; preds = %if.else28, %if.then26
  br label %do.end31

do.end31:                                         ; preds = %if.end30
  br label %do.body32

do.body32:                                        ; preds = %do.end31
  %7 = load i32, i32* %copts, align 4
  %and33 = and i32 %7, 32
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %if.then35, label %if.else37

if.then35:                                        ; preds = %do.body32
  %call36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.46, i32 0, i32 0))
  br label %if.end39

if.else37:                                        ; preds = %do.body32
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.46, i32 0, i32 0))
  br label %if.end39

if.end39:                                         ; preds = %if.else37, %if.then35
  br label %do.end40

do.end40:                                         ; preds = %if.end39
  br label %do.body41

do.body41:                                        ; preds = %do.end40
  %8 = load i32, i32* %copts, align 4
  %and42 = and i32 %8, 128
  %tobool43 = icmp ne i32 %and42, 0
  br i1 %tobool43, label %if.then44, label %if.else46

if.then44:                                        ; preds = %do.body41
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.47, i32 0, i32 0))
  br label %if.end48

if.else46:                                        ; preds = %do.body41
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.47, i32 0, i32 0))
  br label %if.end48

if.end48:                                         ; preds = %if.else46, %if.then44
  br label %do.end49

do.end49:                                         ; preds = %if.end48
  br label %if.end93

if.else50:                                        ; preds = %entry
  br label %do.body51

do.body51:                                        ; preds = %if.else50
  %9 = load i32, i32* %copts, align 4
  %and52 = and i32 %9, 64
  %tobool53 = icmp ne i32 %and52, 0
  br i1 %tobool53, label %if.then54, label %if.end56

if.then54:                                        ; preds = %do.body51
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.42, i32 0, i32 0))
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %do.body51
  br label %do.end57

do.end57:                                         ; preds = %if.end56
  br label %do.body58

do.body58:                                        ; preds = %do.end57
  %10 = load i32, i32* %copts, align 4
  %and59 = and i32 %10, 2
  %tobool60 = icmp ne i32 %and59, 0
  br i1 %tobool60, label %if.then61, label %if.end63

if.then61:                                        ; preds = %do.body58
  %call62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.43, i32 0, i32 0))
  br label %if.end63

if.end63:                                         ; preds = %if.then61, %do.body58
  br label %do.end64

do.end64:                                         ; preds = %if.end63
  br label %do.body65

do.body65:                                        ; preds = %do.end64
  %11 = load i32, i32* %copts, align 4
  %and66 = and i32 %11, 8
  %tobool67 = icmp ne i32 %and66, 0
  br i1 %tobool67, label %if.then68, label %if.end70

if.then68:                                        ; preds = %do.body65
  %call69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0))
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %do.body65
  br label %do.end71

do.end71:                                         ; preds = %if.end70
  br label %do.body72

do.body72:                                        ; preds = %do.end71
  %12 = load i32, i32* %copts, align 4
  %and73 = and i32 %12, 4
  %tobool74 = icmp ne i32 %and73, 0
  br i1 %tobool74, label %if.then75, label %if.end77

if.then75:                                        ; preds = %do.body72
  %call76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.45, i32 0, i32 0))
  br label %if.end77

if.end77:                                         ; preds = %if.then75, %do.body72
  br label %do.end78

do.end78:                                         ; preds = %if.end77
  br label %do.body79

do.body79:                                        ; preds = %do.end78
  %13 = load i32, i32* %copts, align 4
  %and80 = and i32 %13, 32
  %tobool81 = icmp ne i32 %and80, 0
  br i1 %tobool81, label %if.then82, label %if.end84

if.then82:                                        ; preds = %do.body79
  %call83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.46, i32 0, i32 0))
  br label %if.end84

if.end84:                                         ; preds = %if.then82, %do.body79
  br label %do.end85

do.end85:                                         ; preds = %if.end84
  br label %do.body86

do.body86:                                        ; preds = %do.end85
  %14 = load i32, i32* %copts, align 4
  %and87 = and i32 %14, 128
  %tobool88 = icmp ne i32 %and87, 0
  br i1 %tobool88, label %if.then89, label %if.end91

if.then89:                                        ; preds = %do.body86
  %call90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.47, i32 0, i32 0))
  br label %if.end91

if.end91:                                         ; preds = %if.then89, %do.body86
  br label %do.end92

do.end92:                                         ; preds = %if.end91
  br label %if.end93

if.end93:                                         ; preds = %do.end92, %do.end49
  %15 = load i8*, i8** %cmd.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %16 to i32
  %17 = load i8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), align 1
  %conv94 = sext i8 %17 to i32
  %cmp = icmp eq i32 %conv, %conv94
  br i1 %cmp, label %land.lhs.true, label %if.else101

land.lhs.true:                                    ; preds = %if.end93
  %18 = load i8*, i8** %cmd.addr, align 4
  %call96 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  %cmp97 = icmp eq i32 %call96, 0
  br i1 %cmp97, label %if.then99, label %if.else101

if.then99:                                        ; preds = %land.lhs.true
  %call100 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i32 0, i32 0))
  br label %if.end116

if.else101:                                       ; preds = %land.lhs.true, %if.end93
  %19 = load i8*, i8** %cmd.addr, align 4
  %arrayidx102 = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx102, align 1
  %conv103 = sext i8 %20 to i32
  %21 = load i8, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), align 1
  %conv104 = sext i8 %21 to i32
  %cmp105 = icmp eq i32 %conv103, %conv104
  br i1 %cmp105, label %land.lhs.true107, label %if.else113

land.lhs.true107:                                 ; preds = %if.else101
  %22 = load i8*, i8** %cmd.addr, align 4
  %call108 = call i32 @strcmp(i8* %22, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %cmp109 = icmp eq i32 %call108, 0
  br i1 %cmp109, label %if.then111, label %if.else113

if.then111:                                       ; preds = %land.lhs.true107
  %call112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.71, i32 0, i32 0))
  br label %if.end115

if.else113:                                       ; preds = %land.lhs.true107, %if.else101
  %23 = load i8*, i8** %cmd.addr, align 4
  %call114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.72, i32 0, i32 0), i8* %23)
  br label %if.end115

if.end115:                                        ; preds = %if.else113, %if.then111
  br label %if.end116

if.end116:                                        ; preds = %if.end115, %if.then99
  ret void
}

declare i32 @sh_chkwrite(i32) #1

declare void @pcomp_set_compspec_options(%struct.compspec*, i32, i32) #1

declare void @pcomp_set_readline_variables(i32, i32) #1

declare %struct.compspec* @progcomp_search(i8*) #1

declare void @sh_invalidopt(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @find_compact(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [25 x %struct._compacts], [25 x %struct._compacts]* @compacts, i32 0, i32 %0
  %actname = getelementptr inbounds %struct._compacts, %struct._compacts* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %actname, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %3 to i32
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [25 x %struct._compacts], [25 x %struct._compacts]* @compacts, i32 0, i32 %4
  %actname3 = getelementptr inbounds %struct._compacts, %struct._compacts* %arrayidx2, i32 0, i32 0
  %5 = load i8*, i8** %actname3, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %7 = load i8*, i8** %name.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [25 x %struct._compacts], [25 x %struct._compacts]* @compacts, i32 0, i32 %8
  %actname8 = getelementptr inbounds %struct._compacts, %struct._compacts* %arrayidx7, i32 0, i32 0
  %9 = load i8*, i8** %actname8, align 4
  %call = call i32 @strcmp(i8* %7, i8* %9)
  %cmp9 = icmp eq i32 %call, 0
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %i, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare i32 @strcmp(i8*, i8*) #1

declare i32 @progcomp_remove(i8*) #1

declare void @progcomp_walk(i32 (%struct.bucket_contents*)*) #1

; Function Attrs: noinline nounwind
define internal i32 @print_compitem(%struct.bucket_contents* %item) #0 {
entry:
  %item.addr = alloca %struct.bucket_contents*, align 4
  %cs = alloca %struct.compspec*, align 4
  %cmd = alloca i8*, align 4
  store %struct.bucket_contents* %item, %struct.bucket_contents** %item.addr, align 4
  %0 = load %struct.bucket_contents*, %struct.bucket_contents** %item.addr, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %0, i32 0, i32 1
  %1 = load i8*, i8** %key, align 4
  store i8* %1, i8** %cmd, align 4
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %item.addr, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %2, i32 0, i32 2
  %3 = load i8*, i8** %data, align 4
  %4 = bitcast i8* %3 to %struct.compspec*
  store %struct.compspec* %4, %struct.compspec** %cs, align 4
  %5 = load i8*, i8** %cmd, align 4
  %6 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %call = call i32 @print_one_completion(i8* %5, %struct.compspec* %6)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @print_one_completion(i8* %cmd, %struct.compspec* %cs) #0 {
entry:
  %cmd.addr = alloca i8*, align 4
  %cs.addr = alloca %struct.compspec*, align 4
  %acts = alloca i32, align 4
  %copts = alloca i32, align 4
  %x = alloca i8*, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.40, i32 0, i32 0))
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %0, i32 0, i32 2
  %1 = load i32, i32* %options, align 4
  store i32 %1, i32* %copts, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %2 = load i32, i32* %copts, align 4
  %and = and i32 %2, 64
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.42, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %3 = load i32, i32* %copts, align 4
  %and3 = and i32 %3, 2
  %tobool4 = icmp ne i32 %and3, 0
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %do.body2
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.43, i32 0, i32 0))
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %do.body2
  br label %do.end8

do.end8:                                          ; preds = %if.end7
  br label %do.body9

do.body9:                                         ; preds = %do.end8
  %4 = load i32, i32* %copts, align 4
  %and10 = and i32 %4, 8
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %do.body9
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0))
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %do.body9
  br label %do.end15

do.end15:                                         ; preds = %if.end14
  br label %do.body16

do.body16:                                        ; preds = %do.end15
  %5 = load i32, i32* %copts, align 4
  %and17 = and i32 %5, 4
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %if.then19, label %if.end21

if.then19:                                        ; preds = %do.body16
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.45, i32 0, i32 0))
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %do.body16
  br label %do.end22

do.end22:                                         ; preds = %if.end21
  br label %do.body23

do.body23:                                        ; preds = %do.end22
  %6 = load i32, i32* %copts, align 4
  %and24 = and i32 %6, 32
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %do.body23
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.46, i32 0, i32 0))
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %do.body23
  br label %do.end29

do.end29:                                         ; preds = %if.end28
  br label %do.body30

do.body30:                                        ; preds = %do.end29
  %7 = load i32, i32* %copts, align 4
  %and31 = and i32 %7, 128
  %tobool32 = icmp ne i32 %and31, 0
  br i1 %tobool32, label %if.then33, label %if.end35

if.then33:                                        ; preds = %do.body30
  %call34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.47, i32 0, i32 0))
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %do.body30
  br label %do.end36

do.end36:                                         ; preds = %if.end35
  %8 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %actions = getelementptr inbounds %struct.compspec, %struct.compspec* %8, i32 0, i32 1
  %9 = load i32, i32* %actions, align 4
  store i32 %9, i32* %acts, align 4
  br label %do.body37

do.body37:                                        ; preds = %do.end36
  %10 = load i32, i32* %acts, align 4
  %and38 = and i32 %10, 1
  %tobool39 = icmp ne i32 %and38, 0
  br i1 %tobool39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %do.body37
  %call41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.49, i32 0, i32 0))
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %do.body37
  br label %do.end43

do.end43:                                         ; preds = %if.end42
  br label %do.body44

do.body44:                                        ; preds = %do.end43
  %11 = load i32, i32* %acts, align 4
  %and45 = and i32 %11, 8
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %if.then47, label %if.end49

if.then47:                                        ; preds = %do.body44
  %call48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.50, i32 0, i32 0))
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %do.body44
  br label %do.end50

do.end50:                                         ; preds = %if.end49
  br label %do.body51

do.body51:                                        ; preds = %do.end50
  %12 = load i32, i32* %acts, align 4
  %and52 = and i32 %12, 16
  %tobool53 = icmp ne i32 %and52, 0
  br i1 %tobool53, label %if.then54, label %if.end56

if.then54:                                        ; preds = %do.body51
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.51, i32 0, i32 0))
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %do.body51
  br label %do.end57

do.end57:                                         ; preds = %if.end56
  br label %do.body58

do.body58:                                        ; preds = %do.end57
  %13 = load i32, i32* %acts, align 4
  %and59 = and i32 %13, 32
  %tobool60 = icmp ne i32 %and59, 0
  br i1 %tobool60, label %if.then61, label %if.end63

if.then61:                                        ; preds = %do.body58
  %call62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0))
  br label %if.end63

if.end63:                                         ; preds = %if.then61, %do.body58
  br label %do.end64

do.end64:                                         ; preds = %if.end63
  br label %do.body65

do.body65:                                        ; preds = %do.end64
  %14 = load i32, i32* %acts, align 4
  %and66 = and i32 %14, 256
  %tobool67 = icmp ne i32 %and66, 0
  br i1 %tobool67, label %if.then68, label %if.end70

if.then68:                                        ; preds = %do.body65
  %call69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.53, i32 0, i32 0))
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %do.body65
  br label %do.end71

do.end71:                                         ; preds = %if.end70
  br label %do.body72

do.body72:                                        ; preds = %do.end71
  %15 = load i32, i32* %acts, align 4
  %and73 = and i32 %15, 512
  %tobool74 = icmp ne i32 %and73, 0
  br i1 %tobool74, label %if.then75, label %if.end77

if.then75:                                        ; preds = %do.body72
  %call76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.54, i32 0, i32 0))
  br label %if.end77

if.end77:                                         ; preds = %if.then75, %do.body72
  br label %do.end78

do.end78:                                         ; preds = %if.end77
  br label %do.body79

do.body79:                                        ; preds = %do.end78
  %16 = load i32, i32* %acts, align 4
  %and80 = and i32 %16, 2048
  %tobool81 = icmp ne i32 %and80, 0
  br i1 %tobool81, label %if.then82, label %if.end84

if.then82:                                        ; preds = %do.body79
  %call83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0))
  br label %if.end84

if.end84:                                         ; preds = %if.then82, %do.body79
  br label %do.end85

do.end85:                                         ; preds = %if.end84
  br label %do.body86

do.body86:                                        ; preds = %do.end85
  %17 = load i32, i32* %acts, align 4
  %and87 = and i32 %17, 16384
  %tobool88 = icmp ne i32 %and87, 0
  br i1 %tobool88, label %if.then89, label %if.end91

if.then89:                                        ; preds = %do.body86
  %call90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0))
  br label %if.end91

if.end91:                                         ; preds = %if.then89, %do.body86
  br label %do.end92

do.end92:                                         ; preds = %if.end91
  br label %do.body93

do.body93:                                        ; preds = %do.end92
  %18 = load i32, i32* %acts, align 4
  %and94 = and i32 %18, 32768
  %tobool95 = icmp ne i32 %and94, 0
  br i1 %tobool95, label %if.then96, label %if.end98

if.then96:                                        ; preds = %do.body93
  %call97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.57, i32 0, i32 0))
  br label %if.end98

if.end98:                                         ; preds = %if.then96, %do.body93
  br label %do.end99

do.end99:                                         ; preds = %if.end98
  br label %do.body100

do.body100:                                       ; preds = %do.end99
  %19 = load i32, i32* %acts, align 4
  %and101 = and i32 %19, 131072
  %tobool102 = icmp ne i32 %and101, 0
  br i1 %tobool102, label %if.then103, label %if.end105

if.then103:                                       ; preds = %do.body100
  %call104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58, i32 0, i32 0))
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %do.body100
  br label %do.end106

do.end106:                                        ; preds = %if.end105
  br label %do.body107

do.body107:                                       ; preds = %do.end106
  %20 = load i32, i32* %acts, align 4
  %and108 = and i32 %20, 4194304
  %tobool109 = icmp ne i32 %and108, 0
  br i1 %tobool109, label %if.then110, label %if.end112

if.then110:                                       ; preds = %do.body107
  %call111 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.59, i32 0, i32 0))
  br label %if.end112

if.end112:                                        ; preds = %if.then110, %do.body107
  br label %do.end113

do.end113:                                        ; preds = %if.end112
  br label %do.body114

do.body114:                                       ; preds = %do.end113
  %21 = load i32, i32* %acts, align 4
  %and115 = and i32 %21, 8388608
  %tobool116 = icmp ne i32 %and115, 0
  br i1 %tobool116, label %if.then117, label %if.end119

if.then117:                                       ; preds = %do.body114
  %call118 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.60, i32 0, i32 0))
  br label %if.end119

if.end119:                                        ; preds = %if.then117, %do.body114
  br label %do.end120

do.end120:                                        ; preds = %if.end119
  br label %do.body121

do.body121:                                       ; preds = %do.end120
  %22 = load i32, i32* %acts, align 4
  %and122 = and i32 %22, 2
  %tobool123 = icmp ne i32 %and122, 0
  br i1 %tobool123, label %if.then124, label %if.end126

if.then124:                                       ; preds = %do.body121
  %call125 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.17, i32 0, i32 0))
  br label %if.end126

if.end126:                                        ; preds = %if.then124, %do.body121
  br label %do.end127

do.end127:                                        ; preds = %if.end126
  br label %do.body128

do.body128:                                       ; preds = %do.end127
  %23 = load i32, i32* %acts, align 4
  %and129 = and i32 %23, 4
  %tobool130 = icmp ne i32 %and129, 0
  br i1 %tobool130, label %if.then131, label %if.end133

if.then131:                                       ; preds = %do.body128
  %call132 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18, i32 0, i32 0))
  br label %if.end133

if.end133:                                        ; preds = %if.then131, %do.body128
  br label %do.end134

do.end134:                                        ; preds = %if.end133
  br label %do.body135

do.body135:                                       ; preds = %do.end134
  %24 = load i32, i32* %acts, align 4
  %and136 = and i32 %24, 64
  %tobool137 = icmp ne i32 %and136, 0
  br i1 %tobool137, label %if.then138, label %if.end140

if.then138:                                       ; preds = %do.body135
  %call139 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.22, i32 0, i32 0))
  br label %if.end140

if.end140:                                        ; preds = %if.then138, %do.body135
  br label %do.end141

do.end141:                                        ; preds = %if.end140
  br label %do.body142

do.body142:                                       ; preds = %do.end141
  %25 = load i32, i32* %acts, align 4
  %and143 = and i32 %25, 128
  %tobool144 = icmp ne i32 %and143, 0
  br i1 %tobool144, label %if.then145, label %if.end147

if.then145:                                       ; preds = %do.body142
  %call146 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0))
  br label %if.end147

if.end147:                                        ; preds = %if.then145, %do.body142
  br label %do.end148

do.end148:                                        ; preds = %if.end147
  br label %do.body149

do.body149:                                       ; preds = %do.end148
  %26 = load i32, i32* %acts, align 4
  %and150 = and i32 %26, 1024
  %tobool151 = icmp ne i32 %and150, 0
  br i1 %tobool151, label %if.then152, label %if.end154

if.then152:                                       ; preds = %do.body149
  %call153 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i32 0, i32 0))
  br label %if.end154

if.end154:                                        ; preds = %if.then152, %do.body149
  br label %do.end155

do.end155:                                        ; preds = %if.end154
  br label %do.body156

do.body156:                                       ; preds = %do.end155
  %27 = load i32, i32* %acts, align 4
  %and157 = and i32 %27, 4096
  %tobool158 = icmp ne i32 %and157, 0
  br i1 %tobool158, label %if.then159, label %if.end161

if.then159:                                       ; preds = %do.body156
  %call160 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.27, i32 0, i32 0))
  br label %if.end161

if.end161:                                        ; preds = %if.then159, %do.body156
  br label %do.end162

do.end162:                                        ; preds = %if.end161
  br label %do.body163

do.body163:                                       ; preds = %do.end162
  %28 = load i32, i32* %acts, align 4
  %and164 = and i32 %28, 8192
  %tobool165 = icmp ne i32 %and164, 0
  br i1 %tobool165, label %if.then166, label %if.end168

if.then166:                                       ; preds = %do.body163
  %call167 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0))
  br label %if.end168

if.end168:                                        ; preds = %if.then166, %do.body163
  br label %do.end169

do.end169:                                        ; preds = %if.end168
  br label %do.body170

do.body170:                                       ; preds = %do.end169
  %29 = load i32, i32* %acts, align 4
  %and171 = and i32 %29, 65536
  %tobool172 = icmp ne i32 %and171, 0
  br i1 %tobool172, label %if.then173, label %if.end175

if.then173:                                       ; preds = %do.body170
  %call174 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.32, i32 0, i32 0))
  br label %if.end175

if.end175:                                        ; preds = %if.then173, %do.body170
  br label %do.end176

do.end176:                                        ; preds = %if.end175
  br label %do.body177

do.body177:                                       ; preds = %do.end176
  %30 = load i32, i32* %acts, align 4
  %and178 = and i32 %30, 262144
  %tobool179 = icmp ne i32 %and178, 0
  br i1 %tobool179, label %if.then180, label %if.end182

if.then180:                                       ; preds = %do.body177
  %call181 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.34, i32 0, i32 0))
  br label %if.end182

if.end182:                                        ; preds = %if.then180, %do.body177
  br label %do.end183

do.end183:                                        ; preds = %if.end182
  br label %do.body184

do.body184:                                       ; preds = %do.end183
  %31 = load i32, i32* %acts, align 4
  %and185 = and i32 %31, 524288
  %tobool186 = icmp ne i32 %and185, 0
  br i1 %tobool186, label %if.then187, label %if.end189

if.then187:                                       ; preds = %do.body184
  %call188 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.35, i32 0, i32 0))
  br label %if.end189

if.end189:                                        ; preds = %if.then187, %do.body184
  br label %do.end190

do.end190:                                        ; preds = %if.end189
  br label %do.body191

do.body191:                                       ; preds = %do.end190
  %32 = load i32, i32* %acts, align 4
  %and192 = and i32 %32, 1048576
  %tobool193 = icmp ne i32 %and192, 0
  br i1 %tobool193, label %if.then194, label %if.end196

if.then194:                                       ; preds = %do.body191
  %call195 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0))
  br label %if.end196

if.end196:                                        ; preds = %if.then194, %do.body191
  br label %do.end197

do.end197:                                        ; preds = %if.end196
  br label %do.body198

do.body198:                                       ; preds = %do.end197
  %33 = load i32, i32* %acts, align 4
  %and199 = and i32 %33, 2097152
  %tobool200 = icmp ne i32 %and199, 0
  br i1 %tobool200, label %if.then201, label %if.end203

if.then201:                                       ; preds = %do.body198
  %call202 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.37, i32 0, i32 0))
  br label %if.end203

if.end203:                                        ; preds = %if.then201, %do.body198
  br label %do.end204

do.end204:                                        ; preds = %if.end203
  br label %do.body205

do.body205:                                       ; preds = %do.end204
  %34 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat = getelementptr inbounds %struct.compspec, %struct.compspec* %34, i32 0, i32 3
  %35 = load i8*, i8** %globpat, align 4
  %tobool206 = icmp ne i8* %35, null
  br i1 %tobool206, label %if.then207, label %if.end211

if.then207:                                       ; preds = %do.body205
  %36 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat208 = getelementptr inbounds %struct.compspec, %struct.compspec* %36, i32 0, i32 3
  %37 = load i8*, i8** %globpat208, align 4
  %call209 = call i8* @sh_single_quote(i8* %37)
  store i8* %call209, i8** %x, align 4
  %38 = load i8*, i8** %x, align 4
  %call210 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.63, i32 0, i32 0), i8* %38)
  %39 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 554)
  br label %if.end211

if.end211:                                        ; preds = %if.then207, %do.body205
  br label %do.end212

do.end212:                                        ; preds = %if.end211
  br label %do.body213

do.body213:                                       ; preds = %do.end212
  %40 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words = getelementptr inbounds %struct.compspec, %struct.compspec* %40, i32 0, i32 4
  %41 = load i8*, i8** %words, align 4
  %tobool214 = icmp ne i8* %41, null
  br i1 %tobool214, label %if.then215, label %if.end219

if.then215:                                       ; preds = %do.body213
  %42 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words216 = getelementptr inbounds %struct.compspec, %struct.compspec* %42, i32 0, i32 4
  %43 = load i8*, i8** %words216, align 4
  %call217 = call i8* @sh_single_quote(i8* %43)
  store i8* %call217, i8** %x, align 4
  %44 = load i8*, i8** %x, align 4
  %call218 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64, i32 0, i32 0), i8* %44)
  %45 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %45, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 555)
  br label %if.end219

if.end219:                                        ; preds = %if.then215, %do.body213
  br label %do.end220

do.end220:                                        ; preds = %if.end219
  br label %do.body221

do.body221:                                       ; preds = %do.end220
  %46 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix = getelementptr inbounds %struct.compspec, %struct.compspec* %46, i32 0, i32 5
  %47 = load i8*, i8** %prefix, align 4
  %tobool222 = icmp ne i8* %47, null
  br i1 %tobool222, label %if.then223, label %if.end227

if.then223:                                       ; preds = %do.body221
  %48 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix224 = getelementptr inbounds %struct.compspec, %struct.compspec* %48, i32 0, i32 5
  %49 = load i8*, i8** %prefix224, align 4
  %call225 = call i8* @sh_single_quote(i8* %49)
  store i8* %call225, i8** %x, align 4
  %50 = load i8*, i8** %x, align 4
  %call226 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.65, i32 0, i32 0), i8* %50)
  %51 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %51, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 556)
  br label %if.end227

if.end227:                                        ; preds = %if.then223, %do.body221
  br label %do.end228

do.end228:                                        ; preds = %if.end227
  br label %do.body229

do.body229:                                       ; preds = %do.end228
  %52 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix = getelementptr inbounds %struct.compspec, %struct.compspec* %52, i32 0, i32 6
  %53 = load i8*, i8** %suffix, align 4
  %tobool230 = icmp ne i8* %53, null
  br i1 %tobool230, label %if.then231, label %if.end235

if.then231:                                       ; preds = %do.body229
  %54 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix232 = getelementptr inbounds %struct.compspec, %struct.compspec* %54, i32 0, i32 6
  %55 = load i8*, i8** %suffix232, align 4
  %call233 = call i8* @sh_single_quote(i8* %55)
  store i8* %call233, i8** %x, align 4
  %56 = load i8*, i8** %x, align 4
  %call234 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0), i8* %56)
  %57 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %57, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 557)
  br label %if.end235

if.end235:                                        ; preds = %if.then231, %do.body229
  br label %do.end236

do.end236:                                        ; preds = %if.end235
  br label %do.body237

do.body237:                                       ; preds = %do.end236
  %58 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat = getelementptr inbounds %struct.compspec, %struct.compspec* %58, i32 0, i32 10
  %59 = load i8*, i8** %filterpat, align 4
  %tobool238 = icmp ne i8* %59, null
  br i1 %tobool238, label %if.then239, label %if.end243

if.then239:                                       ; preds = %do.body237
  %60 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat240 = getelementptr inbounds %struct.compspec, %struct.compspec* %60, i32 0, i32 10
  %61 = load i8*, i8** %filterpat240, align 4
  %call241 = call i8* @sh_single_quote(i8* %61)
  store i8* %call241, i8** %x, align 4
  %62 = load i8*, i8** %x, align 4
  %call242 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.67, i32 0, i32 0), i8* %62)
  %63 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %63, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 558)
  br label %if.end243

if.end243:                                        ; preds = %if.then239, %do.body237
  br label %do.end244

do.end244:                                        ; preds = %if.end243
  br label %do.body245

do.body245:                                       ; preds = %do.end244
  %64 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command = getelementptr inbounds %struct.compspec, %struct.compspec* %64, i32 0, i32 8
  %65 = load i8*, i8** %command, align 4
  %tobool246 = icmp ne i8* %65, null
  br i1 %tobool246, label %if.then247, label %if.end251

if.then247:                                       ; preds = %do.body245
  %66 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command248 = getelementptr inbounds %struct.compspec, %struct.compspec* %66, i32 0, i32 8
  %67 = load i8*, i8** %command248, align 4
  %call249 = call i8* @sh_single_quote(i8* %67)
  store i8* %call249, i8** %x, align 4
  %68 = load i8*, i8** %x, align 4
  %call250 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.68, i32 0, i32 0), i8* %68)
  %69 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %69, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 560)
  br label %if.end251

if.end251:                                        ; preds = %if.then247, %do.body245
  br label %do.end252

do.end252:                                        ; preds = %if.end251
  br label %do.body253

do.body253:                                       ; preds = %do.end252
  %70 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname = getelementptr inbounds %struct.compspec, %struct.compspec* %70, i32 0, i32 7
  %71 = load i8*, i8** %funcname, align 4
  %tobool254 = icmp ne i8* %71, null
  br i1 %tobool254, label %if.then255, label %if.end258

if.then255:                                       ; preds = %do.body253
  %72 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname256 = getelementptr inbounds %struct.compspec, %struct.compspec* %72, i32 0, i32 7
  %73 = load i8*, i8** %funcname256, align 4
  %call257 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.69, i32 0, i32 0), i8* %73)
  br label %if.end258

if.end258:                                        ; preds = %if.then255, %do.body253
  br label %do.end259

do.end259:                                        ; preds = %if.end258
  %74 = load i8*, i8** %cmd.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %74, i32 0
  %75 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %75 to i32
  %76 = load i8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), align 1
  %conv260 = sext i8 %76 to i32
  %cmp = icmp eq i32 %conv, %conv260
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %do.end259
  %77 = load i8*, i8** %cmd.addr, align 4
  %call262 = call i32 @strcmp(i8* %77, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  %cmp263 = icmp eq i32 %call262, 0
  br i1 %cmp263, label %if.then265, label %if.else

if.then265:                                       ; preds = %land.lhs.true
  %call266 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i32 0, i32 0))
  br label %if.end281

if.else:                                          ; preds = %land.lhs.true, %do.end259
  %78 = load i8*, i8** %cmd.addr, align 4
  %arrayidx267 = getelementptr inbounds i8, i8* %78, i32 0
  %79 = load i8, i8* %arrayidx267, align 1
  %conv268 = sext i8 %79 to i32
  %80 = load i8, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), align 1
  %conv269 = sext i8 %80 to i32
  %cmp270 = icmp eq i32 %conv268, %conv269
  br i1 %cmp270, label %land.lhs.true272, label %if.else278

land.lhs.true272:                                 ; preds = %if.else
  %81 = load i8*, i8** %cmd.addr, align 4
  %call273 = call i32 @strcmp(i8* %81, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %cmp274 = icmp eq i32 %call273, 0
  br i1 %cmp274, label %if.then276, label %if.else278

if.then276:                                       ; preds = %land.lhs.true272
  %call277 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.71, i32 0, i32 0))
  br label %if.end280

if.else278:                                       ; preds = %land.lhs.true272, %if.else
  %82 = load i8*, i8** %cmd.addr, align 4
  %call279 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.72, i32 0, i32 0), i8* %82)
  br label %if.end280

if.end280:                                        ; preds = %if.else278, %if.then276
  br label %if.end281

if.end281:                                        ; preds = %if.end280, %if.then265
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i8* @sh_single_quote(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
