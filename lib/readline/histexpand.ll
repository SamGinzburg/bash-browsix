; ModuleID = 'histexpand.c'
source_filename = "histexpand.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._hist_entry = type { i8*, i8*, i8* }
%struct.__mbstate_t = type { i32, i32 }

@history_expansion_char = global i8 33, align 1
@history_subst_char = global i8 94, align 1
@history_comment_char = global i8 0, align 1
@.str = private unnamed_addr constant [6 x i8] c" \09\0A\0D=\00", align 1
@history_no_expand_chars = global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), align 4
@history_quotes_inhibit_expansion = global i32 0, align 4
@.str.1 = private unnamed_addr constant [11 x i8] c" \09\0A;&()|<>\00", align 1
@history_word_delimiters = global i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), align 4
@history_base = external global i32, align 4
@history_length = external global i32, align 4
@rl_byte_oriented = external global i32, align 4
@history_event_delimiter_chars = internal global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), align 4
@history_search_delimiter_chars = external global i8*, align 4
@search_string = internal global i8* null, align 4
@history_offset = external global i32, align 4
@search_match = internal global i8* null, align 4
@history_inhibit_expansion_function = common global i32 (i8*, i32)* null, align 4
@.str.2 = private unnamed_addr constant [6 x i8] c"^$*%-\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c":$*%^\00", align 1
@error_pointer = internal global i8 0, align 1
@subst_lhs_len = internal global i32 0, align 4
@subst_lhs = internal global i8* null, align 4
@subst_rhs = internal global i8* null, align 4
@subst_rhs_len = internal global i32 0, align 4
@.str.4 = private unnamed_addr constant [16 x i8] c"event not found\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"bad word specifier\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"substitution failed\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"unrecognized history modifier\00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"no previous substitution\00", align 1
@.str.9 = private unnamed_addr constant [24 x i8] c"unknown expansion error\00", align 1
@.str.10 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"()\0A\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"<>;&|$\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"!@?+*\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"\22'`\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"\5C`\22$\00", align 1

; Function Attrs: noinline nounwind
define i8* @get_history_event(i8* %string, i32* %caller_index, i32 %delimiting_quote) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %caller_index.addr = alloca i32*, align 4
  %delimiting_quote.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %entry1 = alloca %struct._hist_entry*, align 4
  %which = alloca i32, align 4
  %sign = alloca i32, align 4
  %local_index = alloca i32, align 4
  %substring_okay = alloca i32, align 4
  %search_func = alloca i32 (i8*, i32)*, align 4
  %temp = alloca i8*, align 4
  %v = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32* %caller_index, i32** %caller_index.addr, align 4
  store i32 %delimiting_quote, i32* %delimiting_quote.addr, align 4
  %0 = load i32*, i32** %caller_index.addr, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* %i, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %5 = load i8, i8* @history_expansion_char, align 1
  %conv2 = sext i8 %5 to i32
  %cmp = icmp ne i32 %conv, %conv2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  store i32 1, i32* %sign, align 4
  store i32 0, i32* %substring_okay, align 4
  %7 = load i8*, i8** %string.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %9 to i32
  %10 = load i8, i8* @history_expansion_char, align 1
  %conv6 = sext i8 %10 to i32
  %cmp7 = icmp eq i32 %conv5, %conv6
  br i1 %cmp7, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %11, 1
  store i32 %inc10, i32* %i, align 4
  %12 = load i32, i32* @history_base, align 4
  %13 = load i32, i32* @history_length, align 4
  %sub = sub nsw i32 %13, 1
  %add = add nsw i32 %12, %sub
  store i32 %add, i32* %which, align 4
  %14 = load i32, i32* %i, align 4
  %15 = load i32*, i32** %caller_index.addr, align 4
  store i32 %14, i32* %15, align 4
  %16 = load i32, i32* %which, align 4
  %call = call %struct._hist_entry* @history_get(i32 %16)
  store %struct._hist_entry* %call, %struct._hist_entry** %entry1, align 4
  %tobool = icmp ne %struct._hist_entry* %call, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then9
  %17 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %17, i32 0, i32 0
  %18 = load i8*, i8** %line, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %18, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end
  %19 = load i8*, i8** %string.addr, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %19, i32 %20
  %21 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %21 to i32
  %cmp14 = icmp eq i32 %conv13, 45
  br i1 %cmp14, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end11
  store i32 -1, i32* %sign, align 4
  %22 = load i32, i32* %i, align 4
  %inc17 = add nsw i32 %22, 1
  store i32 %inc17, i32* %i, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end11
  %23 = load i8*, i8** %string.addr, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %25 to i32
  %cmp21 = icmp sge i32 %conv20, 48
  br i1 %cmp21, label %land.lhs.true, label %if.end54

land.lhs.true:                                    ; preds = %if.end18
  %26 = load i8*, i8** %string.addr, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %26, i32 %27
  %28 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %28 to i32
  %cmp25 = icmp sle i32 %conv24, 57
  br i1 %cmp25, label %if.then27, label %if.end54

if.then27:                                        ; preds = %land.lhs.true
  store i32 0, i32* %which, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then27
  %29 = load i8*, i8** %string.addr, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %31 to i32
  %cmp30 = icmp sge i32 %conv29, 48
  br i1 %cmp30, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %32 = load i8*, i8** %string.addr, align 4
  %33 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %32, i32 %33
  %34 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %34 to i32
  %cmp34 = icmp sle i32 %conv33, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %35 = phi i1 [ false, %for.cond ], [ %cmp34, %land.rhs ]
  br i1 %35, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %36 = load i32, i32* %which, align 4
  %mul = mul nsw i32 %36, 10
  %37 = load i8*, i8** %string.addr, align 4
  %38 = load i32, i32* %i, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %37, i32 %38
  %39 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %39 to i32
  %sub38 = sub nsw i32 %conv37, 48
  %add39 = add nsw i32 %mul, %sub38
  store i32 %add39, i32* %which, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %40 = load i32, i32* %i, align 4
  %inc40 = add nsw i32 %40, 1
  store i32 %inc40, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %41 = load i32, i32* %i, align 4
  %42 = load i32*, i32** %caller_index.addr, align 4
  store i32 %41, i32* %42, align 4
  %43 = load i32, i32* %sign, align 4
  %cmp41 = icmp slt i32 %43, 0
  br i1 %cmp41, label %if.then43, label %if.end46

if.then43:                                        ; preds = %for.end
  %44 = load i32, i32* @history_length, align 4
  %45 = load i32, i32* @history_base, align 4
  %add44 = add nsw i32 %44, %45
  %46 = load i32, i32* %which, align 4
  %sub45 = sub nsw i32 %add44, %46
  store i32 %sub45, i32* %which, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.then43, %for.end
  %47 = load i32, i32* %which, align 4
  %call47 = call %struct._hist_entry* @history_get(i32 %47)
  store %struct._hist_entry* %call47, %struct._hist_entry** %entry1, align 4
  %tobool48 = icmp ne %struct._hist_entry* %call47, null
  br i1 %tobool48, label %cond.true49, label %cond.false51

cond.true49:                                      ; preds = %if.end46
  %48 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %line50 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %48, i32 0, i32 0
  %49 = load i8*, i8** %line50, align 4
  br label %cond.end52

cond.false51:                                     ; preds = %if.end46
  br label %cond.end52

cond.end52:                                       ; preds = %cond.false51, %cond.true49
  %cond53 = phi i8* [ %49, %cond.true49 ], [ null, %cond.false51 ]
  store i8* %cond53, i8** %retval, align 4
  br label %return

if.end54:                                         ; preds = %land.lhs.true, %if.end18
  %50 = load i8*, i8** %string.addr, align 4
  %51 = load i32, i32* %i, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %50, i32 %51
  %52 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %52 to i32
  %cmp57 = icmp eq i32 %conv56, 63
  br i1 %cmp57, label %if.then59, label %if.end62

if.then59:                                        ; preds = %if.end54
  %53 = load i32, i32* %substring_okay, align 4
  %inc60 = add nsw i32 %53, 1
  store i32 %inc60, i32* %substring_okay, align 4
  %54 = load i32, i32* %i, align 4
  %inc61 = add nsw i32 %54, 1
  store i32 %inc61, i32* %i, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.then59, %if.end54
  %55 = load i32, i32* %i, align 4
  store i32 %55, i32* %local_index, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc136, %if.end62
  %56 = load i8*, i8** %string.addr, align 4
  %57 = load i32, i32* %i, align 4
  %arrayidx64 = getelementptr inbounds i8, i8* %56, i32 %57
  %58 = load i8, i8* %arrayidx64, align 1
  store i8 %58, i8* %c, align 1
  %tobool65 = icmp ne i8 %58, 0
  br i1 %tobool65, label %for.body66, label %for.end138

for.body66:                                       ; preds = %for.cond63
  %call67 = call i32 @__ctype_get_mb_cur_max()
  %cmp68 = icmp ugt i32 %call67, 1
  br i1 %cmp68, label %land.lhs.true70, label %if.end82

land.lhs.true70:                                  ; preds = %for.body66
  %59 = load i32, i32* @rl_byte_oriented, align 4
  %cmp71 = icmp eq i32 %59, 0
  br i1 %cmp71, label %if.then73, label %if.end82

if.then73:                                        ; preds = %land.lhs.true70
  %60 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %60, i8 0, i32 8, i32 4, i1 false)
  %61 = load i8*, i8** %string.addr, align 4
  %62 = load i32, i32* %i, align 4
  %call74 = call i32 @_rl_adjust_point(i8* %61, i32 %62, %struct.__mbstate_t* %ps)
  %63 = load i8*, i8** %string.addr, align 4
  %64 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %63, i32 %64
  %call75 = call i32 @_rl_get_char_len(i8* %add.ptr, %struct.__mbstate_t* %ps)
  store i32 %call75, i32* %v, align 4
  %cmp76 = icmp sgt i32 %call75, 1
  br i1 %cmp76, label %if.then78, label %if.end81

if.then78:                                        ; preds = %if.then73
  %65 = load i32, i32* %v, align 4
  %sub79 = sub nsw i32 %65, 1
  %66 = load i32, i32* %i, align 4
  %add80 = add nsw i32 %66, %sub79
  store i32 %add80, i32* %i, align 4
  br label %for.inc136

if.end81:                                         ; preds = %if.then73
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %land.lhs.true70, %for.body66
  %67 = load i32, i32* %substring_okay, align 4
  %tobool83 = icmp ne i32 %67, 0
  br i1 %tobool83, label %lor.lhs.false122, label %land.lhs.true84

land.lhs.true84:                                  ; preds = %if.end82
  %68 = load i8, i8* %c, align 1
  %conv85 = sext i8 %68 to i32
  %cmp86 = icmp eq i32 %conv85, 32
  br i1 %cmp86, label %if.then134, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true84
  %69 = load i8, i8* %c, align 1
  %conv88 = sext i8 %69 to i32
  %cmp89 = icmp eq i32 %conv88, 9
  br i1 %cmp89, label %if.then134, label %lor.lhs.false91

lor.lhs.false91:                                  ; preds = %lor.lhs.false
  %70 = load i8, i8* %c, align 1
  %conv92 = sext i8 %70 to i32
  %cmp93 = icmp eq i32 %conv92, 58
  br i1 %cmp93, label %if.then134, label %lor.lhs.false95

lor.lhs.false95:                                  ; preds = %lor.lhs.false91
  %71 = load i8*, i8** @history_event_delimiter_chars, align 4
  %tobool96 = icmp ne i8* %71, null
  br i1 %tobool96, label %land.lhs.true97, label %lor.lhs.false106

land.lhs.true97:                                  ; preds = %lor.lhs.false95
  %72 = load i8, i8* %c, align 1
  %conv98 = sext i8 %72 to i32
  %tobool99 = icmp ne i32 %conv98, 0
  br i1 %tobool99, label %cond.true100, label %cond.false105

cond.true100:                                     ; preds = %land.lhs.true97
  %73 = load i8*, i8** @history_event_delimiter_chars, align 4
  %74 = load i8, i8* %c, align 1
  %conv101 = sext i8 %74 to i32
  %call102 = call i8* @strchr(i8* %73, i32 %conv101)
  %cmp103 = icmp ne i8* %call102, null
  br i1 %cmp103, label %if.then134, label %lor.lhs.false106

cond.false105:                                    ; preds = %land.lhs.true97
  br i1 false, label %if.then134, label %lor.lhs.false106

lor.lhs.false106:                                 ; preds = %cond.false105, %cond.true100, %lor.lhs.false95
  %75 = load i8*, i8** @history_search_delimiter_chars, align 4
  %tobool107 = icmp ne i8* %75, null
  br i1 %tobool107, label %land.lhs.true108, label %lor.lhs.false117

land.lhs.true108:                                 ; preds = %lor.lhs.false106
  %76 = load i8, i8* %c, align 1
  %conv109 = sext i8 %76 to i32
  %tobool110 = icmp ne i32 %conv109, 0
  br i1 %tobool110, label %cond.true111, label %cond.false116

cond.true111:                                     ; preds = %land.lhs.true108
  %77 = load i8*, i8** @history_search_delimiter_chars, align 4
  %78 = load i8, i8* %c, align 1
  %conv112 = sext i8 %78 to i32
  %call113 = call i8* @strchr(i8* %77, i32 %conv112)
  %cmp114 = icmp ne i8* %call113, null
  br i1 %cmp114, label %if.then134, label %lor.lhs.false117

cond.false116:                                    ; preds = %land.lhs.true108
  br i1 false, label %if.then134, label %lor.lhs.false117

lor.lhs.false117:                                 ; preds = %cond.false116, %cond.true111, %lor.lhs.false106
  %79 = load i8*, i8** %string.addr, align 4
  %80 = load i32, i32* %i, align 4
  %arrayidx118 = getelementptr inbounds i8, i8* %79, i32 %80
  %81 = load i8, i8* %arrayidx118, align 1
  %conv119 = sext i8 %81 to i32
  %82 = load i32, i32* %delimiting_quote.addr, align 4
  %cmp120 = icmp eq i32 %conv119, %82
  br i1 %cmp120, label %if.then134, label %lor.lhs.false122

lor.lhs.false122:                                 ; preds = %lor.lhs.false117, %if.end82
  %83 = load i8*, i8** %string.addr, align 4
  %84 = load i32, i32* %i, align 4
  %arrayidx123 = getelementptr inbounds i8, i8* %83, i32 %84
  %85 = load i8, i8* %arrayidx123, align 1
  %conv124 = sext i8 %85 to i32
  %cmp125 = icmp eq i32 %conv124, 10
  br i1 %cmp125, label %if.then134, label %lor.lhs.false127

lor.lhs.false127:                                 ; preds = %lor.lhs.false122
  %86 = load i32, i32* %substring_okay, align 4
  %tobool128 = icmp ne i32 %86, 0
  br i1 %tobool128, label %land.lhs.true129, label %if.end135

land.lhs.true129:                                 ; preds = %lor.lhs.false127
  %87 = load i8*, i8** %string.addr, align 4
  %88 = load i32, i32* %i, align 4
  %arrayidx130 = getelementptr inbounds i8, i8* %87, i32 %88
  %89 = load i8, i8* %arrayidx130, align 1
  %conv131 = sext i8 %89 to i32
  %cmp132 = icmp eq i32 %conv131, 63
  br i1 %cmp132, label %if.then134, label %if.end135

if.then134:                                       ; preds = %land.lhs.true129, %lor.lhs.false122, %lor.lhs.false117, %cond.false116, %cond.true111, %cond.false105, %cond.true100, %lor.lhs.false91, %lor.lhs.false, %land.lhs.true84
  br label %for.end138

if.end135:                                        ; preds = %land.lhs.true129, %lor.lhs.false127
  br label %for.inc136

for.inc136:                                       ; preds = %if.end135, %if.then78
  %90 = load i32, i32* %i, align 4
  %inc137 = add nsw i32 %90, 1
  store i32 %inc137, i32* %i, align 4
  br label %for.cond63

for.end138:                                       ; preds = %if.then134, %for.cond63
  %91 = load i32, i32* %i, align 4
  %92 = load i32, i32* %local_index, align 4
  %sub139 = sub nsw i32 %91, %92
  store i32 %sub139, i32* %which, align 4
  %93 = load i32, i32* %which, align 4
  %add140 = add nsw i32 1, %93
  %call141 = call i8* @xmalloc(i32 %add140)
  store i8* %call141, i8** %temp, align 4
  %94 = load i32, i32* %which, align 4
  %tobool142 = icmp ne i32 %94, 0
  br i1 %tobool142, label %if.then143, label %if.end146

if.then143:                                       ; preds = %for.end138
  %95 = load i8*, i8** %temp, align 4
  %96 = load i8*, i8** %string.addr, align 4
  %97 = load i32, i32* %local_index, align 4
  %add.ptr144 = getelementptr inbounds i8, i8* %96, i32 %97
  %98 = load i32, i32* %which, align 4
  %call145 = call i8* @strncpy(i8* %95, i8* %add.ptr144, i32 %98)
  br label %if.end146

if.end146:                                        ; preds = %if.then143, %for.end138
  %99 = load i8*, i8** %temp, align 4
  %100 = load i32, i32* %which, align 4
  %arrayidx147 = getelementptr inbounds i8, i8* %99, i32 %100
  store i8 0, i8* %arrayidx147, align 1
  %101 = load i32, i32* %substring_okay, align 4
  %tobool148 = icmp ne i32 %101, 0
  br i1 %tobool148, label %land.lhs.true149, label %if.end156

land.lhs.true149:                                 ; preds = %if.end146
  %102 = load i8*, i8** %string.addr, align 4
  %103 = load i32, i32* %i, align 4
  %arrayidx150 = getelementptr inbounds i8, i8* %102, i32 %103
  %104 = load i8, i8* %arrayidx150, align 1
  %conv151 = sext i8 %104 to i32
  %cmp152 = icmp eq i32 %conv151, 63
  br i1 %cmp152, label %if.then154, label %if.end156

if.then154:                                       ; preds = %land.lhs.true149
  %105 = load i32, i32* %i, align 4
  %inc155 = add nsw i32 %105, 1
  store i32 %inc155, i32* %i, align 4
  br label %if.end156

if.end156:                                        ; preds = %if.then154, %land.lhs.true149, %if.end146
  %106 = load i32, i32* %i, align 4
  %107 = load i32*, i32** %caller_index.addr, align 4
  store i32 %106, i32* %107, align 4
  %108 = load i8*, i8** %temp, align 4
  %109 = load i8, i8* %108, align 1
  %conv157 = sext i8 %109 to i32
  %cmp158 = icmp eq i32 %conv157, 0
  br i1 %cmp158, label %land.lhs.true160, label %if.end170

land.lhs.true160:                                 ; preds = %if.end156
  %110 = load i32, i32* %substring_okay, align 4
  %tobool161 = icmp ne i32 %110, 0
  br i1 %tobool161, label %if.then162, label %if.end170

if.then162:                                       ; preds = %land.lhs.true160
  %111 = load i8*, i8** @search_string, align 4
  %tobool163 = icmp ne i8* %111, null
  br i1 %tobool163, label %if.then164, label %if.else

if.then164:                                       ; preds = %if.then162
  %112 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %112)
  %113 = load i8*, i8** @search_string, align 4
  %call165 = call i32 @strlen(i8* %113)
  %add166 = add i32 1, %call165
  %call167 = call i8* @xmalloc(i32 %add166)
  %114 = load i8*, i8** @search_string, align 4
  %call168 = call i8* @strcpy(i8* %call167, i8* %114)
  store i8* %call168, i8** %temp, align 4
  br label %if.end169

if.else:                                          ; preds = %if.then162
  br label %do.body

do.body:                                          ; preds = %if.else
  %115 = load i32, i32* @history_length, align 4
  store i32 %115, i32* @history_offset, align 4
  %116 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %116)
  store i8* null, i8** %retval, align 4
  br label %return

do.end:                                           ; No predecessors!
  br label %if.end169

if.end169:                                        ; preds = %do.end, %if.then164
  br label %if.end170

if.end170:                                        ; preds = %if.end169, %land.lhs.true160, %if.end156
  %117 = load i32, i32* %substring_okay, align 4
  %tobool171 = icmp ne i32 %117, 0
  %cond172 = select i1 %tobool171, i32 (i8*, i32)* @history_search, i32 (i8*, i32)* @history_search_prefix
  store i32 (i8*, i32)* %cond172, i32 (i8*, i32)** %search_func, align 4
  br label %while.body

while.body:                                       ; preds = %if.end170, %if.end211
  %118 = load i32 (i8*, i32)*, i32 (i8*, i32)** %search_func, align 4
  %119 = load i8*, i8** %temp, align 4
  %call173 = call i32 %118(i8* %119, i32 -1)
  store i32 %call173, i32* %local_index, align 4
  %120 = load i32, i32* %local_index, align 4
  %cmp174 = icmp slt i32 %120, 0
  br i1 %cmp174, label %if.then176, label %if.end179

if.then176:                                       ; preds = %while.body
  br label %do.body177

do.body177:                                       ; preds = %if.then176
  %121 = load i32, i32* @history_length, align 4
  store i32 %121, i32* @history_offset, align 4
  %122 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %122)
  store i8* null, i8** %retval, align 4
  br label %return

do.end178:                                        ; No predecessors!
  br label %if.end179

if.end179:                                        ; preds = %do.end178, %while.body
  %123 = load i32, i32* %local_index, align 4
  %cmp180 = icmp eq i32 %123, 0
  br i1 %cmp180, label %if.then184, label %lor.lhs.false182

lor.lhs.false182:                                 ; preds = %if.end179
  %124 = load i32, i32* %substring_okay, align 4
  %tobool183 = icmp ne i32 %124, 0
  br i1 %tobool183, label %if.then184, label %if.end205

if.then184:                                       ; preds = %lor.lhs.false182, %if.end179
  %call185 = call %struct._hist_entry* @current_history()
  store %struct._hist_entry* %call185, %struct._hist_entry** %entry1, align 4
  %125 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %cmp186 = icmp eq %struct._hist_entry* %125, null
  br i1 %cmp186, label %if.then188, label %if.end191

if.then188:                                       ; preds = %if.then184
  br label %do.body189

do.body189:                                       ; preds = %if.then188
  %126 = load i32, i32* @history_length, align 4
  store i32 %126, i32* @history_offset, align 4
  %127 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %127)
  store i8* null, i8** %retval, align 4
  br label %return

do.end190:                                        ; No predecessors!
  br label %if.end191

if.end191:                                        ; preds = %do.end190, %if.then184
  %128 = load i32, i32* @history_length, align 4
  store i32 %128, i32* @history_offset, align 4
  %129 = load i32, i32* %substring_okay, align 4
  %tobool192 = icmp ne i32 %129, 0
  br i1 %tobool192, label %if.then193, label %if.else202

if.then193:                                       ; preds = %if.end191
  %130 = load i8*, i8** @search_string, align 4
  %tobool194 = icmp ne i8* %130, null
  br i1 %tobool194, label %if.then195, label %if.end196

if.then195:                                       ; preds = %if.then193
  %131 = load i8*, i8** @search_string, align 4
  call void @free(i8* %131)
  br label %if.end196

if.end196:                                        ; preds = %if.then195, %if.then193
  %132 = load i8*, i8** %temp, align 4
  store i8* %132, i8** @search_string, align 4
  %133 = load i8*, i8** @search_match, align 4
  %tobool197 = icmp ne i8* %133, null
  br i1 %tobool197, label %if.then198, label %if.end199

if.then198:                                       ; preds = %if.end196
  %134 = load i8*, i8** @search_match, align 4
  call void @free(i8* %134)
  br label %if.end199

if.end199:                                        ; preds = %if.then198, %if.end196
  %135 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %line200 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %135, i32 0, i32 0
  %136 = load i8*, i8** %line200, align 4
  %137 = load i32, i32* %local_index, align 4
  %call201 = call i8* @history_find_word(i8* %136, i32 %137)
  store i8* %call201, i8** @search_match, align 4
  br label %if.end203

if.else202:                                       ; preds = %if.end191
  %138 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %138)
  br label %if.end203

if.end203:                                        ; preds = %if.else202, %if.end199
  %139 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %line204 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %139, i32 0, i32 0
  %140 = load i8*, i8** %line204, align 4
  store i8* %140, i8** %retval, align 4
  br label %return

if.end205:                                        ; preds = %lor.lhs.false182
  %141 = load i32, i32* @history_offset, align 4
  %tobool206 = icmp ne i32 %141, 0
  br i1 %tobool206, label %if.then207, label %if.else208

if.then207:                                       ; preds = %if.end205
  %142 = load i32, i32* @history_offset, align 4
  %dec = add nsw i32 %142, -1
  store i32 %dec, i32* @history_offset, align 4
  br label %if.end211

if.else208:                                       ; preds = %if.end205
  br label %do.body209

do.body209:                                       ; preds = %if.else208
  %143 = load i32, i32* @history_length, align 4
  store i32 %143, i32* @history_offset, align 4
  %144 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %144)
  store i8* null, i8** %retval, align 4
  br label %return

do.end210:                                        ; No predecessors!
  br label %if.end211

if.end211:                                        ; preds = %do.end210, %if.then207
  br label %while.body

return:                                           ; preds = %do.body209, %if.end203, %do.body189, %do.body177, %do.body, %cond.end52, %cond.end, %if.then
  %145 = load i8*, i8** %retval, align 4
  ret i8* %145
}

declare %struct._hist_entry* @history_get(i32) #1

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

declare i32 @_rl_adjust_point(i8*, i32, %struct.__mbstate_t*) #1

declare i32 @_rl_get_char_len(i8*, %struct.__mbstate_t*) #1

declare i8* @strchr(i8*, i32) #1

declare i8* @xmalloc(i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare void @xfree(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

declare i32 @history_search(i8*, i32) #1

declare i32 @history_search_prefix(i8*, i32) #1

declare %struct._hist_entry* @current_history() #1

declare void @free(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @history_find_word(i8* %line, i32 %ind) #0 {
entry:
  %retval = alloca i8*, align 4
  %line.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %words = alloca i8**, align 4
  %s = alloca i8*, align 4
  %i = alloca i32, align 4
  %wind = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  %0 = load i8*, i8** %line.addr, align 4
  %1 = load i32, i32* %ind.addr, align 4
  %call = call i8** @history_tokenize_internal(i8* %0, i32 %1, i32* %wind)
  store i8** %call, i8*** %words, align 4
  %2 = load i32, i32* %wind, align 4
  %cmp = icmp eq i32 %2, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8**, i8*** %words, align 4
  %cmp1 = icmp eq i8** %3, null
  br i1 %cmp1, label %if.then, label %if.end6

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load i8**, i8*** %words, align 4
  %tobool = icmp ne i8** %4, null
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %5 = load i8**, i8*** %words, align 4
  call void @freewords(i8** %5, i32 0)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %6 = load i8**, i8*** %words, align 4
  %tobool3 = icmp ne i8** %6, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %7 = load i8**, i8*** %words, align 4
  %8 = bitcast i8** %7 to i8*
  call void @free(i8* %8)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false
  %9 = load i8**, i8*** %words, align 4
  %10 = load i32, i32* %wind, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %9, i32 %10
  %11 = load i8*, i8** %arrayidx, align 4
  store i8* %11, i8** %s, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %wind, align 4
  %cmp7 = icmp slt i32 %12, %13
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i8**, i8*** %words, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %14, i32 %15
  %16 = load i8*, i8** %arrayidx8, align 4
  call void @xfree(i8* %16)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load i8**, i8*** %words, align 4
  %19 = load i32, i32* %wind, align 4
  %add = add nsw i32 %19, 1
  call void @freewords(i8** %18, i32 %add)
  %20 = load i8**, i8*** %words, align 4
  %21 = bitcast i8** %20 to i8*
  call void @xfree(i8* %21)
  %22 = load i8*, i8** %s, align 4
  store i8* %22, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.end5
  %23 = load i8*, i8** %retval, align 4
  ret i8* %23
}

; Function Attrs: noinline nounwind
define i32 @history_expand(i8* %hstring, i8** %output) #0 {
entry:
  %retval = alloca i32, align 4
  %hstring.addr = alloca i8*, align 4
  %output.addr = alloca i8**, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  %passc = alloca i32, align 4
  %cc = alloca i32, align 4
  %modified = alloca i32, align 4
  %eindex = alloca i32, align 4
  %only_printing = alloca i32, align 4
  %dquote = alloca i32, align 4
  %squote = alloca i32, align 4
  %flag = alloca i32, align 4
  %string = alloca i8*, align 4
  %result_len = alloca i32, align 4
  %result = alloca i8*, align 4
  %mb = alloca [16 x i8], align 1
  %ps = alloca %struct.__mbstate_t, align 4
  %temp = alloca i8*, align 4
  %v = alloca i32, align 4
  %qc = alloca i32, align 4
  %tchar = alloca i32, align 4
  %k = alloca i32, align 4
  %c = alloca i32, align 4
  %sl = alloca i32, align 4
  %quote = alloca i32, align 4
  %slen = alloca i32, align 4
  %sl341 = alloca i32, align 4
  %sl429 = alloca i32, align 4
  %sl521 = alloca i32, align 4
  store i8* %hstring, i8** %hstring.addr, align 4
  store i8** %output, i8*** %output.addr, align 4
  %0 = load i8**, i8*** %output.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8, i8* @history_expansion_char, align 1
  %conv = sext i8 %1 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.end
  %2 = load i8*, i8** %hstring.addr, align 4
  %call = call i32 @strlen(i8* %2)
  %add = add i32 1, %call
  %call4 = call i8* @xmalloc(i32 %add)
  %3 = load i8*, i8** %hstring.addr, align 4
  %call5 = call i8* @strcpy(i8* %call4, i8* %3)
  %4 = load i8**, i8*** %output.addr, align 4
  store i8* %call5, i8** %4, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  store i32 256, i32* %result_len, align 4
  %call7 = call i8* @xmalloc(i32 256)
  store i8* %call7, i8** %result, align 4
  %5 = load i8*, i8** %result, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  store i8 0, i8* %arrayidx, align 1
  store i32 0, i32* %modified, align 4
  store i32 0, i32* %only_printing, align 4
  %6 = load i8*, i8** %hstring.addr, align 4
  %call8 = call i32 @strlen(i8* %6)
  store i32 %call8, i32* %l, align 4
  %7 = load i8*, i8** %hstring.addr, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %8 to i32
  %9 = load i8, i8* @history_subst_char, align 1
  %conv11 = sext i8 %9 to i32
  %cmp12 = icmp eq i32 %conv10, %conv11
  br i1 %cmp12, label %if.then14, label %if.else

if.then14:                                        ; preds = %if.end6
  %10 = load i32, i32* %l, align 4
  %add15 = add nsw i32 %10, 5
  %call16 = call i8* @xmalloc(i32 %add15)
  store i8* %call16, i8** %string, align 4
  %11 = load i8, i8* @history_expansion_char, align 1
  %12 = load i8*, i8** %string, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %12, i32 1
  store i8 %11, i8* %arrayidx17, align 1
  %13 = load i8*, i8** %string, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %13, i32 0
  store i8 %11, i8* %arrayidx18, align 1
  %14 = load i8*, i8** %string, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %14, i32 2
  store i8 58, i8* %arrayidx19, align 1
  %15 = load i8*, i8** %string, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %15, i32 3
  store i8 115, i8* %arrayidx20, align 1
  %16 = load i8*, i8** %string, align 4
  %add.ptr = getelementptr inbounds i8, i8* %16, i32 4
  %17 = load i8*, i8** %hstring.addr, align 4
  %call21 = call i8* @strcpy(i8* %add.ptr, i8* %17)
  %18 = load i32, i32* %l, align 4
  %add22 = add nsw i32 %18, 4
  store i32 %add22, i32* %l, align 4
  br label %if.end173

if.else:                                          ; preds = %if.end6
  %19 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %19, i8 0, i32 8, i32 4, i1 false)
  %20 = load i8*, i8** %hstring.addr, align 4
  store i8* %20, i8** %string, align 4
  store i32 0, i32* %squote, align 4
  store i32 0, i32* %dquote, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else
  %21 = load i8*, i8** %string, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx23, align 1
  %tobool = icmp ne i8 %23, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call24 = call i32 @__ctype_get_mb_cur_max()
  %cmp25 = icmp ugt i32 %call24, 1
  br i1 %cmp25, label %land.lhs.true, label %if.end37

land.lhs.true:                                    ; preds = %for.body
  %24 = load i32, i32* @rl_byte_oriented, align 4
  %cmp27 = icmp eq i32 %24, 0
  br i1 %cmp27, label %if.then29, label %if.end37

if.then29:                                        ; preds = %land.lhs.true
  %25 = load i8*, i8** %string, align 4
  %26 = load i32, i32* %i, align 4
  %add.ptr30 = getelementptr inbounds i8, i8* %25, i32 %26
  %call31 = call i32 @_rl_get_char_len(i8* %add.ptr30, %struct.__mbstate_t* %ps)
  store i32 %call31, i32* %v, align 4
  %27 = load i32, i32* %v, align 4
  %cmp32 = icmp sgt i32 %27, 1
  br i1 %cmp32, label %if.then34, label %if.end36

if.then34:                                        ; preds = %if.then29
  %28 = load i32, i32* %v, align 4
  %sub = sub nsw i32 %28, 1
  %29 = load i32, i32* %i, align 4
  %add35 = add nsw i32 %29, %sub
  store i32 %add35, i32* %i, align 4
  br label %for.inc

if.end36:                                         ; preds = %if.then29
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %land.lhs.true, %for.body
  %30 = load i8*, i8** %string, align 4
  %31 = load i32, i32* %i, align 4
  %add38 = add nsw i32 %31, 1
  %arrayidx39 = getelementptr inbounds i8, i8* %30, i32 %add38
  %32 = load i8, i8* %arrayidx39, align 1
  %conv40 = sext i8 %32 to i32
  store i32 %conv40, i32* %cc, align 4
  %33 = load i8, i8* @history_comment_char, align 1
  %conv41 = sext i8 %33 to i32
  %tobool42 = icmp ne i32 %conv41, 0
  br i1 %tobool42, label %land.lhs.true43, label %if.else68

land.lhs.true43:                                  ; preds = %if.end37
  %34 = load i8*, i8** %string, align 4
  %35 = load i32, i32* %i, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %34, i32 %35
  %36 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %36 to i32
  %37 = load i8, i8* @history_comment_char, align 1
  %conv46 = sext i8 %37 to i32
  %cmp47 = icmp eq i32 %conv45, %conv46
  br i1 %cmp47, label %land.lhs.true49, label %if.else68

land.lhs.true49:                                  ; preds = %land.lhs.true43
  %38 = load i32, i32* %dquote, align 4
  %cmp50 = icmp eq i32 %38, 0
  br i1 %cmp50, label %land.lhs.true52, label %if.else68

land.lhs.true52:                                  ; preds = %land.lhs.true49
  %39 = load i32, i32* %i, align 4
  %cmp53 = icmp eq i32 %39, 0
  br i1 %cmp53, label %if.then65, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true52
  %40 = load i8*, i8** %string, align 4
  %41 = load i32, i32* %i, align 4
  %sub55 = sub nsw i32 %41, 1
  %arrayidx56 = getelementptr inbounds i8, i8* %40, i32 %sub55
  %42 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %42 to i32
  %tobool58 = icmp ne i32 %conv57, 0
  br i1 %tobool58, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %43 = load i8*, i8** @history_word_delimiters, align 4
  %44 = load i8*, i8** %string, align 4
  %45 = load i32, i32* %i, align 4
  %sub59 = sub nsw i32 %45, 1
  %arrayidx60 = getelementptr inbounds i8, i8* %44, i32 %sub59
  %46 = load i8, i8* %arrayidx60, align 1
  %conv61 = sext i8 %46 to i32
  %call62 = call i8* @strchr(i8* %43, i32 %conv61)
  %cmp63 = icmp ne i8* %call62, null
  br i1 %cmp63, label %if.then65, label %if.else68

cond.false:                                       ; preds = %lor.lhs.false
  br i1 false, label %if.then65, label %if.else68

if.then65:                                        ; preds = %cond.false, %cond.true, %land.lhs.true52
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then65
  %47 = load i8*, i8** %string, align 4
  %48 = load i32, i32* %i, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %47, i32 %48
  %49 = load i8, i8* %arrayidx66, align 1
  %tobool67 = icmp ne i8 %49, 0
  br i1 %tobool67, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %50 = load i32, i32* %i, align 4
  %inc = add nsw i32 %50, 1
  store i32 %inc, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %for.end

if.else68:                                        ; preds = %cond.false, %cond.true, %land.lhs.true49, %land.lhs.true43, %if.end37
  %51 = load i8*, i8** %string, align 4
  %52 = load i32, i32* %i, align 4
  %arrayidx69 = getelementptr inbounds i8, i8* %51, i32 %52
  %53 = load i8, i8* %arrayidx69, align 1
  %conv70 = sext i8 %53 to i32
  %54 = load i8, i8* @history_expansion_char, align 1
  %conv71 = sext i8 %54 to i32
  %cmp72 = icmp eq i32 %conv70, %conv71
  br i1 %cmp72, label %if.then74, label %if.else98

if.then74:                                        ; preds = %if.else68
  %55 = load i32, i32* %cc, align 4
  %cmp75 = icmp eq i32 %55, 0
  br i1 %cmp75, label %if.then84, label %lor.lhs.false77

lor.lhs.false77:                                  ; preds = %if.then74
  %56 = load i32, i32* %cc, align 4
  %tobool78 = icmp ne i32 %56, 0
  br i1 %tobool78, label %cond.true79, label %cond.false83

cond.true79:                                      ; preds = %lor.lhs.false77
  %57 = load i8*, i8** @history_no_expand_chars, align 4
  %58 = load i32, i32* %cc, align 4
  %call80 = call i8* @strchr(i8* %57, i32 %58)
  %cmp81 = icmp ne i8* %call80, null
  br i1 %cmp81, label %if.then84, label %if.else85

cond.false83:                                     ; preds = %lor.lhs.false77
  br i1 false, label %if.then84, label %if.else85

if.then84:                                        ; preds = %cond.false83, %cond.true79, %if.then74
  br label %for.inc

if.else85:                                        ; preds = %cond.false83, %cond.true79
  %59 = load i32, i32* %dquote, align 4
  %tobool86 = icmp ne i32 %59, 0
  br i1 %tobool86, label %land.lhs.true87, label %if.else91

land.lhs.true87:                                  ; preds = %if.else85
  %60 = load i32, i32* %cc, align 4
  %cmp88 = icmp eq i32 %60, 34
  br i1 %cmp88, label %if.then90, label %if.else91

if.then90:                                        ; preds = %land.lhs.true87
  br label %for.inc

if.else91:                                        ; preds = %land.lhs.true87, %if.else85
  %61 = load i32 (i8*, i32)*, i32 (i8*, i32)** @history_inhibit_expansion_function, align 4
  %tobool92 = icmp ne i32 (i8*, i32)* %61, null
  br i1 %tobool92, label %land.lhs.true93, label %if.else97

land.lhs.true93:                                  ; preds = %if.else91
  %62 = load i32 (i8*, i32)*, i32 (i8*, i32)** @history_inhibit_expansion_function, align 4
  %63 = load i8*, i8** %string, align 4
  %64 = load i32, i32* %i, align 4
  %call94 = call i32 %62(i8* %63, i32 %64)
  %tobool95 = icmp ne i32 %call94, 0
  br i1 %tobool95, label %if.then96, label %if.else97

if.then96:                                        ; preds = %land.lhs.true93
  br label %for.inc

if.else97:                                        ; preds = %land.lhs.true93, %if.else91
  br label %for.end

if.else98:                                        ; preds = %if.else68
  %65 = load i32, i32* %dquote, align 4
  %tobool99 = icmp ne i32 %65, 0
  br i1 %tobool99, label %land.lhs.true100, label %if.else110

land.lhs.true100:                                 ; preds = %if.else98
  %66 = load i8*, i8** %string, align 4
  %67 = load i32, i32* %i, align 4
  %arrayidx101 = getelementptr inbounds i8, i8* %66, i32 %67
  %68 = load i8, i8* %arrayidx101, align 1
  %conv102 = sext i8 %68 to i32
  %cmp103 = icmp eq i32 %conv102, 92
  br i1 %cmp103, label %land.lhs.true105, label %if.else110

land.lhs.true105:                                 ; preds = %land.lhs.true100
  %69 = load i32, i32* %cc, align 4
  %cmp106 = icmp eq i32 %69, 34
  br i1 %cmp106, label %if.then108, label %if.else110

if.then108:                                       ; preds = %land.lhs.true105
  %70 = load i32, i32* %i, align 4
  %inc109 = add nsw i32 %70, 1
  store i32 %inc109, i32* %i, align 4
  br label %if.end158

if.else110:                                       ; preds = %land.lhs.true105, %land.lhs.true100, %if.else98
  %71 = load i32, i32* @history_quotes_inhibit_expansion, align 4
  %tobool111 = icmp ne i32 %71, 0
  br i1 %tobool111, label %land.lhs.true112, label %if.else119

land.lhs.true112:                                 ; preds = %if.else110
  %72 = load i8*, i8** %string, align 4
  %73 = load i32, i32* %i, align 4
  %arrayidx113 = getelementptr inbounds i8, i8* %72, i32 %73
  %74 = load i8, i8* %arrayidx113, align 1
  %conv114 = sext i8 %74 to i32
  %cmp115 = icmp eq i32 %conv114, 34
  br i1 %cmp115, label %if.then117, label %if.else119

if.then117:                                       ; preds = %land.lhs.true112
  %75 = load i32, i32* %dquote, align 4
  %sub118 = sub nsw i32 1, %75
  store i32 %sub118, i32* %dquote, align 4
  br label %if.end157

if.else119:                                       ; preds = %land.lhs.true112, %if.else110
  %76 = load i32, i32* %dquote, align 4
  %cmp120 = icmp eq i32 %76, 0
  br i1 %cmp120, label %land.lhs.true122, label %if.else138

land.lhs.true122:                                 ; preds = %if.else119
  %77 = load i32, i32* @history_quotes_inhibit_expansion, align 4
  %tobool123 = icmp ne i32 %77, 0
  br i1 %tobool123, label %land.lhs.true124, label %if.else138

land.lhs.true124:                                 ; preds = %land.lhs.true122
  %78 = load i8*, i8** %string, align 4
  %79 = load i32, i32* %i, align 4
  %arrayidx125 = getelementptr inbounds i8, i8* %78, i32 %79
  %80 = load i8, i8* %arrayidx125, align 1
  %conv126 = sext i8 %80 to i32
  %cmp127 = icmp eq i32 %conv126, 39
  br i1 %cmp127, label %if.then129, label %if.else138

if.then129:                                       ; preds = %land.lhs.true124
  %81 = load i32, i32* %i, align 4
  %cmp130 = icmp sgt i32 %81, 0
  br i1 %cmp130, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then129
  %82 = load i8*, i8** %string, align 4
  %83 = load i32, i32* %i, align 4
  %sub132 = sub nsw i32 %83, 1
  %arrayidx133 = getelementptr inbounds i8, i8* %82, i32 %sub132
  %84 = load i8, i8* %arrayidx133, align 1
  %conv134 = sext i8 %84 to i32
  %cmp135 = icmp eq i32 %conv134, 36
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then129
  %85 = phi i1 [ false, %if.then129 ], [ %cmp135, %land.rhs ]
  %land.ext = zext i1 %85 to i32
  store i32 %land.ext, i32* %flag, align 4
  %86 = load i32, i32* %i, align 4
  %inc137 = add nsw i32 %86, 1
  store i32 %inc137, i32* %i, align 4
  %87 = load i8*, i8** %string, align 4
  %88 = load i32, i32* %flag, align 4
  call void @hist_string_extract_single_quoted(i8* %87, i32* %i, i32 %88)
  br label %if.end156

if.else138:                                       ; preds = %land.lhs.true124, %land.lhs.true122, %if.else119
  %89 = load i32, i32* @history_quotes_inhibit_expansion, align 4
  %tobool139 = icmp ne i32 %89, 0
  br i1 %tobool139, label %land.lhs.true140, label %if.end155

land.lhs.true140:                                 ; preds = %if.else138
  %90 = load i8*, i8** %string, align 4
  %91 = load i32, i32* %i, align 4
  %arrayidx141 = getelementptr inbounds i8, i8* %90, i32 %91
  %92 = load i8, i8* %arrayidx141, align 1
  %conv142 = sext i8 %92 to i32
  %cmp143 = icmp eq i32 %conv142, 92
  br i1 %cmp143, label %if.then145, label %if.end155

if.then145:                                       ; preds = %land.lhs.true140
  %93 = load i32, i32* %cc, align 4
  %cmp146 = icmp eq i32 %93, 39
  br i1 %cmp146, label %if.then152, label %lor.lhs.false148

lor.lhs.false148:                                 ; preds = %if.then145
  %94 = load i32, i32* %cc, align 4
  %95 = load i8, i8* @history_expansion_char, align 1
  %conv149 = sext i8 %95 to i32
  %cmp150 = icmp eq i32 %94, %conv149
  br i1 %cmp150, label %if.then152, label %if.end154

if.then152:                                       ; preds = %lor.lhs.false148, %if.then145
  %96 = load i32, i32* %i, align 4
  %inc153 = add nsw i32 %96, 1
  store i32 %inc153, i32* %i, align 4
  br label %if.end154

if.end154:                                        ; preds = %if.then152, %lor.lhs.false148
  br label %if.end155

if.end155:                                        ; preds = %if.end154, %land.lhs.true140, %if.else138
  br label %if.end156

if.end156:                                        ; preds = %if.end155, %land.end
  br label %if.end157

if.end157:                                        ; preds = %if.end156, %if.then117
  br label %if.end158

if.end158:                                        ; preds = %if.end157, %if.then108
  br label %if.end159

if.end159:                                        ; preds = %if.end158
  br label %if.end160

if.end160:                                        ; preds = %if.end159
  br label %for.inc

for.inc:                                          ; preds = %if.end160, %if.then96, %if.then90, %if.then84, %if.then34
  %97 = load i32, i32* %i, align 4
  %inc161 = add nsw i32 %97, 1
  store i32 %inc161, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.else97, %while.end, %for.cond
  %98 = load i8*, i8** %string, align 4
  %99 = load i32, i32* %i, align 4
  %arrayidx162 = getelementptr inbounds i8, i8* %98, i32 %99
  %100 = load i8, i8* %arrayidx162, align 1
  %conv163 = sext i8 %100 to i32
  %101 = load i8, i8* @history_expansion_char, align 1
  %conv164 = sext i8 %101 to i32
  %cmp165 = icmp ne i32 %conv163, %conv164
  br i1 %cmp165, label %if.then167, label %if.end172

if.then167:                                       ; preds = %for.end
  %102 = load i8*, i8** %result, align 4
  call void @xfree(i8* %102)
  %103 = load i8*, i8** %string, align 4
  %call168 = call i32 @strlen(i8* %103)
  %add169 = add i32 1, %call168
  %call170 = call i8* @xmalloc(i32 %add169)
  %104 = load i8*, i8** %string, align 4
  %call171 = call i8* @strcpy(i8* %call170, i8* %104)
  %105 = load i8**, i8*** %output.addr, align 4
  store i8* %call171, i8** %105, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end172:                                        ; preds = %for.end
  br label %if.end173

if.end173:                                        ; preds = %if.end172, %if.then14
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %squote, align 4
  store i32 0, i32* %dquote, align 4
  store i32 0, i32* %passc, align 4
  br label %for.cond174

for.cond174:                                      ; preds = %for.inc546, %if.end173
  %106 = load i32, i32* %i, align 4
  %107 = load i32, i32* %l, align 4
  %cmp175 = icmp slt i32 %106, %107
  br i1 %cmp175, label %for.body177, label %for.end548

for.body177:                                      ; preds = %for.cond174
  %108 = load i8*, i8** %string, align 4
  %109 = load i32, i32* %i, align 4
  %arrayidx178 = getelementptr inbounds i8, i8* %108, i32 %109
  %110 = load i8, i8* %arrayidx178, align 1
  %conv179 = sext i8 %110 to i32
  store i32 %conv179, i32* %tchar, align 4
  %111 = load i32, i32* %passc, align 4
  %tobool180 = icmp ne i32 %111, 0
  br i1 %tobool180, label %if.then181, label %if.end193

if.then181:                                       ; preds = %for.body177
  store i32 0, i32* %passc, align 4
  br label %do.body

do.body:                                          ; preds = %if.then181
  %112 = load i32, i32* %j, align 4
  %113 = load i32, i32* %result_len, align 4
  %sub182 = sub nsw i32 %113, 1
  %cmp183 = icmp sge i32 %112, %sub182
  br i1 %cmp183, label %if.then185, label %if.end188

if.then185:                                       ; preds = %do.body
  %114 = load i8*, i8** %result, align 4
  %115 = load i32, i32* %result_len, align 4
  %add186 = add nsw i32 %115, 64
  store i32 %add186, i32* %result_len, align 4
  %call187 = call i8* @xrealloc(i8* %114, i32 %add186)
  store i8* %call187, i8** %result, align 4
  br label %if.end188

if.end188:                                        ; preds = %if.then185, %do.body
  %116 = load i32, i32* %tchar, align 4
  %conv189 = trunc i32 %116 to i8
  %117 = load i8*, i8** %result, align 4
  %118 = load i32, i32* %j, align 4
  %inc190 = add nsw i32 %118, 1
  store i32 %inc190, i32* %j, align 4
  %arrayidx191 = getelementptr inbounds i8, i8* %117, i32 %118
  store i8 %conv189, i8* %arrayidx191, align 1
  %119 = load i8*, i8** %result, align 4
  %120 = load i32, i32* %j, align 4
  %arrayidx192 = getelementptr inbounds i8, i8* %119, i32 %120
  store i8 0, i8* %arrayidx192, align 1
  br label %do.end

do.end:                                           ; preds = %if.end188
  br label %for.inc546

if.end193:                                        ; preds = %for.body177
  %call194 = call i32 @__ctype_get_mb_cur_max()
  %cmp195 = icmp ugt i32 %call194, 1
  br i1 %cmp195, label %land.lhs.true197, label %if.end246

land.lhs.true197:                                 ; preds = %if.end193
  %121 = load i32, i32* @rl_byte_oriented, align 4
  %cmp198 = icmp eq i32 %121, 0
  br i1 %cmp198, label %if.then200, label %if.end246

if.then200:                                       ; preds = %land.lhs.true197
  %122 = load i32, i32* %tchar, align 4
  store i32 %122, i32* %c, align 4
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  call void @llvm.memset.p0i8.i32(i8* %arraydecay, i8 0, i32 16, i32 1, i1 false)
  store i32 0, i32* %k, align 4
  br label %for.cond201

for.cond201:                                      ; preds = %for.inc217, %if.then200
  %123 = load i32, i32* %k, align 4
  %cmp202 = icmp slt i32 %123, 16
  br i1 %cmp202, label %for.body204, label %for.end219

for.body204:                                      ; preds = %for.cond201
  %124 = load i32, i32* %c, align 4
  %conv205 = trunc i32 %124 to i8
  %125 = load i32, i32* %k, align 4
  %arrayidx206 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 %125
  store i8 %conv205, i8* %arrayidx206, align 1
  %126 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %126, i8 0, i32 8, i32 4, i1 false)
  %arraydecay207 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call208 = call i32 @_rl_get_char_len(i8* %arraydecay207, %struct.__mbstate_t* %ps)
  %cmp209 = icmp eq i32 %call208, -2
  br i1 %cmp209, label %if.then211, label %if.else215

if.then211:                                       ; preds = %for.body204
  %127 = load i8*, i8** %string, align 4
  %128 = load i32, i32* %i, align 4
  %inc212 = add nsw i32 %128, 1
  store i32 %inc212, i32* %i, align 4
  %arrayidx213 = getelementptr inbounds i8, i8* %127, i32 %inc212
  %129 = load i8, i8* %arrayidx213, align 1
  %conv214 = sext i8 %129 to i32
  store i32 %conv214, i32* %c, align 4
  br label %if.end216

if.else215:                                       ; preds = %for.body204
  br label %for.end219

if.end216:                                        ; preds = %if.then211
  br label %for.inc217

for.inc217:                                       ; preds = %if.end216
  %130 = load i32, i32* %k, align 4
  %inc218 = add nsw i32 %130, 1
  store i32 %inc218, i32* %k, align 4
  br label %for.cond201

for.end219:                                       ; preds = %if.else215, %for.cond201
  %arraydecay220 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call221 = call i32 @strlen(i8* %arraydecay220)
  %cmp222 = icmp ugt i32 %call221, 1
  br i1 %cmp222, label %if.then224, label %if.end245

if.then224:                                       ; preds = %for.end219
  br label %do.body225

do.body225:                                       ; preds = %if.then224
  %arraydecay226 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call227 = call i32 @strlen(i8* %arraydecay226)
  store i32 %call227, i32* %sl, align 4
  %131 = load i32, i32* %sl, align 4
  %132 = load i32, i32* %j, align 4
  %add228 = add nsw i32 %132, %131
  store i32 %add228, i32* %j, align 4
  %133 = load i32, i32* %j, align 4
  %134 = load i32, i32* %result_len, align 4
  %cmp229 = icmp sge i32 %133, %134
  br i1 %cmp229, label %if.then231, label %if.end239

if.then231:                                       ; preds = %do.body225
  br label %while.cond232

while.cond232:                                    ; preds = %while.body235, %if.then231
  %135 = load i32, i32* %j, align 4
  %136 = load i32, i32* %result_len, align 4
  %cmp233 = icmp sge i32 %135, %136
  br i1 %cmp233, label %while.body235, label %while.end237

while.body235:                                    ; preds = %while.cond232
  %137 = load i32, i32* %result_len, align 4
  %add236 = add nsw i32 %137, 128
  store i32 %add236, i32* %result_len, align 4
  br label %while.cond232

while.end237:                                     ; preds = %while.cond232
  %138 = load i8*, i8** %result, align 4
  %139 = load i32, i32* %result_len, align 4
  %call238 = call i8* @xrealloc(i8* %138, i32 %139)
  store i8* %call238, i8** %result, align 4
  br label %if.end239

if.end239:                                        ; preds = %while.end237, %do.body225
  %140 = load i8*, i8** %result, align 4
  %141 = load i32, i32* %j, align 4
  %add.ptr240 = getelementptr inbounds i8, i8* %140, i32 %141
  %142 = load i32, i32* %sl, align 4
  %idx.neg = sub i32 0, %142
  %add.ptr241 = getelementptr inbounds i8, i8* %add.ptr240, i32 %idx.neg
  %arraydecay242 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call243 = call i8* @strcpy(i8* %add.ptr241, i8* %arraydecay242)
  br label %do.end244

do.end244:                                        ; preds = %if.end239
  br label %for.inc546

if.end245:                                        ; preds = %for.end219
  br label %if.end246

if.end246:                                        ; preds = %if.end245, %land.lhs.true197, %if.end193
  %143 = load i32, i32* %tchar, align 4
  %144 = load i8, i8* @history_expansion_char, align 1
  %conv247 = sext i8 %144 to i32
  %cmp248 = icmp eq i32 %143, %conv247
  br i1 %cmp248, label %if.then250, label %if.else251

if.then250:                                       ; preds = %if.end246
  store i32 -3, i32* %tchar, align 4
  br label %if.end257

if.else251:                                       ; preds = %if.end246
  %145 = load i32, i32* %tchar, align 4
  %146 = load i8, i8* @history_comment_char, align 1
  %conv252 = sext i8 %146 to i32
  %cmp253 = icmp eq i32 %145, %conv252
  br i1 %cmp253, label %if.then255, label %if.end256

if.then255:                                       ; preds = %if.else251
  store i32 -2, i32* %tchar, align 4
  br label %if.end256

if.end256:                                        ; preds = %if.then255, %if.else251
  br label %if.end257

if.end257:                                        ; preds = %if.end256, %if.then250
  %147 = load i32, i32* %tchar, align 4
  switch i32 %147, label %sw.default [
    i32 92, label %sw.bb
    i32 34, label %sw.bb285
    i32 39, label %sw.bb300
    i32 -2, label %sw.bb400
    i32 -3, label %sw.bb463
  ]

sw.default:                                       ; preds = %if.end257
  br label %do.body258

do.body258:                                       ; preds = %sw.default
  %148 = load i32, i32* %j, align 4
  %149 = load i32, i32* %result_len, align 4
  %sub259 = sub nsw i32 %149, 1
  %cmp260 = icmp sge i32 %148, %sub259
  br i1 %cmp260, label %if.then262, label %if.end265

if.then262:                                       ; preds = %do.body258
  %150 = load i8*, i8** %result, align 4
  %151 = load i32, i32* %result_len, align 4
  %add263 = add nsw i32 %151, 64
  store i32 %add263, i32* %result_len, align 4
  %call264 = call i8* @xrealloc(i8* %150, i32 %add263)
  store i8* %call264, i8** %result, align 4
  br label %if.end265

if.end265:                                        ; preds = %if.then262, %do.body258
  %152 = load i8*, i8** %string, align 4
  %153 = load i32, i32* %i, align 4
  %arrayidx266 = getelementptr inbounds i8, i8* %152, i32 %153
  %154 = load i8, i8* %arrayidx266, align 1
  %155 = load i8*, i8** %result, align 4
  %156 = load i32, i32* %j, align 4
  %inc267 = add nsw i32 %156, 1
  store i32 %inc267, i32* %j, align 4
  %arrayidx268 = getelementptr inbounds i8, i8* %155, i32 %156
  store i8 %154, i8* %arrayidx268, align 1
  %157 = load i8*, i8** %result, align 4
  %158 = load i32, i32* %j, align 4
  %arrayidx269 = getelementptr inbounds i8, i8* %157, i32 %158
  store i8 0, i8* %arrayidx269, align 1
  br label %do.end270

do.end270:                                        ; preds = %if.end265
  br label %sw.epilog

sw.bb:                                            ; preds = %if.end257
  %159 = load i32, i32* %passc, align 4
  %inc271 = add nsw i32 %159, 1
  store i32 %inc271, i32* %passc, align 4
  br label %do.body272

do.body272:                                       ; preds = %sw.bb
  %160 = load i32, i32* %j, align 4
  %161 = load i32, i32* %result_len, align 4
  %sub273 = sub nsw i32 %161, 1
  %cmp274 = icmp sge i32 %160, %sub273
  br i1 %cmp274, label %if.then276, label %if.end279

if.then276:                                       ; preds = %do.body272
  %162 = load i8*, i8** %result, align 4
  %163 = load i32, i32* %result_len, align 4
  %add277 = add nsw i32 %163, 64
  store i32 %add277, i32* %result_len, align 4
  %call278 = call i8* @xrealloc(i8* %162, i32 %add277)
  store i8* %call278, i8** %result, align 4
  br label %if.end279

if.end279:                                        ; preds = %if.then276, %do.body272
  %164 = load i32, i32* %tchar, align 4
  %conv280 = trunc i32 %164 to i8
  %165 = load i8*, i8** %result, align 4
  %166 = load i32, i32* %j, align 4
  %inc281 = add nsw i32 %166, 1
  store i32 %inc281, i32* %j, align 4
  %arrayidx282 = getelementptr inbounds i8, i8* %165, i32 %166
  store i8 %conv280, i8* %arrayidx282, align 1
  %167 = load i8*, i8** %result, align 4
  %168 = load i32, i32* %j, align 4
  %arrayidx283 = getelementptr inbounds i8, i8* %167, i32 %168
  store i8 0, i8* %arrayidx283, align 1
  br label %do.end284

do.end284:                                        ; preds = %if.end279
  br label %sw.epilog

sw.bb285:                                         ; preds = %if.end257
  %169 = load i32, i32* %dquote, align 4
  %sub286 = sub nsw i32 1, %169
  store i32 %sub286, i32* %dquote, align 4
  br label %do.body287

do.body287:                                       ; preds = %sw.bb285
  %170 = load i32, i32* %j, align 4
  %171 = load i32, i32* %result_len, align 4
  %sub288 = sub nsw i32 %171, 1
  %cmp289 = icmp sge i32 %170, %sub288
  br i1 %cmp289, label %if.then291, label %if.end294

if.then291:                                       ; preds = %do.body287
  %172 = load i8*, i8** %result, align 4
  %173 = load i32, i32* %result_len, align 4
  %add292 = add nsw i32 %173, 64
  store i32 %add292, i32* %result_len, align 4
  %call293 = call i8* @xrealloc(i8* %172, i32 %add292)
  store i8* %call293, i8** %result, align 4
  br label %if.end294

if.end294:                                        ; preds = %if.then291, %do.body287
  %174 = load i32, i32* %tchar, align 4
  %conv295 = trunc i32 %174 to i8
  %175 = load i8*, i8** %result, align 4
  %176 = load i32, i32* %j, align 4
  %inc296 = add nsw i32 %176, 1
  store i32 %inc296, i32* %j, align 4
  %arrayidx297 = getelementptr inbounds i8, i8* %175, i32 %176
  store i8 %conv295, i8* %arrayidx297, align 1
  %177 = load i8*, i8** %result, align 4
  %178 = load i32, i32* %j, align 4
  %arrayidx298 = getelementptr inbounds i8, i8* %177, i32 %178
  store i8 0, i8* %arrayidx298, align 1
  br label %do.end299

do.end299:                                        ; preds = %if.end294
  br label %sw.epilog

sw.bb300:                                         ; preds = %if.end257
  %179 = load i32, i32* %squote, align 4
  %tobool301 = icmp ne i32 %179, 0
  br i1 %tobool301, label %if.then302, label %if.else316

if.then302:                                       ; preds = %sw.bb300
  store i32 0, i32* %squote, align 4
  br label %do.body303

do.body303:                                       ; preds = %if.then302
  %180 = load i32, i32* %j, align 4
  %181 = load i32, i32* %result_len, align 4
  %sub304 = sub nsw i32 %181, 1
  %cmp305 = icmp sge i32 %180, %sub304
  br i1 %cmp305, label %if.then307, label %if.end310

if.then307:                                       ; preds = %do.body303
  %182 = load i8*, i8** %result, align 4
  %183 = load i32, i32* %result_len, align 4
  %add308 = add nsw i32 %183, 64
  store i32 %add308, i32* %result_len, align 4
  %call309 = call i8* @xrealloc(i8* %182, i32 %add308)
  store i8* %call309, i8** %result, align 4
  br label %if.end310

if.end310:                                        ; preds = %if.then307, %do.body303
  %184 = load i32, i32* %tchar, align 4
  %conv311 = trunc i32 %184 to i8
  %185 = load i8*, i8** %result, align 4
  %186 = load i32, i32* %j, align 4
  %inc312 = add nsw i32 %186, 1
  store i32 %inc312, i32* %j, align 4
  %arrayidx313 = getelementptr inbounds i8, i8* %185, i32 %186
  store i8 %conv311, i8* %arrayidx313, align 1
  %187 = load i8*, i8** %result, align 4
  %188 = load i32, i32* %j, align 4
  %arrayidx314 = getelementptr inbounds i8, i8* %187, i32 %188
  store i8 0, i8* %arrayidx314, align 1
  br label %do.end315

do.end315:                                        ; preds = %if.end310
  br label %if.end399

if.else316:                                       ; preds = %sw.bb300
  %189 = load i32, i32* %dquote, align 4
  %cmp317 = icmp eq i32 %189, 0
  br i1 %cmp317, label %land.lhs.true319, label %if.else360

land.lhs.true319:                                 ; preds = %if.else316
  %190 = load i32, i32* @history_quotes_inhibit_expansion, align 4
  %tobool320 = icmp ne i32 %190, 0
  br i1 %tobool320, label %if.then321, label %if.else360

if.then321:                                       ; preds = %land.lhs.true319
  %191 = load i32, i32* %i, align 4
  %cmp322 = icmp sgt i32 %191, 0
  br i1 %cmp322, label %land.rhs324, label %land.end330

land.rhs324:                                      ; preds = %if.then321
  %192 = load i8*, i8** %string, align 4
  %193 = load i32, i32* %i, align 4
  %sub325 = sub nsw i32 %193, 1
  %arrayidx326 = getelementptr inbounds i8, i8* %192, i32 %sub325
  %194 = load i8, i8* %arrayidx326, align 1
  %conv327 = sext i8 %194 to i32
  %cmp328 = icmp eq i32 %conv327, 36
  br label %land.end330

land.end330:                                      ; preds = %land.rhs324, %if.then321
  %195 = phi i1 [ false, %if.then321 ], [ %cmp328, %land.rhs324 ]
  %land.ext331 = zext i1 %195 to i32
  store i32 %land.ext331, i32* %flag, align 4
  %196 = load i32, i32* %i, align 4
  %inc332 = add nsw i32 %196, 1
  store i32 %inc332, i32* %i, align 4
  store i32 %196, i32* %quote, align 4
  %197 = load i8*, i8** %string, align 4
  %198 = load i32, i32* %flag, align 4
  call void @hist_string_extract_single_quoted(i8* %197, i32* %i, i32 %198)
  %199 = load i32, i32* %i, align 4
  %200 = load i32, i32* %quote, align 4
  %sub333 = sub nsw i32 %199, %200
  %add334 = add nsw i32 %sub333, 2
  store i32 %add334, i32* %slen, align 4
  %201 = load i32, i32* %slen, align 4
  %call335 = call i8* @xmalloc(i32 %201)
  store i8* %call335, i8** %temp, align 4
  %202 = load i8*, i8** %temp, align 4
  %203 = load i8*, i8** %string, align 4
  %204 = load i32, i32* %quote, align 4
  %add.ptr336 = getelementptr inbounds i8, i8* %203, i32 %204
  %205 = load i32, i32* %slen, align 4
  %call337 = call i8* @strncpy(i8* %202, i8* %add.ptr336, i32 %205)
  %206 = load i8*, i8** %temp, align 4
  %207 = load i32, i32* %slen, align 4
  %sub338 = sub nsw i32 %207, 1
  %arrayidx339 = getelementptr inbounds i8, i8* %206, i32 %sub338
  store i8 0, i8* %arrayidx339, align 1
  br label %do.body340

do.body340:                                       ; preds = %land.end330
  %208 = load i8*, i8** %temp, align 4
  %call342 = call i32 @strlen(i8* %208)
  store i32 %call342, i32* %sl341, align 4
  %209 = load i32, i32* %sl341, align 4
  %210 = load i32, i32* %j, align 4
  %add343 = add nsw i32 %210, %209
  store i32 %add343, i32* %j, align 4
  %211 = load i32, i32* %j, align 4
  %212 = load i32, i32* %result_len, align 4
  %cmp344 = icmp sge i32 %211, %212
  br i1 %cmp344, label %if.then346, label %if.end354

if.then346:                                       ; preds = %do.body340
  br label %while.cond347

while.cond347:                                    ; preds = %while.body350, %if.then346
  %213 = load i32, i32* %j, align 4
  %214 = load i32, i32* %result_len, align 4
  %cmp348 = icmp sge i32 %213, %214
  br i1 %cmp348, label %while.body350, label %while.end352

while.body350:                                    ; preds = %while.cond347
  %215 = load i32, i32* %result_len, align 4
  %add351 = add nsw i32 %215, 128
  store i32 %add351, i32* %result_len, align 4
  br label %while.cond347

while.end352:                                     ; preds = %while.cond347
  %216 = load i8*, i8** %result, align 4
  %217 = load i32, i32* %result_len, align 4
  %call353 = call i8* @xrealloc(i8* %216, i32 %217)
  store i8* %call353, i8** %result, align 4
  br label %if.end354

if.end354:                                        ; preds = %while.end352, %do.body340
  %218 = load i8*, i8** %result, align 4
  %219 = load i32, i32* %j, align 4
  %add.ptr355 = getelementptr inbounds i8, i8* %218, i32 %219
  %220 = load i32, i32* %sl341, align 4
  %idx.neg356 = sub i32 0, %220
  %add.ptr357 = getelementptr inbounds i8, i8* %add.ptr355, i32 %idx.neg356
  %221 = load i8*, i8** %temp, align 4
  %call358 = call i8* @strcpy(i8* %add.ptr357, i8* %221)
  br label %do.end359

do.end359:                                        ; preds = %if.end354
  %222 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %222)
  br label %if.end398

if.else360:                                       ; preds = %land.lhs.true319, %if.else316
  %223 = load i32, i32* %dquote, align 4
  %cmp361 = icmp eq i32 %223, 0
  br i1 %cmp361, label %land.lhs.true363, label %if.else383

land.lhs.true363:                                 ; preds = %if.else360
  %224 = load i32, i32* %squote, align 4
  %cmp364 = icmp eq i32 %224, 0
  br i1 %cmp364, label %land.lhs.true366, label %if.else383

land.lhs.true366:                                 ; preds = %land.lhs.true363
  %225 = load i32, i32* @history_quotes_inhibit_expansion, align 4
  %cmp367 = icmp eq i32 %225, 0
  br i1 %cmp367, label %if.then369, label %if.else383

if.then369:                                       ; preds = %land.lhs.true366
  store i32 1, i32* %squote, align 4
  br label %do.body370

do.body370:                                       ; preds = %if.then369
  %226 = load i32, i32* %j, align 4
  %227 = load i32, i32* %result_len, align 4
  %sub371 = sub nsw i32 %227, 1
  %cmp372 = icmp sge i32 %226, %sub371
  br i1 %cmp372, label %if.then374, label %if.end377

if.then374:                                       ; preds = %do.body370
  %228 = load i8*, i8** %result, align 4
  %229 = load i32, i32* %result_len, align 4
  %add375 = add nsw i32 %229, 64
  store i32 %add375, i32* %result_len, align 4
  %call376 = call i8* @xrealloc(i8* %228, i32 %add375)
  store i8* %call376, i8** %result, align 4
  br label %if.end377

if.end377:                                        ; preds = %if.then374, %do.body370
  %230 = load i8*, i8** %string, align 4
  %231 = load i32, i32* %i, align 4
  %arrayidx378 = getelementptr inbounds i8, i8* %230, i32 %231
  %232 = load i8, i8* %arrayidx378, align 1
  %233 = load i8*, i8** %result, align 4
  %234 = load i32, i32* %j, align 4
  %inc379 = add nsw i32 %234, 1
  store i32 %inc379, i32* %j, align 4
  %arrayidx380 = getelementptr inbounds i8, i8* %233, i32 %234
  store i8 %232, i8* %arrayidx380, align 1
  %235 = load i8*, i8** %result, align 4
  %236 = load i32, i32* %j, align 4
  %arrayidx381 = getelementptr inbounds i8, i8* %235, i32 %236
  store i8 0, i8* %arrayidx381, align 1
  br label %do.end382

do.end382:                                        ; preds = %if.end377
  br label %if.end397

if.else383:                                       ; preds = %land.lhs.true366, %land.lhs.true363, %if.else360
  br label %do.body384

do.body384:                                       ; preds = %if.else383
  %237 = load i32, i32* %j, align 4
  %238 = load i32, i32* %result_len, align 4
  %sub385 = sub nsw i32 %238, 1
  %cmp386 = icmp sge i32 %237, %sub385
  br i1 %cmp386, label %if.then388, label %if.end391

if.then388:                                       ; preds = %do.body384
  %239 = load i8*, i8** %result, align 4
  %240 = load i32, i32* %result_len, align 4
  %add389 = add nsw i32 %240, 64
  store i32 %add389, i32* %result_len, align 4
  %call390 = call i8* @xrealloc(i8* %239, i32 %add389)
  store i8* %call390, i8** %result, align 4
  br label %if.end391

if.end391:                                        ; preds = %if.then388, %do.body384
  %241 = load i8*, i8** %string, align 4
  %242 = load i32, i32* %i, align 4
  %arrayidx392 = getelementptr inbounds i8, i8* %241, i32 %242
  %243 = load i8, i8* %arrayidx392, align 1
  %244 = load i8*, i8** %result, align 4
  %245 = load i32, i32* %j, align 4
  %inc393 = add nsw i32 %245, 1
  store i32 %inc393, i32* %j, align 4
  %arrayidx394 = getelementptr inbounds i8, i8* %244, i32 %245
  store i8 %243, i8* %arrayidx394, align 1
  %246 = load i8*, i8** %result, align 4
  %247 = load i32, i32* %j, align 4
  %arrayidx395 = getelementptr inbounds i8, i8* %246, i32 %247
  store i8 0, i8* %arrayidx395, align 1
  br label %do.end396

do.end396:                                        ; preds = %if.end391
  br label %if.end397

if.end397:                                        ; preds = %do.end396, %do.end382
  br label %if.end398

if.end398:                                        ; preds = %if.end397, %do.end359
  br label %if.end399

if.end399:                                        ; preds = %if.end398, %do.end315
  br label %sw.epilog

sw.bb400:                                         ; preds = %if.end257
  %248 = load i32, i32* %dquote, align 4
  %cmp401 = icmp eq i32 %248, 0
  br i1 %cmp401, label %land.lhs.true406, label %lor.lhs.false403

lor.lhs.false403:                                 ; preds = %sw.bb400
  %249 = load i32, i32* @history_quotes_inhibit_expansion, align 4
  %cmp404 = icmp eq i32 %249, 0
  br i1 %cmp404, label %land.lhs.true406, label %if.else448

land.lhs.true406:                                 ; preds = %lor.lhs.false403, %sw.bb400
  %250 = load i32, i32* %i, align 4
  %cmp407 = icmp eq i32 %250, 0
  br i1 %cmp407, label %if.then422, label %lor.lhs.false409

lor.lhs.false409:                                 ; preds = %land.lhs.true406
  %251 = load i8*, i8** %string, align 4
  %252 = load i32, i32* %i, align 4
  %sub410 = sub nsw i32 %252, 1
  %arrayidx411 = getelementptr inbounds i8, i8* %251, i32 %sub410
  %253 = load i8, i8* %arrayidx411, align 1
  %conv412 = sext i8 %253 to i32
  %tobool413 = icmp ne i32 %conv412, 0
  br i1 %tobool413, label %cond.true414, label %cond.false421

cond.true414:                                     ; preds = %lor.lhs.false409
  %254 = load i8*, i8** @history_word_delimiters, align 4
  %255 = load i8*, i8** %string, align 4
  %256 = load i32, i32* %i, align 4
  %sub415 = sub nsw i32 %256, 1
  %arrayidx416 = getelementptr inbounds i8, i8* %255, i32 %sub415
  %257 = load i8, i8* %arrayidx416, align 1
  %conv417 = sext i8 %257 to i32
  %call418 = call i8* @strchr(i8* %254, i32 %conv417)
  %cmp419 = icmp ne i8* %call418, null
  br i1 %cmp419, label %if.then422, label %if.else448

cond.false421:                                    ; preds = %lor.lhs.false409
  br i1 false, label %if.then422, label %if.else448

if.then422:                                       ; preds = %cond.false421, %cond.true414, %land.lhs.true406
  %258 = load i32, i32* %l, align 4
  %259 = load i32, i32* %i, align 4
  %sub423 = sub nsw i32 %258, %259
  %add424 = add nsw i32 %sub423, 1
  %call425 = call i8* @xmalloc(i32 %add424)
  store i8* %call425, i8** %temp, align 4
  %260 = load i8*, i8** %temp, align 4
  %261 = load i8*, i8** %string, align 4
  %262 = load i32, i32* %i, align 4
  %add.ptr426 = getelementptr inbounds i8, i8* %261, i32 %262
  %call427 = call i8* @strcpy(i8* %260, i8* %add.ptr426)
  br label %do.body428

do.body428:                                       ; preds = %if.then422
  %263 = load i8*, i8** %temp, align 4
  %call430 = call i32 @strlen(i8* %263)
  store i32 %call430, i32* %sl429, align 4
  %264 = load i32, i32* %sl429, align 4
  %265 = load i32, i32* %j, align 4
  %add431 = add nsw i32 %265, %264
  store i32 %add431, i32* %j, align 4
  %266 = load i32, i32* %j, align 4
  %267 = load i32, i32* %result_len, align 4
  %cmp432 = icmp sge i32 %266, %267
  br i1 %cmp432, label %if.then434, label %if.end442

if.then434:                                       ; preds = %do.body428
  br label %while.cond435

while.cond435:                                    ; preds = %while.body438, %if.then434
  %268 = load i32, i32* %j, align 4
  %269 = load i32, i32* %result_len, align 4
  %cmp436 = icmp sge i32 %268, %269
  br i1 %cmp436, label %while.body438, label %while.end440

while.body438:                                    ; preds = %while.cond435
  %270 = load i32, i32* %result_len, align 4
  %add439 = add nsw i32 %270, 128
  store i32 %add439, i32* %result_len, align 4
  br label %while.cond435

while.end440:                                     ; preds = %while.cond435
  %271 = load i8*, i8** %result, align 4
  %272 = load i32, i32* %result_len, align 4
  %call441 = call i8* @xrealloc(i8* %271, i32 %272)
  store i8* %call441, i8** %result, align 4
  br label %if.end442

if.end442:                                        ; preds = %while.end440, %do.body428
  %273 = load i8*, i8** %result, align 4
  %274 = load i32, i32* %j, align 4
  %add.ptr443 = getelementptr inbounds i8, i8* %273, i32 %274
  %275 = load i32, i32* %sl429, align 4
  %idx.neg444 = sub i32 0, %275
  %add.ptr445 = getelementptr inbounds i8, i8* %add.ptr443, i32 %idx.neg444
  %276 = load i8*, i8** %temp, align 4
  %call446 = call i8* @strcpy(i8* %add.ptr445, i8* %276)
  br label %do.end447

do.end447:                                        ; preds = %if.end442
  %277 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %277)
  %278 = load i32, i32* %l, align 4
  store i32 %278, i32* %i, align 4
  br label %if.end462

if.else448:                                       ; preds = %cond.false421, %cond.true414, %lor.lhs.false403
  br label %do.body449

do.body449:                                       ; preds = %if.else448
  %279 = load i32, i32* %j, align 4
  %280 = load i32, i32* %result_len, align 4
  %sub450 = sub nsw i32 %280, 1
  %cmp451 = icmp sge i32 %279, %sub450
  br i1 %cmp451, label %if.then453, label %if.end456

if.then453:                                       ; preds = %do.body449
  %281 = load i8*, i8** %result, align 4
  %282 = load i32, i32* %result_len, align 4
  %add454 = add nsw i32 %282, 64
  store i32 %add454, i32* %result_len, align 4
  %call455 = call i8* @xrealloc(i8* %281, i32 %add454)
  store i8* %call455, i8** %result, align 4
  br label %if.end456

if.end456:                                        ; preds = %if.then453, %do.body449
  %283 = load i8*, i8** %string, align 4
  %284 = load i32, i32* %i, align 4
  %arrayidx457 = getelementptr inbounds i8, i8* %283, i32 %284
  %285 = load i8, i8* %arrayidx457, align 1
  %286 = load i8*, i8** %result, align 4
  %287 = load i32, i32* %j, align 4
  %inc458 = add nsw i32 %287, 1
  store i32 %inc458, i32* %j, align 4
  %arrayidx459 = getelementptr inbounds i8, i8* %286, i32 %287
  store i8 %285, i8* %arrayidx459, align 1
  %288 = load i8*, i8** %result, align 4
  %289 = load i32, i32* %j, align 4
  %arrayidx460 = getelementptr inbounds i8, i8* %288, i32 %289
  store i8 0, i8* %arrayidx460, align 1
  br label %do.end461

do.end461:                                        ; preds = %if.end456
  br label %if.end462

if.end462:                                        ; preds = %do.end461, %do.end447
  br label %sw.epilog

sw.bb463:                                         ; preds = %if.end257
  %290 = load i8*, i8** %string, align 4
  %291 = load i32, i32* %i, align 4
  %add464 = add nsw i32 %291, 1
  %arrayidx465 = getelementptr inbounds i8, i8* %290, i32 %add464
  %292 = load i8, i8* %arrayidx465, align 1
  %conv466 = sext i8 %292 to i32
  store i32 %conv466, i32* %cc, align 4
  %293 = load i32, i32* %cc, align 4
  %cmp467 = icmp eq i32 %293, 0
  br i1 %cmp467, label %if.then486, label %lor.lhs.false469

lor.lhs.false469:                                 ; preds = %sw.bb463
  %294 = load i32, i32* %cc, align 4
  %tobool470 = icmp ne i32 %294, 0
  br i1 %tobool470, label %cond.true471, label %cond.false475

cond.true471:                                     ; preds = %lor.lhs.false469
  %295 = load i8*, i8** @history_no_expand_chars, align 4
  %296 = load i32, i32* %cc, align 4
  %call472 = call i8* @strchr(i8* %295, i32 %296)
  %cmp473 = icmp ne i8* %call472, null
  br i1 %cmp473, label %if.then486, label %lor.lhs.false476

cond.false475:                                    ; preds = %lor.lhs.false469
  br i1 false, label %if.then486, label %lor.lhs.false476

lor.lhs.false476:                                 ; preds = %cond.false475, %cond.true471
  %297 = load i32, i32* %dquote, align 4
  %tobool477 = icmp ne i32 %297, 0
  br i1 %tobool477, label %land.lhs.true478, label %lor.lhs.false481

land.lhs.true478:                                 ; preds = %lor.lhs.false476
  %298 = load i32, i32* %cc, align 4
  %cmp479 = icmp eq i32 %298, 34
  br i1 %cmp479, label %if.then486, label %lor.lhs.false481

lor.lhs.false481:                                 ; preds = %land.lhs.true478, %lor.lhs.false476
  %299 = load i32 (i8*, i32)*, i32 (i8*, i32)** @history_inhibit_expansion_function, align 4
  %tobool482 = icmp ne i32 (i8*, i32)* %299, null
  br i1 %tobool482, label %land.lhs.true483, label %if.end500

land.lhs.true483:                                 ; preds = %lor.lhs.false481
  %300 = load i32 (i8*, i32)*, i32 (i8*, i32)** @history_inhibit_expansion_function, align 4
  %301 = load i8*, i8** %string, align 4
  %302 = load i32, i32* %i, align 4
  %call484 = call i32 %300(i8* %301, i32 %302)
  %tobool485 = icmp ne i32 %call484, 0
  br i1 %tobool485, label %if.then486, label %if.end500

if.then486:                                       ; preds = %land.lhs.true483, %land.lhs.true478, %cond.false475, %cond.true471, %sw.bb463
  br label %do.body487

do.body487:                                       ; preds = %if.then486
  %303 = load i32, i32* %j, align 4
  %304 = load i32, i32* %result_len, align 4
  %sub488 = sub nsw i32 %304, 1
  %cmp489 = icmp sge i32 %303, %sub488
  br i1 %cmp489, label %if.then491, label %if.end494

if.then491:                                       ; preds = %do.body487
  %305 = load i8*, i8** %result, align 4
  %306 = load i32, i32* %result_len, align 4
  %add492 = add nsw i32 %306, 64
  store i32 %add492, i32* %result_len, align 4
  %call493 = call i8* @xrealloc(i8* %305, i32 %add492)
  store i8* %call493, i8** %result, align 4
  br label %if.end494

if.end494:                                        ; preds = %if.then491, %do.body487
  %307 = load i8*, i8** %string, align 4
  %308 = load i32, i32* %i, align 4
  %arrayidx495 = getelementptr inbounds i8, i8* %307, i32 %308
  %309 = load i8, i8* %arrayidx495, align 1
  %310 = load i8*, i8** %result, align 4
  %311 = load i32, i32* %j, align 4
  %inc496 = add nsw i32 %311, 1
  store i32 %inc496, i32* %j, align 4
  %arrayidx497 = getelementptr inbounds i8, i8* %310, i32 %311
  store i8 %309, i8* %arrayidx497, align 1
  %312 = load i8*, i8** %result, align 4
  %313 = load i32, i32* %j, align 4
  %arrayidx498 = getelementptr inbounds i8, i8* %312, i32 %313
  store i8 0, i8* %arrayidx498, align 1
  br label %do.end499

do.end499:                                        ; preds = %if.end494
  br label %sw.epilog

if.end500:                                        ; preds = %land.lhs.true483, %lor.lhs.false481
  %314 = load i32, i32* %squote, align 4
  %tobool501 = icmp ne i32 %314, 0
  br i1 %tobool501, label %cond.true502, label %cond.false503

cond.true502:                                     ; preds = %if.end500
  br label %cond.end

cond.false503:                                    ; preds = %if.end500
  %315 = load i32, i32* %dquote, align 4
  %tobool504 = icmp ne i32 %315, 0
  %cond = select i1 %tobool504, i32 34, i32 0
  br label %cond.end

cond.end:                                         ; preds = %cond.false503, %cond.true502
  %cond505 = phi i32 [ 39, %cond.true502 ], [ %cond, %cond.false503 ]
  store i32 %cond505, i32* %qc, align 4
  %316 = load i8*, i8** %string, align 4
  %317 = load i32, i32* %i, align 4
  %318 = load i32, i32* %qc, align 4
  %319 = load i8*, i8** %result, align 4
  %call506 = call i32 @history_expand_internal(i8* %316, i32 %317, i32 %318, i32* %eindex, i8** %temp, i8* %319)
  store i32 %call506, i32* %r, align 4
  %320 = load i32, i32* %r, align 4
  %cmp507 = icmp slt i32 %320, 0
  br i1 %cmp507, label %if.then509, label %if.else514

if.then509:                                       ; preds = %cond.end
  %321 = load i8*, i8** %temp, align 4
  %322 = load i8**, i8*** %output.addr, align 4
  store i8* %321, i8** %322, align 4
  %323 = load i8*, i8** %result, align 4
  call void @xfree(i8* %323)
  %324 = load i8*, i8** %string, align 4
  %325 = load i8*, i8** %hstring.addr, align 4
  %cmp510 = icmp ne i8* %324, %325
  br i1 %cmp510, label %if.then512, label %if.end513

if.then512:                                       ; preds = %if.then509
  %326 = load i8*, i8** %string, align 4
  call void @xfree(i8* %326)
  br label %if.end513

if.end513:                                        ; preds = %if.then512, %if.then509
  store i32 -1, i32* %retval, align 4
  br label %return

if.else514:                                       ; preds = %cond.end
  %327 = load i8*, i8** %temp, align 4
  %tobool515 = icmp ne i8* %327, null
  br i1 %tobool515, label %if.then516, label %if.end541

if.then516:                                       ; preds = %if.else514
  %328 = load i32, i32* %modified, align 4
  %inc517 = add nsw i32 %328, 1
  store i32 %inc517, i32* %modified, align 4
  %329 = load i8*, i8** %temp, align 4
  %330 = load i8, i8* %329, align 1
  %tobool518 = icmp ne i8 %330, 0
  br i1 %tobool518, label %if.then519, label %if.end540

if.then519:                                       ; preds = %if.then516
  br label %do.body520

do.body520:                                       ; preds = %if.then519
  %331 = load i8*, i8** %temp, align 4
  %call522 = call i32 @strlen(i8* %331)
  store i32 %call522, i32* %sl521, align 4
  %332 = load i32, i32* %sl521, align 4
  %333 = load i32, i32* %j, align 4
  %add523 = add nsw i32 %333, %332
  store i32 %add523, i32* %j, align 4
  %334 = load i32, i32* %j, align 4
  %335 = load i32, i32* %result_len, align 4
  %cmp524 = icmp sge i32 %334, %335
  br i1 %cmp524, label %if.then526, label %if.end534

if.then526:                                       ; preds = %do.body520
  br label %while.cond527

while.cond527:                                    ; preds = %while.body530, %if.then526
  %336 = load i32, i32* %j, align 4
  %337 = load i32, i32* %result_len, align 4
  %cmp528 = icmp sge i32 %336, %337
  br i1 %cmp528, label %while.body530, label %while.end532

while.body530:                                    ; preds = %while.cond527
  %338 = load i32, i32* %result_len, align 4
  %add531 = add nsw i32 %338, 128
  store i32 %add531, i32* %result_len, align 4
  br label %while.cond527

while.end532:                                     ; preds = %while.cond527
  %339 = load i8*, i8** %result, align 4
  %340 = load i32, i32* %result_len, align 4
  %call533 = call i8* @xrealloc(i8* %339, i32 %340)
  store i8* %call533, i8** %result, align 4
  br label %if.end534

if.end534:                                        ; preds = %while.end532, %do.body520
  %341 = load i8*, i8** %result, align 4
  %342 = load i32, i32* %j, align 4
  %add.ptr535 = getelementptr inbounds i8, i8* %341, i32 %342
  %343 = load i32, i32* %sl521, align 4
  %idx.neg536 = sub i32 0, %343
  %add.ptr537 = getelementptr inbounds i8, i8* %add.ptr535, i32 %idx.neg536
  %344 = load i8*, i8** %temp, align 4
  %call538 = call i8* @strcpy(i8* %add.ptr537, i8* %344)
  br label %do.end539

do.end539:                                        ; preds = %if.end534
  br label %if.end540

if.end540:                                        ; preds = %do.end539, %if.then516
  %345 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %345)
  br label %if.end541

if.end541:                                        ; preds = %if.end540, %if.else514
  %346 = load i32, i32* %r, align 4
  %cmp542 = icmp eq i32 %346, 1
  %conv543 = zext i1 %cmp542 to i32
  %347 = load i32, i32* %only_printing, align 4
  %add544 = add nsw i32 %347, %conv543
  store i32 %add544, i32* %only_printing, align 4
  %348 = load i32, i32* %eindex, align 4
  store i32 %348, i32* %i, align 4
  br label %if.end545

if.end545:                                        ; preds = %if.end541
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end545, %do.end499, %if.end462, %if.end399, %do.end299, %do.end284, %do.end270
  br label %for.inc546

for.inc546:                                       ; preds = %sw.epilog, %do.end244, %do.end
  %349 = load i32, i32* %i, align 4
  %inc547 = add nsw i32 %349, 1
  store i32 %inc547, i32* %i, align 4
  br label %for.cond174

for.end548:                                       ; preds = %for.cond174
  %350 = load i8*, i8** %result, align 4
  %351 = load i8**, i8*** %output.addr, align 4
  store i8* %350, i8** %351, align 4
  %352 = load i8*, i8** %string, align 4
  %353 = load i8*, i8** %hstring.addr, align 4
  %cmp549 = icmp ne i8* %352, %353
  br i1 %cmp549, label %if.then551, label %if.end552

if.then551:                                       ; preds = %for.end548
  %354 = load i8*, i8** %string, align 4
  call void @xfree(i8* %354)
  br label %if.end552

if.end552:                                        ; preds = %if.then551, %for.end548
  %355 = load i32, i32* %only_printing, align 4
  %tobool553 = icmp ne i32 %355, 0
  br i1 %tobool553, label %if.then554, label %if.end555

if.then554:                                       ; preds = %if.end552
  store i32 2, i32* %retval, align 4
  br label %return

if.end555:                                        ; preds = %if.end552
  %356 = load i32, i32* %modified, align 4
  %cmp556 = icmp ne i32 %356, 0
  %conv557 = zext i1 %cmp556 to i32
  store i32 %conv557, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end555, %if.then554, %if.end513, %if.then167, %if.then3, %if.then
  %357 = load i32, i32* %retval, align 4
  ret i32 %357
}

; Function Attrs: noinline nounwind
define internal void @hist_string_extract_single_quoted(i8* %string, i32* %sindex, i32 %flags) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %sindex.addr = alloca i32*, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32* %sindex, i32** %sindex.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32*, i32** %sindex.addr, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %7 to i32
  %cmp = icmp ne i32 %conv2, 39
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %8 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %8, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %9 = load i32, i32* %flags.addr, align 4
  %and = and i32 %9, 1
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %10 = load i8*, i8** %string.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %12 to i32
  %cmp7 = icmp eq i32 %conv6, 92
  br i1 %cmp7, label %land.lhs.true9, label %if.end

land.lhs.true9:                                   ; preds = %land.lhs.true
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i32, i32* %i, align 4
  %add = add nsw i32 %14, 1
  %arrayidx10 = getelementptr inbounds i8, i8* %13, i32 %add
  %15 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %15 to i32
  %tobool12 = icmp ne i32 %conv11, 0
  br i1 %tobool12, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true9
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true9, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %17, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %18 = load i32, i32* %i, align 4
  %19 = load i32*, i32** %sindex.addr, align 4
  store i32 %18, i32* %19, align 4
  ret void
}

declare i8* @xrealloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @history_expand_internal(i8* %string, i32 %start, i32 %qc, i32* %end_index_ptr, i8** %ret_string, i8* %current_line) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %qc.addr = alloca i32, align 4
  %end_index_ptr.addr = alloca i32*, align 4
  %ret_string.addr = alloca i8**, align 4
  %current_line.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %starting_index = alloca i32, align 4
  %substitute_globally = alloca i32, align 4
  %subst_bywords = alloca i32, align 4
  %want_quotes = alloca i32, align 4
  %print_only = alloca i32, align 4
  %event = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %result = alloca i8*, align 4
  %tstr = alloca i8*, align 4
  %t = alloca i8*, align 4
  %c = alloca i8, align 1
  %word_spec = alloca i8*, align 4
  %result_len = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %fake_s = alloca [3 x i8], align 1
  %fake_i = alloca i32, align 4
  %new_event = alloca i8*, align 4
  %delimiter = alloca i32, align 4
  %failed = alloca i32, align 4
  %si = alloca i32, align 4
  %l_temp = alloca i32, align 4
  %ws = alloca i32, align 4
  %we = alloca i32, align 4
  %len = alloca i32, align 4
  %x = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %qc, i32* %qc.addr, align 4
  store i32* %end_index_ptr, i32** %end_index_ptr.addr, align 4
  store i8** %ret_string, i8*** %ret_string.addr, align 4
  store i8* %current_line, i8** %current_line.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  store i32 128, i32* %result_len, align 4
  %call = call i8* @xmalloc(i32 128)
  store i8* %call, i8** %result, align 4
  %1 = load i32, i32* %start.addr, align 4
  store i32 %1, i32* %i, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %i, align 4
  %add = add nsw i32 %3, 1
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %add
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %i, align 4
  %add1 = add nsw i32 %6, 1
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i32 %add1
  %7 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %call4 = call i8* @strchr(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i32 %conv3)
  %cmp = icmp ne i8* %call4, null
  br i1 %cmp, label %if.then, label %if.else

cond.false:                                       ; preds = %entry
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %cond.false, %cond.true
  store i32 0, i32* %fake_i, align 4
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  %9 = load i8, i8* @history_expansion_char, align 1
  %arrayidx6 = getelementptr inbounds [3 x i8], [3 x i8]* %fake_s, i32 0, i32 1
  store i8 %9, i8* %arrayidx6, align 1
  %arrayidx7 = getelementptr inbounds [3 x i8], [3 x i8]* %fake_s, i32 0, i32 0
  store i8 %9, i8* %arrayidx7, align 1
  %arrayidx8 = getelementptr inbounds [3 x i8], [3 x i8]* %fake_s, i32 0, i32 2
  store i8 0, i8* %arrayidx8, align 1
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %fake_s, i32 0, i32 0
  %call9 = call i8* @get_history_event(i8* %arraydecay, i32* %fake_i, i32 0)
  store i8* %call9, i8** %event, align 4
  br label %if.end19

if.else:                                          ; preds = %cond.false, %cond.true
  %10 = load i8*, i8** %string.addr, align 4
  %11 = load i32, i32* %i, align 4
  %add10 = add nsw i32 %11, 1
  %arrayidx11 = getelementptr inbounds i8, i8* %10, i32 %add10
  %12 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %12 to i32
  %cmp13 = icmp eq i32 %conv12, 35
  br i1 %cmp13, label %if.then15, label %if.else17

if.then15:                                        ; preds = %if.else
  %13 = load i32, i32* %i, align 4
  %add16 = add nsw i32 %13, 2
  store i32 %add16, i32* %i, align 4
  %14 = load i8*, i8** %current_line.addr, align 4
  store i8* %14, i8** %event, align 4
  br label %if.end

if.else17:                                        ; preds = %if.else
  %15 = load i8*, i8** %string.addr, align 4
  %16 = load i32, i32* %qc.addr, align 4
  %call18 = call i8* @get_history_event(i8* %15, i32* %i, i32 %16)
  store i8* %call18, i8** %event, align 4
  br label %if.end

if.end:                                           ; preds = %if.else17, %if.then15
  br label %if.end19

if.end19:                                         ; preds = %if.end, %if.then
  %17 = load i8*, i8** %event, align 4
  %cmp20 = icmp eq i8* %17, null
  br i1 %cmp20, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.end19
  %18 = load i8*, i8** %string.addr, align 4
  %19 = load i32, i32* %start.addr, align 4
  %20 = load i32, i32* %i, align 4
  %call23 = call i8* @hist_error(i8* %18, i32 %19, i32 %20, i32 0)
  %21 = load i8**, i8*** %ret_string.addr, align 4
  store i8* %call23, i8** %21, align 4
  %22 = load i8*, i8** %result, align 4
  call void @xfree(i8* %22)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end24:                                         ; preds = %if.end19
  %23 = load i32, i32* %i, align 4
  store i32 %23, i32* %starting_index, align 4
  %24 = load i8*, i8** %string.addr, align 4
  %25 = load i8*, i8** %event, align 4
  %call25 = call i8* @get_history_word_specifier(i8* %24, i8* %25, i32* %i)
  store i8* %call25, i8** %word_spec, align 4
  %26 = load i8*, i8** %word_spec, align 4
  %cmp26 = icmp eq i8* %26, @error_pointer
  br i1 %cmp26, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end24
  %27 = load i8*, i8** %string.addr, align 4
  %28 = load i32, i32* %starting_index, align 4
  %29 = load i32, i32* %i, align 4
  %call29 = call i8* @hist_error(i8* %27, i32 %28, i32 %29, i32 1)
  %30 = load i8**, i8*** %ret_string.addr, align 4
  store i8* %call29, i8** %30, align 4
  %31 = load i8*, i8** %result, align 4
  call void @xfree(i8* %31)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end30:                                         ; preds = %if.end24
  %32 = load i8*, i8** %word_spec, align 4
  %tobool31 = icmp ne i8* %32, null
  br i1 %tobool31, label %cond.true32, label %cond.false37

cond.true32:                                      ; preds = %if.end30
  %33 = load i8*, i8** %word_spec, align 4
  %call33 = call i32 @strlen(i8* %33)
  %add34 = add i32 1, %call33
  %call35 = call i8* @xmalloc(i32 %add34)
  %34 = load i8*, i8** %word_spec, align 4
  %call36 = call i8* @strcpy(i8* %call35, i8* %34)
  br label %cond.end

cond.false37:                                     ; preds = %if.end30
  %35 = load i8*, i8** %event, align 4
  %call38 = call i32 @strlen(i8* %35)
  %add39 = add i32 1, %call38
  %call40 = call i8* @xmalloc(i32 %add39)
  %36 = load i8*, i8** %event, align 4
  %call41 = call i8* @strcpy(i8* %call40, i8* %36)
  br label %cond.end

cond.end:                                         ; preds = %cond.false37, %cond.true32
  %cond = phi i8* [ %call36, %cond.true32 ], [ %call41, %cond.false37 ]
  store i8* %cond, i8** %temp, align 4
  %37 = load i8*, i8** %word_spec, align 4
  %tobool42 = icmp ne i8* %37, null
  br i1 %tobool42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %cond.end
  %38 = load i8*, i8** %word_spec, align 4
  call void @free(i8* %38)
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %cond.end
  store i32 0, i32* %print_only, align 4
  store i32 0, i32* %subst_bywords, align 4
  store i32 0, i32* %substitute_globally, align 4
  store i32 0, i32* %want_quotes, align 4
  %39 = load i32, i32* %i, align 4
  store i32 %39, i32* %starting_index, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.then266, %if.then262, %if.end44
  %40 = load i8*, i8** %string.addr, align 4
  %41 = load i32, i32* %i, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %40, i32 %41
  %42 = load i8, i8* %arrayidx45, align 1
  %conv46 = sext i8 %42 to i32
  %cmp47 = icmp eq i32 %conv46, 58
  br i1 %cmp47, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %43 = load i8*, i8** %string.addr, align 4
  %44 = load i32, i32* %i, align 4
  %add49 = add nsw i32 %44, 1
  %arrayidx50 = getelementptr inbounds i8, i8* %43, i32 %add49
  %45 = load i8, i8* %arrayidx50, align 1
  store i8 %45, i8* %c, align 1
  %46 = load i8, i8* %c, align 1
  %conv51 = sext i8 %46 to i32
  %cmp52 = icmp eq i32 %conv51, 103
  br i1 %cmp52, label %if.then57, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %47 = load i8, i8* %c, align 1
  %conv54 = sext i8 %47 to i32
  %cmp55 = icmp eq i32 %conv54, 97
  br i1 %cmp55, label %if.then57, label %if.else61

if.then57:                                        ; preds = %lor.lhs.false, %while.body
  store i32 1, i32* %substitute_globally, align 4
  %48 = load i32, i32* %i, align 4
  %inc58 = add nsw i32 %48, 1
  store i32 %inc58, i32* %i, align 4
  %49 = load i8*, i8** %string.addr, align 4
  %50 = load i32, i32* %i, align 4
  %add59 = add nsw i32 %50, 1
  %arrayidx60 = getelementptr inbounds i8, i8* %49, i32 %add59
  %51 = load i8, i8* %arrayidx60, align 1
  store i8 %51, i8* %c, align 1
  br label %if.end70

if.else61:                                        ; preds = %lor.lhs.false
  %52 = load i8, i8* %c, align 1
  %conv62 = sext i8 %52 to i32
  %cmp63 = icmp eq i32 %conv62, 71
  br i1 %cmp63, label %if.then65, label %if.end69

if.then65:                                        ; preds = %if.else61
  store i32 1, i32* %subst_bywords, align 4
  %53 = load i32, i32* %i, align 4
  %inc66 = add nsw i32 %53, 1
  store i32 %inc66, i32* %i, align 4
  %54 = load i8*, i8** %string.addr, align 4
  %55 = load i32, i32* %i, align 4
  %add67 = add nsw i32 %55, 1
  %arrayidx68 = getelementptr inbounds i8, i8* %54, i32 %add67
  %56 = load i8, i8* %arrayidx68, align 1
  store i8 %56, i8* %c, align 1
  br label %if.end69

if.end69:                                         ; preds = %if.then65, %if.else61
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.then57
  %57 = load i8, i8* %c, align 1
  %conv71 = sext i8 %57 to i32
  switch i32 %conv71, label %sw.default [
    i32 113, label %sw.bb
    i32 120, label %sw.bb75
    i32 112, label %sw.bb76
    i32 116, label %sw.bb78
    i32 104, label %sw.bb87
    i32 114, label %sw.bb92
    i32 101, label %sw.bb97
    i32 38, label %sw.bb106
    i32 115, label %sw.bb106
  ]

sw.default:                                       ; preds = %if.end70
  %58 = load i8*, i8** %string.addr, align 4
  %59 = load i32, i32* %i, align 4
  %add72 = add nsw i32 %59, 1
  %60 = load i32, i32* %i, align 4
  %add73 = add nsw i32 %60, 2
  %call74 = call i8* @hist_error(i8* %58, i32 %add72, i32 %add73, i32 3)
  %61 = load i8**, i8*** %ret_string.addr, align 4
  store i8* %call74, i8** %61, align 4
  %62 = load i8*, i8** %result, align 4
  call void @xfree(i8* %62)
  %63 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %63)
  store i32 -1, i32* %retval, align 4
  br label %return

sw.bb:                                            ; preds = %if.end70
  store i32 113, i32* %want_quotes, align 4
  br label %sw.epilog

sw.bb75:                                          ; preds = %if.end70
  store i32 120, i32* %want_quotes, align 4
  br label %sw.epilog

sw.bb76:                                          ; preds = %if.end70
  %64 = load i32, i32* %print_only, align 4
  %inc77 = add nsw i32 %64, 1
  store i32 %inc77, i32* %print_only, align 4
  br label %sw.epilog

sw.bb78:                                          ; preds = %if.end70
  %65 = load i8*, i8** %temp, align 4
  %call79 = call i8* @strrchr(i8* %65, i32 47)
  store i8* %call79, i8** %tstr, align 4
  %66 = load i8*, i8** %tstr, align 4
  %tobool80 = icmp ne i8* %66, null
  br i1 %tobool80, label %if.then81, label %if.end86

if.then81:                                        ; preds = %sw.bb78
  %67 = load i8*, i8** %tstr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %incdec.ptr, i8** %tstr, align 4
  %68 = load i8*, i8** %tstr, align 4
  %call82 = call i32 @strlen(i8* %68)
  %add83 = add i32 1, %call82
  %call84 = call i8* @xmalloc(i32 %add83)
  %69 = load i8*, i8** %tstr, align 4
  %call85 = call i8* @strcpy(i8* %call84, i8* %69)
  store i8* %call85, i8** %t, align 4
  %70 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %70)
  %71 = load i8*, i8** %t, align 4
  store i8* %71, i8** %temp, align 4
  br label %if.end86

if.end86:                                         ; preds = %if.then81, %sw.bb78
  br label %sw.epilog

sw.bb87:                                          ; preds = %if.end70
  %72 = load i8*, i8** %temp, align 4
  %call88 = call i8* @strrchr(i8* %72, i32 47)
  store i8* %call88, i8** %tstr, align 4
  %73 = load i8*, i8** %tstr, align 4
  %tobool89 = icmp ne i8* %73, null
  br i1 %tobool89, label %if.then90, label %if.end91

if.then90:                                        ; preds = %sw.bb87
  %74 = load i8*, i8** %tstr, align 4
  store i8 0, i8* %74, align 1
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %sw.bb87
  br label %sw.epilog

sw.bb92:                                          ; preds = %if.end70
  %75 = load i8*, i8** %temp, align 4
  %call93 = call i8* @strrchr(i8* %75, i32 46)
  store i8* %call93, i8** %tstr, align 4
  %76 = load i8*, i8** %tstr, align 4
  %tobool94 = icmp ne i8* %76, null
  br i1 %tobool94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %sw.bb92
  %77 = load i8*, i8** %tstr, align 4
  store i8 0, i8* %77, align 1
  br label %if.end96

if.end96:                                         ; preds = %if.then95, %sw.bb92
  br label %sw.epilog

sw.bb97:                                          ; preds = %if.end70
  %78 = load i8*, i8** %temp, align 4
  %call98 = call i8* @strrchr(i8* %78, i32 46)
  store i8* %call98, i8** %tstr, align 4
  %79 = load i8*, i8** %tstr, align 4
  %tobool99 = icmp ne i8* %79, null
  br i1 %tobool99, label %if.then100, label %if.end105

if.then100:                                       ; preds = %sw.bb97
  %80 = load i8*, i8** %tstr, align 4
  %call101 = call i32 @strlen(i8* %80)
  %add102 = add i32 1, %call101
  %call103 = call i8* @xmalloc(i32 %add102)
  %81 = load i8*, i8** %tstr, align 4
  %call104 = call i8* @strcpy(i8* %call103, i8* %81)
  store i8* %call104, i8** %t, align 4
  %82 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %82)
  %83 = load i8*, i8** %t, align 4
  store i8* %83, i8** %temp, align 4
  br label %if.end105

if.end105:                                        ; preds = %if.then100, %sw.bb97
  br label %sw.epilog

sw.bb106:                                         ; preds = %if.end70, %if.end70
  %84 = load i8, i8* %c, align 1
  %conv107 = sext i8 %84 to i32
  %cmp108 = icmp eq i32 %conv107, 115
  br i1 %cmp108, label %if.then110, label %if.else176

if.then110:                                       ; preds = %sw.bb106
  %85 = load i32, i32* %i, align 4
  %add111 = add nsw i32 %85, 2
  %86 = load i8*, i8** %string.addr, align 4
  %call112 = call i32 @strlen(i8* %86)
  %cmp113 = icmp slt i32 %add111, %call112
  br i1 %cmp113, label %if.then115, label %if.else139

if.then115:                                       ; preds = %if.then110
  %call116 = call i32 @__ctype_get_mb_cur_max()
  %cmp117 = icmp ugt i32 %call116, 1
  br i1 %cmp117, label %land.lhs.true, label %if.else134

land.lhs.true:                                    ; preds = %if.then115
  %87 = load i32, i32* @rl_byte_oriented, align 4
  %cmp119 = icmp eq i32 %87, 0
  br i1 %cmp119, label %if.then121, label %if.else134

if.then121:                                       ; preds = %land.lhs.true
  %88 = load i8*, i8** %string.addr, align 4
  %89 = load i32, i32* %i, align 4
  %add122 = add nsw i32 %89, 2
  %call123 = call i32 @_rl_adjust_point(i8* %88, i32 %add122, %struct.__mbstate_t* %ps)
  %90 = load i8*, i8** %string.addr, align 4
  %91 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %90, i32 %91
  %add.ptr124 = getelementptr inbounds i8, i8* %add.ptr, i32 2
  %call125 = call i32 @_rl_get_char_len(i8* %add.ptr124, %struct.__mbstate_t* %ps)
  %cmp126 = icmp sgt i32 %call125, 1
  br i1 %cmp126, label %if.then128, label %if.else129

if.then128:                                       ; preds = %if.then121
  store i32 0, i32* %delimiter, align 4
  br label %if.end133

if.else129:                                       ; preds = %if.then121
  %92 = load i8*, i8** %string.addr, align 4
  %93 = load i32, i32* %i, align 4
  %add130 = add nsw i32 %93, 2
  %arrayidx131 = getelementptr inbounds i8, i8* %92, i32 %add130
  %94 = load i8, i8* %arrayidx131, align 1
  %conv132 = sext i8 %94 to i32
  store i32 %conv132, i32* %delimiter, align 4
  br label %if.end133

if.end133:                                        ; preds = %if.else129, %if.then128
  br label %if.end138

if.else134:                                       ; preds = %land.lhs.true, %if.then115
  %95 = load i8*, i8** %string.addr, align 4
  %96 = load i32, i32* %i, align 4
  %add135 = add nsw i32 %96, 2
  %arrayidx136 = getelementptr inbounds i8, i8* %95, i32 %add135
  %97 = load i8, i8* %arrayidx136, align 1
  %conv137 = sext i8 %97 to i32
  store i32 %conv137, i32* %delimiter, align 4
  br label %if.end138

if.end138:                                        ; preds = %if.else134, %if.end133
  br label %if.end140

if.else139:                                       ; preds = %if.then110
  br label %sw.epilog

if.end140:                                        ; preds = %if.end138
  %98 = load i32, i32* %i, align 4
  %add141 = add nsw i32 %98, 3
  store i32 %add141, i32* %i, align 4
  %99 = load i8*, i8** %string.addr, align 4
  %100 = load i32, i32* %delimiter, align 4
  %call142 = call i8* @get_subst_pattern(i8* %99, i32* %i, i32 %100, i32 0, i32* @subst_lhs_len)
  store i8* %call142, i8** %t, align 4
  %101 = load i8*, i8** %t, align 4
  %tobool143 = icmp ne i8* %101, null
  br i1 %tobool143, label %if.then144, label %if.else148

if.then144:                                       ; preds = %if.end140
  %102 = load i8*, i8** @subst_lhs, align 4
  %tobool145 = icmp ne i8* %102, null
  br i1 %tobool145, label %if.then146, label %if.end147

if.then146:                                       ; preds = %if.then144
  %103 = load i8*, i8** @subst_lhs, align 4
  call void @free(i8* %103)
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %if.then144
  %104 = load i8*, i8** %t, align 4
  store i8* %104, i8** @subst_lhs, align 4
  br label %if.end164

if.else148:                                       ; preds = %if.end140
  %105 = load i8*, i8** @subst_lhs, align 4
  %tobool149 = icmp ne i8* %105, null
  br i1 %tobool149, label %if.end163, label %if.then150

if.then150:                                       ; preds = %if.else148
  %106 = load i8*, i8** @search_string, align 4
  %tobool151 = icmp ne i8* %106, null
  br i1 %tobool151, label %land.lhs.true152, label %if.else161

land.lhs.true152:                                 ; preds = %if.then150
  %107 = load i8*, i8** @search_string, align 4
  %108 = load i8, i8* %107, align 1
  %conv153 = sext i8 %108 to i32
  %tobool154 = icmp ne i32 %conv153, 0
  br i1 %tobool154, label %if.then155, label %if.else161

if.then155:                                       ; preds = %land.lhs.true152
  %109 = load i8*, i8** @search_string, align 4
  %call156 = call i32 @strlen(i8* %109)
  %add157 = add i32 1, %call156
  %call158 = call i8* @xmalloc(i32 %add157)
  %110 = load i8*, i8** @search_string, align 4
  %call159 = call i8* @strcpy(i8* %call158, i8* %110)
  store i8* %call159, i8** @subst_lhs, align 4
  %111 = load i8*, i8** @subst_lhs, align 4
  %call160 = call i32 @strlen(i8* %111)
  store i32 %call160, i32* @subst_lhs_len, align 4
  br label %if.end162

if.else161:                                       ; preds = %land.lhs.true152, %if.then150
  store i8* null, i8** @subst_lhs, align 4
  store i32 0, i32* @subst_lhs_len, align 4
  br label %if.end162

if.end162:                                        ; preds = %if.else161, %if.then155
  br label %if.end163

if.end163:                                        ; preds = %if.end162, %if.else148
  br label %if.end164

if.end164:                                        ; preds = %if.end163, %if.end147
  %112 = load i8*, i8** @subst_rhs, align 4
  %tobool165 = icmp ne i8* %112, null
  br i1 %tobool165, label %if.then166, label %if.end167

if.then166:                                       ; preds = %if.end164
  %113 = load i8*, i8** @subst_rhs, align 4
  call void @free(i8* %113)
  br label %if.end167

if.end167:                                        ; preds = %if.then166, %if.end164
  %114 = load i8*, i8** %string.addr, align 4
  %115 = load i32, i32* %delimiter, align 4
  %call168 = call i8* @get_subst_pattern(i8* %114, i32* %i, i32 %115, i32 1, i32* @subst_rhs_len)
  store i8* %call168, i8** @subst_rhs, align 4
  br i1 true, label %cond.true169, label %cond.false173

cond.true169:                                     ; preds = %if.end167
  %116 = load i8*, i8** @subst_rhs, align 4
  %call170 = call i8* @strchr(i8* %116, i32 38)
  %cmp171 = icmp ne i8* %call170, null
  br i1 %cmp171, label %if.then174, label %if.end175

cond.false173:                                    ; preds = %if.end167
  br i1 false, label %if.then174, label %if.end175

if.then174:                                       ; preds = %cond.false173, %cond.true169
  call void @postproc_subst_rhs()
  br label %if.end175

if.end175:                                        ; preds = %if.then174, %cond.false173, %cond.true169
  br label %if.end178

if.else176:                                       ; preds = %sw.bb106
  %117 = load i32, i32* %i, align 4
  %add177 = add nsw i32 %117, 2
  store i32 %add177, i32* %i, align 4
  br label %if.end178

if.end178:                                        ; preds = %if.else176, %if.end175
  %118 = load i32, i32* @subst_lhs_len, align 4
  %cmp179 = icmp eq i32 %118, 0
  br i1 %cmp179, label %if.then181, label %if.end183

if.then181:                                       ; preds = %if.end178
  %119 = load i8*, i8** %string.addr, align 4
  %120 = load i32, i32* %starting_index, align 4
  %121 = load i32, i32* %i, align 4
  %call182 = call i8* @hist_error(i8* %119, i32 %120, i32 %121, i32 4)
  %122 = load i8**, i8*** %ret_string.addr, align 4
  store i8* %call182, i8** %122, align 4
  %123 = load i8*, i8** %result, align 4
  call void @xfree(i8* %123)
  %124 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %124)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end183:                                        ; preds = %if.end178
  %125 = load i8*, i8** %temp, align 4
  %call184 = call i32 @strlen(i8* %125)
  store i32 %call184, i32* %l_temp, align 4
  %126 = load i32, i32* @subst_lhs_len, align 4
  %127 = load i32, i32* %l_temp, align 4
  %cmp185 = icmp sgt i32 %126, %127
  br i1 %cmp185, label %if.then187, label %if.end189

if.then187:                                       ; preds = %if.end183
  %128 = load i8*, i8** %string.addr, align 4
  %129 = load i32, i32* %starting_index, align 4
  %130 = load i32, i32* %i, align 4
  %call188 = call i8* @hist_error(i8* %128, i32 %129, i32 %130, i32 2)
  %131 = load i8**, i8*** %ret_string.addr, align 4
  store i8* %call188, i8** %131, align 4
  %132 = load i8*, i8** %result, align 4
  call void @xfree(i8* %132)
  %133 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %133)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end189:                                        ; preds = %if.end183
  store i32 0, i32* %we, align 4
  store i32 0, i32* %si, align 4
  store i32 1, i32* %failed, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc257, %if.end189
  %134 = load i32, i32* %si, align 4
  %135 = load i32, i32* @subst_lhs_len, align 4
  %add190 = add nsw i32 %134, %135
  %136 = load i32, i32* %l_temp, align 4
  %cmp191 = icmp sle i32 %add190, %136
  br i1 %cmp191, label %for.body, label %for.end259

for.body:                                         ; preds = %for.cond
  %137 = load i32, i32* %subst_bywords, align 4
  %tobool193 = icmp ne i32 %137, 0
  br i1 %tobool193, label %land.lhs.true194, label %if.end213

land.lhs.true194:                                 ; preds = %for.body
  %138 = load i32, i32* %si, align 4
  %139 = load i32, i32* %we, align 4
  %cmp195 = icmp sgt i32 %138, %139
  br i1 %cmp195, label %if.then197, label %if.end213

if.then197:                                       ; preds = %land.lhs.true194
  br label %for.cond198

for.cond198:                                      ; preds = %for.inc, %if.then197
  %140 = load i8*, i8** %temp, align 4
  %141 = load i32, i32* %si, align 4
  %arrayidx199 = getelementptr inbounds i8, i8* %140, i32 %141
  %142 = load i8, i8* %arrayidx199, align 1
  %conv200 = sext i8 %142 to i32
  %tobool201 = icmp ne i32 %conv200, 0
  br i1 %tobool201, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond198
  %143 = load i8*, i8** %temp, align 4
  %144 = load i32, i32* %si, align 4
  %arrayidx202 = getelementptr inbounds i8, i8* %143, i32 %144
  %145 = load i8, i8* %arrayidx202, align 1
  %conv203 = sext i8 %145 to i32
  %cmp204 = icmp eq i32 %conv203, 32
  br i1 %cmp204, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %146 = load i8*, i8** %temp, align 4
  %147 = load i32, i32* %si, align 4
  %arrayidx206 = getelementptr inbounds i8, i8* %146, i32 %147
  %148 = load i8, i8* %arrayidx206, align 1
  %conv207 = sext i8 %148 to i32
  %cmp208 = icmp eq i32 %conv207, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %149 = phi i1 [ true, %land.rhs ], [ %cmp208, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %for.cond198
  %150 = phi i1 [ false, %for.cond198 ], [ %149, %lor.end ]
  br i1 %150, label %for.body210, label %for.end

for.body210:                                      ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body210
  %151 = load i32, i32* %si, align 4
  %inc211 = add nsw i32 %151, 1
  store i32 %inc211, i32* %si, align 4
  br label %for.cond198

for.end:                                          ; preds = %land.end
  %152 = load i32, i32* %si, align 4
  store i32 %152, i32* %ws, align 4
  %153 = load i8*, i8** %temp, align 4
  %154 = load i32, i32* %si, align 4
  %call212 = call i32 @history_tokenize_word(i8* %153, i32 %154)
  store i32 %call212, i32* %we, align 4
  br label %if.end213

if.end213:                                        ; preds = %for.end, %land.lhs.true194, %for.body
  %155 = load i32, i32* @subst_lhs_len, align 4
  %cmp214 = icmp eq i32 %155, 0
  br i1 %cmp214, label %cond.true216, label %cond.false217

cond.true216:                                     ; preds = %if.end213
  br i1 true, label %if.then230, label %if.end256

cond.false217:                                    ; preds = %if.end213
  %156 = load i8*, i8** %temp, align 4
  %157 = load i32, i32* %si, align 4
  %add.ptr218 = getelementptr inbounds i8, i8* %156, i32 %157
  %arrayidx219 = getelementptr inbounds i8, i8* %add.ptr218, i32 0
  %158 = load i8, i8* %arrayidx219, align 1
  %conv220 = sext i8 %158 to i32
  %159 = load i8*, i8** @subst_lhs, align 4
  %arrayidx221 = getelementptr inbounds i8, i8* %159, i32 0
  %160 = load i8, i8* %arrayidx221, align 1
  %conv222 = sext i8 %160 to i32
  %cmp223 = icmp eq i32 %conv220, %conv222
  br i1 %cmp223, label %land.lhs.true225, label %if.end256

land.lhs.true225:                                 ; preds = %cond.false217
  %161 = load i8*, i8** %temp, align 4
  %162 = load i32, i32* %si, align 4
  %add.ptr226 = getelementptr inbounds i8, i8* %161, i32 %162
  %163 = load i8*, i8** @subst_lhs, align 4
  %164 = load i32, i32* @subst_lhs_len, align 4
  %call227 = call i32 @strncmp(i8* %add.ptr226, i8* %163, i32 %164)
  %cmp228 = icmp eq i32 %call227, 0
  br i1 %cmp228, label %if.then230, label %if.end256

if.then230:                                       ; preds = %land.lhs.true225, %cond.true216
  %165 = load i32, i32* @subst_rhs_len, align 4
  %166 = load i32, i32* @subst_lhs_len, align 4
  %sub = sub nsw i32 %165, %166
  %167 = load i32, i32* %l_temp, align 4
  %add231 = add nsw i32 %sub, %167
  store i32 %add231, i32* %len, align 4
  %168 = load i32, i32* %len, align 4
  %add232 = add nsw i32 1, %168
  %call233 = call i8* @xmalloc(i32 %add232)
  store i8* %call233, i8** %new_event, align 4
  %169 = load i8*, i8** %new_event, align 4
  %170 = load i8*, i8** %temp, align 4
  %171 = load i32, i32* %si, align 4
  %call234 = call i8* @strncpy(i8* %169, i8* %170, i32 %171)
  %172 = load i8*, i8** %new_event, align 4
  %173 = load i32, i32* %si, align 4
  %add.ptr235 = getelementptr inbounds i8, i8* %172, i32 %173
  %174 = load i8*, i8** @subst_rhs, align 4
  %175 = load i32, i32* @subst_rhs_len, align 4
  %call236 = call i8* @strncpy(i8* %add.ptr235, i8* %174, i32 %175)
  %176 = load i8*, i8** %new_event, align 4
  %177 = load i32, i32* %si, align 4
  %add.ptr237 = getelementptr inbounds i8, i8* %176, i32 %177
  %178 = load i32, i32* @subst_rhs_len, align 4
  %add.ptr238 = getelementptr inbounds i8, i8* %add.ptr237, i32 %178
  %179 = load i8*, i8** %temp, align 4
  %180 = load i32, i32* %si, align 4
  %add.ptr239 = getelementptr inbounds i8, i8* %179, i32 %180
  %181 = load i32, i32* @subst_lhs_len, align 4
  %add.ptr240 = getelementptr inbounds i8, i8* %add.ptr239, i32 %181
  %182 = load i32, i32* %l_temp, align 4
  %183 = load i32, i32* %si, align 4
  %184 = load i32, i32* @subst_lhs_len, align 4
  %add241 = add nsw i32 %183, %184
  %sub242 = sub nsw i32 %182, %add241
  %call243 = call i8* @strncpy(i8* %add.ptr238, i8* %add.ptr240, i32 %sub242)
  %185 = load i8*, i8** %new_event, align 4
  %186 = load i32, i32* %len, align 4
  %arrayidx244 = getelementptr inbounds i8, i8* %185, i32 %186
  store i8 0, i8* %arrayidx244, align 1
  %187 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %187)
  %188 = load i8*, i8** %new_event, align 4
  store i8* %188, i8** %temp, align 4
  store i32 0, i32* %failed, align 4
  %189 = load i32, i32* %substitute_globally, align 4
  %tobool245 = icmp ne i32 %189, 0
  br i1 %tobool245, label %if.then246, label %if.else251

if.then246:                                       ; preds = %if.then230
  %190 = load i32, i32* @subst_rhs_len, align 4
  %sub247 = sub nsw i32 %190, 1
  %191 = load i32, i32* %si, align 4
  %add248 = add nsw i32 %191, %sub247
  store i32 %add248, i32* %si, align 4
  %192 = load i8*, i8** %temp, align 4
  %call249 = call i32 @strlen(i8* %192)
  store i32 %call249, i32* %l_temp, align 4
  %193 = load i32, i32* %substitute_globally, align 4
  %inc250 = add nsw i32 %193, 1
  store i32 %inc250, i32* %substitute_globally, align 4
  br label %for.inc257

if.else251:                                       ; preds = %if.then230
  %194 = load i32, i32* %subst_bywords, align 4
  %tobool252 = icmp ne i32 %194, 0
  br i1 %tobool252, label %if.then253, label %if.else255

if.then253:                                       ; preds = %if.else251
  %195 = load i32, i32* %we, align 4
  store i32 %195, i32* %si, align 4
  %196 = load i8*, i8** %temp, align 4
  %call254 = call i32 @strlen(i8* %196)
  store i32 %call254, i32* %l_temp, align 4
  br label %for.inc257

if.else255:                                       ; preds = %if.else251
  br label %for.end259

if.end256:                                        ; preds = %land.lhs.true225, %cond.false217, %cond.true216
  br label %for.inc257

for.inc257:                                       ; preds = %if.end256, %if.then253, %if.then246
  %197 = load i32, i32* %si, align 4
  %inc258 = add nsw i32 %197, 1
  store i32 %inc258, i32* %si, align 4
  br label %for.cond

for.end259:                                       ; preds = %if.else255, %for.cond
  %198 = load i32, i32* %substitute_globally, align 4
  %cmp260 = icmp sgt i32 %198, 1
  br i1 %cmp260, label %if.then262, label %if.end263

if.then262:                                       ; preds = %for.end259
  store i32 0, i32* %substitute_globally, align 4
  br label %while.cond

if.end263:                                        ; preds = %for.end259
  %199 = load i32, i32* %failed, align 4
  %cmp264 = icmp eq i32 %199, 0
  br i1 %cmp264, label %if.then266, label %if.end267

if.then266:                                       ; preds = %if.end263
  br label %while.cond

if.end267:                                        ; preds = %if.end263
  %200 = load i8*, i8** %string.addr, align 4
  %201 = load i32, i32* %starting_index, align 4
  %202 = load i32, i32* %i, align 4
  %call268 = call i8* @hist_error(i8* %200, i32 %201, i32 %202, i32 2)
  %203 = load i8**, i8*** %ret_string.addr, align 4
  store i8* %call268, i8** %203, align 4
  %204 = load i8*, i8** %result, align 4
  call void @xfree(i8* %204)
  %205 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %205)
  store i32 -1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.else139, %if.end105, %if.end96, %if.end91, %if.end86, %sw.bb76, %sw.bb75, %sw.bb
  %206 = load i32, i32* %i, align 4
  %add269 = add nsw i32 %206, 2
  store i32 %add269, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %207 = load i32, i32* %i, align 4
  %dec = add nsw i32 %207, -1
  store i32 %dec, i32* %i, align 4
  %208 = load i32, i32* %want_quotes, align 4
  %tobool270 = icmp ne i32 %208, 0
  br i1 %tobool270, label %if.then271, label %if.end288

if.then271:                                       ; preds = %while.end
  %209 = load i32, i32* %want_quotes, align 4
  %cmp272 = icmp eq i32 %209, 113
  br i1 %cmp272, label %if.then274, label %if.else276

if.then274:                                       ; preds = %if.then271
  %210 = load i8*, i8** %temp, align 4
  %call275 = call i8* @sh_single_quote(i8* %210)
  store i8* %call275, i8** %x, align 4
  br label %if.end287

if.else276:                                       ; preds = %if.then271
  %211 = load i32, i32* %want_quotes, align 4
  %cmp277 = icmp eq i32 %211, 120
  br i1 %cmp277, label %if.then279, label %if.else281

if.then279:                                       ; preds = %if.else276
  %212 = load i8*, i8** %temp, align 4
  %call280 = call i8* @quote_breaks(i8* %212)
  store i8* %call280, i8** %x, align 4
  br label %if.end286

if.else281:                                       ; preds = %if.else276
  %213 = load i8*, i8** %temp, align 4
  %call282 = call i32 @strlen(i8* %213)
  %add283 = add i32 1, %call282
  %call284 = call i8* @xmalloc(i32 %add283)
  %214 = load i8*, i8** %temp, align 4
  %call285 = call i8* @strcpy(i8* %call284, i8* %214)
  store i8* %call285, i8** %x, align 4
  br label %if.end286

if.end286:                                        ; preds = %if.else281, %if.then279
  br label %if.end287

if.end287:                                        ; preds = %if.end286, %if.then274
  %215 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %215)
  %216 = load i8*, i8** %x, align 4
  store i8* %216, i8** %temp, align 4
  br label %if.end288

if.end288:                                        ; preds = %if.end287, %while.end
  %217 = load i8*, i8** %temp, align 4
  %call289 = call i32 @strlen(i8* %217)
  store i32 %call289, i32* %n, align 4
  %218 = load i32, i32* %n, align 4
  %219 = load i32, i32* %result_len, align 4
  %cmp290 = icmp sge i32 %218, %219
  br i1 %cmp290, label %if.then292, label %if.end295

if.then292:                                       ; preds = %if.end288
  %220 = load i8*, i8** %result, align 4
  %221 = load i32, i32* %n, align 4
  %add293 = add nsw i32 %221, 2
  %call294 = call i8* @xrealloc(i8* %220, i32 %add293)
  store i8* %call294, i8** %result, align 4
  br label %if.end295

if.end295:                                        ; preds = %if.then292, %if.end288
  %222 = load i8*, i8** %result, align 4
  %223 = load i8*, i8** %temp, align 4
  %call296 = call i8* @strcpy(i8* %222, i8* %223)
  %224 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %224)
  %225 = load i32, i32* %i, align 4
  %226 = load i32*, i32** %end_index_ptr.addr, align 4
  store i32 %225, i32* %226, align 4
  %227 = load i8*, i8** %result, align 4
  %228 = load i8**, i8*** %ret_string.addr, align 4
  store i8* %227, i8** %228, align 4
  %229 = load i32, i32* %print_only, align 4
  store i32 %229, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end295, %if.end267, %if.then187, %if.then181, %sw.default, %if.then28, %if.then22
  %230 = load i32, i32* %retval, align 4
  ret i32 %230
}

; Function Attrs: noinline nounwind
define i8* @history_arg_extract(i32 %first, i32 %last, i8* %string) #0 {
entry:
  %retval = alloca i8*, align 4
  %first.addr = alloca i32, align 4
  %last.addr = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %result = alloca i8*, align 4
  %size = alloca i32, align 4
  %offset = alloca i32, align 4
  %list = alloca i8**, align 4
  store i32 %first, i32* %first.addr, align 4
  store i32 %last, i32* %last.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i8** @history_tokenize(i8* %0)
  store i8** %call, i8*** %list, align 4
  %cmp = icmp eq i8** %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i8**, i8*** %list, align 4
  %2 = load i32, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %len, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %len, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %last.addr, align 4
  %cmp1 = icmp slt i32 %5, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %for.end
  %6 = load i32, i32* %len, align 4
  %7 = load i32, i32* %last.addr, align 4
  %add = add nsw i32 %6, %7
  %sub = sub nsw i32 %add, 1
  store i32 %sub, i32* %last.addr, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %for.end
  %8 = load i32, i32* %first.addr, align 4
  %cmp4 = icmp slt i32 %8, 0
  br i1 %cmp4, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end3
  %9 = load i32, i32* %len, align 4
  %10 = load i32, i32* %first.addr, align 4
  %add6 = add nsw i32 %9, %10
  %sub7 = sub nsw i32 %add6, 1
  store i32 %sub7, i32* %first.addr, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then5, %if.end3
  %11 = load i32, i32* %last.addr, align 4
  %cmp9 = icmp eq i32 %11, 36
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end8
  %12 = load i32, i32* %len, align 4
  %sub11 = sub nsw i32 %12, 1
  store i32 %sub11, i32* %last.addr, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end8
  %13 = load i32, i32* %first.addr, align 4
  %cmp13 = icmp eq i32 %13, 36
  br i1 %cmp13, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.end12
  %14 = load i32, i32* %len, align 4
  %sub15 = sub nsw i32 %14, 1
  store i32 %sub15, i32* %first.addr, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.end12
  %15 = load i32, i32* %last.addr, align 4
  %inc17 = add nsw i32 %15, 1
  store i32 %inc17, i32* %last.addr, align 4
  %16 = load i32, i32* %first.addr, align 4
  %17 = load i32, i32* %len, align 4
  %cmp18 = icmp sge i32 %16, %17
  br i1 %cmp18, label %if.then26, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end16
  %18 = load i32, i32* %last.addr, align 4
  %19 = load i32, i32* %len, align 4
  %cmp19 = icmp sgt i32 %18, %19
  br i1 %cmp19, label %if.then26, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false
  %20 = load i32, i32* %first.addr, align 4
  %cmp21 = icmp slt i32 %20, 0
  br i1 %cmp21, label %if.then26, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %lor.lhs.false20
  %21 = load i32, i32* %last.addr, align 4
  %cmp23 = icmp slt i32 %21, 0
  br i1 %cmp23, label %if.then26, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.lhs.false22
  %22 = load i32, i32* %first.addr, align 4
  %23 = load i32, i32* %last.addr, align 4
  %cmp25 = icmp sgt i32 %22, %23
  br i1 %cmp25, label %if.then26, label %if.else

if.then26:                                        ; preds = %lor.lhs.false24, %lor.lhs.false22, %lor.lhs.false20, %lor.lhs.false, %if.end16
  store i8* null, i8** %result, align 4
  br label %if.end58

if.else:                                          ; preds = %lor.lhs.false24
  store i32 0, i32* %size, align 4
  %24 = load i32, i32* %first.addr, align 4
  store i32 %24, i32* %i, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc34, %if.else
  %25 = load i32, i32* %i, align 4
  %26 = load i32, i32* %last.addr, align 4
  %cmp28 = icmp slt i32 %25, %26
  br i1 %cmp28, label %for.body29, label %for.end36

for.body29:                                       ; preds = %for.cond27
  %27 = load i8**, i8*** %list, align 4
  %28 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds i8*, i8** %27, i32 %28
  %29 = load i8*, i8** %arrayidx30, align 4
  %call31 = call i32 @strlen(i8* %29)
  %add32 = add i32 %call31, 1
  %30 = load i32, i32* %size, align 4
  %add33 = add i32 %30, %add32
  store i32 %add33, i32* %size, align 4
  br label %for.inc34

for.inc34:                                        ; preds = %for.body29
  %31 = load i32, i32* %i, align 4
  %inc35 = add nsw i32 %31, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond27

for.end36:                                        ; preds = %for.cond27
  %32 = load i32, i32* %size, align 4
  %add37 = add nsw i32 %32, 1
  %call38 = call i8* @xmalloc(i32 %add37)
  store i8* %call38, i8** %result, align 4
  %33 = load i8*, i8** %result, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %33, i32 0
  store i8 0, i8* %arrayidx39, align 1
  %34 = load i32, i32* %first.addr, align 4
  store i32 %34, i32* %i, align 4
  store i32 0, i32* %offset, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc55, %for.end36
  %35 = load i32, i32* %i, align 4
  %36 = load i32, i32* %last.addr, align 4
  %cmp41 = icmp slt i32 %35, %36
  br i1 %cmp41, label %for.body42, label %for.end57

for.body42:                                       ; preds = %for.cond40
  %37 = load i8*, i8** %result, align 4
  %38 = load i32, i32* %offset, align 4
  %add.ptr = getelementptr inbounds i8, i8* %37, i32 %38
  %39 = load i8**, i8*** %list, align 4
  %40 = load i32, i32* %i, align 4
  %arrayidx43 = getelementptr inbounds i8*, i8** %39, i32 %40
  %41 = load i8*, i8** %arrayidx43, align 4
  %call44 = call i8* @strcpy(i8* %add.ptr, i8* %41)
  %42 = load i8**, i8*** %list, align 4
  %43 = load i32, i32* %i, align 4
  %arrayidx45 = getelementptr inbounds i8*, i8** %42, i32 %43
  %44 = load i8*, i8** %arrayidx45, align 4
  %call46 = call i32 @strlen(i8* %44)
  %45 = load i32, i32* %offset, align 4
  %add47 = add i32 %45, %call46
  store i32 %add47, i32* %offset, align 4
  %46 = load i32, i32* %i, align 4
  %add48 = add nsw i32 %46, 1
  %47 = load i32, i32* %last.addr, align 4
  %cmp49 = icmp slt i32 %add48, %47
  br i1 %cmp49, label %if.then50, label %if.end54

if.then50:                                        ; preds = %for.body42
  %48 = load i8*, i8** %result, align 4
  %49 = load i32, i32* %offset, align 4
  %inc51 = add nsw i32 %49, 1
  store i32 %inc51, i32* %offset, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %48, i32 %49
  store i8 32, i8* %arrayidx52, align 1
  %50 = load i8*, i8** %result, align 4
  %51 = load i32, i32* %offset, align 4
  %arrayidx53 = getelementptr inbounds i8, i8* %50, i32 %51
  store i8 0, i8* %arrayidx53, align 1
  br label %if.end54

if.end54:                                         ; preds = %if.then50, %for.body42
  br label %for.inc55

for.inc55:                                        ; preds = %if.end54
  %52 = load i32, i32* %i, align 4
  %inc56 = add nsw i32 %52, 1
  store i32 %inc56, i32* %i, align 4
  br label %for.cond40

for.end57:                                        ; preds = %for.cond40
  br label %if.end58

if.end58:                                         ; preds = %for.end57, %if.then26
  store i32 0, i32* %i, align 4
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc63, %if.end58
  %53 = load i32, i32* %i, align 4
  %54 = load i32, i32* %len, align 4
  %cmp60 = icmp slt i32 %53, %54
  br i1 %cmp60, label %for.body61, label %for.end65

for.body61:                                       ; preds = %for.cond59
  %55 = load i8**, i8*** %list, align 4
  %56 = load i32, i32* %i, align 4
  %arrayidx62 = getelementptr inbounds i8*, i8** %55, i32 %56
  %57 = load i8*, i8** %arrayidx62, align 4
  call void @xfree(i8* %57)
  br label %for.inc63

for.inc63:                                        ; preds = %for.body61
  %58 = load i32, i32* %i, align 4
  %inc64 = add nsw i32 %58, 1
  store i32 %inc64, i32* %i, align 4
  br label %for.cond59

for.end65:                                        ; preds = %for.cond59
  %59 = load i8**, i8*** %list, align 4
  %60 = bitcast i8** %59 to i8*
  call void @xfree(i8* %60)
  %61 = load i8*, i8** %result, align 4
  store i8* %61, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end65, %if.then
  %62 = load i8*, i8** %retval, align 4
  ret i8* %62
}

; Function Attrs: noinline nounwind
define i8** @history_tokenize(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i8** @history_tokenize_internal(i8* %0, i32 -1, i32* null)
  ret i8** %call
}

; Function Attrs: noinline nounwind
define internal i8** @history_tokenize_internal(i8* %string, i32 %wind, i32* %indp) #0 {
entry:
  %retval = alloca i8**, align 4
  %string.addr = alloca i8*, align 4
  %wind.addr = alloca i32, align 4
  %indp.addr = alloca i32*, align 4
  %result = alloca i8**, align 4
  %i = alloca i32, align 4
  %start = alloca i32, align 4
  %result_index = alloca i32, align 4
  %size = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %wind, i32* %wind.addr, align 4
  store i32* %indp, i32** %indp.addr, align 4
  %0 = load i32*, i32** %indp.addr, align 4
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %wind.addr, align 4
  %cmp = icmp ne i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32*, i32** %indp.addr, align 4
  store i32 -1, i32* %2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  store i32 0, i32* %size, align 4
  store i32 0, i32* %result_index, align 4
  store i32 0, i32* %i, align 4
  store i8** null, i8*** %result, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end64, %if.end
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %tobool1 = icmp ne i8 %5, 0
  br i1 %tobool1, label %for.body, label %for.end69

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %6 = load i8*, i8** %string.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx3, align 1
  %conv = sext i8 %8 to i32
  %tobool4 = icmp ne i32 %conv, 0
  br i1 %tobool4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond2
  %9 = load i8*, i8** %string.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %11 to i32
  %cmp7 = icmp eq i32 %conv6, 32
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %12 = load i8*, i8** %string.addr, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %14 to i32
  %cmp11 = icmp eq i32 %conv10, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %15 = phi i1 [ true, %land.rhs ], [ %cmp11, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %for.cond2
  %16 = phi i1 [ false, %for.cond2 ], [ %15, %lor.end ]
  br i1 %16, label %for.body13, label %for.end

for.body13:                                       ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body13
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond2

for.end:                                          ; preds = %land.end
  %18 = load i8*, i8** %string.addr, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %20 to i32
  %cmp16 = icmp eq i32 %conv15, 0
  br i1 %cmp16, label %if.then23, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %21 = load i8*, i8** %string.addr, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %23 to i32
  %24 = load i8, i8* @history_comment_char, align 1
  %conv20 = sext i8 %24 to i32
  %cmp21 = icmp eq i32 %conv19, %conv20
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %lor.lhs.false, %for.end
  %25 = load i8**, i8*** %result, align 4
  store i8** %25, i8*** %retval, align 4
  br label %return

if.end24:                                         ; preds = %lor.lhs.false
  %26 = load i32, i32* %i, align 4
  store i32 %26, i32* %start, align 4
  %27 = load i8*, i8** %string.addr, align 4
  %28 = load i32, i32* %start, align 4
  %call = call i32 @history_tokenize_word(i8* %27, i32 %28)
  store i32 %call, i32* %i, align 4
  %29 = load i32, i32* %i, align 4
  %30 = load i32, i32* %start, align 4
  %cmp25 = icmp eq i32 %29, %30
  br i1 %cmp25, label %land.lhs.true27, label %if.end46

land.lhs.true27:                                  ; preds = %if.end24
  %31 = load i8*, i8** @history_word_delimiters, align 4
  %tobool28 = icmp ne i8* %31, null
  br i1 %tobool28, label %if.then29, label %if.end46

if.then29:                                        ; preds = %land.lhs.true27
  %32 = load i32, i32* %i, align 4
  %inc30 = add nsw i32 %32, 1
  store i32 %inc30, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then29
  %33 = load i8*, i8** %string.addr, align 4
  %34 = load i32, i32* %i, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %35 to i32
  %tobool33 = icmp ne i32 %conv32, 0
  br i1 %tobool33, label %land.rhs34, label %land.end44

land.rhs34:                                       ; preds = %while.cond
  %36 = load i8*, i8** %string.addr, align 4
  %37 = load i32, i32* %i, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %36, i32 %37
  %38 = load i8, i8* %arrayidx35, align 1
  %conv36 = sext i8 %38 to i32
  %tobool37 = icmp ne i32 %conv36, 0
  br i1 %tobool37, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.rhs34
  %39 = load i8*, i8** @history_word_delimiters, align 4
  %40 = load i8*, i8** %string.addr, align 4
  %41 = load i32, i32* %i, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %40, i32 %41
  %42 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %42 to i32
  %call40 = call i8* @strchr(i8* %39, i32 %conv39)
  %cmp41 = icmp ne i8* %call40, null
  %conv42 = zext i1 %cmp41 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.rhs34
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv42, %cond.true ], [ 0, %cond.false ]
  %tobool43 = icmp ne i32 %cond, 0
  br label %land.end44

land.end44:                                       ; preds = %cond.end, %while.cond
  %43 = phi i1 [ false, %while.cond ], [ %tobool43, %cond.end ]
  br i1 %43, label %while.body, label %while.end

while.body:                                       ; preds = %land.end44
  %44 = load i32, i32* %i, align 4
  %inc45 = add nsw i32 %44, 1
  store i32 %inc45, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end44
  br label %if.end46

if.end46:                                         ; preds = %while.end, %land.lhs.true27, %if.end24
  %45 = load i32*, i32** %indp.addr, align 4
  %tobool47 = icmp ne i32* %45, null
  br i1 %tobool47, label %land.lhs.true48, label %if.end58

land.lhs.true48:                                  ; preds = %if.end46
  %46 = load i32, i32* %wind.addr, align 4
  %cmp49 = icmp ne i32 %46, -1
  br i1 %cmp49, label %land.lhs.true51, label %if.end58

land.lhs.true51:                                  ; preds = %land.lhs.true48
  %47 = load i32, i32* %wind.addr, align 4
  %48 = load i32, i32* %start, align 4
  %cmp52 = icmp sge i32 %47, %48
  br i1 %cmp52, label %land.lhs.true54, label %if.end58

land.lhs.true54:                                  ; preds = %land.lhs.true51
  %49 = load i32, i32* %wind.addr, align 4
  %50 = load i32, i32* %i, align 4
  %cmp55 = icmp slt i32 %49, %50
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %land.lhs.true54
  %51 = load i32, i32* %result_index, align 4
  %52 = load i32*, i32** %indp.addr, align 4
  store i32 %51, i32* %52, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %land.lhs.true54, %land.lhs.true51, %land.lhs.true48, %if.end46
  %53 = load i32, i32* %result_index, align 4
  %add = add nsw i32 %53, 2
  %54 = load i32, i32* %size, align 4
  %cmp59 = icmp sge i32 %add, %54
  br i1 %cmp59, label %if.then61, label %if.end64

if.then61:                                        ; preds = %if.end58
  %55 = load i8**, i8*** %result, align 4
  %56 = bitcast i8** %55 to i8*
  %57 = load i32, i32* %size, align 4
  %add62 = add nsw i32 %57, 10
  store i32 %add62, i32* %size, align 4
  %mul = mul i32 %add62, 4
  %call63 = call i8* @xrealloc(i8* %56, i32 %mul)
  %58 = bitcast i8* %call63 to i8**
  store i8** %58, i8*** %result, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then61, %if.end58
  %59 = load i8*, i8** %string.addr, align 4
  %60 = load i32, i32* %start, align 4
  %61 = load i32, i32* %i, align 4
  %call65 = call i8* @history_substring(i8* %59, i32 %60, i32 %61)
  %62 = load i8**, i8*** %result, align 4
  %63 = load i32, i32* %result_index, align 4
  %inc66 = add nsw i32 %63, 1
  store i32 %inc66, i32* %result_index, align 4
  %arrayidx67 = getelementptr inbounds i8*, i8** %62, i32 %63
  store i8* %call65, i8** %arrayidx67, align 4
  %64 = load i8**, i8*** %result, align 4
  %65 = load i32, i32* %result_index, align 4
  %arrayidx68 = getelementptr inbounds i8*, i8** %64, i32 %65
  store i8* null, i8** %arrayidx68, align 4
  br label %for.cond

for.end69:                                        ; preds = %for.cond
  %66 = load i8**, i8*** %result, align 4
  store i8** %66, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %for.end69, %if.then23
  %67 = load i8**, i8*** %retval, align 4
  ret i8** %67
}

; Function Attrs: noinline nounwind
define internal i8* @hist_error(i8* %s, i32 %start, i32 %current, i32 %errtype) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %current.addr = alloca i32, align 4
  %errtype.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  %emsg = alloca i8*, align 4
  %ll = alloca i32, align 4
  %elen = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %current, i32* %current.addr, align 4
  store i32 %errtype, i32* %errtype.addr, align 4
  %0 = load i32, i32* %current.addr, align 4
  %1 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %0, %1
  store i32 %sub, i32* %ll, align 4
  %2 = load i32, i32* %errtype.addr, align 4
  switch i32 %2, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
    i32 4, label %sw.bb4
  ]

sw.bb:                                            ; preds = %entry
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0), i8** %emsg, align 4
  store i32 15, i32* %elen, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  store i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i32 0, i32 0), i8** %emsg, align 4
  store i32 18, i32* %elen, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  store i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i32 0, i32 0), i8** %emsg, align 4
  store i32 19, i32* %elen, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  store i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i32 0, i32 0), i8** %emsg, align 4
  store i32 29, i32* %elen, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i32 0, i32 0), i8** %emsg, align 4
  store i32 24, i32* %elen, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.9, i32 0, i32 0), i8** %emsg, align 4
  store i32 23, i32* %elen, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %3 = load i32, i32* %ll, align 4
  %4 = load i32, i32* %elen, align 4
  %add = add nsw i32 %3, %4
  %add5 = add nsw i32 %add, 3
  %call = call i8* @xmalloc(i32 %add5)
  store i8* %call, i8** %temp, align 4
  %5 = load i8*, i8** %temp, align 4
  %6 = load i8*, i8** %s.addr, align 4
  %7 = load i32, i32* %start.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i32, i32* %ll, align 4
  %call6 = call i8* @strncpy(i8* %5, i8* %add.ptr, i32 %8)
  %9 = load i8*, i8** %temp, align 4
  %10 = load i32, i32* %ll, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 %10
  store i8 58, i8* %arrayidx, align 1
  %11 = load i8*, i8** %temp, align 4
  %12 = load i32, i32* %ll, align 4
  %add7 = add nsw i32 %12, 1
  %arrayidx8 = getelementptr inbounds i8, i8* %11, i32 %add7
  store i8 32, i8* %arrayidx8, align 1
  %13 = load i8*, i8** %temp, align 4
  %14 = load i32, i32* %ll, align 4
  %add.ptr9 = getelementptr inbounds i8, i8* %13, i32 %14
  %add.ptr10 = getelementptr inbounds i8, i8* %add.ptr9, i32 2
  %15 = load i8*, i8** %emsg, align 4
  %call11 = call i8* @strcpy(i8* %add.ptr10, i8* %15)
  %16 = load i8*, i8** %temp, align 4
  ret i8* %16
}

; Function Attrs: noinline nounwind
define internal i8* @get_history_word_specifier(i8* %spec, i8* %from, i32* %caller_index) #0 {
entry:
  %retval = alloca i8*, align 4
  %spec.addr = alloca i8*, align 4
  %from.addr = alloca i8*, align 4
  %caller_index.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %first = alloca i32, align 4
  %last = alloca i32, align 4
  %expecting_word_spec = alloca i32, align 4
  %result = alloca i8*, align 4
  store i8* %spec, i8** %spec.addr, align 4
  store i8* %from, i8** %from.addr, align 4
  store i32* %caller_index, i32** %caller_index.addr, align 4
  %0 = load i32*, i32** %caller_index.addr, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* %i, align 4
  store i32 0, i32* %expecting_word_spec, align 4
  store i32 0, i32* %last, align 4
  store i32 0, i32* %first, align 4
  store i8* null, i8** %result, align 4
  %2 = load i8*, i8** %spec.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, 58
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  %6 = load i32, i32* %expecting_word_spec, align 4
  %inc2 = add nsw i32 %6, 1
  store i32 %inc2, i32* %expecting_word_spec, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i8*, i8** %spec.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 37
  br i1 %cmp5, label %if.then7, label %if.end13

if.then7:                                         ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %add = add nsw i32 %10, 1
  %11 = load i32*, i32** %caller_index.addr, align 4
  store i32 %add, i32* %11, align 4
  %12 = load i8*, i8** @search_match, align 4
  %tobool = icmp ne i8* %12, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then7
  %13 = load i8*, i8** @search_match, align 4
  %call = call i32 @strlen(i8* %13)
  %add8 = add i32 1, %call
  %call9 = call i8* @xmalloc(i32 %add8)
  %14 = load i8*, i8** @search_match, align 4
  %call10 = call i8* @strcpy(i8* %call9, i8* %14)
  br label %cond.end

cond.false:                                       ; preds = %if.then7
  %call11 = call i8* @xmalloc(i32 1)
  %call12 = call i8* @strcpy(i8* %call11, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call10, %cond.true ], [ %call12, %cond.false ]
  store i8* %cond, i8** %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.end
  %15 = load i8*, i8** %spec.addr, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %17 to i32
  %cmp16 = icmp eq i32 %conv15, 42
  br i1 %cmp16, label %if.then18, label %if.end28

if.then18:                                        ; preds = %if.end13
  %18 = load i32, i32* %i, align 4
  %add19 = add nsw i32 %18, 1
  %19 = load i32*, i32** %caller_index.addr, align 4
  store i32 %add19, i32* %19, align 4
  %20 = load i8*, i8** %from.addr, align 4
  %call20 = call i8* @history_arg_extract(i32 1, i32 36, i8* %20)
  store i8* %call20, i8** %result, align 4
  %21 = load i8*, i8** %result, align 4
  %tobool21 = icmp ne i8* %21, null
  br i1 %tobool21, label %cond.true22, label %cond.false23

cond.true22:                                      ; preds = %if.then18
  %22 = load i8*, i8** %result, align 4
  br label %cond.end26

cond.false23:                                     ; preds = %if.then18
  %call24 = call i8* @xmalloc(i32 1)
  %call25 = call i8* @strcpy(i8* %call24, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false23, %cond.true22
  %cond27 = phi i8* [ %22, %cond.true22 ], [ %call25, %cond.false23 ]
  store i8* %cond27, i8** %retval, align 4
  br label %return

if.end28:                                         ; preds = %if.end13
  %23 = load i8*, i8** %spec.addr, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %25 to i32
  %cmp31 = icmp eq i32 %conv30, 36
  br i1 %cmp31, label %if.then33, label %if.end36

if.then33:                                        ; preds = %if.end28
  %26 = load i32, i32* %i, align 4
  %add34 = add nsw i32 %26, 1
  %27 = load i32*, i32** %caller_index.addr, align 4
  store i32 %add34, i32* %27, align 4
  %28 = load i8*, i8** %from.addr, align 4
  %call35 = call i8* @history_arg_extract(i32 36, i32 36, i8* %28)
  store i8* %call35, i8** %retval, align 4
  br label %return

if.end36:                                         ; preds = %if.end28
  %29 = load i8*, i8** %spec.addr, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %31 to i32
  %cmp39 = icmp eq i32 %conv38, 45
  br i1 %cmp39, label %if.then41, label %if.else

if.then41:                                        ; preds = %if.end36
  store i32 0, i32* %first, align 4
  br label %if.end75

if.else:                                          ; preds = %if.end36
  %32 = load i8*, i8** %spec.addr, align 4
  %33 = load i32, i32* %i, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %32, i32 %33
  %34 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %34 to i32
  %cmp44 = icmp eq i32 %conv43, 94
  br i1 %cmp44, label %if.then46, label %if.else48

if.then46:                                        ; preds = %if.else
  store i32 1, i32* %first, align 4
  %35 = load i32, i32* %i, align 4
  %inc47 = add nsw i32 %35, 1
  store i32 %inc47, i32* %i, align 4
  br label %if.end74

if.else48:                                        ; preds = %if.else
  %36 = load i8*, i8** %spec.addr, align 4
  %37 = load i32, i32* %i, align 4
  %arrayidx49 = getelementptr inbounds i8, i8* %36, i32 %37
  %38 = load i8, i8* %arrayidx49, align 1
  %conv50 = sext i8 %38 to i32
  %cmp51 = icmp sge i32 %conv50, 48
  br i1 %cmp51, label %land.lhs.true, label %if.else72

land.lhs.true:                                    ; preds = %if.else48
  %39 = load i8*, i8** %spec.addr, align 4
  %40 = load i32, i32* %i, align 4
  %arrayidx53 = getelementptr inbounds i8, i8* %39, i32 %40
  %41 = load i8, i8* %arrayidx53, align 1
  %conv54 = sext i8 %41 to i32
  %cmp55 = icmp sle i32 %conv54, 57
  br i1 %cmp55, label %land.lhs.true57, label %if.else72

land.lhs.true57:                                  ; preds = %land.lhs.true
  %42 = load i32, i32* %expecting_word_spec, align 4
  %tobool58 = icmp ne i32 %42, 0
  br i1 %tobool58, label %if.then59, label %if.else72

if.then59:                                        ; preds = %land.lhs.true57
  store i32 0, i32* %first, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then59
  %43 = load i8*, i8** %spec.addr, align 4
  %44 = load i32, i32* %i, align 4
  %arrayidx60 = getelementptr inbounds i8, i8* %43, i32 %44
  %45 = load i8, i8* %arrayidx60, align 1
  %conv61 = sext i8 %45 to i32
  %cmp62 = icmp sge i32 %conv61, 48
  br i1 %cmp62, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %46 = load i8*, i8** %spec.addr, align 4
  %47 = load i32, i32* %i, align 4
  %arrayidx64 = getelementptr inbounds i8, i8* %46, i32 %47
  %48 = load i8, i8* %arrayidx64, align 1
  %conv65 = sext i8 %48 to i32
  %cmp66 = icmp sle i32 %conv65, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %49 = phi i1 [ false, %for.cond ], [ %cmp66, %land.rhs ]
  br i1 %49, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %50 = load i32, i32* %first, align 4
  %mul = mul nsw i32 %50, 10
  %51 = load i8*, i8** %spec.addr, align 4
  %52 = load i32, i32* %i, align 4
  %arrayidx68 = getelementptr inbounds i8, i8* %51, i32 %52
  %53 = load i8, i8* %arrayidx68, align 1
  %conv69 = sext i8 %53 to i32
  %sub = sub nsw i32 %conv69, 48
  %add70 = add nsw i32 %mul, %sub
  store i32 %add70, i32* %first, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %54 = load i32, i32* %i, align 4
  %inc71 = add nsw i32 %54, 1
  store i32 %inc71, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  br label %if.end73

if.else72:                                        ; preds = %land.lhs.true57, %land.lhs.true, %if.else48
  store i8* null, i8** %retval, align 4
  br label %return

if.end73:                                         ; preds = %for.end
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %if.then46
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %if.then41
  %55 = load i8*, i8** %spec.addr, align 4
  %56 = load i32, i32* %i, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %55, i32 %56
  %57 = load i8, i8* %arrayidx76, align 1
  %conv77 = sext i8 %57 to i32
  %cmp78 = icmp eq i32 %conv77, 94
  br i1 %cmp78, label %if.then84, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end75
  %58 = load i8*, i8** %spec.addr, align 4
  %59 = load i32, i32* %i, align 4
  %arrayidx80 = getelementptr inbounds i8, i8* %58, i32 %59
  %60 = load i8, i8* %arrayidx80, align 1
  %conv81 = sext i8 %60 to i32
  %cmp82 = icmp eq i32 %conv81, 42
  br i1 %cmp82, label %if.then84, label %if.else91

if.then84:                                        ; preds = %lor.lhs.false, %if.end75
  %61 = load i8*, i8** %spec.addr, align 4
  %62 = load i32, i32* %i, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %61, i32 %62
  %63 = load i8, i8* %arrayidx85, align 1
  %conv86 = sext i8 %63 to i32
  %cmp87 = icmp eq i32 %conv86, 94
  %cond89 = select i1 %cmp87, i32 1, i32 36
  store i32 %cond89, i32* %last, align 4
  %64 = load i32, i32* %i, align 4
  %inc90 = add nsw i32 %64, 1
  store i32 %inc90, i32* %i, align 4
  br label %if.end140

if.else91:                                        ; preds = %lor.lhs.false
  %65 = load i8*, i8** %spec.addr, align 4
  %66 = load i32, i32* %i, align 4
  %arrayidx92 = getelementptr inbounds i8, i8* %65, i32 %66
  %67 = load i8, i8* %arrayidx92, align 1
  %conv93 = sext i8 %67 to i32
  %cmp94 = icmp ne i32 %conv93, 45
  br i1 %cmp94, label %if.then96, label %if.else97

if.then96:                                        ; preds = %if.else91
  %68 = load i32, i32* %first, align 4
  store i32 %68, i32* %last, align 4
  br label %if.end139

if.else97:                                        ; preds = %if.else91
  %69 = load i32, i32* %i, align 4
  %inc98 = add nsw i32 %69, 1
  store i32 %inc98, i32* %i, align 4
  %70 = load i8*, i8** %spec.addr, align 4
  %71 = load i32, i32* %i, align 4
  %arrayidx99 = getelementptr inbounds i8, i8* %70, i32 %71
  %72 = load i8, i8* %arrayidx99, align 1
  %conv100 = sext i8 %72 to i32
  %cmp101 = icmp sge i32 %conv100, 48
  br i1 %cmp101, label %land.lhs.true103, label %if.else129

land.lhs.true103:                                 ; preds = %if.else97
  %73 = load i8*, i8** %spec.addr, align 4
  %74 = load i32, i32* %i, align 4
  %arrayidx104 = getelementptr inbounds i8, i8* %73, i32 %74
  %75 = load i8, i8* %arrayidx104, align 1
  %conv105 = sext i8 %75 to i32
  %cmp106 = icmp sle i32 %conv105, 57
  br i1 %cmp106, label %if.then108, label %if.else129

if.then108:                                       ; preds = %land.lhs.true103
  store i32 0, i32* %last, align 4
  br label %for.cond109

for.cond109:                                      ; preds = %for.inc126, %if.then108
  %76 = load i8*, i8** %spec.addr, align 4
  %77 = load i32, i32* %i, align 4
  %arrayidx110 = getelementptr inbounds i8, i8* %76, i32 %77
  %78 = load i8, i8* %arrayidx110, align 1
  %conv111 = sext i8 %78 to i32
  %cmp112 = icmp sge i32 %conv111, 48
  br i1 %cmp112, label %land.rhs114, label %land.end119

land.rhs114:                                      ; preds = %for.cond109
  %79 = load i8*, i8** %spec.addr, align 4
  %80 = load i32, i32* %i, align 4
  %arrayidx115 = getelementptr inbounds i8, i8* %79, i32 %80
  %81 = load i8, i8* %arrayidx115, align 1
  %conv116 = sext i8 %81 to i32
  %cmp117 = icmp sle i32 %conv116, 57
  br label %land.end119

land.end119:                                      ; preds = %land.rhs114, %for.cond109
  %82 = phi i1 [ false, %for.cond109 ], [ %cmp117, %land.rhs114 ]
  br i1 %82, label %for.body120, label %for.end128

for.body120:                                      ; preds = %land.end119
  %83 = load i32, i32* %last, align 4
  %mul121 = mul nsw i32 %83, 10
  %84 = load i8*, i8** %spec.addr, align 4
  %85 = load i32, i32* %i, align 4
  %arrayidx122 = getelementptr inbounds i8, i8* %84, i32 %85
  %86 = load i8, i8* %arrayidx122, align 1
  %conv123 = sext i8 %86 to i32
  %sub124 = sub nsw i32 %conv123, 48
  %add125 = add nsw i32 %mul121, %sub124
  store i32 %add125, i32* %last, align 4
  br label %for.inc126

for.inc126:                                       ; preds = %for.body120
  %87 = load i32, i32* %i, align 4
  %inc127 = add nsw i32 %87, 1
  store i32 %inc127, i32* %i, align 4
  br label %for.cond109

for.end128:                                       ; preds = %land.end119
  br label %if.end138

if.else129:                                       ; preds = %land.lhs.true103, %if.else97
  %88 = load i8*, i8** %spec.addr, align 4
  %89 = load i32, i32* %i, align 4
  %arrayidx130 = getelementptr inbounds i8, i8* %88, i32 %89
  %90 = load i8, i8* %arrayidx130, align 1
  %conv131 = sext i8 %90 to i32
  %cmp132 = icmp eq i32 %conv131, 36
  br i1 %cmp132, label %if.then134, label %if.else136

if.then134:                                       ; preds = %if.else129
  %91 = load i32, i32* %i, align 4
  %inc135 = add nsw i32 %91, 1
  store i32 %inc135, i32* %i, align 4
  store i32 36, i32* %last, align 4
  br label %if.end137

if.else136:                                       ; preds = %if.else129
  store i32 -1, i32* %last, align 4
  br label %if.end137

if.end137:                                        ; preds = %if.else136, %if.then134
  br label %if.end138

if.end138:                                        ; preds = %if.end137, %for.end128
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %if.then96
  br label %if.end140

if.end140:                                        ; preds = %if.end139, %if.then84
  %92 = load i32, i32* %i, align 4
  %93 = load i32*, i32** %caller_index.addr, align 4
  store i32 %92, i32* %93, align 4
  %94 = load i32, i32* %last, align 4
  %95 = load i32, i32* %first, align 4
  %cmp141 = icmp sge i32 %94, %95
  br i1 %cmp141, label %if.then149, label %lor.lhs.false143

lor.lhs.false143:                                 ; preds = %if.end140
  %96 = load i32, i32* %last, align 4
  %cmp144 = icmp eq i32 %96, 36
  br i1 %cmp144, label %if.then149, label %lor.lhs.false146

lor.lhs.false146:                                 ; preds = %lor.lhs.false143
  %97 = load i32, i32* %last, align 4
  %cmp147 = icmp slt i32 %97, 0
  br i1 %cmp147, label %if.then149, label %if.end151

if.then149:                                       ; preds = %lor.lhs.false146, %lor.lhs.false143, %if.end140
  %98 = load i32, i32* %first, align 4
  %99 = load i32, i32* %last, align 4
  %100 = load i8*, i8** %from.addr, align 4
  %call150 = call i8* @history_arg_extract(i32 %98, i32 %99, i8* %100)
  store i8* %call150, i8** %result, align 4
  br label %if.end151

if.end151:                                        ; preds = %if.then149, %lor.lhs.false146
  %101 = load i8*, i8** %result, align 4
  %tobool152 = icmp ne i8* %101, null
  br i1 %tobool152, label %cond.true153, label %cond.false154

cond.true153:                                     ; preds = %if.end151
  %102 = load i8*, i8** %result, align 4
  br label %cond.end155

cond.false154:                                    ; preds = %if.end151
  br label %cond.end155

cond.end155:                                      ; preds = %cond.false154, %cond.true153
  %cond156 = phi i8* [ %102, %cond.true153 ], [ @error_pointer, %cond.false154 ]
  store i8* %cond156, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end155, %if.else72, %if.then33, %cond.end26, %cond.end
  %103 = load i8*, i8** %retval, align 4
  ret i8* %103
}

declare i8* @strrchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @get_subst_pattern(i8* %str, i32* %iptr, i32 %delimiter, i32 %is_rhs, i32* %lenptr) #0 {
entry:
  %str.addr = alloca i8*, align 4
  %iptr.addr = alloca i32*, align 4
  %delimiter.addr = alloca i32, align 4
  %is_rhs.addr = alloca i32, align 4
  %lenptr.addr = alloca i32*, align 4
  %si = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %s = alloca i8*, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %v = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 4
  store i32* %iptr, i32** %iptr.addr, align 4
  store i32 %delimiter, i32* %delimiter.addr, align 4
  store i32 %is_rhs, i32* %is_rhs.addr, align 4
  store i32* %lenptr, i32** %lenptr.addr, align 4
  store i8* null, i8** %s, align 4
  %0 = load i32*, i32** %iptr.addr, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* %i, align 4
  %2 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %2, i8 0, i32 8, i32 4, i1 false)
  %3 = load i8*, i8** %str.addr, align 4
  %4 = load i32, i32* %i, align 4
  %call = call i32 @_rl_adjust_point(i8* %3, i32 %4, %struct.__mbstate_t* %ps)
  %5 = load i32, i32* %i, align 4
  store i32 %5, i32* %si, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i8*, i8** %str.addr, align 4
  %7 = load i32, i32* %si, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %8 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %9 = load i8*, i8** %str.addr, align 4
  %10 = load i32, i32* %si, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %11 to i32
  %12 = load i32, i32* %delimiter.addr, align 4
  %cmp = icmp ne i32 %conv2, %12
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %13 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %13, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %call4 = call i32 @__ctype_get_mb_cur_max()
  %cmp5 = icmp ugt i32 %call4, 1
  br i1 %cmp5, label %land.lhs.true, label %if.else25

land.lhs.true:                                    ; preds = %for.body
  %14 = load i32, i32* @rl_byte_oriented, align 4
  %cmp7 = icmp eq i32 %14, 0
  br i1 %cmp7, label %if.then, label %if.else25

if.then:                                          ; preds = %land.lhs.true
  %15 = load i8*, i8** %str.addr, align 4
  %16 = load i32, i32* %si, align 4
  %add.ptr = getelementptr inbounds i8, i8* %15, i32 %16
  %call9 = call i32 @_rl_get_char_len(i8* %add.ptr, %struct.__mbstate_t* %ps)
  store i32 %call9, i32* %v, align 4
  %cmp10 = icmp sgt i32 %call9, 1
  br i1 %cmp10, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.then
  %17 = load i32, i32* %v, align 4
  %sub = sub nsw i32 %17, 1
  %18 = load i32, i32* %si, align 4
  %add = add nsw i32 %18, %sub
  store i32 %add, i32* %si, align 4
  br label %if.end24

if.else:                                          ; preds = %if.then
  %19 = load i8*, i8** %str.addr, align 4
  %20 = load i32, i32* %si, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %19, i32 %20
  %21 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %21 to i32
  %cmp15 = icmp eq i32 %conv14, 92
  br i1 %cmp15, label %land.lhs.true17, label %if.end

land.lhs.true17:                                  ; preds = %if.else
  %22 = load i8*, i8** %str.addr, align 4
  %23 = load i32, i32* %si, align 4
  %add18 = add nsw i32 %23, 1
  %arrayidx19 = getelementptr inbounds i8, i8* %22, i32 %add18
  %24 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %24 to i32
  %25 = load i32, i32* %delimiter.addr, align 4
  %cmp21 = icmp eq i32 %conv20, %25
  br i1 %cmp21, label %if.then23, label %if.end

if.then23:                                        ; preds = %land.lhs.true17
  %26 = load i32, i32* %si, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %si, align 4
  br label %if.end

if.end:                                           ; preds = %if.then23, %land.lhs.true17, %if.else
  br label %if.end24

if.end24:                                         ; preds = %if.end, %if.then12
  br label %if.end39

if.else25:                                        ; preds = %land.lhs.true, %for.body
  %27 = load i8*, i8** %str.addr, align 4
  %28 = load i32, i32* %si, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %29 to i32
  %cmp28 = icmp eq i32 %conv27, 92
  br i1 %cmp28, label %land.lhs.true30, label %if.end38

land.lhs.true30:                                  ; preds = %if.else25
  %30 = load i8*, i8** %str.addr, align 4
  %31 = load i32, i32* %si, align 4
  %add31 = add nsw i32 %31, 1
  %arrayidx32 = getelementptr inbounds i8, i8* %30, i32 %add31
  %32 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %32 to i32
  %33 = load i32, i32* %delimiter.addr, align 4
  %cmp34 = icmp eq i32 %conv33, %33
  br i1 %cmp34, label %if.then36, label %if.end38

if.then36:                                        ; preds = %land.lhs.true30
  %34 = load i32, i32* %si, align 4
  %inc37 = add nsw i32 %34, 1
  store i32 %inc37, i32* %si, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %land.lhs.true30, %if.else25
  br label %if.end39

if.end39:                                         ; preds = %if.end38, %if.end24
  br label %for.inc

for.inc:                                          ; preds = %if.end39
  %35 = load i32, i32* %si, align 4
  %inc40 = add nsw i32 %35, 1
  store i32 %inc40, i32* %si, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %36 = load i32, i32* %si, align 4
  %37 = load i32, i32* %i, align 4
  %cmp41 = icmp sgt i32 %36, %37
  br i1 %cmp41, label %if.then44, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %38 = load i32, i32* %is_rhs.addr, align 4
  %tobool43 = icmp ne i32 %38, 0
  br i1 %tobool43, label %if.then44, label %if.end75

if.then44:                                        ; preds = %lor.lhs.false, %for.end
  %39 = load i32, i32* %si, align 4
  %40 = load i32, i32* %i, align 4
  %sub45 = sub nsw i32 %39, %40
  %add46 = add nsw i32 %sub45, 1
  %call47 = call i8* @xmalloc(i32 %add46)
  store i8* %call47, i8** %s, align 4
  store i32 0, i32* %j, align 4
  %41 = load i32, i32* %i, align 4
  store i32 %41, i32* %k, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc67, %if.then44
  %42 = load i32, i32* %k, align 4
  %43 = load i32, i32* %si, align 4
  %cmp49 = icmp slt i32 %42, %43
  br i1 %cmp49, label %for.body51, label %for.end70

for.body51:                                       ; preds = %for.cond48
  %44 = load i8*, i8** %str.addr, align 4
  %45 = load i32, i32* %k, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %44, i32 %45
  %46 = load i8, i8* %arrayidx52, align 1
  %conv53 = sext i8 %46 to i32
  %cmp54 = icmp eq i32 %conv53, 92
  br i1 %cmp54, label %land.lhs.true56, label %if.end64

land.lhs.true56:                                  ; preds = %for.body51
  %47 = load i8*, i8** %str.addr, align 4
  %48 = load i32, i32* %k, align 4
  %add57 = add nsw i32 %48, 1
  %arrayidx58 = getelementptr inbounds i8, i8* %47, i32 %add57
  %49 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %49 to i32
  %50 = load i32, i32* %delimiter.addr, align 4
  %cmp60 = icmp eq i32 %conv59, %50
  br i1 %cmp60, label %if.then62, label %if.end64

if.then62:                                        ; preds = %land.lhs.true56
  %51 = load i32, i32* %k, align 4
  %inc63 = add nsw i32 %51, 1
  store i32 %inc63, i32* %k, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then62, %land.lhs.true56, %for.body51
  %52 = load i8*, i8** %str.addr, align 4
  %53 = load i32, i32* %k, align 4
  %arrayidx65 = getelementptr inbounds i8, i8* %52, i32 %53
  %54 = load i8, i8* %arrayidx65, align 1
  %55 = load i8*, i8** %s, align 4
  %56 = load i32, i32* %j, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %55, i32 %56
  store i8 %54, i8* %arrayidx66, align 1
  br label %for.inc67

for.inc67:                                        ; preds = %if.end64
  %57 = load i32, i32* %j, align 4
  %inc68 = add nsw i32 %57, 1
  store i32 %inc68, i32* %j, align 4
  %58 = load i32, i32* %k, align 4
  %inc69 = add nsw i32 %58, 1
  store i32 %inc69, i32* %k, align 4
  br label %for.cond48

for.end70:                                        ; preds = %for.cond48
  %59 = load i8*, i8** %s, align 4
  %60 = load i32, i32* %j, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %59, i32 %60
  store i8 0, i8* %arrayidx71, align 1
  %61 = load i32*, i32** %lenptr.addr, align 4
  %tobool72 = icmp ne i32* %61, null
  br i1 %tobool72, label %if.then73, label %if.end74

if.then73:                                        ; preds = %for.end70
  %62 = load i32, i32* %j, align 4
  %63 = load i32*, i32** %lenptr.addr, align 4
  store i32 %62, i32* %63, align 4
  br label %if.end74

if.end74:                                         ; preds = %if.then73, %for.end70
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %lor.lhs.false
  %64 = load i32, i32* %si, align 4
  store i32 %64, i32* %i, align 4
  %65 = load i8*, i8** %str.addr, align 4
  %66 = load i32, i32* %i, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %65, i32 %66
  %67 = load i8, i8* %arrayidx76, align 1
  %tobool77 = icmp ne i8 %67, 0
  br i1 %tobool77, label %if.then78, label %if.end80

if.then78:                                        ; preds = %if.end75
  %68 = load i32, i32* %i, align 4
  %inc79 = add nsw i32 %68, 1
  store i32 %inc79, i32* %i, align 4
  br label %if.end80

if.end80:                                         ; preds = %if.then78, %if.end75
  %69 = load i32, i32* %i, align 4
  %70 = load i32*, i32** %iptr.addr, align 4
  store i32 %69, i32* %70, align 4
  %71 = load i8*, i8** %s, align 4
  ret i8* %71
}

; Function Attrs: noinline nounwind
define internal i32 @history_tokenize_word(i8* %string, i32 %ind) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %delimiter = alloca i32, align 4
  %nestdelim = alloca i32, align 4
  %delimopen = alloca i32, align 4
  %peek = alloca i32, align 4
  %peek177 = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  %0 = load i32, i32* %ind.addr, align 4
  store i32 %0, i32* %i, align 4
  store i32 0, i32* %nestdelim, align 4
  store i32 0, i32* %delimiter, align 4
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %6 to i32
  %call = call i8* @strchr(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i32 %conv2)
  %cmp = icmp ne i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

cond.false:                                       ; preds = %entry
  br i1 false, label %if.then, label %if.end

if.then:                                          ; preds = %cond.false, %cond.true
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  %8 = load i32, i32* %i, align 4
  store i32 %8, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.false, %cond.true
  %9 = load i8*, i8** %string.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx4, align 1
  %conv5 = zext i8 %11 to i32
  %call6 = call i32 @isdigit(i32 %conv5) #4
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end33

if.then8:                                         ; preds = %if.end
  %12 = load i32, i32* %i, align 4
  store i32 %12, i32* %j, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then8
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i32, i32* %j, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %15 to i32
  %tobool11 = icmp ne i32 %conv10, 0
  br i1 %tobool11, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %16 = load i8*, i8** %string.addr, align 4
  %17 = load i32, i32* %j, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %16, i32 %17
  %18 = load i8, i8* %arrayidx12, align 1
  %conv13 = zext i8 %18 to i32
  %call14 = call i32 @isdigit(i32 %conv13) #4
  %tobool15 = icmp ne i32 %call14, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %19 = phi i1 [ false, %while.cond ], [ %tobool15, %land.rhs ]
  br i1 %19, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %20 = load i32, i32* %j, align 4
  %inc16 = add nsw i32 %20, 1
  store i32 %inc16, i32* %j, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %21 = load i8*, i8** %string.addr, align 4
  %22 = load i32, i32* %j, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %23 to i32
  %cmp19 = icmp eq i32 %conv18, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %while.end
  %24 = load i32, i32* %j, align 4
  store i32 %24, i32* %retval, align 4
  br label %return

if.end22:                                         ; preds = %while.end
  %25 = load i8*, i8** %string.addr, align 4
  %26 = load i32, i32* %j, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %25, i32 %26
  %27 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %27 to i32
  %cmp25 = icmp eq i32 %conv24, 60
  br i1 %cmp25, label %if.then31, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end22
  %28 = load i8*, i8** %string.addr, align 4
  %29 = load i32, i32* %j, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %30 to i32
  %cmp29 = icmp eq i32 %conv28, 62
  br i1 %cmp29, label %if.then31, label %if.else

if.then31:                                        ; preds = %lor.lhs.false, %if.end22
  %31 = load i32, i32* %j, align 4
  store i32 %31, i32* %i, align 4
  br label %if.end32

if.else:                                          ; preds = %lor.lhs.false
  %32 = load i32, i32* %j, align 4
  store i32 %32, i32* %i, align 4
  br label %get_word

if.end32:                                         ; preds = %if.then31
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end
  %33 = load i8*, i8** %string.addr, align 4
  %34 = load i32, i32* %i, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %35 to i32
  %tobool36 = icmp ne i32 %conv35, 0
  br i1 %tobool36, label %cond.true37, label %cond.false43

cond.true37:                                      ; preds = %if.end33
  %36 = load i8*, i8** %string.addr, align 4
  %37 = load i32, i32* %i, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %36, i32 %37
  %38 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %38 to i32
  %call40 = call i8* @strchr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 %conv39)
  %cmp41 = icmp ne i8* %call40, null
  br i1 %cmp41, label %if.then44, label %if.end165

cond.false43:                                     ; preds = %if.end33
  br i1 false, label %if.then44, label %if.end165

if.then44:                                        ; preds = %cond.false43, %cond.true37
  %39 = load i8*, i8** %string.addr, align 4
  %40 = load i32, i32* %i, align 4
  %add = add nsw i32 %40, 1
  %arrayidx45 = getelementptr inbounds i8, i8* %39, i32 %add
  %41 = load i8, i8* %arrayidx45, align 1
  %conv46 = sext i8 %41 to i32
  store i32 %conv46, i32* %peek, align 4
  %42 = load i32, i32* %peek, align 4
  %43 = load i8*, i8** %string.addr, align 4
  %44 = load i32, i32* %i, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %43, i32 %44
  %45 = load i8, i8* %arrayidx47, align 1
  %conv48 = sext i8 %45 to i32
  %cmp49 = icmp eq i32 %42, %conv48
  br i1 %cmp49, label %land.lhs.true, label %if.else78

land.lhs.true:                                    ; preds = %if.then44
  %46 = load i32, i32* %peek, align 4
  %cmp51 = icmp ne i32 %46, 36
  br i1 %cmp51, label %if.then53, label %if.else78

if.then53:                                        ; preds = %land.lhs.true
  %47 = load i32, i32* %peek, align 4
  %cmp54 = icmp eq i32 %47, 60
  br i1 %cmp54, label %land.lhs.true56, label %if.else64

land.lhs.true56:                                  ; preds = %if.then53
  %48 = load i8*, i8** %string.addr, align 4
  %49 = load i32, i32* %i, align 4
  %add57 = add nsw i32 %49, 2
  %arrayidx58 = getelementptr inbounds i8, i8* %48, i32 %add57
  %50 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %50 to i32
  %cmp60 = icmp eq i32 %conv59, 45
  br i1 %cmp60, label %if.then62, label %if.else64

if.then62:                                        ; preds = %land.lhs.true56
  %51 = load i32, i32* %i, align 4
  %inc63 = add nsw i32 %51, 1
  store i32 %inc63, i32* %i, align 4
  br label %if.end76

if.else64:                                        ; preds = %land.lhs.true56, %if.then53
  %52 = load i32, i32* %peek, align 4
  %cmp65 = icmp eq i32 %52, 60
  br i1 %cmp65, label %land.lhs.true67, label %if.end75

land.lhs.true67:                                  ; preds = %if.else64
  %53 = load i8*, i8** %string.addr, align 4
  %54 = load i32, i32* %i, align 4
  %add68 = add nsw i32 %54, 2
  %arrayidx69 = getelementptr inbounds i8, i8* %53, i32 %add68
  %55 = load i8, i8* %arrayidx69, align 1
  %conv70 = sext i8 %55 to i32
  %cmp71 = icmp eq i32 %conv70, 60
  br i1 %cmp71, label %if.then73, label %if.end75

if.then73:                                        ; preds = %land.lhs.true67
  %56 = load i32, i32* %i, align 4
  %inc74 = add nsw i32 %56, 1
  store i32 %inc74, i32* %i, align 4
  br label %if.end75

if.end75:                                         ; preds = %if.then73, %land.lhs.true67, %if.else64
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %if.then62
  %57 = load i32, i32* %i, align 4
  %add77 = add nsw i32 %57, 2
  store i32 %add77, i32* %i, align 4
  %58 = load i32, i32* %i, align 4
  store i32 %58, i32* %retval, align 4
  br label %return

if.else78:                                        ; preds = %land.lhs.true, %if.then44
  %59 = load i32, i32* %peek, align 4
  %cmp79 = icmp eq i32 %59, 38
  br i1 %cmp79, label %land.lhs.true81, label %if.else113

land.lhs.true81:                                  ; preds = %if.else78
  %60 = load i8*, i8** %string.addr, align 4
  %61 = load i32, i32* %i, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %60, i32 %61
  %62 = load i8, i8* %arrayidx82, align 1
  %conv83 = sext i8 %62 to i32
  %cmp84 = icmp eq i32 %conv83, 62
  br i1 %cmp84, label %if.then91, label %lor.lhs.false86

lor.lhs.false86:                                  ; preds = %land.lhs.true81
  %63 = load i8*, i8** %string.addr, align 4
  %64 = load i32, i32* %i, align 4
  %arrayidx87 = getelementptr inbounds i8, i8* %63, i32 %64
  %65 = load i8, i8* %arrayidx87, align 1
  %conv88 = sext i8 %65 to i32
  %cmp89 = icmp eq i32 %conv88, 60
  br i1 %cmp89, label %if.then91, label %if.else113

if.then91:                                        ; preds = %lor.lhs.false86, %land.lhs.true81
  %66 = load i32, i32* %i, align 4
  %add92 = add nsw i32 %66, 2
  store i32 %add92, i32* %j, align 4
  br label %while.cond93

while.cond93:                                     ; preds = %while.body103, %if.then91
  %67 = load i8*, i8** %string.addr, align 4
  %68 = load i32, i32* %j, align 4
  %arrayidx94 = getelementptr inbounds i8, i8* %67, i32 %68
  %69 = load i8, i8* %arrayidx94, align 1
  %conv95 = sext i8 %69 to i32
  %tobool96 = icmp ne i32 %conv95, 0
  br i1 %tobool96, label %land.rhs97, label %land.end102

land.rhs97:                                       ; preds = %while.cond93
  %70 = load i8*, i8** %string.addr, align 4
  %71 = load i32, i32* %j, align 4
  %arrayidx98 = getelementptr inbounds i8, i8* %70, i32 %71
  %72 = load i8, i8* %arrayidx98, align 1
  %conv99 = zext i8 %72 to i32
  %call100 = call i32 @isdigit(i32 %conv99) #4
  %tobool101 = icmp ne i32 %call100, 0
  br label %land.end102

land.end102:                                      ; preds = %land.rhs97, %while.cond93
  %73 = phi i1 [ false, %while.cond93 ], [ %tobool101, %land.rhs97 ]
  br i1 %73, label %while.body103, label %while.end105

while.body103:                                    ; preds = %land.end102
  %74 = load i32, i32* %j, align 4
  %inc104 = add nsw i32 %74, 1
  store i32 %inc104, i32* %j, align 4
  br label %while.cond93

while.end105:                                     ; preds = %land.end102
  %75 = load i8*, i8** %string.addr, align 4
  %76 = load i32, i32* %j, align 4
  %arrayidx106 = getelementptr inbounds i8, i8* %75, i32 %76
  %77 = load i8, i8* %arrayidx106, align 1
  %conv107 = sext i8 %77 to i32
  %cmp108 = icmp eq i32 %conv107, 45
  br i1 %cmp108, label %if.then110, label %if.end112

if.then110:                                       ; preds = %while.end105
  %78 = load i32, i32* %j, align 4
  %inc111 = add nsw i32 %78, 1
  store i32 %inc111, i32* %j, align 4
  br label %if.end112

if.end112:                                        ; preds = %if.then110, %while.end105
  %79 = load i32, i32* %j, align 4
  store i32 %79, i32* %retval, align 4
  br label %return

if.else113:                                       ; preds = %lor.lhs.false86, %if.else78
  %80 = load i32, i32* %peek, align 4
  %cmp114 = icmp eq i32 %80, 62
  br i1 %cmp114, label %land.lhs.true116, label %lor.lhs.false121

land.lhs.true116:                                 ; preds = %if.else113
  %81 = load i8*, i8** %string.addr, align 4
  %82 = load i32, i32* %i, align 4
  %arrayidx117 = getelementptr inbounds i8, i8* %81, i32 %82
  %83 = load i8, i8* %arrayidx117, align 1
  %conv118 = sext i8 %83 to i32
  %cmp119 = icmp eq i32 %conv118, 38
  br i1 %cmp119, label %if.then129, label %lor.lhs.false121

lor.lhs.false121:                                 ; preds = %land.lhs.true116, %if.else113
  %84 = load i32, i32* %peek, align 4
  %cmp122 = icmp eq i32 %84, 124
  br i1 %cmp122, label %land.lhs.true124, label %if.else131

land.lhs.true124:                                 ; preds = %lor.lhs.false121
  %85 = load i8*, i8** %string.addr, align 4
  %86 = load i32, i32* %i, align 4
  %arrayidx125 = getelementptr inbounds i8, i8* %85, i32 %86
  %87 = load i8, i8* %arrayidx125, align 1
  %conv126 = sext i8 %87 to i32
  %cmp127 = icmp eq i32 %conv126, 62
  br i1 %cmp127, label %if.then129, label %if.else131

if.then129:                                       ; preds = %land.lhs.true124, %land.lhs.true116
  %88 = load i32, i32* %i, align 4
  %add130 = add nsw i32 %88, 2
  store i32 %add130, i32* %i, align 4
  %89 = load i32, i32* %i, align 4
  store i32 %89, i32* %retval, align 4
  br label %return

if.else131:                                       ; preds = %land.lhs.true124, %lor.lhs.false121
  %90 = load i32, i32* %peek, align 4
  %cmp132 = icmp eq i32 %90, 40
  br i1 %cmp132, label %land.lhs.true134, label %lor.lhs.false144

land.lhs.true134:                                 ; preds = %if.else131
  %91 = load i8*, i8** %string.addr, align 4
  %92 = load i32, i32* %i, align 4
  %arrayidx135 = getelementptr inbounds i8, i8* %91, i32 %92
  %93 = load i8, i8* %arrayidx135, align 1
  %conv136 = sext i8 %93 to i32
  %cmp137 = icmp eq i32 %conv136, 62
  br i1 %cmp137, label %if.then152, label %lor.lhs.false139

lor.lhs.false139:                                 ; preds = %land.lhs.true134
  %94 = load i8*, i8** %string.addr, align 4
  %95 = load i32, i32* %i, align 4
  %arrayidx140 = getelementptr inbounds i8, i8* %94, i32 %95
  %96 = load i8, i8* %arrayidx140, align 1
  %conv141 = sext i8 %96 to i32
  %cmp142 = icmp eq i32 %conv141, 60
  br i1 %cmp142, label %if.then152, label %lor.lhs.false144

lor.lhs.false144:                                 ; preds = %lor.lhs.false139, %if.else131
  %97 = load i32, i32* %peek, align 4
  %cmp145 = icmp eq i32 %97, 40
  br i1 %cmp145, label %land.lhs.true147, label %if.end154

land.lhs.true147:                                 ; preds = %lor.lhs.false144
  %98 = load i8*, i8** %string.addr, align 4
  %99 = load i32, i32* %i, align 4
  %arrayidx148 = getelementptr inbounds i8, i8* %98, i32 %99
  %100 = load i8, i8* %arrayidx148, align 1
  %conv149 = sext i8 %100 to i32
  %cmp150 = icmp eq i32 %conv149, 36
  br i1 %cmp150, label %if.then152, label %if.end154

if.then152:                                       ; preds = %land.lhs.true147, %lor.lhs.false139, %land.lhs.true134
  %101 = load i32, i32* %i, align 4
  %add153 = add nsw i32 %101, 2
  store i32 %add153, i32* %i, align 4
  store i32 40, i32* %delimopen, align 4
  store i32 41, i32* %delimiter, align 4
  store i32 1, i32* %nestdelim, align 4
  br label %get_word

if.end154:                                        ; preds = %land.lhs.true147, %lor.lhs.false144
  br label %if.end155

if.end155:                                        ; preds = %if.end154
  br label %if.end156

if.end156:                                        ; preds = %if.end155
  br label %if.end157

if.end157:                                        ; preds = %if.end156
  %102 = load i8*, i8** %string.addr, align 4
  %103 = load i32, i32* %i, align 4
  %arrayidx158 = getelementptr inbounds i8, i8* %102, i32 %103
  %104 = load i8, i8* %arrayidx158, align 1
  %conv159 = sext i8 %104 to i32
  %cmp160 = icmp ne i32 %conv159, 36
  br i1 %cmp160, label %if.then162, label %if.end164

if.then162:                                       ; preds = %if.end157
  %105 = load i32, i32* %i, align 4
  %inc163 = add nsw i32 %105, 1
  store i32 %inc163, i32* %i, align 4
  %106 = load i32, i32* %i, align 4
  store i32 %106, i32* %retval, align 4
  br label %return

if.end164:                                        ; preds = %if.end157
  br label %if.end165

if.end165:                                        ; preds = %if.end164, %cond.false43, %cond.true37
  %107 = load i8*, i8** %string.addr, align 4
  %108 = load i32, i32* %i, align 4
  %arrayidx166 = getelementptr inbounds i8, i8* %107, i32 %108
  %109 = load i8, i8* %arrayidx166, align 1
  %conv167 = sext i8 %109 to i32
  %tobool168 = icmp ne i32 %conv167, 0
  br i1 %tobool168, label %cond.true169, label %cond.false175

cond.true169:                                     ; preds = %if.end165
  %110 = load i8*, i8** %string.addr, align 4
  %111 = load i32, i32* %i, align 4
  %arrayidx170 = getelementptr inbounds i8, i8* %110, i32 %111
  %112 = load i8, i8* %arrayidx170, align 1
  %conv171 = sext i8 %112 to i32
  %call172 = call i8* @strchr(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0), i32 %conv171)
  %cmp173 = icmp ne i8* %call172, null
  br i1 %cmp173, label %if.then176, label %if.end186

cond.false175:                                    ; preds = %if.end165
  br i1 false, label %if.then176, label %if.end186

if.then176:                                       ; preds = %cond.false175, %cond.true169
  %113 = load i8*, i8** %string.addr, align 4
  %114 = load i32, i32* %i, align 4
  %add178 = add nsw i32 %114, 1
  %arrayidx179 = getelementptr inbounds i8, i8* %113, i32 %add178
  %115 = load i8, i8* %arrayidx179, align 1
  %conv180 = sext i8 %115 to i32
  store i32 %conv180, i32* %peek177, align 4
  %116 = load i32, i32* %peek177, align 4
  %cmp181 = icmp eq i32 %116, 40
  br i1 %cmp181, label %if.then183, label %if.end185

if.then183:                                       ; preds = %if.then176
  %117 = load i32, i32* %i, align 4
  %add184 = add nsw i32 %117, 2
  store i32 %add184, i32* %i, align 4
  store i32 40, i32* %delimopen, align 4
  store i32 41, i32* %delimiter, align 4
  store i32 1, i32* %nestdelim, align 4
  br label %if.end185

if.end185:                                        ; preds = %if.then183, %if.then176
  br label %if.end186

if.end186:                                        ; preds = %if.end185, %cond.false175, %cond.true169
  br label %get_word

get_word:                                         ; preds = %if.end186, %if.then152, %if.else
  %118 = load i32, i32* %delimiter, align 4
  %cmp187 = icmp eq i32 %118, 0
  br i1 %cmp187, label %land.lhs.true189, label %if.end204

land.lhs.true189:                                 ; preds = %get_word
  %119 = load i8*, i8** %string.addr, align 4
  %120 = load i32, i32* %i, align 4
  %arrayidx190 = getelementptr inbounds i8, i8* %119, i32 %120
  %121 = load i8, i8* %arrayidx190, align 1
  %conv191 = sext i8 %121 to i32
  %tobool192 = icmp ne i32 %conv191, 0
  br i1 %tobool192, label %cond.true193, label %cond.false199

cond.true193:                                     ; preds = %land.lhs.true189
  %122 = load i8*, i8** %string.addr, align 4
  %123 = load i32, i32* %i, align 4
  %arrayidx194 = getelementptr inbounds i8, i8* %122, i32 %123
  %124 = load i8, i8* %arrayidx194, align 1
  %conv195 = sext i8 %124 to i32
  %call196 = call i8* @strchr(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i32 %conv195)
  %cmp197 = icmp ne i8* %call196, null
  br i1 %cmp197, label %if.then200, label %if.end204

cond.false199:                                    ; preds = %land.lhs.true189
  br i1 false, label %if.then200, label %if.end204

if.then200:                                       ; preds = %cond.false199, %cond.true193
  %125 = load i8*, i8** %string.addr, align 4
  %126 = load i32, i32* %i, align 4
  %inc201 = add nsw i32 %126, 1
  store i32 %inc201, i32* %i, align 4
  %arrayidx202 = getelementptr inbounds i8, i8* %125, i32 %126
  %127 = load i8, i8* %arrayidx202, align 1
  %conv203 = sext i8 %127 to i32
  store i32 %conv203, i32* %delimiter, align 4
  br label %if.end204

if.end204:                                        ; preds = %if.then200, %cond.false199, %cond.true193, %get_word
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end204
  %128 = load i8*, i8** %string.addr, align 4
  %129 = load i32, i32* %i, align 4
  %arrayidx205 = getelementptr inbounds i8, i8* %128, i32 %129
  %130 = load i8, i8* %arrayidx205, align 1
  %tobool206 = icmp ne i8 %130, 0
  br i1 %tobool206, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %131 = load i8*, i8** %string.addr, align 4
  %132 = load i32, i32* %i, align 4
  %arrayidx207 = getelementptr inbounds i8, i8* %131, i32 %132
  %133 = load i8, i8* %arrayidx207, align 1
  %conv208 = sext i8 %133 to i32
  %cmp209 = icmp eq i32 %conv208, 92
  br i1 %cmp209, label %land.lhs.true211, label %if.end219

land.lhs.true211:                                 ; preds = %for.body
  %134 = load i8*, i8** %string.addr, align 4
  %135 = load i32, i32* %i, align 4
  %add212 = add nsw i32 %135, 1
  %arrayidx213 = getelementptr inbounds i8, i8* %134, i32 %add212
  %136 = load i8, i8* %arrayidx213, align 1
  %conv214 = sext i8 %136 to i32
  %cmp215 = icmp eq i32 %conv214, 10
  br i1 %cmp215, label %if.then217, label %if.end219

if.then217:                                       ; preds = %land.lhs.true211
  %137 = load i32, i32* %i, align 4
  %inc218 = add nsw i32 %137, 1
  store i32 %inc218, i32* %i, align 4
  br label %for.inc

if.end219:                                        ; preds = %land.lhs.true211, %for.body
  %138 = load i8*, i8** %string.addr, align 4
  %139 = load i32, i32* %i, align 4
  %arrayidx220 = getelementptr inbounds i8, i8* %138, i32 %139
  %140 = load i8, i8* %arrayidx220, align 1
  %conv221 = sext i8 %140 to i32
  %cmp222 = icmp eq i32 %conv221, 92
  br i1 %cmp222, label %land.lhs.true224, label %if.end243

land.lhs.true224:                                 ; preds = %if.end219
  %141 = load i32, i32* %delimiter, align 4
  %cmp225 = icmp ne i32 %141, 39
  br i1 %cmp225, label %land.lhs.true227, label %if.end243

land.lhs.true227:                                 ; preds = %land.lhs.true224
  %142 = load i32, i32* %delimiter, align 4
  %cmp228 = icmp ne i32 %142, 34
  br i1 %cmp228, label %if.then241, label %lor.lhs.false230

lor.lhs.false230:                                 ; preds = %land.lhs.true227
  %143 = load i8*, i8** %string.addr, align 4
  %144 = load i32, i32* %i, align 4
  %arrayidx231 = getelementptr inbounds i8, i8* %143, i32 %144
  %145 = load i8, i8* %arrayidx231, align 1
  %conv232 = sext i8 %145 to i32
  %tobool233 = icmp ne i32 %conv232, 0
  br i1 %tobool233, label %cond.true234, label %cond.false240

cond.true234:                                     ; preds = %lor.lhs.false230
  %146 = load i8*, i8** %string.addr, align 4
  %147 = load i32, i32* %i, align 4
  %arrayidx235 = getelementptr inbounds i8, i8* %146, i32 %147
  %148 = load i8, i8* %arrayidx235, align 1
  %conv236 = sext i8 %148 to i32
  %call237 = call i8* @strchr(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0), i32 %conv236)
  %cmp238 = icmp ne i8* %call237, null
  br i1 %cmp238, label %if.then241, label %if.end243

cond.false240:                                    ; preds = %lor.lhs.false230
  br i1 false, label %if.then241, label %if.end243

if.then241:                                       ; preds = %cond.false240, %cond.true234, %land.lhs.true227
  %149 = load i32, i32* %i, align 4
  %inc242 = add nsw i32 %149, 1
  store i32 %inc242, i32* %i, align 4
  br label %for.inc

if.end243:                                        ; preds = %cond.false240, %cond.true234, %land.lhs.true224, %if.end219
  %150 = load i32, i32* %nestdelim, align 4
  %tobool244 = icmp ne i32 %150, 0
  br i1 %tobool244, label %land.lhs.true245, label %if.end252

land.lhs.true245:                                 ; preds = %if.end243
  %151 = load i8*, i8** %string.addr, align 4
  %152 = load i32, i32* %i, align 4
  %arrayidx246 = getelementptr inbounds i8, i8* %151, i32 %152
  %153 = load i8, i8* %arrayidx246, align 1
  %conv247 = sext i8 %153 to i32
  %154 = load i32, i32* %delimopen, align 4
  %cmp248 = icmp eq i32 %conv247, %154
  br i1 %cmp248, label %if.then250, label %if.end252

if.then250:                                       ; preds = %land.lhs.true245
  %155 = load i32, i32* %nestdelim, align 4
  %inc251 = add nsw i32 %155, 1
  store i32 %inc251, i32* %nestdelim, align 4
  br label %for.inc

if.end252:                                        ; preds = %land.lhs.true245, %if.end243
  %156 = load i32, i32* %nestdelim, align 4
  %tobool253 = icmp ne i32 %156, 0
  br i1 %tobool253, label %land.lhs.true254, label %if.end264

land.lhs.true254:                                 ; preds = %if.end252
  %157 = load i8*, i8** %string.addr, align 4
  %158 = load i32, i32* %i, align 4
  %arrayidx255 = getelementptr inbounds i8, i8* %157, i32 %158
  %159 = load i8, i8* %arrayidx255, align 1
  %conv256 = sext i8 %159 to i32
  %160 = load i32, i32* %delimiter, align 4
  %cmp257 = icmp eq i32 %conv256, %160
  br i1 %cmp257, label %if.then259, label %if.end264

if.then259:                                       ; preds = %land.lhs.true254
  %161 = load i32, i32* %nestdelim, align 4
  %dec = add nsw i32 %161, -1
  store i32 %dec, i32* %nestdelim, align 4
  %162 = load i32, i32* %nestdelim, align 4
  %cmp260 = icmp eq i32 %162, 0
  br i1 %cmp260, label %if.then262, label %if.end263

if.then262:                                       ; preds = %if.then259
  store i32 0, i32* %delimiter, align 4
  br label %if.end263

if.end263:                                        ; preds = %if.then262, %if.then259
  br label %for.inc

if.end264:                                        ; preds = %land.lhs.true254, %if.end252
  %163 = load i32, i32* %delimiter, align 4
  %tobool265 = icmp ne i32 %163, 0
  br i1 %tobool265, label %land.lhs.true266, label %if.end272

land.lhs.true266:                                 ; preds = %if.end264
  %164 = load i8*, i8** %string.addr, align 4
  %165 = load i32, i32* %i, align 4
  %arrayidx267 = getelementptr inbounds i8, i8* %164, i32 %165
  %166 = load i8, i8* %arrayidx267, align 1
  %conv268 = sext i8 %166 to i32
  %167 = load i32, i32* %delimiter, align 4
  %cmp269 = icmp eq i32 %conv268, %167
  br i1 %cmp269, label %if.then271, label %if.end272

if.then271:                                       ; preds = %land.lhs.true266
  store i32 0, i32* %delimiter, align 4
  br label %for.inc

if.end272:                                        ; preds = %land.lhs.true266, %if.end264
  %168 = load i32, i32* %delimiter, align 4
  %cmp273 = icmp eq i32 %168, 0
  br i1 %cmp273, label %land.lhs.true275, label %if.end287

land.lhs.true275:                                 ; preds = %if.end272
  %169 = load i8*, i8** %string.addr, align 4
  %170 = load i32, i32* %i, align 4
  %arrayidx276 = getelementptr inbounds i8, i8* %169, i32 %170
  %171 = load i8, i8* %arrayidx276, align 1
  %conv277 = sext i8 %171 to i32
  %tobool278 = icmp ne i32 %conv277, 0
  br i1 %tobool278, label %cond.true279, label %cond.false285

cond.true279:                                     ; preds = %land.lhs.true275
  %172 = load i8*, i8** @history_word_delimiters, align 4
  %173 = load i8*, i8** %string.addr, align 4
  %174 = load i32, i32* %i, align 4
  %arrayidx280 = getelementptr inbounds i8, i8* %173, i32 %174
  %175 = load i8, i8* %arrayidx280, align 1
  %conv281 = sext i8 %175 to i32
  %call282 = call i8* @strchr(i8* %172, i32 %conv281)
  %cmp283 = icmp ne i8* %call282, null
  br i1 %cmp283, label %if.then286, label %if.end287

cond.false285:                                    ; preds = %land.lhs.true275
  br i1 false, label %if.then286, label %if.end287

if.then286:                                       ; preds = %cond.false285, %cond.true279
  br label %for.end

if.end287:                                        ; preds = %cond.false285, %cond.true279, %if.end272
  %176 = load i32, i32* %delimiter, align 4
  %cmp288 = icmp eq i32 %176, 0
  br i1 %cmp288, label %land.lhs.true290, label %if.end304

land.lhs.true290:                                 ; preds = %if.end287
  %177 = load i8*, i8** %string.addr, align 4
  %178 = load i32, i32* %i, align 4
  %arrayidx291 = getelementptr inbounds i8, i8* %177, i32 %178
  %179 = load i8, i8* %arrayidx291, align 1
  %conv292 = sext i8 %179 to i32
  %tobool293 = icmp ne i32 %conv292, 0
  br i1 %tobool293, label %cond.true294, label %cond.false300

cond.true294:                                     ; preds = %land.lhs.true290
  %180 = load i8*, i8** %string.addr, align 4
  %181 = load i32, i32* %i, align 4
  %arrayidx295 = getelementptr inbounds i8, i8* %180, i32 %181
  %182 = load i8, i8* %arrayidx295, align 1
  %conv296 = sext i8 %182 to i32
  %call297 = call i8* @strchr(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i32 %conv296)
  %cmp298 = icmp ne i8* %call297, null
  br i1 %cmp298, label %if.then301, label %if.end304

cond.false300:                                    ; preds = %land.lhs.true290
  br i1 false, label %if.then301, label %if.end304

if.then301:                                       ; preds = %cond.false300, %cond.true294
  %183 = load i8*, i8** %string.addr, align 4
  %184 = load i32, i32* %i, align 4
  %arrayidx302 = getelementptr inbounds i8, i8* %183, i32 %184
  %185 = load i8, i8* %arrayidx302, align 1
  %conv303 = sext i8 %185 to i32
  store i32 %conv303, i32* %delimiter, align 4
  br label %if.end304

if.end304:                                        ; preds = %if.then301, %cond.false300, %cond.true294, %if.end287
  br label %for.inc

for.inc:                                          ; preds = %if.end304, %if.then271, %if.end263, %if.then250, %if.then241, %if.then217
  %186 = load i32, i32* %i, align 4
  %inc305 = add nsw i32 %186, 1
  store i32 %inc305, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then286, %for.cond
  %187 = load i32, i32* %i, align 4
  store i32 %187, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then162, %if.then129, %if.end112, %if.end76, %if.then21, %if.then
  %188 = load i32, i32* %retval, align 4
  ret i32 %188
}

declare i32 @strncmp(i8*, i8*, i32) #1

declare i8* @sh_single_quote(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @quote_breaks(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  %r = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %len = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 3, i32* %len, align 4
  %0 = load i8*, i8** %s.addr, align 4
  store i8* %0, i8** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %p, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %p, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i8*, i8** %p, align 4
  %6 = load i8, i8* %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv2, 39
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %7 = load i32, i32* %len, align 4
  %add = add nsw i32 %7, 3
  store i32 %add, i32* %len, align 4
  br label %if.end16

if.else:                                          ; preds = %for.body
  %8 = load i8*, i8** %p, align 4
  %9 = load i8, i8* %8, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 32
  br i1 %cmp5, label %if.then14, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %10 = load i8*, i8** %p, align 4
  %11 = load i8, i8* %10, align 1
  %conv7 = sext i8 %11 to i32
  %cmp8 = icmp eq i32 %conv7, 9
  br i1 %cmp8, label %if.then14, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %12 = load i8*, i8** %p, align 4
  %13 = load i8, i8* %12, align 1
  %conv11 = sext i8 %13 to i32
  %cmp12 = icmp eq i32 %conv11, 10
  br i1 %cmp12, label %if.then14, label %if.end

if.then14:                                        ; preds = %lor.lhs.false10, %lor.lhs.false, %if.else
  %14 = load i32, i32* %len, align 4
  %add15 = add nsw i32 %14, 2
  store i32 %add15, i32* %len, align 4
  br label %if.end

if.end:                                           ; preds = %if.then14, %lor.lhs.false10
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %15 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %16 = load i32, i32* %len, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %len, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %17 = load i32, i32* %len, align 4
  %call = call i8* @xmalloc(i32 %17)
  store i8* %call, i8** %ret, align 4
  store i8* %call, i8** %r, align 4
  %18 = load i8*, i8** %r, align 4
  %incdec.ptr17 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr17, i8** %r, align 4
  store i8 39, i8* %18, align 1
  %19 = load i8*, i8** %s.addr, align 4
  store i8* %19, i8** %p, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %if.end55, %for.end
  %20 = load i8*, i8** %p, align 4
  %tobool19 = icmp ne i8* %20, null
  br i1 %tobool19, label %land.rhs20, label %land.end23

land.rhs20:                                       ; preds = %for.cond18
  %21 = load i8*, i8** %p, align 4
  %22 = load i8, i8* %21, align 1
  %conv21 = sext i8 %22 to i32
  %tobool22 = icmp ne i32 %conv21, 0
  br label %land.end23

land.end23:                                       ; preds = %land.rhs20, %for.cond18
  %23 = phi i1 [ false, %for.cond18 ], [ %tobool22, %land.rhs20 ]
  br i1 %23, label %for.body24, label %for.end56

for.body24:                                       ; preds = %land.end23
  %24 = load i8*, i8** %p, align 4
  %25 = load i8, i8* %24, align 1
  %conv25 = sext i8 %25 to i32
  %cmp26 = icmp eq i32 %conv25, 39
  br i1 %cmp26, label %if.then28, label %if.else34

if.then28:                                        ; preds = %for.body24
  %26 = load i8*, i8** %r, align 4
  %incdec.ptr29 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %incdec.ptr29, i8** %r, align 4
  store i8 39, i8* %26, align 1
  %27 = load i8*, i8** %r, align 4
  %incdec.ptr30 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr30, i8** %r, align 4
  store i8 92, i8* %27, align 1
  %28 = load i8*, i8** %r, align 4
  %incdec.ptr31 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr31, i8** %r, align 4
  store i8 39, i8* %28, align 1
  %29 = load i8*, i8** %r, align 4
  %incdec.ptr32 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %incdec.ptr32, i8** %r, align 4
  store i8 39, i8* %29, align 1
  %30 = load i8*, i8** %p, align 4
  %incdec.ptr33 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %incdec.ptr33, i8** %p, align 4
  br label %if.end55

if.else34:                                        ; preds = %for.body24
  %31 = load i8*, i8** %p, align 4
  %32 = load i8, i8* %31, align 1
  %conv35 = sext i8 %32 to i32
  %cmp36 = icmp eq i32 %conv35, 32
  br i1 %cmp36, label %if.then46, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %if.else34
  %33 = load i8*, i8** %p, align 4
  %34 = load i8, i8* %33, align 1
  %conv39 = sext i8 %34 to i32
  %cmp40 = icmp eq i32 %conv39, 9
  br i1 %cmp40, label %if.then46, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %lor.lhs.false38
  %35 = load i8*, i8** %p, align 4
  %36 = load i8, i8* %35, align 1
  %conv43 = sext i8 %36 to i32
  %cmp44 = icmp eq i32 %conv43, 10
  br i1 %cmp44, label %if.then46, label %if.else51

if.then46:                                        ; preds = %lor.lhs.false42, %lor.lhs.false38, %if.else34
  %37 = load i8*, i8** %r, align 4
  %incdec.ptr47 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %incdec.ptr47, i8** %r, align 4
  store i8 39, i8* %37, align 1
  %38 = load i8*, i8** %p, align 4
  %incdec.ptr48 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr48, i8** %p, align 4
  %39 = load i8, i8* %38, align 1
  %40 = load i8*, i8** %r, align 4
  %incdec.ptr49 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr49, i8** %r, align 4
  store i8 %39, i8* %40, align 1
  %41 = load i8*, i8** %r, align 4
  %incdec.ptr50 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %incdec.ptr50, i8** %r, align 4
  store i8 39, i8* %41, align 1
  br label %if.end54

if.else51:                                        ; preds = %lor.lhs.false42
  %42 = load i8*, i8** %p, align 4
  %incdec.ptr52 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %incdec.ptr52, i8** %p, align 4
  %43 = load i8, i8* %42, align 1
  %44 = load i8*, i8** %r, align 4
  %incdec.ptr53 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr53, i8** %r, align 4
  store i8 %43, i8* %44, align 1
  br label %if.end54

if.end54:                                         ; preds = %if.else51, %if.then46
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.then28
  br label %for.cond18

for.end56:                                        ; preds = %land.end23
  %45 = load i8*, i8** %r, align 4
  %incdec.ptr57 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr57, i8** %r, align 4
  store i8 39, i8* %45, align 1
  %46 = load i8*, i8** %r, align 4
  store i8 0, i8* %46, align 1
  %47 = load i8*, i8** %ret, align 4
  ret i8* %47
}

; Function Attrs: noinline nounwind
define internal void @postproc_subst_rhs() #0 {
entry:
  %new = alloca i8*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %new_size = alloca i32, align 4
  %0 = load i32, i32* @subst_rhs_len, align 4
  %1 = load i32, i32* @subst_lhs_len, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* %new_size, align 4
  %call = call i8* @xmalloc(i32 %add)
  store i8* %call, i8** %new, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* @subst_rhs_len, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** @subst_rhs, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp1 = icmp eq i32 %conv, 38
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %7 = load i32, i32* %j, align 4
  %8 = load i32, i32* @subst_lhs_len, align 4
  %add3 = add nsw i32 %7, %8
  %9 = load i32, i32* %new_size, align 4
  %cmp4 = icmp sge i32 %add3, %9
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %10 = load i8*, i8** %new, align 4
  %11 = load i32, i32* %new_size, align 4
  %mul = mul nsw i32 %11, 2
  %12 = load i32, i32* @subst_lhs_len, align 4
  %add7 = add nsw i32 %mul, %12
  store i32 %add7, i32* %new_size, align 4
  %call8 = call i8* @xrealloc(i8* %10, i32 %add7)
  store i8* %call8, i8** %new, align 4
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  %13 = load i8*, i8** %new, align 4
  %14 = load i32, i32* %j, align 4
  %add.ptr = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8*, i8** @subst_lhs, align 4
  %call9 = call i8* @strcpy(i8* %add.ptr, i8* %15)
  %16 = load i32, i32* @subst_lhs_len, align 4
  %17 = load i32, i32* %j, align 4
  %add10 = add nsw i32 %17, %16
  store i32 %add10, i32* %j, align 4
  br label %if.end31

if.else:                                          ; preds = %for.body
  %18 = load i8*, i8** @subst_rhs, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %20 to i32
  %cmp13 = icmp eq i32 %conv12, 92
  br i1 %cmp13, label %land.lhs.true, label %if.end21

land.lhs.true:                                    ; preds = %if.else
  %21 = load i8*, i8** @subst_rhs, align 4
  %22 = load i32, i32* %i, align 4
  %add15 = add nsw i32 %22, 1
  %arrayidx16 = getelementptr inbounds i8, i8* %21, i32 %add15
  %23 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %23 to i32
  %cmp18 = icmp eq i32 %conv17, 38
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %land.lhs.true
  %24 = load i32, i32* %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %land.lhs.true, %if.else
  %25 = load i32, i32* %j, align 4
  %26 = load i32, i32* %new_size, align 4
  %cmp22 = icmp sge i32 %25, %26
  br i1 %cmp22, label %if.then24, label %if.end27

if.then24:                                        ; preds = %if.end21
  %27 = load i8*, i8** %new, align 4
  %28 = load i32, i32* %new_size, align 4
  %mul25 = mul nsw i32 %28, 2
  store i32 %mul25, i32* %new_size, align 4
  %call26 = call i8* @xrealloc(i8* %27, i32 %mul25)
  store i8* %call26, i8** %new, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then24, %if.end21
  %29 = load i8*, i8** @subst_rhs, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load i8, i8* %arrayidx28, align 1
  %32 = load i8*, i8** %new, align 4
  %33 = load i32, i32* %j, align 4
  %inc29 = add nsw i32 %33, 1
  store i32 %inc29, i32* %j, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %32, i32 %33
  store i8 %31, i8* %arrayidx30, align 1
  br label %if.end31

if.end31:                                         ; preds = %if.end27, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end31
  %34 = load i32, i32* %i, align 4
  %inc32 = add nsw i32 %34, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %35 = load i8*, i8** %new, align 4
  %36 = load i32, i32* %j, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %35, i32 %36
  store i8 0, i8* %arrayidx33, align 1
  %37 = load i8*, i8** @subst_rhs, align 4
  call void @xfree(i8* %37)
  %38 = load i8*, i8** %new, align 4
  store i8* %38, i8** @subst_rhs, align 4
  %39 = load i32, i32* %j, align 4
  store i32 %39, i32* @subst_rhs_len, align 4
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @isdigit(i32) #3

; Function Attrs: noinline nounwind
define internal i8* @history_substring(i8* %string, i32 %start, i32 %end) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %result = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  %0 = load i32, i32* %end.addr, align 4
  %1 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %0, %1
  store i32 %sub, i32* %len, align 4
  %2 = load i32, i32* %len, align 4
  %add = add nsw i32 %2, 1
  %call = call i8* @xmalloc(i32 %add)
  store i8* %call, i8** %result, align 4
  %3 = load i8*, i8** %result, align 4
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %start.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i32, i32* %len, align 4
  %call1 = call i8* @strncpy(i8* %3, i8* %add.ptr, i32 %6)
  %7 = load i8*, i8** %result, align 4
  %8 = load i32, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 %8
  store i8 0, i8* %arrayidx, align 1
  %9 = load i8*, i8** %result, align 4
  ret i8* %9
}

; Function Attrs: noinline nounwind
define internal void @freewords(i8** %words, i32 %start) #0 {
entry:
  %words.addr = alloca i8**, align 4
  %start.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8** %words, i8*** %words.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  %0 = load i32, i32* %start.addr, align 4
  store i32 %0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8**, i8*** %words.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8**, i8*** %words.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i32 %5
  %6 = load i8*, i8** %arrayidx1, align 4
  call void @xfree(i8* %6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
