; ModuleID = 'colors.c'
source_filename = "colors.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._color_ext_type = type { %struct.bin_str, %struct.bin_str, %struct._color_ext_type* }
%struct.bin_str = type { i32, i8* }
%struct._IO_FILE = type opaque
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@_rl_color_ext_list = global %struct._color_ext_type* null, align 4
@rl_outstream = external global %struct._IO_FILE*, align 4
@_rl_color_indicator = external global [0 x %struct.bin_str], align 4
@rl_filename_stat_hook = external global i32 (i8**)*, align 4
@.str = private unnamed_addr constant [7 x i8] c"target\00", align 1
@_rl_print_color_indicator.filetype_indicator = internal global [10 x i32] [i32 13, i32 8, i32 11, i32 6, i32 10, i32 5, i32 7, i32 9, i32 5, i32 6], align 4
@.str.1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"00\00", align 1

; Function Attrs: noinline nounwind
define void @_rl_put_indicator(%struct.bin_str* %ind) #0 {
entry:
  %ind.addr = alloca %struct.bin_str*, align 4
  store %struct.bin_str* %ind, %struct.bin_str** %ind.addr, align 4
  %0 = load %struct.bin_str*, %struct.bin_str** %ind.addr, align 4
  %string = getelementptr inbounds %struct.bin_str, %struct.bin_str* %0, i32 0, i32 1
  %1 = load i8*, i8** %string, align 4
  %2 = load %struct.bin_str*, %struct.bin_str** %ind.addr, align 4
  %len = getelementptr inbounds %struct.bin_str, %struct.bin_str* %2, i32 0, i32 0
  %3 = load i32, i32* %len, align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 @fwrite(i8* %1, i32 %3, i32 1, %struct._IO_FILE* %4)
  ret void
}

declare i32 @fwrite(i8*, i32, i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define void @_rl_set_normal_color() #0 {
entry:
  %call = call zeroext i1 @is_colored(i32 4)
  br i1 %call, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 0))
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 4))
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 1))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal zeroext i1 @is_colored(i32 %colored_filetype) #0 {
entry:
  %colored_filetype.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %s = alloca i8*, align 4
  store i32 %colored_filetype, i32* %colored_filetype.addr, align 4
  %0 = load i32, i32* %colored_filetype.addr, align 4
  %arrayidx = getelementptr inbounds [0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 %0
  %len1 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %arrayidx, i32 0, i32 0
  %1 = load i32, i32* %len1, align 4
  store i32 %1, i32* %len, align 4
  %2 = load i32, i32* %colored_filetype.addr, align 4
  %arrayidx2 = getelementptr inbounds [0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 %2
  %string = getelementptr inbounds %struct.bin_str, %struct.bin_str* %arrayidx2, i32 0, i32 1
  %3 = load i8*, i8** %string, align 4
  store i8* %3, i8** %s, align 4
  %4 = load i32, i32* %len, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %5 = load i32, i32* %len, align 4
  %cmp3 = icmp eq i32 %5, 1
  br i1 %cmp3, label %land.lhs.true, label %lor.rhs

land.lhs.true:                                    ; preds = %lor.lhs.false
  %6 = load i8*, i8** %s, align 4
  %call = call i32 @strncmp(i8* %6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 1)
  %cmp4 = icmp eq i32 %call, 0
  br i1 %cmp4, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %7 = load i32, i32* %len, align 4
  %cmp5 = icmp eq i32 %7, 2
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %8 = load i8*, i8** %s, align 4
  %call6 = call i32 @strncmp(i8* %8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32 2)
  %cmp7 = icmp eq i32 %call6, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %9 = phi i1 [ false, %lor.rhs ], [ %cmp7, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.lhs.true, %entry
  %10 = phi i1 [ true, %land.lhs.true ], [ true, %entry ], [ %9, %land.end ]
  %lnot = xor i1 %10, true
  ret i1 %lnot
}

; Function Attrs: noinline nounwind
define zeroext i1 @_rl_print_prefix_color() #0 {
entry:
  %retval = alloca i1, align 1
  %s = alloca %struct.bin_str*, align 4
  store %struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 9), %struct.bin_str** %s, align 4
  %0 = load %struct.bin_str*, %struct.bin_str** %s, align 4
  %string = getelementptr inbounds %struct.bin_str, %struct.bin_str* %0, i32 0, i32 1
  %1 = load i8*, i8** %string, align 4
  %cmp = icmp ne i8* %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call zeroext i1 @is_colored(i32 4)
  br i1 %call, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  call void @restore_default_color()
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 0))
  %2 = load %struct.bin_str*, %struct.bin_str** %s, align 4
  call void @_rl_put_indicator(%struct.bin_str* %2)
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 1))
  store i1 false, i1* %retval, align 1
  br label %return

if.else:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.else, %if.end
  %3 = load i1, i1* %retval, align 1
  ret i1 %3
}

; Function Attrs: noinline nounwind
define internal void @restore_default_color() #0 {
entry:
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 0))
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 1))
  ret void
}

; Function Attrs: noinline nounwind
define zeroext i1 @_rl_print_color_indicator(i8* %f) #0 {
entry:
  %retval = alloca i1, align 1
  %f.addr = alloca i8*, align 4
  %colored_filetype = alloca i32, align 4
  %ext = alloca %struct._color_ext_type*, align 4
  %len = alloca i32, align 4
  %name = alloca i8*, align 4
  %filename = alloca i8*, align 4
  %astat = alloca %struct.stat, align 8
  %linkstat = alloca %struct.stat, align 8
  %mode = alloca i32, align 4
  %linkok = alloca i32, align 4
  %stat_ok = alloca i32, align 4
  %s = alloca %struct.bin_str*, align 4
  store i8* %f, i8** %f.addr, align 4
  %0 = load i8*, i8** %f.addr, align 4
  store i8* %0, i8** %name, align 4
  store i8* null, i8** %filename, align 4
  %1 = load i32 (i8**)*, i32 (i8**)** @rl_filename_stat_hook, align 4
  %tobool = icmp ne i32 (i8**)* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %f.addr, align 4
  %call = call i32 @strlen(i8* %2)
  %add = add i32 1, %call
  %call1 = call i8* @xmalloc(i32 %add)
  %3 = load i8*, i8** %f.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %3)
  store i8* %call2, i8** %filename, align 4
  %4 = load i32 (i8**)*, i32 (i8**)** @rl_filename_stat_hook, align 4
  %call3 = call i32 %4(i8** %filename)
  %5 = load i8*, i8** %filename, align 4
  store i8* %5, i8** %name, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i8*, i8** %name, align 4
  %call4 = call i32 @lstat(i8* %6, %struct.stat* %astat)
  store i32 %call4, i32* %stat_ok, align 4
  %7 = load i32, i32* %stat_ok, align 4
  %cmp = icmp eq i32 %7, 0
  br i1 %cmp, label %if.then5, label %if.else18

if.then5:                                         ; preds = %if.end
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %astat, i32 0, i32 6
  %8 = load i32, i32* %st_mode, align 8
  store i32 %8, i32* %mode, align 4
  %9 = load i32, i32* %mode, align 4
  %and = and i32 %9, 61440
  %cmp6 = icmp eq i32 %and, 40960
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then5
  %10 = load i8*, i8** %name, align 4
  %call8 = call i32 @stat(i8* %10, %struct.stat* %linkstat)
  %cmp9 = icmp eq i32 %call8, 0
  %conv = zext i1 %cmp9 to i32
  store i32 %conv, i32* %linkok, align 4
  %11 = load i32, i32* %linkok, align 4
  %tobool10 = icmp ne i32 %11, 0
  br i1 %tobool10, label %land.lhs.true, label %if.end16

land.lhs.true:                                    ; preds = %if.then7
  %12 = load i8*, i8** getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 7, i32 1), align 4
  %call11 = call i32 @strncmp(i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 6)
  %cmp12 = icmp eq i32 %call11, 0
  br i1 %cmp12, label %if.then14, label %if.end16

if.then14:                                        ; preds = %land.lhs.true
  %st_mode15 = getelementptr inbounds %struct.stat, %struct.stat* %linkstat, i32 0, i32 6
  %13 = load i32, i32* %st_mode15, align 8
  store i32 %13, i32* %mode, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %land.lhs.true, %if.then7
  br label %if.end17

if.else:                                          ; preds = %if.then5
  store i32 1, i32* %linkok, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.else, %if.end16
  br label %if.end19

if.else18:                                        ; preds = %if.end
  store i32 -1, i32* %linkok, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.end17
  %14 = load i32, i32* %linkok, align 4
  %cmp20 = icmp eq i32 %14, -1
  br i1 %cmp20, label %land.lhs.true22, label %if.else26

land.lhs.true22:                                  ; preds = %if.end19
  %15 = load i8*, i8** getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 12, i32 1), align 4
  %cmp23 = icmp ne i8* %15, null
  br i1 %cmp23, label %if.then25, label %if.else26

if.then25:                                        ; preds = %land.lhs.true22
  store i32 12, i32* %colored_filetype, align 4
  br label %if.end154

if.else26:                                        ; preds = %land.lhs.true22, %if.end19
  %16 = load i32, i32* %linkok, align 4
  %cmp27 = icmp eq i32 %16, 0
  br i1 %cmp27, label %land.lhs.true29, label %if.else37

land.lhs.true29:                                  ; preds = %if.else26
  %17 = load i32, i32* %mode, align 4
  %and30 = and i32 %17, 61440
  %cmp31 = icmp eq i32 %and30, 40960
  br i1 %cmp31, label %land.lhs.true33, label %if.else37

land.lhs.true33:                                  ; preds = %land.lhs.true29
  %18 = load i8*, i8** getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 13, i32 1), align 4
  %cmp34 = icmp ne i8* %18, null
  br i1 %cmp34, label %if.then36, label %if.else37

if.then36:                                        ; preds = %land.lhs.true33
  store i32 13, i32* %colored_filetype, align 4
  br label %if.end153

if.else37:                                        ; preds = %land.lhs.true33, %land.lhs.true29, %if.else26
  %19 = load i32, i32* %stat_ok, align 4
  %cmp38 = icmp ne i32 %19, 0
  br i1 %cmp38, label %if.then40, label %if.else41

if.then40:                                        ; preds = %if.else37
  %20 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_rl_print_color_indicator.filetype_indicator, i32 0, i32 5), align 4
  store i32 %20, i32* %colored_filetype, align 4
  br label %if.end152

if.else41:                                        ; preds = %if.else37
  %21 = load i32, i32* %mode, align 4
  %and42 = and i32 %21, 61440
  %cmp43 = icmp eq i32 %and42, 32768
  br i1 %cmp43, label %if.then45, label %if.else86

if.then45:                                        ; preds = %if.else41
  store i32 5, i32* %colored_filetype, align 4
  %22 = load i32, i32* %mode, align 4
  %and46 = and i32 %22, 2048
  %cmp47 = icmp ne i32 %and46, 0
  br i1 %cmp47, label %land.lhs.true49, label %if.else53

land.lhs.true49:                                  ; preds = %if.then45
  %call50 = call zeroext i1 @is_colored(i32 16)
  br i1 %call50, label %if.then52, label %if.else53

if.then52:                                        ; preds = %land.lhs.true49
  store i32 16, i32* %colored_filetype, align 4
  br label %if.end85

if.else53:                                        ; preds = %land.lhs.true49, %if.then45
  %23 = load i32, i32* %mode, align 4
  %and54 = and i32 %23, 1024
  %cmp55 = icmp ne i32 %and54, 0
  br i1 %cmp55, label %land.lhs.true57, label %if.else61

land.lhs.true57:                                  ; preds = %if.else53
  %call58 = call zeroext i1 @is_colored(i32 17)
  br i1 %call58, label %if.then60, label %if.else61

if.then60:                                        ; preds = %land.lhs.true57
  store i32 17, i32* %colored_filetype, align 4
  br label %if.end84

if.else61:                                        ; preds = %land.lhs.true57, %if.else53
  %call62 = call zeroext i1 @is_colored(i32 21)
  br i1 %call62, label %land.lhs.true64, label %if.else66

land.lhs.true64:                                  ; preds = %if.else61
  br i1 false, label %if.then65, label %if.else66

if.then65:                                        ; preds = %land.lhs.true64
  store i32 21, i32* %colored_filetype, align 4
  br label %if.end83

if.else66:                                        ; preds = %land.lhs.true64, %if.else61
  %24 = load i32, i32* %mode, align 4
  %and67 = and i32 %24, 73
  %cmp68 = icmp ne i32 %and67, 0
  br i1 %cmp68, label %land.lhs.true70, label %if.else74

land.lhs.true70:                                  ; preds = %if.else66
  %call71 = call zeroext i1 @is_colored(i32 14)
  br i1 %call71, label %if.then73, label %if.else74

if.then73:                                        ; preds = %land.lhs.true70
  store i32 14, i32* %colored_filetype, align 4
  br label %if.end82

if.else74:                                        ; preds = %land.lhs.true70, %if.else66
  %st_nlink = getelementptr inbounds %struct.stat, %struct.stat* %astat, i32 0, i32 4
  %25 = load i32, i32* %st_nlink, align 8
  %cmp75 = icmp ult i32 1, %25
  br i1 %cmp75, label %land.lhs.true77, label %if.end81

land.lhs.true77:                                  ; preds = %if.else74
  %call78 = call zeroext i1 @is_colored(i32 22)
  br i1 %call78, label %if.then80, label %if.end81

if.then80:                                        ; preds = %land.lhs.true77
  store i32 22, i32* %colored_filetype, align 4
  br label %if.end81

if.end81:                                         ; preds = %if.then80, %land.lhs.true77, %if.else74
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %if.then73
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %if.then65
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %if.then60
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %if.then52
  br label %if.end151

if.else86:                                        ; preds = %if.else41
  %26 = load i32, i32* %mode, align 4
  %and87 = and i32 %26, 61440
  %cmp88 = icmp eq i32 %and87, 16384
  br i1 %cmp88, label %if.then90, label %if.else119

if.then90:                                        ; preds = %if.else86
  store i32 6, i32* %colored_filetype, align 4
  %27 = load i32, i32* %mode, align 4
  %and91 = and i32 %27, 512
  %tobool92 = icmp ne i32 %and91, 0
  br i1 %tobool92, label %land.lhs.true93, label %if.else100

land.lhs.true93:                                  ; preds = %if.then90
  %28 = load i32, i32* %mode, align 4
  %and94 = and i32 %28, 2
  %tobool95 = icmp ne i32 %and94, 0
  br i1 %tobool95, label %land.lhs.true96, label %if.else100

land.lhs.true96:                                  ; preds = %land.lhs.true93
  %call97 = call zeroext i1 @is_colored(i32 20)
  br i1 %call97, label %if.then99, label %if.else100

if.then99:                                        ; preds = %land.lhs.true96
  store i32 20, i32* %colored_filetype, align 4
  br label %if.end118

if.else100:                                       ; preds = %land.lhs.true96, %land.lhs.true93, %if.then90
  %29 = load i32, i32* %mode, align 4
  %and101 = and i32 %29, 2
  %cmp102 = icmp ne i32 %and101, 0
  br i1 %cmp102, label %land.lhs.true104, label %if.else108

land.lhs.true104:                                 ; preds = %if.else100
  %call105 = call zeroext i1 @is_colored(i32 19)
  br i1 %call105, label %if.then107, label %if.else108

if.then107:                                       ; preds = %land.lhs.true104
  store i32 19, i32* %colored_filetype, align 4
  br label %if.end117

if.else108:                                       ; preds = %land.lhs.true104, %if.else100
  %30 = load i32, i32* %mode, align 4
  %and109 = and i32 %30, 512
  %cmp110 = icmp ne i32 %and109, 0
  br i1 %cmp110, label %land.lhs.true112, label %if.end116

land.lhs.true112:                                 ; preds = %if.else108
  %call113 = call zeroext i1 @is_colored(i32 18)
  br i1 %call113, label %if.then115, label %if.end116

if.then115:                                       ; preds = %land.lhs.true112
  store i32 18, i32* %colored_filetype, align 4
  br label %if.end116

if.end116:                                        ; preds = %if.then115, %land.lhs.true112, %if.else108
  br label %if.end117

if.end117:                                        ; preds = %if.end116, %if.then107
  br label %if.end118

if.end118:                                        ; preds = %if.end117, %if.then99
  br label %if.end150

if.else119:                                       ; preds = %if.else86
  %31 = load i32, i32* %mode, align 4
  %and120 = and i32 %31, 61440
  %cmp121 = icmp eq i32 %and120, 40960
  br i1 %cmp121, label %if.then123, label %if.else124

if.then123:                                       ; preds = %if.else119
  store i32 7, i32* %colored_filetype, align 4
  br label %if.end149

if.else124:                                       ; preds = %if.else119
  %32 = load i32, i32* %mode, align 4
  %and125 = and i32 %32, 61440
  %cmp126 = icmp eq i32 %and125, 4096
  br i1 %cmp126, label %if.then128, label %if.else129

if.then128:                                       ; preds = %if.else124
  store i32 8, i32* %colored_filetype, align 4
  br label %if.end148

if.else129:                                       ; preds = %if.else124
  %33 = load i32, i32* %mode, align 4
  %and130 = and i32 %33, 61440
  %cmp131 = icmp eq i32 %and130, 49152
  br i1 %cmp131, label %if.then133, label %if.else134

if.then133:                                       ; preds = %if.else129
  store i32 9, i32* %colored_filetype, align 4
  br label %if.end147

if.else134:                                       ; preds = %if.else129
  %34 = load i32, i32* %mode, align 4
  %and135 = and i32 %34, 61440
  %cmp136 = icmp eq i32 %and135, 24576
  br i1 %cmp136, label %if.then138, label %if.else139

if.then138:                                       ; preds = %if.else134
  store i32 10, i32* %colored_filetype, align 4
  br label %if.end146

if.else139:                                       ; preds = %if.else134
  %35 = load i32, i32* %mode, align 4
  %and140 = and i32 %35, 61440
  %cmp141 = icmp eq i32 %and140, 8192
  br i1 %cmp141, label %if.then143, label %if.else144

if.then143:                                       ; preds = %if.else139
  store i32 11, i32* %colored_filetype, align 4
  br label %if.end145

if.else144:                                       ; preds = %if.else139
  store i32 13, i32* %colored_filetype, align 4
  br label %if.end145

if.end145:                                        ; preds = %if.else144, %if.then143
  br label %if.end146

if.end146:                                        ; preds = %if.end145, %if.then138
  br label %if.end147

if.end147:                                        ; preds = %if.end146, %if.then133
  br label %if.end148

if.end148:                                        ; preds = %if.end147, %if.then128
  br label %if.end149

if.end149:                                        ; preds = %if.end148, %if.then123
  br label %if.end150

if.end150:                                        ; preds = %if.end149, %if.end118
  br label %if.end151

if.end151:                                        ; preds = %if.end150, %if.end85
  br label %if.end152

if.end152:                                        ; preds = %if.end151, %if.then40
  br label %if.end153

if.end153:                                        ; preds = %if.end152, %if.then36
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %if.then25
  store %struct._color_ext_type* null, %struct._color_ext_type** %ext, align 4
  %36 = load i32, i32* %colored_filetype, align 4
  %cmp155 = icmp eq i32 %36, 5
  br i1 %cmp155, label %if.then157, label %if.end177

if.then157:                                       ; preds = %if.end154
  %37 = load i8*, i8** %name, align 4
  %call158 = call i32 @strlen(i8* %37)
  store i32 %call158, i32* %len, align 4
  %38 = load i32, i32* %len, align 4
  %39 = load i8*, i8** %name, align 4
  %add.ptr = getelementptr inbounds i8, i8* %39, i32 %38
  store i8* %add.ptr, i8** %name, align 4
  %40 = load %struct._color_ext_type*, %struct._color_ext_type** @_rl_color_ext_list, align 4
  store %struct._color_ext_type* %40, %struct._color_ext_type** %ext, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then157
  %41 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %cmp159 = icmp ne %struct._color_ext_type* %41, null
  br i1 %cmp159, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %42 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %ext161 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %42, i32 0, i32 0
  %len162 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %ext161, i32 0, i32 0
  %43 = load i32, i32* %len162, align 4
  %44 = load i32, i32* %len, align 4
  %cmp163 = icmp ule i32 %43, %44
  br i1 %cmp163, label %land.lhs.true165, label %if.end176

land.lhs.true165:                                 ; preds = %for.body
  %45 = load i8*, i8** %name, align 4
  %46 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %ext166 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %46, i32 0, i32 0
  %len167 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %ext166, i32 0, i32 0
  %47 = load i32, i32* %len167, align 4
  %idx.neg = sub i32 0, %47
  %add.ptr168 = getelementptr inbounds i8, i8* %45, i32 %idx.neg
  %48 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %ext169 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %48, i32 0, i32 0
  %string = getelementptr inbounds %struct.bin_str, %struct.bin_str* %ext169, i32 0, i32 1
  %49 = load i8*, i8** %string, align 4
  %50 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %ext170 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %50, i32 0, i32 0
  %len171 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %ext170, i32 0, i32 0
  %51 = load i32, i32* %len171, align 4
  %call172 = call i32 @strncmp(i8* %add.ptr168, i8* %49, i32 %51)
  %cmp173 = icmp eq i32 %call172, 0
  br i1 %cmp173, label %if.then175, label %if.end176

if.then175:                                       ; preds = %land.lhs.true165
  br label %for.end

if.end176:                                        ; preds = %land.lhs.true165, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end176
  %52 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %next = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %52, i32 0, i32 2
  %53 = load %struct._color_ext_type*, %struct._color_ext_type** %next, align 4
  store %struct._color_ext_type* %53, %struct._color_ext_type** %ext, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then175, %for.cond
  br label %if.end177

if.end177:                                        ; preds = %for.end, %if.end154
  %54 = load i8*, i8** %filename, align 4
  call void @free(i8* %54)
  %55 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %tobool178 = icmp ne %struct._color_ext_type* %55, null
  br i1 %tobool178, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end177
  %56 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %seq = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %56, i32 0, i32 1
  br label %cond.end

cond.false:                                       ; preds = %if.end177
  %57 = load i32, i32* %colored_filetype, align 4
  %arrayidx = getelementptr inbounds [0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 %57
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bin_str* [ %seq, %cond.true ], [ %arrayidx, %cond.false ]
  store %struct.bin_str* %cond, %struct.bin_str** %s, align 4
  %58 = load %struct.bin_str*, %struct.bin_str** %s, align 4
  %string179 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %58, i32 0, i32 1
  %59 = load i8*, i8** %string179, align 4
  %cmp180 = icmp ne i8* %59, null
  br i1 %cmp180, label %if.then182, label %if.else186

if.then182:                                       ; preds = %cond.end
  %call183 = call zeroext i1 @is_colored(i32 4)
  br i1 %call183, label %if.then184, label %if.end185

if.then184:                                       ; preds = %if.then182
  call void @restore_default_color()
  br label %if.end185

if.end185:                                        ; preds = %if.then184, %if.then182
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 0))
  %60 = load %struct.bin_str*, %struct.bin_str** %s, align 4
  call void @_rl_put_indicator(%struct.bin_str* %60)
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 1))
  store i1 false, i1* %retval, align 1
  br label %return

if.else186:                                       ; preds = %cond.end
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.else186, %if.end185
  %61 = load i1, i1* %retval, align 1
  ret i1 %61
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

declare i32 @lstat(i8*, %struct.stat*) #1

declare i32 @stat(i8*, %struct.stat*) #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare void @free(i8*) #1

; Function Attrs: noinline nounwind
define void @_rl_prep_non_filename_text() #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 2, i32 1), align 4
  %cmp = icmp ne i8* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 2))
  br label %if.end

if.else:                                          ; preds = %entry
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 0))
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 3))
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 1))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
