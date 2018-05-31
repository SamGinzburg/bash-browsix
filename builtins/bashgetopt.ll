; ModuleID = 'bashgetopt.c'
source_filename = "bashgetopt.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@lcurrent = global %struct.word_list* null, align 4
@internal_getopt.errstr = internal global [3 x i8] c"-\00\00", align 1
@list_optarg = common global i8* null, align 4
@loptend = common global %struct.word_list* null, align 4
@lhead = internal global %struct.word_list* null, align 4
@sp = internal global i32 0, align 4
@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@list_opttype = common global i32 0, align 4
@list_optopt = common global i32 0, align 4

; Function Attrs: noinline nounwind
define i32 @internal_getopt(%struct.word_list* %list, i8* %opts) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %opts.addr = alloca i8*, align 4
  %c = alloca i32, align 4
  %cp = alloca i8*, align 4
  %plus = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i8* %opts, i8** %opts.addr, align 4
  %0 = load i8*, i8** %opts.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 43
  %conv1 = zext i1 %cmp to i32
  store i32 %conv1, i32* %plus, align 4
  %2 = load i32, i32* %plus, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %opts.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %incdec.ptr, i8** %opts.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp2 = icmp eq %struct.word_list* %4, null
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i8* null, i8** @list_optarg, align 4
  store %struct.word_list* null, %struct.word_list** @loptend, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %6 = load %struct.word_list*, %struct.word_list** @lhead, align 4
  %cmp6 = icmp ne %struct.word_list* %5, %6
  br i1 %cmp6, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %7 = load %struct.word_list*, %struct.word_list** @lhead, align 4
  %cmp8 = icmp eq %struct.word_list* %7, null
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %lor.lhs.false, %if.end5
  store i32 1, i32* @sp, align 4
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %8, %struct.word_list** @lhead, align 4
  store %struct.word_list* %8, %struct.word_list** @lcurrent, align 4
  store %struct.word_list* null, %struct.word_list** @loptend, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %lor.lhs.false
  %9 = load i32, i32* @sp, align 4
  %cmp12 = icmp eq i32 %9, 1
  br i1 %cmp12, label %if.then14, label %if.end79

if.then14:                                        ; preds = %if.end11
  %10 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %cmp15 = icmp eq %struct.word_list* %10, null
  br i1 %cmp15, label %if.then35, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %if.then14
  %11 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %11, i32 0, i32 1
  %12 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word18 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %12, i32 0, i32 0
  %13 = load i8*, i8** %word18, align 4
  %14 = load i8, i8* %13, align 1
  %conv19 = sext i8 %14 to i32
  %cmp20 = icmp ne i32 %conv19, 45
  br i1 %cmp20, label %land.lhs.true, label %lor.lhs.false29

land.lhs.true:                                    ; preds = %lor.lhs.false17
  %15 = load i32, i32* %plus, align 4
  %tobool22 = icmp ne i32 %15, 0
  br i1 %tobool22, label %lor.lhs.false23, label %if.then35

lor.lhs.false23:                                  ; preds = %land.lhs.true
  %16 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word24 = getelementptr inbounds %struct.word_list, %struct.word_list* %16, i32 0, i32 1
  %17 = load %struct.word_desc*, %struct.word_desc** %word24, align 4
  %word25 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %17, i32 0, i32 0
  %18 = load i8*, i8** %word25, align 4
  %19 = load i8, i8* %18, align 1
  %conv26 = sext i8 %19 to i32
  %cmp27 = icmp ne i32 %conv26, 43
  br i1 %cmp27, label %if.then35, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false23, %lor.lhs.false17
  %20 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word30 = getelementptr inbounds %struct.word_list, %struct.word_list* %20, i32 0, i32 1
  %21 = load %struct.word_desc*, %struct.word_desc** %word30, align 4
  %word31 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %21, i32 0, i32 0
  %22 = load i8*, i8** %word31, align 4
  %arrayidx = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx, align 1
  %conv32 = sext i8 %23 to i32
  %cmp33 = icmp eq i32 %conv32, 0
  br i1 %cmp33, label %if.then35, label %if.else

if.then35:                                        ; preds = %lor.lhs.false29, %lor.lhs.false23, %land.lhs.true, %if.then14
  store %struct.word_list* null, %struct.word_list** @lhead, align 4
  %24 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  store %struct.word_list* %24, %struct.word_list** @loptend, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false29
  %25 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word36 = getelementptr inbounds %struct.word_list, %struct.word_list* %25, i32 0, i32 1
  %26 = load %struct.word_desc*, %struct.word_desc** %word36, align 4
  %word37 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %26, i32 0, i32 0
  %27 = load i8*, i8** %word37, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %28 to i32
  %29 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv40 = sext i8 %29 to i32
  %cmp41 = icmp eq i32 %conv39, %conv40
  br i1 %cmp41, label %land.lhs.true43, label %if.else49

land.lhs.true43:                                  ; preds = %if.else
  %30 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word44 = getelementptr inbounds %struct.word_list, %struct.word_list* %30, i32 0, i32 1
  %31 = load %struct.word_desc*, %struct.word_desc** %word44, align 4
  %word45 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %31, i32 0, i32 0
  %32 = load i8*, i8** %word45, align 4
  %call = call i32 @strcmp(i8* %32, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %cmp46 = icmp eq i32 %call, 0
  br i1 %cmp46, label %if.then48, label %if.else49

if.then48:                                        ; preds = %land.lhs.true43
  store %struct.word_list* null, %struct.word_list** @lhead, align 4
  %33 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  store %struct.word_list* %33, %struct.word_list** @loptend, align 4
  store i32 -99, i32* %retval, align 4
  br label %return

if.else49:                                        ; preds = %land.lhs.true43, %if.else
  %34 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word50 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 1
  %35 = load %struct.word_desc*, %struct.word_desc** %word50, align 4
  %word51 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %35, i32 0, i32 0
  %36 = load i8*, i8** %word51, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %36, i32 0
  %37 = load i8, i8* %arrayidx52, align 1
  %conv53 = sext i8 %37 to i32
  %cmp54 = icmp eq i32 %conv53, 45
  br i1 %cmp54, label %land.lhs.true56, label %if.end71

land.lhs.true56:                                  ; preds = %if.else49
  %38 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word57 = getelementptr inbounds %struct.word_list, %struct.word_list* %38, i32 0, i32 1
  %39 = load %struct.word_desc*, %struct.word_desc** %word57, align 4
  %word58 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %39, i32 0, i32 0
  %40 = load i8*, i8** %word58, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %40, i32 1
  %41 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %41 to i32
  %cmp61 = icmp eq i32 %conv60, 45
  br i1 %cmp61, label %land.lhs.true63, label %if.end71

land.lhs.true63:                                  ; preds = %land.lhs.true56
  %42 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word64 = getelementptr inbounds %struct.word_list, %struct.word_list* %42, i32 0, i32 1
  %43 = load %struct.word_desc*, %struct.word_desc** %word64, align 4
  %word65 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %43, i32 0, i32 0
  %44 = load i8*, i8** %word65, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %44, i32 2
  %45 = load i8, i8* %arrayidx66, align 1
  %conv67 = sext i8 %45 to i32
  %cmp68 = icmp eq i32 %conv67, 0
  br i1 %cmp68, label %if.then70, label %if.end71

if.then70:                                        ; preds = %land.lhs.true63
  store %struct.word_list* null, %struct.word_list** @lhead, align 4
  %46 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %46, i32 0, i32 0
  %47 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %47, %struct.word_list** @loptend, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end71:                                         ; preds = %land.lhs.true63, %land.lhs.true56, %if.else49
  br label %if.end72

if.end72:                                         ; preds = %if.end71
  br label %if.end73

if.end73:                                         ; preds = %if.end72
  %48 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word74 = getelementptr inbounds %struct.word_list, %struct.word_list* %48, i32 0, i32 1
  %49 = load %struct.word_desc*, %struct.word_desc** %word74, align 4
  %word75 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %49, i32 0, i32 0
  %50 = load i8*, i8** %word75, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %50, i32 0
  %51 = load i8, i8* %arrayidx76, align 1
  %conv77 = sext i8 %51 to i32
  store i32 %conv77, i32* @list_opttype, align 4
  %conv78 = trunc i32 %conv77 to i8
  store i8 %conv78, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @internal_getopt.errstr, i32 0, i32 0), align 1
  br label %if.end79

if.end79:                                         ; preds = %if.end73, %if.end11
  %52 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word80 = getelementptr inbounds %struct.word_list, %struct.word_list* %52, i32 0, i32 1
  %53 = load %struct.word_desc*, %struct.word_desc** %word80, align 4
  %word81 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %53, i32 0, i32 0
  %54 = load i8*, i8** %word81, align 4
  %55 = load i32, i32* @sp, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %54, i32 %55
  %56 = load i8, i8* %arrayidx82, align 1
  %conv83 = sext i8 %56 to i32
  store i32 %conv83, i32* %c, align 4
  store i32 %conv83, i32* @list_optopt, align 4
  %57 = load i32, i32* %c, align 4
  %cmp84 = icmp eq i32 %57, 58
  br i1 %cmp84, label %if.then90, label %lor.lhs.false86

lor.lhs.false86:                                  ; preds = %if.end79
  %58 = load i8*, i8** %opts.addr, align 4
  %59 = load i32, i32* %c, align 4
  %call87 = call i8* @strchr(i8* %58, i32 %59)
  store i8* %call87, i8** %cp, align 4
  %cmp88 = icmp eq i8* %call87, null
  br i1 %cmp88, label %if.then90, label %if.end105

if.then90:                                        ; preds = %lor.lhs.false86, %if.end79
  %60 = load i32, i32* %c, align 4
  %conv91 = trunc i32 %60 to i8
  store i8 %conv91, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @internal_getopt.errstr, i32 0, i32 1), align 1
  call void @sh_invalidopt(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @internal_getopt.errstr, i32 0, i32 0))
  %61 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word92 = getelementptr inbounds %struct.word_list, %struct.word_list* %61, i32 0, i32 1
  %62 = load %struct.word_desc*, %struct.word_desc** %word92, align 4
  %word93 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %62, i32 0, i32 0
  %63 = load i8*, i8** %word93, align 4
  %64 = load i32, i32* @sp, align 4
  %inc = add nsw i32 %64, 1
  store i32 %inc, i32* @sp, align 4
  %arrayidx94 = getelementptr inbounds i8, i8* %63, i32 %inc
  %65 = load i8, i8* %arrayidx94, align 1
  %conv95 = sext i8 %65 to i32
  %cmp96 = icmp eq i32 %conv95, 0
  br i1 %cmp96, label %if.then98, label %if.end100

if.then98:                                        ; preds = %if.then90
  %66 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next99 = getelementptr inbounds %struct.word_list, %struct.word_list* %66, i32 0, i32 0
  %67 = load %struct.word_list*, %struct.word_list** %next99, align 4
  store %struct.word_list* %67, %struct.word_list** @lcurrent, align 4
  store i32 1, i32* @sp, align 4
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %if.then90
  store i8* null, i8** @list_optarg, align 4
  %68 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %tobool101 = icmp ne %struct.word_list* %68, null
  br i1 %tobool101, label %if.then102, label %if.end104

if.then102:                                       ; preds = %if.end100
  %69 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next103 = getelementptr inbounds %struct.word_list, %struct.word_list* %69, i32 0, i32 0
  %70 = load %struct.word_list*, %struct.word_list** %next103, align 4
  store %struct.word_list* %70, %struct.word_list** @loptend, align 4
  br label %if.end104

if.end104:                                        ; preds = %if.then102, %if.end100
  store i32 63, i32* %retval, align 4
  br label %return

if.end105:                                        ; preds = %lor.lhs.false86
  %71 = load i8*, i8** %cp, align 4
  %incdec.ptr106 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %incdec.ptr106, i8** %cp, align 4
  %72 = load i8, i8* %incdec.ptr106, align 1
  %conv107 = sext i8 %72 to i32
  %cmp108 = icmp eq i32 %conv107, 58
  br i1 %cmp108, label %if.then114, label %lor.lhs.false110

lor.lhs.false110:                                 ; preds = %if.end105
  %73 = load i8*, i8** %cp, align 4
  %74 = load i8, i8* %73, align 1
  %conv111 = sext i8 %74 to i32
  %cmp112 = icmp eq i32 %conv111, 59
  br i1 %cmp112, label %if.then114, label %if.else171

if.then114:                                       ; preds = %lor.lhs.false110, %if.end105
  %75 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word115 = getelementptr inbounds %struct.word_list, %struct.word_list* %75, i32 0, i32 1
  %76 = load %struct.word_desc*, %struct.word_desc** %word115, align 4
  %word116 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %76, i32 0, i32 0
  %77 = load i8*, i8** %word116, align 4
  %78 = load i32, i32* @sp, align 4
  %add = add nsw i32 %78, 1
  %arrayidx117 = getelementptr inbounds i8, i8* %77, i32 %add
  %79 = load i8, i8* %arrayidx117, align 1
  %tobool118 = icmp ne i8 %79, 0
  br i1 %tobool118, label %if.then119, label %if.else124

if.then119:                                       ; preds = %if.then114
  %80 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word120 = getelementptr inbounds %struct.word_list, %struct.word_list* %80, i32 0, i32 1
  %81 = load %struct.word_desc*, %struct.word_desc** %word120, align 4
  %word121 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %81, i32 0, i32 0
  %82 = load i8*, i8** %word121, align 4
  %83 = load i32, i32* @sp, align 4
  %add.ptr = getelementptr inbounds i8, i8* %82, i32 %83
  %add.ptr122 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  store i8* %add.ptr122, i8** @list_optarg, align 4
  %84 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next123 = getelementptr inbounds %struct.word_list, %struct.word_list* %84, i32 0, i32 0
  %85 = load %struct.word_list*, %struct.word_list** %next123, align 4
  store %struct.word_list* %85, %struct.word_list** @lcurrent, align 4
  br label %if.end170

if.else124:                                       ; preds = %if.then114
  %86 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next125 = getelementptr inbounds %struct.word_list, %struct.word_list* %86, i32 0, i32 0
  %87 = load %struct.word_list*, %struct.word_list** %next125, align 4
  %tobool126 = icmp ne %struct.word_list* %87, null
  br i1 %tobool126, label %land.lhs.true127, label %if.else160

land.lhs.true127:                                 ; preds = %if.else124
  %88 = load i8*, i8** %cp, align 4
  %89 = load i8, i8* %88, align 1
  %conv128 = sext i8 %89 to i32
  %cmp129 = icmp eq i32 %conv128, 58
  br i1 %cmp129, label %if.then155, label %lor.lhs.false131

lor.lhs.false131:                                 ; preds = %land.lhs.true127
  %90 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next132 = getelementptr inbounds %struct.word_list, %struct.word_list* %90, i32 0, i32 0
  %91 = load %struct.word_list*, %struct.word_list** %next132, align 4
  %word133 = getelementptr inbounds %struct.word_list, %struct.word_list* %91, i32 0, i32 1
  %92 = load %struct.word_desc*, %struct.word_desc** %word133, align 4
  %word134 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %92, i32 0, i32 0
  %93 = load i8*, i8** %word134, align 4
  %94 = load i8, i8* %93, align 1
  %conv135 = sext i8 %94 to i32
  %cmp136 = icmp ne i32 %conv135, 45
  br i1 %cmp136, label %land.lhs.true138, label %lor.lhs.false147

land.lhs.true138:                                 ; preds = %lor.lhs.false131
  %95 = load i32, i32* %plus, align 4
  %tobool139 = icmp ne i32 %95, 0
  br i1 %tobool139, label %lor.lhs.false140, label %if.then155

lor.lhs.false140:                                 ; preds = %land.lhs.true138
  %96 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next141 = getelementptr inbounds %struct.word_list, %struct.word_list* %96, i32 0, i32 0
  %97 = load %struct.word_list*, %struct.word_list** %next141, align 4
  %word142 = getelementptr inbounds %struct.word_list, %struct.word_list* %97, i32 0, i32 1
  %98 = load %struct.word_desc*, %struct.word_desc** %word142, align 4
  %word143 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %98, i32 0, i32 0
  %99 = load i8*, i8** %word143, align 4
  %100 = load i8, i8* %99, align 1
  %conv144 = sext i8 %100 to i32
  %cmp145 = icmp ne i32 %conv144, 43
  br i1 %cmp145, label %if.then155, label %lor.lhs.false147

lor.lhs.false147:                                 ; preds = %lor.lhs.false140, %lor.lhs.false131
  %101 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next148 = getelementptr inbounds %struct.word_list, %struct.word_list* %101, i32 0, i32 0
  %102 = load %struct.word_list*, %struct.word_list** %next148, align 4
  %word149 = getelementptr inbounds %struct.word_list, %struct.word_list* %102, i32 0, i32 1
  %103 = load %struct.word_desc*, %struct.word_desc** %word149, align 4
  %word150 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %103, i32 0, i32 0
  %104 = load i8*, i8** %word150, align 4
  %arrayidx151 = getelementptr inbounds i8, i8* %104, i32 1
  %105 = load i8, i8* %arrayidx151, align 1
  %conv152 = sext i8 %105 to i32
  %cmp153 = icmp eq i32 %conv152, 0
  br i1 %cmp153, label %if.then155, label %if.else160

if.then155:                                       ; preds = %lor.lhs.false147, %lor.lhs.false140, %land.lhs.true138, %land.lhs.true127
  %106 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next156 = getelementptr inbounds %struct.word_list, %struct.word_list* %106, i32 0, i32 0
  %107 = load %struct.word_list*, %struct.word_list** %next156, align 4
  store %struct.word_list* %107, %struct.word_list** @lcurrent, align 4
  %108 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word157 = getelementptr inbounds %struct.word_list, %struct.word_list* %108, i32 0, i32 1
  %109 = load %struct.word_desc*, %struct.word_desc** %word157, align 4
  %word158 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %109, i32 0, i32 0
  %110 = load i8*, i8** %word158, align 4
  store i8* %110, i8** @list_optarg, align 4
  %111 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next159 = getelementptr inbounds %struct.word_list, %struct.word_list* %111, i32 0, i32 0
  %112 = load %struct.word_list*, %struct.word_list** %next159, align 4
  store %struct.word_list* %112, %struct.word_list** @lcurrent, align 4
  br label %if.end169

if.else160:                                       ; preds = %lor.lhs.false147, %if.else124
  %113 = load i8*, i8** %cp, align 4
  %114 = load i8, i8* %113, align 1
  %conv161 = sext i8 %114 to i32
  %cmp162 = icmp eq i32 %conv161, 59
  br i1 %cmp162, label %if.then164, label %if.else166

if.then164:                                       ; preds = %if.else160
  store i8* null, i8** @list_optarg, align 4
  %115 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next165 = getelementptr inbounds %struct.word_list, %struct.word_list* %115, i32 0, i32 0
  %116 = load %struct.word_list*, %struct.word_list** %next165, align 4
  store %struct.word_list* %116, %struct.word_list** @lcurrent, align 4
  br label %if.end168

if.else166:                                       ; preds = %if.else160
  %117 = load i32, i32* %c, align 4
  %conv167 = trunc i32 %117 to i8
  store i8 %conv167, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @internal_getopt.errstr, i32 0, i32 1), align 1
  call void @sh_needarg(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @internal_getopt.errstr, i32 0, i32 0))
  store i32 1, i32* @sp, align 4
  store i8* null, i8** @list_optarg, align 4
  store i32 63, i32* %retval, align 4
  br label %return

if.end168:                                        ; preds = %if.then164
  br label %if.end169

if.end169:                                        ; preds = %if.end168, %if.then155
  br label %if.end170

if.end170:                                        ; preds = %if.end169, %if.then119
  store i32 1, i32* @sp, align 4
  br label %if.end235

if.else171:                                       ; preds = %lor.lhs.false110
  %118 = load i8*, i8** %cp, align 4
  %119 = load i8, i8* %118, align 1
  %conv172 = sext i8 %119 to i32
  %cmp173 = icmp eq i32 %conv172, 35
  br i1 %cmp173, label %if.then175, label %if.else223

if.then175:                                       ; preds = %if.else171
  %120 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word176 = getelementptr inbounds %struct.word_list, %struct.word_list* %120, i32 0, i32 1
  %121 = load %struct.word_desc*, %struct.word_desc** %word176, align 4
  %word177 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %121, i32 0, i32 0
  %122 = load i8*, i8** %word177, align 4
  %123 = load i32, i32* @sp, align 4
  %add178 = add nsw i32 %123, 1
  %arrayidx179 = getelementptr inbounds i8, i8* %122, i32 %add178
  %124 = load i8, i8* %arrayidx179, align 1
  %tobool180 = icmp ne i8 %124, 0
  br i1 %tobool180, label %if.then181, label %if.else205

if.then181:                                       ; preds = %if.then175
  %125 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word182 = getelementptr inbounds %struct.word_list, %struct.word_list* %125, i32 0, i32 1
  %126 = load %struct.word_desc*, %struct.word_desc** %word182, align 4
  %word183 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %126, i32 0, i32 0
  %127 = load i8*, i8** %word183, align 4
  %128 = load i32, i32* @sp, align 4
  %add184 = add nsw i32 %128, 1
  %arrayidx185 = getelementptr inbounds i8, i8* %127, i32 %add184
  %129 = load i8, i8* %arrayidx185, align 1
  %conv186 = sext i8 %129 to i32
  %cmp187 = icmp sge i32 %conv186, 48
  br i1 %cmp187, label %land.lhs.true189, label %if.else203

land.lhs.true189:                                 ; preds = %if.then181
  %130 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word190 = getelementptr inbounds %struct.word_list, %struct.word_list* %130, i32 0, i32 1
  %131 = load %struct.word_desc*, %struct.word_desc** %word190, align 4
  %word191 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %131, i32 0, i32 0
  %132 = load i8*, i8** %word191, align 4
  %133 = load i32, i32* @sp, align 4
  %add192 = add nsw i32 %133, 1
  %arrayidx193 = getelementptr inbounds i8, i8* %132, i32 %add192
  %134 = load i8, i8* %arrayidx193, align 1
  %conv194 = sext i8 %134 to i32
  %cmp195 = icmp sle i32 %conv194, 57
  br i1 %cmp195, label %if.then197, label %if.else203

if.then197:                                       ; preds = %land.lhs.true189
  %135 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word198 = getelementptr inbounds %struct.word_list, %struct.word_list* %135, i32 0, i32 1
  %136 = load %struct.word_desc*, %struct.word_desc** %word198, align 4
  %word199 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %136, i32 0, i32 0
  %137 = load i8*, i8** %word199, align 4
  %138 = load i32, i32* @sp, align 4
  %add.ptr200 = getelementptr inbounds i8, i8* %137, i32 %138
  %add.ptr201 = getelementptr inbounds i8, i8* %add.ptr200, i32 1
  store i8* %add.ptr201, i8** @list_optarg, align 4
  %139 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next202 = getelementptr inbounds %struct.word_list, %struct.word_list* %139, i32 0, i32 0
  %140 = load %struct.word_list*, %struct.word_list** %next202, align 4
  store %struct.word_list* %140, %struct.word_list** @lcurrent, align 4
  br label %if.end204

if.else203:                                       ; preds = %land.lhs.true189, %if.then181
  store i8* null, i8** @list_optarg, align 4
  br label %if.end204

if.end204:                                        ; preds = %if.else203, %if.then197
  br label %if.end222

if.else205:                                       ; preds = %if.then175
  %141 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next206 = getelementptr inbounds %struct.word_list, %struct.word_list* %141, i32 0, i32 0
  %142 = load %struct.word_list*, %struct.word_list** %next206, align 4
  %tobool207 = icmp ne %struct.word_list* %142, null
  br i1 %tobool207, label %land.lhs.true208, label %if.else219

land.lhs.true208:                                 ; preds = %if.else205
  %143 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next209 = getelementptr inbounds %struct.word_list, %struct.word_list* %143, i32 0, i32 0
  %144 = load %struct.word_list*, %struct.word_list** %next209, align 4
  %word210 = getelementptr inbounds %struct.word_list, %struct.word_list* %144, i32 0, i32 1
  %145 = load %struct.word_desc*, %struct.word_desc** %word210, align 4
  %word211 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %145, i32 0, i32 0
  %146 = load i8*, i8** %word211, align 4
  %call212 = call i32 @legal_number(i8* %146, i64* null)
  %tobool213 = icmp ne i32 %call212, 0
  br i1 %tobool213, label %if.then214, label %if.else219

if.then214:                                       ; preds = %land.lhs.true208
  %147 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next215 = getelementptr inbounds %struct.word_list, %struct.word_list* %147, i32 0, i32 0
  %148 = load %struct.word_list*, %struct.word_list** %next215, align 4
  store %struct.word_list* %148, %struct.word_list** @lcurrent, align 4
  %149 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word216 = getelementptr inbounds %struct.word_list, %struct.word_list* %149, i32 0, i32 1
  %150 = load %struct.word_desc*, %struct.word_desc** %word216, align 4
  %word217 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %150, i32 0, i32 0
  %151 = load i8*, i8** %word217, align 4
  store i8* %151, i8** @list_optarg, align 4
  %152 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next218 = getelementptr inbounds %struct.word_list, %struct.word_list* %152, i32 0, i32 0
  %153 = load %struct.word_list*, %struct.word_list** %next218, align 4
  store %struct.word_list* %153, %struct.word_list** @lcurrent, align 4
  br label %if.end221

if.else219:                                       ; preds = %land.lhs.true208, %if.else205
  %154 = load i32, i32* %c, align 4
  %conv220 = trunc i32 %154 to i8
  store i8 %conv220, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @internal_getopt.errstr, i32 0, i32 1), align 1
  call void @sh_neednumarg(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @internal_getopt.errstr, i32 0, i32 0))
  store i32 1, i32* @sp, align 4
  store i8* null, i8** @list_optarg, align 4
  store i32 63, i32* %retval, align 4
  br label %return

if.end221:                                        ; preds = %if.then214
  br label %if.end222

if.end222:                                        ; preds = %if.end221, %if.end204
  br label %if.end234

if.else223:                                       ; preds = %if.else171
  %155 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %word224 = getelementptr inbounds %struct.word_list, %struct.word_list* %155, i32 0, i32 1
  %156 = load %struct.word_desc*, %struct.word_desc** %word224, align 4
  %word225 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %156, i32 0, i32 0
  %157 = load i8*, i8** %word225, align 4
  %158 = load i32, i32* @sp, align 4
  %inc226 = add nsw i32 %158, 1
  store i32 %inc226, i32* @sp, align 4
  %arrayidx227 = getelementptr inbounds i8, i8* %157, i32 %inc226
  %159 = load i8, i8* %arrayidx227, align 1
  %conv228 = sext i8 %159 to i32
  %cmp229 = icmp eq i32 %conv228, 0
  br i1 %cmp229, label %if.then231, label %if.end233

if.then231:                                       ; preds = %if.else223
  store i32 1, i32* @sp, align 4
  %160 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  %next232 = getelementptr inbounds %struct.word_list, %struct.word_list* %160, i32 0, i32 0
  %161 = load %struct.word_list*, %struct.word_list** %next232, align 4
  store %struct.word_list* %161, %struct.word_list** @lcurrent, align 4
  br label %if.end233

if.end233:                                        ; preds = %if.then231, %if.else223
  store i8* null, i8** @list_optarg, align 4
  br label %if.end234

if.end234:                                        ; preds = %if.end233, %if.end222
  br label %if.end235

if.end235:                                        ; preds = %if.end234, %if.end170
  %162 = load i32, i32* %c, align 4
  store i32 %162, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end235, %if.else219, %if.else166, %if.end104, %if.then70, %if.then48, %if.then35, %if.then4
  %163 = load i32, i32* %retval, align 4
  ret i32 %163
}

declare i32 @strcmp(i8*, i8*) #1

declare i8* @strchr(i8*, i32) #1

declare void @sh_invalidopt(i8*) #1

declare void @sh_needarg(i8*) #1

declare i32 @legal_number(i8*, i64*) #1

declare void @sh_neednumarg(i8*) #1

; Function Attrs: noinline nounwind
define void @reset_internal_getopt() #0 {
entry:
  store %struct.word_list* null, %struct.word_list** @loptend, align 4
  store %struct.word_list* null, %struct.word_list** @lcurrent, align 4
  store %struct.word_list* null, %struct.word_list** @lhead, align 4
  store i32 1, i32* @sp, align 4
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
