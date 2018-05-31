; ModuleID = 'getopt.c'
source_filename = "getopt.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.sh_getopt_state = type { i8*, i32, i32, i8*, i32, i32 }

@sh_optarg = global i8* null, align 4
@sh_optind = global i32 0, align 4
@sh_opterr = global i32 1, align 4
@sh_optopt = global i32 63, align 4
@sh_badopt = global i32 0, align 4
@nextchar = internal global i8* null, align 4
@sh_curopt = internal global i32 0, align 4
@sh_charindex = internal global i32 0, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str = private unnamed_addr constant [26 x i8] c"%s: illegal option -- %c\0A\00", align 1
@.str.1 = private unnamed_addr constant [39 x i8] c"%s: option requires an argument -- %c\0A\00", align 1
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"getopt.c\00", align 1

; Function Attrs: noinline nounwind
define i32 @sh_getopt(i32 %argc, i8** %argv, i8* %optstring) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %optstring.addr = alloca i8*, align 4
  %c = alloca i8, align 1
  %temp = alloca i8*, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  store i8* %optstring, i8** %optstring.addr, align 4
  store i8* null, i8** @sh_optarg, align 4
  %0 = load i32, i32* @sh_optind, align 4
  %1 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* @sh_optind, align 4
  %cmp1 = icmp slt i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* %argc.addr, align 4
  store i32 %3, i32* @sh_optind, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i32, i32* @sh_optind, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 1, i32* @sh_optind, align 4
  store i8* null, i8** @nextchar, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %5 = load i8*, i8** @nextchar, align 4
  %cmp5 = icmp eq i8* %5, null
  br i1 %cmp5, label %if.then9, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %if.end4
  %6 = load i8*, i8** @nextchar, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv, 0
  br i1 %cmp7, label %if.then9, label %if.end41

if.then9:                                         ; preds = %lor.lhs.false6, %if.end4
  %8 = load i32, i32* @sh_optind, align 4
  %9 = load i32, i32* %argc.addr, align 4
  %cmp10 = icmp sge i32 %8, %9
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.then9
  store i32 -1, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.then9
  %10 = load i8**, i8*** %argv.addr, align 4
  %11 = load i32, i32* @sh_optind, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx, align 4
  store i8* %12, i8** %temp, align 4
  %13 = load i8*, i8** %temp, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %14 to i32
  %cmp16 = icmp eq i32 %conv15, 45
  br i1 %cmp16, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %if.end13
  %15 = load i8*, i8** %temp, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %15, i32 1
  %16 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %16 to i32
  %cmp20 = icmp eq i32 %conv19, 45
  br i1 %cmp20, label %land.lhs.true22, label %if.end28

land.lhs.true22:                                  ; preds = %land.lhs.true
  %17 = load i8*, i8** %temp, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %17, i32 2
  %18 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %18 to i32
  %cmp25 = icmp eq i32 %conv24, 0
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %land.lhs.true22
  %19 = load i32, i32* @sh_optind, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* @sh_optind, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end28:                                         ; preds = %land.lhs.true22, %land.lhs.true, %if.end13
  %20 = load i8*, i8** %temp, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %21 to i32
  %cmp31 = icmp ne i32 %conv30, 45
  br i1 %cmp31, label %if.then38, label %lor.lhs.false33

lor.lhs.false33:                                  ; preds = %if.end28
  %22 = load i8*, i8** %temp, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %23 to i32
  %cmp36 = icmp eq i32 %conv35, 0
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %lor.lhs.false33, %if.end28
  store i32 -1, i32* %retval, align 4
  br label %return

if.end39:                                         ; preds = %lor.lhs.false33
  %24 = load i8**, i8*** %argv.addr, align 4
  %25 = load i32, i32* @sh_optind, align 4
  store i32 %25, i32* @sh_curopt, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %24, i32 %25
  %26 = load i8*, i8** %arrayidx40, align 4
  %add.ptr = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %add.ptr, i8** @nextchar, align 4
  store i32 1, i32* @sh_charindex, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.end39, %lor.lhs.false6
  %27 = load i8*, i8** @nextchar, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr, i8** @nextchar, align 4
  %28 = load i8, i8* %27, align 1
  store i8 %28, i8* %c, align 1
  %29 = load i32, i32* @sh_charindex, align 4
  %inc42 = add nsw i32 %29, 1
  store i32 %inc42, i32* @sh_charindex, align 4
  %30 = load i8*, i8** %optstring.addr, align 4
  %31 = load i8, i8* %c, align 1
  %conv43 = sext i8 %31 to i32
  %call = call i8* @strchr(i8* %30, i32 %conv43)
  store i8* %call, i8** %temp, align 4
  %32 = load i8, i8* %c, align 1
  %conv44 = sext i8 %32 to i32
  store i32 %conv44, i32* @sh_optopt, align 4
  %33 = load i8*, i8** @nextchar, align 4
  %cmp45 = icmp eq i8* %33, null
  br i1 %cmp45, label %if.then51, label %lor.lhs.false47

lor.lhs.false47:                                  ; preds = %if.end41
  %34 = load i8*, i8** @nextchar, align 4
  %35 = load i8, i8* %34, align 1
  %conv48 = sext i8 %35 to i32
  %cmp49 = icmp eq i32 %conv48, 0
  br i1 %cmp49, label %if.then51, label %if.end53

if.then51:                                        ; preds = %lor.lhs.false47, %if.end41
  %36 = load i32, i32* @sh_optind, align 4
  %inc52 = add nsw i32 %36, 1
  store i32 %inc52, i32* @sh_optind, align 4
  store i8* null, i8** @nextchar, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.then51, %lor.lhs.false47
  %37 = load i8*, i8** %temp, align 4
  %cmp54 = icmp eq i8* %37, null
  br i1 %cmp54, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end53
  %38 = load i8, i8* %c, align 1
  %conv56 = sext i8 %38 to i32
  %cmp57 = icmp eq i32 %conv56, 58
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end53
  %39 = phi i1 [ true, %if.end53 ], [ %cmp57, %lor.rhs ]
  %lor.ext = zext i1 %39 to i32
  store i32 %lor.ext, i32* @sh_badopt, align 4
  br i1 %39, label %if.then59, label %if.end66

if.then59:                                        ; preds = %lor.end
  %40 = load i32, i32* @sh_opterr, align 4
  %tobool = icmp ne i32 %40, 0
  br i1 %tobool, label %if.then60, label %if.end65

if.then60:                                        ; preds = %if.then59
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call61 = call i8* @libintl_gettext(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0))
  %42 = load i8**, i8*** %argv.addr, align 4
  %arrayidx62 = getelementptr inbounds i8*, i8** %42, i32 0
  %43 = load i8*, i8** %arrayidx62, align 4
  %44 = load i8, i8* %c, align 1
  %conv63 = sext i8 %44 to i32
  %call64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* %call61, i8* %43, i32 %conv63)
  br label %if.end65

if.end65:                                         ; preds = %if.then60, %if.then59
  store i32 63, i32* %retval, align 4
  br label %return

if.end66:                                         ; preds = %lor.end
  %45 = load i8*, i8** %temp, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %45, i32 1
  %46 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %46 to i32
  %cmp69 = icmp eq i32 %conv68, 58
  br i1 %cmp69, label %if.then71, label %if.end99

if.then71:                                        ; preds = %if.end66
  %47 = load i8*, i8** @nextchar, align 4
  %tobool72 = icmp ne i8* %47, null
  br i1 %tobool72, label %land.lhs.true73, label %if.else

land.lhs.true73:                                  ; preds = %if.then71
  %48 = load i8*, i8** @nextchar, align 4
  %49 = load i8, i8* %48, align 1
  %conv74 = sext i8 %49 to i32
  %tobool75 = icmp ne i32 %conv74, 0
  br i1 %tobool75, label %if.then76, label %if.else

if.then76:                                        ; preds = %land.lhs.true73
  %50 = load i8*, i8** @nextchar, align 4
  store i8* %50, i8** @sh_optarg, align 4
  %51 = load i32, i32* @sh_optind, align 4
  %inc77 = add nsw i32 %51, 1
  store i32 %inc77, i32* @sh_optind, align 4
  br label %if.end98

if.else:                                          ; preds = %land.lhs.true73, %if.then71
  %52 = load i32, i32* @sh_optind, align 4
  %53 = load i32, i32* %argc.addr, align 4
  %cmp78 = icmp eq i32 %52, %53
  br i1 %cmp78, label %if.then80, label %if.else94

if.then80:                                        ; preds = %if.else
  %54 = load i32, i32* @sh_opterr, align 4
  %tobool81 = icmp ne i32 %54, 0
  br i1 %tobool81, label %if.then82, label %if.end87

if.then82:                                        ; preds = %if.then80
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call83 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.1, i32 0, i32 0))
  %56 = load i8**, i8*** %argv.addr, align 4
  %arrayidx84 = getelementptr inbounds i8*, i8** %56, i32 0
  %57 = load i8*, i8** %arrayidx84, align 4
  %58 = load i8, i8* %c, align 1
  %conv85 = sext i8 %58 to i32
  %call86 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* %call83, i8* %57, i32 %conv85)
  br label %if.end87

if.end87:                                         ; preds = %if.then82, %if.then80
  %59 = load i8, i8* %c, align 1
  %conv88 = sext i8 %59 to i32
  store i32 %conv88, i32* @sh_optopt, align 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i32 0, i32 0), i8** @sh_optarg, align 4
  %60 = load i8*, i8** %optstring.addr, align 4
  %arrayidx89 = getelementptr inbounds i8, i8* %60, i32 0
  %61 = load i8, i8* %arrayidx89, align 1
  %conv90 = sext i8 %61 to i32
  %cmp91 = icmp eq i32 %conv90, 58
  %cond = select i1 %cmp91, i32 58, i32 63
  %conv93 = trunc i32 %cond to i8
  store i8 %conv93, i8* %c, align 1
  br label %if.end97

if.else94:                                        ; preds = %if.else
  %62 = load i8**, i8*** %argv.addr, align 4
  %63 = load i32, i32* @sh_optind, align 4
  %inc95 = add nsw i32 %63, 1
  store i32 %inc95, i32* @sh_optind, align 4
  %arrayidx96 = getelementptr inbounds i8*, i8** %62, i32 %63
  %64 = load i8*, i8** %arrayidx96, align 4
  store i8* %64, i8** @sh_optarg, align 4
  br label %if.end97

if.end97:                                         ; preds = %if.else94, %if.end87
  br label %if.end98

if.end98:                                         ; preds = %if.end97, %if.then76
  store i8* null, i8** @nextchar, align 4
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.end66
  %65 = load i8, i8* %c, align 1
  %conv100 = sext i8 %65 to i32
  store i32 %conv100, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end99, %if.end65, %if.then38, %if.then27, %if.then12, %if.then
  %66 = load i32, i32* %retval, align 4
  ret i32 %66
}

declare i8* @strchr(i8*, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define void @sh_getopt_restore_state(i8** %argv) #0 {
entry:
  %argv.addr = alloca i8**, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  %0 = load i8*, i8** @nextchar, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 4
  %2 = load i32, i32* @sh_curopt, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %4 = load i32, i32* @sh_charindex, align 4
  %add.ptr = getelementptr inbounds i8, i8* %3, i32 %4
  store i8* %add.ptr, i8** @nextchar, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define %struct.sh_getopt_state* @sh_getopt_alloc_istate() #0 {
entry:
  %ret = alloca %struct.sh_getopt_state*, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i32 231)
  %0 = bitcast i8* %call to %struct.sh_getopt_state*
  store %struct.sh_getopt_state* %0, %struct.sh_getopt_state** %ret, align 4
  %1 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %ret, align 4
  ret %struct.sh_getopt_state* %1
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @sh_getopt_dispose_istate(%struct.sh_getopt_state* %gs) #0 {
entry:
  %gs.addr = alloca %struct.sh_getopt_state*, align 4
  store %struct.sh_getopt_state* %gs, %struct.sh_getopt_state** %gs.addr, align 4
  %0 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %gs.addr, align 4
  %1 = bitcast %struct.sh_getopt_state* %0 to i8*
  call void @sh_xfree(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i32 239)
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.sh_getopt_state* @sh_getopt_save_istate() #0 {
entry:
  %ret = alloca %struct.sh_getopt_state*, align 4
  %call = call %struct.sh_getopt_state* @sh_getopt_alloc_istate()
  store %struct.sh_getopt_state* %call, %struct.sh_getopt_state** %ret, align 4
  %0 = load i8*, i8** @sh_optarg, align 4
  %1 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %ret, align 4
  %gs_optarg = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %1, i32 0, i32 0
  store i8* %0, i8** %gs_optarg, align 4
  %2 = load i32, i32* @sh_optind, align 4
  %3 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %ret, align 4
  %gs_optind = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %3, i32 0, i32 1
  store i32 %2, i32* %gs_optind, align 4
  %4 = load i32, i32* @sh_curopt, align 4
  %5 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %ret, align 4
  %gs_curopt = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %5, i32 0, i32 2
  store i32 %4, i32* %gs_curopt, align 4
  %6 = load i8*, i8** @nextchar, align 4
  %7 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %ret, align 4
  %gs_nextchar = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %7, i32 0, i32 3
  store i8* %6, i8** %gs_nextchar, align 4
  %8 = load i32, i32* @sh_charindex, align 4
  %9 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %ret, align 4
  %gs_charindex = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %9, i32 0, i32 4
  store i32 %8, i32* %gs_charindex, align 4
  %10 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %ret, align 4
  %gs_flags = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %10, i32 0, i32 5
  store i32 0, i32* %gs_flags, align 4
  %11 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %ret, align 4
  ret %struct.sh_getopt_state* %11
}

; Function Attrs: noinline nounwind
define void @sh_getopt_restore_istate(%struct.sh_getopt_state* %state) #0 {
entry:
  %state.addr = alloca %struct.sh_getopt_state*, align 4
  store %struct.sh_getopt_state* %state, %struct.sh_getopt_state** %state.addr, align 4
  %0 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %state.addr, align 4
  %gs_optarg = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %0, i32 0, i32 0
  %1 = load i8*, i8** %gs_optarg, align 4
  store i8* %1, i8** @sh_optarg, align 4
  %2 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %state.addr, align 4
  %gs_optind = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %2, i32 0, i32 1
  %3 = load i32, i32* %gs_optind, align 4
  store i32 %3, i32* @sh_optind, align 4
  %4 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %state.addr, align 4
  %gs_curopt = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %4, i32 0, i32 2
  %5 = load i32, i32* %gs_curopt, align 4
  store i32 %5, i32* @sh_curopt, align 4
  %6 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %state.addr, align 4
  %gs_nextchar = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %6, i32 0, i32 3
  %7 = load i8*, i8** %gs_nextchar, align 4
  store i8* %7, i8** @nextchar, align 4
  %8 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %state.addr, align 4
  %gs_charindex = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %8, i32 0, i32 4
  %9 = load i32, i32* %gs_charindex, align 4
  store i32 %9, i32* @sh_charindex, align 4
  %10 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %state.addr, align 4
  call void @sh_getopt_dispose_istate(%struct.sh_getopt_state* %10)
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
