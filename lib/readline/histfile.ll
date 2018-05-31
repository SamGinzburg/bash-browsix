; ModuleID = 'histfile.c'
source_filename = "histfile.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct._hist_entry = type { i8*, i8*, i8* }

@history_file_version = global i32 1, align 4
@history_write_timestamps = global i32 0, align 4
@history_multiline_entries = global i32 0, align 4
@history_lines_read_from_file = global i32 0, align 4
@history_lines_written_to_file = global i32 0, align 4
@history_comment_char = external global i8, align 1
@history_length = external global i32, align 4
@.str = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c".history\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c".tmp\00", align 1

; Function Attrs: noinline nounwind
define i32 @read_history(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @read_history_range(i8* %0, i32 0, i32 -1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @read_history_range(i8* %filename, i32 %from, i32 %to) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  %line_start = alloca i8*, align 4
  %line_end = alloca i8*, align 4
  %p = alloca i8*, align 4
  %input = alloca i8*, align 4
  %buffer = alloca i8*, align 4
  %bufend = alloca i8*, align 4
  %last_ts = alloca i8*, align 4
  %file = alloca i32, align 4
  %current_line = alloca i32, align 4
  %chars_read = alloca i32, align 4
  %has_timestamps = alloca i32, align 4
  %reset_comment_char = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  %file_size = alloca i32, align 4
  %overflow_errno = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %from, i32* %from.addr, align 4
  store i32 %to, i32* %to.addr, align 4
  store i32 27, i32* %overflow_errno, align 4
  store i32 0, i32* @history_lines_read_from_file, align 4
  store i8* null, i8** %last_ts, align 4
  store i8* null, i8** %buffer, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i8* @history_filename(i8* %0)
  store i8* %call, i8** %input, align 4
  %1 = load i8*, i8** %input, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %input, align 4
  %call1 = call i32 (i8*, i32, ...) @open(i8* %2, i32 0, i32 438)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ -1, %cond.false ]
  store i32 %cond, i32* %file, align 4
  %3 = load i32, i32* %file, align 4
  %cmp = icmp slt i32 %3, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end
  %4 = load i32, i32* %file, align 4
  %call2 = call i32 @fstat(i32 %4, %struct.stat* %finfo)
  %cmp3 = icmp eq i32 %call2, -1
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %cond.end
  br label %error_and_exit

if.end:                                           ; preds = %lor.lhs.false
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %5 = load i32, i32* %st_size, align 8
  store i32 %5, i32* %file_size, align 4
  %6 = load i32, i32* %file_size, align 4
  %st_size4 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %7 = load i32, i32* %st_size4, align 8
  %cmp5 = icmp ne i32 %6, %7
  br i1 %cmp5, label %if.then8, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %if.end
  %8 = load i32, i32* %file_size, align 4
  %add = add i32 %8, 1
  %9 = load i32, i32* %file_size, align 4
  %cmp7 = icmp ult i32 %add, %9
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %lor.lhs.false6, %if.end
  %10 = load i32, i32* %overflow_errno, align 4
  %call9 = call i32* @__errno_location()
  store i32 %10, i32* %call9, align 4
  br label %error_and_exit

if.end10:                                         ; preds = %lor.lhs.false6
  %11 = load i32, i32* %file_size, align 4
  %add11 = add i32 %11, 1
  %call12 = call i8* @malloc(i32 %add11)
  store i8* %call12, i8** %buffer, align 4
  %12 = load i8*, i8** %buffer, align 4
  %cmp13 = icmp eq i8* %12, null
  br i1 %cmp13, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.end10
  %13 = load i32, i32* %overflow_errno, align 4
  %call15 = call i32* @__errno_location()
  store i32 %13, i32* %call15, align 4
  br label %error_and_exit

if.end16:                                         ; preds = %if.end10
  %14 = load i32, i32* %file, align 4
  %15 = load i8*, i8** %buffer, align 4
  %16 = load i32, i32* %file_size, align 4
  %call17 = call i32 @read(i32 %14, i8* %15, i32 %16)
  store i32 %call17, i32* %chars_read, align 4
  %17 = load i32, i32* %chars_read, align 4
  %cmp18 = icmp slt i32 %17, 0
  br i1 %cmp18, label %if.then19, label %if.end35

if.then19:                                        ; preds = %if.end16
  br label %error_and_exit

error_and_exit:                                   ; preds = %if.then19, %if.then14, %if.then8, %if.then
  %call20 = call i32* @__errno_location()
  %18 = load i32, i32* %call20, align 4
  %cmp21 = icmp ne i32 %18, 0
  br i1 %cmp21, label %if.then22, label %if.else

if.then22:                                        ; preds = %error_and_exit
  %call23 = call i32* @__errno_location()
  %19 = load i32, i32* %call23, align 4
  store i32 %19, i32* %chars_read, align 4
  br label %if.end24

if.else:                                          ; preds = %error_and_exit
  store i32 5, i32* %chars_read, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then22
  %20 = load i32, i32* %file, align 4
  %cmp25 = icmp sge i32 %20, 0
  br i1 %cmp25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %if.end24
  %21 = load i32, i32* %file, align 4
  %call27 = call i32 @close(i32 %21)
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %if.end24
  %22 = load i8*, i8** %input, align 4
  %tobool29 = icmp ne i8* %22, null
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end28
  %23 = load i8*, i8** %input, align 4
  call void @free(i8* %23)
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.end28
  %24 = load i8*, i8** %buffer, align 4
  %tobool32 = icmp ne i8* %24, null
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end31
  %25 = load i8*, i8** %buffer, align 4
  call void @free(i8* %25)
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end31
  %26 = load i32, i32* %chars_read, align 4
  store i32 %26, i32* %retval, align 4
  br label %return

if.end35:                                         ; preds = %if.end16
  %27 = load i32, i32* %file, align 4
  %call36 = call i32 @close(i32 %27)
  %28 = load i32, i32* %to.addr, align 4
  %cmp37 = icmp slt i32 %28, 0
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end35
  %29 = load i32, i32* %chars_read, align 4
  store i32 %29, i32* %to.addr, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %if.end35
  %30 = load i8*, i8** %buffer, align 4
  %31 = load i32, i32* %chars_read, align 4
  %add.ptr = getelementptr inbounds i8, i8* %30, i32 %31
  store i8* %add.ptr, i8** %bufend, align 4
  store i32 0, i32* %current_line, align 4
  store i32 0, i32* %reset_comment_char, align 4
  %32 = load i8, i8* @history_comment_char, align 1
  %conv = sext i8 %32 to i32
  %cmp40 = icmp eq i32 %conv, 0
  br i1 %cmp40, label %land.lhs.true, label %if.end51

land.lhs.true:                                    ; preds = %if.end39
  %33 = load i8*, i8** %buffer, align 4
  %arrayidx = getelementptr inbounds i8, i8* %33, i32 0
  %34 = load i8, i8* %arrayidx, align 1
  %conv42 = sext i8 %34 to i32
  %cmp43 = icmp eq i32 %conv42, 35
  br i1 %cmp43, label %land.lhs.true45, label %if.end51

land.lhs.true45:                                  ; preds = %land.lhs.true
  %35 = load i8*, i8** %buffer, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %35, i32 1
  %36 = load i8, i8* %arrayidx46, align 1
  %conv47 = zext i8 %36 to i32
  %call48 = call i32 @isdigit(i32 %conv47) #3
  %tobool49 = icmp ne i32 %call48, 0
  br i1 %tobool49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %land.lhs.true45
  store i8 35, i8* @history_comment_char, align 1
  store i32 1, i32* %reset_comment_char, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %land.lhs.true45, %land.lhs.true, %if.end39
  %37 = load i8*, i8** %buffer, align 4
  %38 = load i8, i8* %37, align 1
  %conv52 = sext i8 %38 to i32
  %39 = load i8, i8* @history_comment_char, align 1
  %conv53 = sext i8 %39 to i32
  %cmp54 = icmp eq i32 %conv52, %conv53
  br i1 %cmp54, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end51
  %40 = load i8*, i8** %buffer, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %40, i32 1
  %41 = load i8, i8* %arrayidx56, align 1
  %conv57 = zext i8 %41 to i32
  %call58 = call i32 @isdigit(i32 %conv57) #3
  %tobool59 = icmp ne i32 %call58, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end51
  %42 = phi i1 [ false, %if.end51 ], [ %tobool59, %land.rhs ]
  %land.ext = zext i1 %42 to i32
  store i32 %land.ext, i32* %has_timestamps, align 4
  %43 = load i32, i32* %has_timestamps, align 4
  %tobool60 = icmp ne i32 %43, 0
  br i1 %tobool60, label %land.rhs61, label %land.end63

land.rhs61:                                       ; preds = %land.end
  %44 = load i32, i32* @history_write_timestamps, align 4
  %tobool62 = icmp ne i32 %44, 0
  br label %land.end63

land.end63:                                       ; preds = %land.rhs61, %land.end
  %45 = phi i1 [ false, %land.end ], [ %tobool62, %land.rhs61 ]
  %land.ext64 = zext i1 %45 to i32
  %46 = load i32, i32* @history_multiline_entries, align 4
  %add65 = add nsw i32 %46, %land.ext64
  store i32 %add65, i32* @history_multiline_entries, align 4
  %47 = load i8*, i8** %buffer, align 4
  store i8* %47, i8** %line_end, align 4
  store i8* %47, i8** %line_start, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %land.end63
  %48 = load i8*, i8** %line_end, align 4
  %49 = load i8*, i8** %bufend, align 4
  %cmp66 = icmp ult i8* %48, %49
  br i1 %cmp66, label %land.rhs68, label %land.end71

land.rhs68:                                       ; preds = %for.cond
  %50 = load i32, i32* %current_line, align 4
  %51 = load i32, i32* %from.addr, align 4
  %cmp69 = icmp slt i32 %50, %51
  br label %land.end71

land.end71:                                       ; preds = %land.rhs68, %for.cond
  %52 = phi i1 [ false, %for.cond ], [ %cmp69, %land.rhs68 ]
  br i1 %52, label %for.body, label %for.end

for.body:                                         ; preds = %land.end71
  %53 = load i8*, i8** %line_end, align 4
  %54 = load i8, i8* %53, align 1
  %conv73 = sext i8 %54 to i32
  %cmp74 = icmp eq i32 %conv73, 10
  br i1 %cmp74, label %if.then76, label %if.end93

if.then76:                                        ; preds = %for.body
  %55 = load i8*, i8** %line_end, align 4
  %add.ptr77 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %add.ptr77, i8** %p, align 4
  %56 = load i8*, i8** %p, align 4
  %57 = load i8, i8* %56, align 1
  %conv78 = sext i8 %57 to i32
  %58 = load i8, i8* @history_comment_char, align 1
  %conv79 = sext i8 %58 to i32
  %cmp80 = icmp eq i32 %conv78, %conv79
  br i1 %cmp80, label %land.rhs82, label %land.end87

land.rhs82:                                       ; preds = %if.then76
  %59 = load i8*, i8** %p, align 4
  %arrayidx83 = getelementptr inbounds i8, i8* %59, i32 1
  %60 = load i8, i8* %arrayidx83, align 1
  %conv84 = zext i8 %60 to i32
  %call85 = call i32 @isdigit(i32 %conv84) #3
  %tobool86 = icmp ne i32 %call85, 0
  br label %land.end87

land.end87:                                       ; preds = %land.rhs82, %if.then76
  %61 = phi i1 [ false, %if.then76 ], [ %tobool86, %land.rhs82 ]
  %land.ext88 = zext i1 %61 to i32
  %cmp89 = icmp eq i32 %land.ext88, 0
  br i1 %cmp89, label %if.then91, label %if.end92

if.then91:                                        ; preds = %land.end87
  %62 = load i32, i32* %current_line, align 4
  %inc = add nsw i32 %62, 1
  store i32 %inc, i32* %current_line, align 4
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %land.end87
  %63 = load i8*, i8** %p, align 4
  store i8* %63, i8** %line_start, align 4
  br label %if.end93

if.end93:                                         ; preds = %if.end92, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end93
  %64 = load i8*, i8** %line_end, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr, i8** %line_end, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end71
  %65 = load i8*, i8** %line_start, align 4
  store i8* %65, i8** %line_end, align 4
  br label %for.cond94

for.cond94:                                       ; preds = %for.inc149, %for.end
  %66 = load i8*, i8** %line_end, align 4
  %67 = load i8*, i8** %bufend, align 4
  %cmp95 = icmp ult i8* %66, %67
  br i1 %cmp95, label %for.body97, label %for.end151

for.body97:                                       ; preds = %for.cond94
  %68 = load i8*, i8** %line_end, align 4
  %69 = load i8, i8* %68, align 1
  %conv98 = sext i8 %69 to i32
  %cmp99 = icmp eq i32 %conv98, 10
  br i1 %cmp99, label %if.then101, label %if.end148

if.then101:                                       ; preds = %for.body97
  %70 = load i8*, i8** %line_end, align 4
  %71 = load i8*, i8** %line_start, align 4
  %cmp102 = icmp ugt i8* %70, %71
  br i1 %cmp102, label %land.lhs.true104, label %if.else111

land.lhs.true104:                                 ; preds = %if.then101
  %72 = load i8*, i8** %line_end, align 4
  %arrayidx105 = getelementptr inbounds i8, i8* %72, i32 -1
  %73 = load i8, i8* %arrayidx105, align 1
  %conv106 = sext i8 %73 to i32
  %cmp107 = icmp eq i32 %conv106, 13
  br i1 %cmp107, label %if.then109, label %if.else111

if.then109:                                       ; preds = %land.lhs.true104
  %74 = load i8*, i8** %line_end, align 4
  %arrayidx110 = getelementptr inbounds i8, i8* %74, i32 -1
  store i8 0, i8* %arrayidx110, align 1
  br label %if.end112

if.else111:                                       ; preds = %land.lhs.true104, %if.then101
  %75 = load i8*, i8** %line_end, align 4
  store i8 0, i8* %75, align 1
  br label %if.end112

if.end112:                                        ; preds = %if.else111, %if.then109
  %76 = load i8*, i8** %line_start, align 4
  %77 = load i8, i8* %76, align 1
  %tobool113 = icmp ne i8 %77, 0
  br i1 %tobool113, label %if.then114, label %if.end141

if.then114:                                       ; preds = %if.end112
  %78 = load i8*, i8** %line_start, align 4
  %79 = load i8, i8* %78, align 1
  %conv115 = sext i8 %79 to i32
  %80 = load i8, i8* @history_comment_char, align 1
  %conv116 = sext i8 %80 to i32
  %cmp117 = icmp eq i32 %conv115, %conv116
  br i1 %cmp117, label %land.rhs119, label %land.end124

land.rhs119:                                      ; preds = %if.then114
  %81 = load i8*, i8** %line_start, align 4
  %arrayidx120 = getelementptr inbounds i8, i8* %81, i32 1
  %82 = load i8, i8* %arrayidx120, align 1
  %conv121 = zext i8 %82 to i32
  %call122 = call i32 @isdigit(i32 %conv121) #3
  %tobool123 = icmp ne i32 %call122, 0
  br label %land.end124

land.end124:                                      ; preds = %land.rhs119, %if.then114
  %83 = phi i1 [ false, %if.then114 ], [ %tobool123, %land.rhs119 ]
  %land.ext125 = zext i1 %83 to i32
  %cmp126 = icmp eq i32 %land.ext125, 0
  br i1 %cmp126, label %if.then128, label %if.else139

if.then128:                                       ; preds = %land.end124
  %84 = load i8*, i8** %last_ts, align 4
  %cmp129 = icmp eq i8* %84, null
  br i1 %cmp129, label %land.lhs.true131, label %if.else134

land.lhs.true131:                                 ; preds = %if.then128
  %85 = load i32, i32* @history_multiline_entries, align 4
  %tobool132 = icmp ne i32 %85, 0
  br i1 %tobool132, label %if.then133, label %if.else134

if.then133:                                       ; preds = %land.lhs.true131
  %86 = load i32, i32* @history_length, align 4
  %sub = sub nsw i32 %86, 1
  %87 = load i8*, i8** %line_start, align 4
  call void @_hs_append_history_line(i32 %sub, i8* %87)
  br label %if.end135

if.else134:                                       ; preds = %land.lhs.true131, %if.then128
  %88 = load i8*, i8** %line_start, align 4
  call void @add_history(i8* %88)
  br label %if.end135

if.end135:                                        ; preds = %if.else134, %if.then133
  %89 = load i8*, i8** %last_ts, align 4
  %tobool136 = icmp ne i8* %89, null
  br i1 %tobool136, label %if.then137, label %if.end138

if.then137:                                       ; preds = %if.end135
  %90 = load i8*, i8** %last_ts, align 4
  call void @add_history_time(i8* %90)
  store i8* null, i8** %last_ts, align 4
  br label %if.end138

if.end138:                                        ; preds = %if.then137, %if.end135
  br label %if.end140

if.else139:                                       ; preds = %land.end124
  %91 = load i8*, i8** %line_start, align 4
  store i8* %91, i8** %last_ts, align 4
  %92 = load i32, i32* %current_line, align 4
  %dec = add nsw i32 %92, -1
  store i32 %dec, i32* %current_line, align 4
  br label %if.end140

if.end140:                                        ; preds = %if.else139, %if.end138
  br label %if.end141

if.end141:                                        ; preds = %if.end140, %if.end112
  %93 = load i32, i32* %current_line, align 4
  %inc142 = add nsw i32 %93, 1
  store i32 %inc142, i32* %current_line, align 4
  %94 = load i32, i32* %current_line, align 4
  %95 = load i32, i32* %to.addr, align 4
  %cmp143 = icmp sge i32 %94, %95
  br i1 %cmp143, label %if.then145, label %if.end146

if.then145:                                       ; preds = %if.end141
  br label %for.end151

if.end146:                                        ; preds = %if.end141
  %96 = load i8*, i8** %line_end, align 4
  %add.ptr147 = getelementptr inbounds i8, i8* %96, i32 1
  store i8* %add.ptr147, i8** %line_start, align 4
  br label %if.end148

if.end148:                                        ; preds = %if.end146, %for.body97
  br label %for.inc149

for.inc149:                                       ; preds = %if.end148
  %97 = load i8*, i8** %line_end, align 4
  %incdec.ptr150 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %incdec.ptr150, i8** %line_end, align 4
  br label %for.cond94

for.end151:                                       ; preds = %if.then145, %for.cond94
  %98 = load i32, i32* %current_line, align 4
  store i32 %98, i32* @history_lines_read_from_file, align 4
  %99 = load i32, i32* %reset_comment_char, align 4
  %tobool152 = icmp ne i32 %99, 0
  br i1 %tobool152, label %if.then153, label %if.end154

if.then153:                                       ; preds = %for.end151
  store i8 0, i8* @history_comment_char, align 1
  br label %if.end154

if.end154:                                        ; preds = %if.then153, %for.end151
  %100 = load i8*, i8** %input, align 4
  %tobool155 = icmp ne i8* %100, null
  br i1 %tobool155, label %if.then156, label %if.end157

if.then156:                                       ; preds = %if.end154
  %101 = load i8*, i8** %input, align 4
  call void @free(i8* %101)
  br label %if.end157

if.end157:                                        ; preds = %if.then156, %if.end154
  %102 = load i8*, i8** %buffer, align 4
  %tobool158 = icmp ne i8* %102, null
  br i1 %tobool158, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end157
  %103 = load i8*, i8** %buffer, align 4
  call void @free(i8* %103)
  br label %if.end160

if.end160:                                        ; preds = %if.then159, %if.end157
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end160, %if.end34
  %104 = load i32, i32* %retval, align 4
  ret i32 %104
}

; Function Attrs: noinline nounwind
define internal i8* @history_filename(i8* %filename) #0 {
entry:
  %retval = alloca i8*, align 4
  %filename.addr = alloca i8*, align 4
  %return_val = alloca i8*, align 4
  %home = alloca i8*, align 4
  %home_len = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @strlen(i8* %1)
  %add = add i32 1, %call
  %call1 = call i8* @xmalloc(i32 %add)
  %2 = load i8*, i8** %filename.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call2, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %return_val, align 4
  %3 = load i8*, i8** %return_val, align 4
  %tobool3 = icmp ne i8* %3, null
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %4 = load i8*, i8** %return_val, align 4
  store i8* %4, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %call4 = call i8* @sh_get_env_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store i8* %call4, i8** %home, align 4
  %5 = load i8*, i8** %home, align 4
  %cmp = icmp eq i8* %5, null
  br i1 %cmp, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  %6 = load i8*, i8** %home, align 4
  %call6 = call i32 @strlen(i8* %6)
  store i32 %call6, i32* %home_len, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else
  %7 = load i32, i32* %home_len, align 4
  %add8 = add nsw i32 2, %7
  %add9 = add nsw i32 %add8, 8
  %call10 = call i8* @xmalloc(i32 %add9)
  store i8* %call10, i8** %return_val, align 4
  %8 = load i8*, i8** %return_val, align 4
  %9 = load i8*, i8** %home, align 4
  %call11 = call i8* @strcpy(i8* %8, i8* %9)
  %10 = load i8*, i8** %return_val, align 4
  %11 = load i32, i32* %home_len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 %11
  store i8 47, i8* %arrayidx, align 1
  %12 = load i8*, i8** %return_val, align 4
  %13 = load i32, i32* %home_len, align 4
  %add.ptr = getelementptr inbounds i8, i8* %12, i32 %13
  %add.ptr12 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  %call13 = call i8* @strcpy(i8* %add.ptr12, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  %14 = load i8*, i8** %return_val, align 4
  store i8* %14, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then5, %if.then
  %15 = load i8*, i8** %retval, align 4
  ret i8* %15
}

declare i32 @open(i8*, i32, ...) #1

declare i32 @fstat(i32, %struct.stat*) #1

declare i32* @__errno_location() #1

declare i8* @malloc(i32) #1

declare i32 @read(i32, i8*, i32) #1

declare i32 @close(i32) #1

declare void @free(i8*) #1

; Function Attrs: nounwind readonly
declare i32 @isdigit(i32) #2

declare void @_hs_append_history_line(i32, i8*) #1

declare void @add_history(i8*) #1

declare void @add_history_time(i8*) #1

; Function Attrs: noinline nounwind
define i32 @history_truncate_file(i8* %fname, i32 %lines) #0 {
entry:
  %fname.addr = alloca i8*, align 4
  %lines.addr = alloca i32, align 4
  %buffer = alloca i8*, align 4
  %filename = alloca i8*, align 4
  %tempname = alloca i8*, align 4
  %bp = alloca i8*, align 4
  %bp1 = alloca i8*, align 4
  %file = alloca i32, align 4
  %chars_read = alloca i32, align 4
  %rv = alloca i32, align 4
  %orig_lines = alloca i32, align 4
  %exists = alloca i32, align 4
  %r = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  %file_size = alloca i32, align 4
  store i8* %fname, i8** %fname.addr, align 4
  store i32 %lines, i32* %lines.addr, align 4
  store i32 0, i32* @history_lines_written_to_file, align 4
  store i8* null, i8** %buffer, align 4
  %0 = load i8*, i8** %fname.addr, align 4
  %call = call i8* @history_filename(i8* %0)
  store i8* %call, i8** %filename, align 4
  store i8* null, i8** %tempname, align 4
  %1 = load i8*, i8** %filename, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %filename, align 4
  %call1 = call i32 (i8*, i32, ...) @open(i8* %2, i32 0, i32 438)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ -1, %cond.false ]
  store i32 %cond, i32* %file, align 4
  store i32 0, i32* %exists, align 4
  store i32 0, i32* %rv, align 4
  %3 = load i32, i32* %file, align 4
  %cmp = icmp eq i32 %3, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end
  %4 = load i32, i32* %file, align 4
  %call2 = call i32 @fstat(i32 %4, %struct.stat* %finfo)
  %cmp3 = icmp eq i32 %call2, -1
  br i1 %cmp3, label %if.then, label %if.end8

if.then:                                          ; preds = %lor.lhs.false, %cond.end
  %call4 = call i32* @__errno_location()
  %5 = load i32, i32* %call4, align 4
  store i32 %5, i32* %rv, align 4
  %6 = load i32, i32* %file, align 4
  %cmp5 = icmp ne i32 %6, -1
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %7 = load i32, i32* %file, align 4
  %call7 = call i32 @close(i32 %7)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %truncate_exit

if.end8:                                          ; preds = %lor.lhs.false
  store i32 1, i32* %exists, align 4
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %8 = load i32, i32* %st_mode, align 8
  %and = and i32 %8, 61440
  %cmp9 = icmp eq i32 %and, 32768
  %conv = zext i1 %cmp9 to i32
  %cmp10 = icmp eq i32 %conv, 0
  br i1 %cmp10, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end8
  %9 = load i32, i32* %file, align 4
  %call13 = call i32 @close(i32 %9)
  store i32 22, i32* %rv, align 4
  br label %truncate_exit

if.end14:                                         ; preds = %if.end8
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %10 = load i32, i32* %st_size, align 8
  store i32 %10, i32* %file_size, align 4
  %11 = load i32, i32* %file_size, align 4
  %st_size15 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %12 = load i32, i32* %st_size15, align 8
  %cmp16 = icmp ne i32 %11, %12
  br i1 %cmp16, label %if.then21, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %if.end14
  %13 = load i32, i32* %file_size, align 4
  %add = add i32 %13, 1
  %14 = load i32, i32* %file_size, align 4
  %cmp19 = icmp ult i32 %add, %14
  br i1 %cmp19, label %if.then21, label %if.end24

if.then21:                                        ; preds = %lor.lhs.false18, %if.end14
  %15 = load i32, i32* %file, align 4
  %call22 = call i32 @close(i32 %15)
  %call23 = call i32* @__errno_location()
  store i32 27, i32* %call23, align 4
  store i32 27, i32* %rv, align 4
  br label %truncate_exit

if.end24:                                         ; preds = %lor.lhs.false18
  %16 = load i32, i32* %file_size, align 4
  %add25 = add i32 %16, 1
  %call26 = call i8* @malloc(i32 %add25)
  store i8* %call26, i8** %buffer, align 4
  %17 = load i8*, i8** %buffer, align 4
  %cmp27 = icmp eq i8* %17, null
  br i1 %cmp27, label %if.then29, label %if.end32

if.then29:                                        ; preds = %if.end24
  %call30 = call i32* @__errno_location()
  %18 = load i32, i32* %call30, align 4
  store i32 %18, i32* %rv, align 4
  %19 = load i32, i32* %file, align 4
  %call31 = call i32 @close(i32 %19)
  br label %truncate_exit

if.end32:                                         ; preds = %if.end24
  %20 = load i32, i32* %file, align 4
  %21 = load i8*, i8** %buffer, align 4
  %22 = load i32, i32* %file_size, align 4
  %call33 = call i32 @read(i32 %20, i8* %21, i32 %22)
  store i32 %call33, i32* %chars_read, align 4
  %23 = load i32, i32* %file, align 4
  %call34 = call i32 @close(i32 %23)
  %24 = load i32, i32* %chars_read, align 4
  %cmp35 = icmp sle i32 %24, 0
  br i1 %cmp35, label %if.then37, label %if.end45

if.then37:                                        ; preds = %if.end32
  %25 = load i32, i32* %chars_read, align 4
  %cmp38 = icmp slt i32 %25, 0
  br i1 %cmp38, label %cond.true40, label %cond.false42

cond.true40:                                      ; preds = %if.then37
  %call41 = call i32* @__errno_location()
  %26 = load i32, i32* %call41, align 4
  br label %cond.end43

cond.false42:                                     ; preds = %if.then37
  br label %cond.end43

cond.end43:                                       ; preds = %cond.false42, %cond.true40
  %cond44 = phi i32 [ %26, %cond.true40 ], [ 0, %cond.false42 ]
  store i32 %cond44, i32* %rv, align 4
  br label %truncate_exit

if.end45:                                         ; preds = %if.end32
  %27 = load i32, i32* %lines.addr, align 4
  store i32 %27, i32* %orig_lines, align 4
  %28 = load i8*, i8** %buffer, align 4
  %29 = load i32, i32* %chars_read, align 4
  %add.ptr = getelementptr inbounds i8, i8* %28, i32 %29
  %add.ptr46 = getelementptr inbounds i8, i8* %add.ptr, i32 -1
  store i8* %add.ptr46, i8** %bp, align 4
  store i8* %add.ptr46, i8** %bp1, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end45
  %30 = load i32, i32* %lines.addr, align 4
  %tobool47 = icmp ne i32 %30, 0
  br i1 %tobool47, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %31 = load i8*, i8** %bp, align 4
  %32 = load i8*, i8** %buffer, align 4
  %cmp48 = icmp ugt i8* %31, %32
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %33 = phi i1 [ false, %for.cond ], [ %cmp48, %land.rhs ]
  br i1 %33, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %34 = load i8*, i8** %bp, align 4
  %35 = load i8, i8* %34, align 1
  %conv50 = sext i8 %35 to i32
  %cmp51 = icmp eq i32 %conv50, 10
  br i1 %cmp51, label %land.lhs.true, label %if.end65

land.lhs.true:                                    ; preds = %for.body
  %36 = load i8*, i8** %bp1, align 4
  %37 = load i8, i8* %36, align 1
  %conv53 = sext i8 %37 to i32
  %38 = load i8, i8* @history_comment_char, align 1
  %conv54 = sext i8 %38 to i32
  %cmp55 = icmp eq i32 %conv53, %conv54
  br i1 %cmp55, label %land.rhs57, label %land.end61

land.rhs57:                                       ; preds = %land.lhs.true
  %39 = load i8*, i8** %bp1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %39, i32 1
  %40 = load i8, i8* %arrayidx, align 1
  %conv58 = zext i8 %40 to i32
  %call59 = call i32 @isdigit(i32 %conv58) #3
  %tobool60 = icmp ne i32 %call59, 0
  br label %land.end61

land.end61:                                       ; preds = %land.rhs57, %land.lhs.true
  %41 = phi i1 [ false, %land.lhs.true ], [ %tobool60, %land.rhs57 ]
  %land.ext = zext i1 %41 to i32
  %cmp62 = icmp eq i32 %land.ext, 0
  br i1 %cmp62, label %if.then64, label %if.end65

if.then64:                                        ; preds = %land.end61
  %42 = load i32, i32* %lines.addr, align 4
  %dec = add nsw i32 %42, -1
  store i32 %dec, i32* %lines.addr, align 4
  br label %if.end65

if.end65:                                         ; preds = %if.then64, %land.end61, %for.body
  %43 = load i8*, i8** %bp, align 4
  store i8* %43, i8** %bp1, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end65
  %44 = load i8*, i8** %bp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %44, i32 -1
  store i8* %incdec.ptr, i8** %bp, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc90, %for.end
  %45 = load i8*, i8** %bp, align 4
  %46 = load i8*, i8** %buffer, align 4
  %cmp67 = icmp ugt i8* %45, %46
  br i1 %cmp67, label %for.body69, label %for.end92

for.body69:                                       ; preds = %for.cond66
  %47 = load i8*, i8** %bp, align 4
  %48 = load i8, i8* %47, align 1
  %conv70 = sext i8 %48 to i32
  %cmp71 = icmp eq i32 %conv70, 10
  br i1 %cmp71, label %land.lhs.true73, label %if.end89

land.lhs.true73:                                  ; preds = %for.body69
  %49 = load i8*, i8** %bp1, align 4
  %50 = load i8, i8* %49, align 1
  %conv74 = sext i8 %50 to i32
  %51 = load i8, i8* @history_comment_char, align 1
  %conv75 = sext i8 %51 to i32
  %cmp76 = icmp eq i32 %conv74, %conv75
  br i1 %cmp76, label %land.rhs78, label %land.end83

land.rhs78:                                       ; preds = %land.lhs.true73
  %52 = load i8*, i8** %bp1, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %52, i32 1
  %53 = load i8, i8* %arrayidx79, align 1
  %conv80 = zext i8 %53 to i32
  %call81 = call i32 @isdigit(i32 %conv80) #3
  %tobool82 = icmp ne i32 %call81, 0
  br label %land.end83

land.end83:                                       ; preds = %land.rhs78, %land.lhs.true73
  %54 = phi i1 [ false, %land.lhs.true73 ], [ %tobool82, %land.rhs78 ]
  %land.ext84 = zext i1 %54 to i32
  %cmp85 = icmp eq i32 %land.ext84, 0
  br i1 %cmp85, label %if.then87, label %if.end89

if.then87:                                        ; preds = %land.end83
  %55 = load i8*, i8** %bp, align 4
  %incdec.ptr88 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr88, i8** %bp, align 4
  br label %for.end92

if.end89:                                         ; preds = %land.end83, %for.body69
  %56 = load i8*, i8** %bp, align 4
  store i8* %56, i8** %bp1, align 4
  br label %for.inc90

for.inc90:                                        ; preds = %if.end89
  %57 = load i8*, i8** %bp, align 4
  %incdec.ptr91 = getelementptr inbounds i8, i8* %57, i32 -1
  store i8* %incdec.ptr91, i8** %bp, align 4
  br label %for.cond66

for.end92:                                        ; preds = %if.then87, %for.cond66
  %58 = load i8*, i8** %bp, align 4
  %59 = load i8*, i8** %buffer, align 4
  %cmp93 = icmp ule i8* %58, %59
  br i1 %cmp93, label %if.then95, label %if.end96

if.then95:                                        ; preds = %for.end92
  store i32 0, i32* %rv, align 4
  %60 = load i32, i32* %orig_lines, align 4
  %61 = load i32, i32* %lines.addr, align 4
  %sub = sub nsw i32 %60, %61
  store i32 %sub, i32* @history_lines_written_to_file, align 4
  br label %truncate_exit

if.end96:                                         ; preds = %for.end92
  %62 = load i8*, i8** %filename, align 4
  %call97 = call i8* @history_tempfile(i8* %62)
  store i8* %call97, i8** %tempname, align 4
  %63 = load i8*, i8** %tempname, align 4
  %call98 = call i32 (i8*, i32, ...) @open(i8* %63, i32 577, i32 384)
  store i32 %call98, i32* %file, align 4
  %cmp99 = icmp ne i32 %call98, -1
  br i1 %cmp99, label %if.then101, label %if.else

if.then101:                                       ; preds = %if.end96
  %64 = load i32, i32* %file, align 4
  %65 = load i8*, i8** %bp, align 4
  %66 = load i32, i32* %chars_read, align 4
  %67 = load i8*, i8** %bp, align 4
  %68 = load i8*, i8** %buffer, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %67 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %68 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub102 = sub nsw i32 %66, %sub.ptr.sub
  %call103 = call i32 @write(i32 %64, i8* %65, i32 %sub102)
  %cmp104 = icmp slt i32 %call103, 0
  br i1 %cmp104, label %if.then106, label %if.end108

if.then106:                                       ; preds = %if.then101
  %call107 = call i32* @__errno_location()
  %69 = load i32, i32* %call107, align 4
  store i32 %69, i32* %rv, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.then106, %if.then101
  %70 = load i32, i32* %file, align 4
  %call109 = call i32 @close(i32 %70)
  %cmp110 = icmp slt i32 %call109, 0
  br i1 %cmp110, label %land.lhs.true112, label %if.end117

land.lhs.true112:                                 ; preds = %if.end108
  %71 = load i32, i32* %rv, align 4
  %cmp113 = icmp eq i32 %71, 0
  br i1 %cmp113, label %if.then115, label %if.end117

if.then115:                                       ; preds = %land.lhs.true112
  %call116 = call i32* @__errno_location()
  %72 = load i32, i32* %call116, align 4
  store i32 %72, i32* %rv, align 4
  br label %if.end117

if.end117:                                        ; preds = %if.then115, %land.lhs.true112, %if.end108
  br label %if.end119

if.else:                                          ; preds = %if.end96
  %call118 = call i32* @__errno_location()
  %73 = load i32, i32* %call118, align 4
  store i32 %73, i32* %rv, align 4
  br label %if.end119

if.end119:                                        ; preds = %if.else, %if.end117
  br label %truncate_exit

truncate_exit:                                    ; preds = %if.end119, %if.then95, %cond.end43, %if.then29, %if.then21, %if.then12, %if.end
  %74 = load i8*, i8** %buffer, align 4
  %tobool120 = icmp ne i8* %74, null
  br i1 %tobool120, label %if.then121, label %if.end122

if.then121:                                       ; preds = %truncate_exit
  %75 = load i8*, i8** %buffer, align 4
  call void @free(i8* %75)
  br label %if.end122

if.end122:                                        ; preds = %if.then121, %truncate_exit
  %76 = load i32, i32* %orig_lines, align 4
  %77 = load i32, i32* %lines.addr, align 4
  %sub123 = sub nsw i32 %76, %77
  store i32 %sub123, i32* @history_lines_written_to_file, align 4
  %78 = load i32, i32* %rv, align 4
  %cmp124 = icmp eq i32 %78, 0
  br i1 %cmp124, label %land.lhs.true126, label %if.end132

land.lhs.true126:                                 ; preds = %if.end122
  %79 = load i8*, i8** %filename, align 4
  %tobool127 = icmp ne i8* %79, null
  br i1 %tobool127, label %land.lhs.true128, label %if.end132

land.lhs.true128:                                 ; preds = %land.lhs.true126
  %80 = load i8*, i8** %tempname, align 4
  %tobool129 = icmp ne i8* %80, null
  br i1 %tobool129, label %if.then130, label %if.end132

if.then130:                                       ; preds = %land.lhs.true128
  %81 = load i8*, i8** %tempname, align 4
  %82 = load i8*, i8** %filename, align 4
  %call131 = call i32 @histfile_restore(i8* %81, i8* %82)
  store i32 %call131, i32* %rv, align 4
  br label %if.end132

if.end132:                                        ; preds = %if.then130, %land.lhs.true128, %land.lhs.true126, %if.end122
  %83 = load i32, i32* %rv, align 4
  %cmp133 = icmp ne i32 %83, 0
  br i1 %cmp133, label %if.then135, label %if.end140

if.then135:                                       ; preds = %if.end132
  %84 = load i8*, i8** %tempname, align 4
  %tobool136 = icmp ne i8* %84, null
  br i1 %tobool136, label %if.then137, label %if.end139

if.then137:                                       ; preds = %if.then135
  %85 = load i8*, i8** %tempname, align 4
  %call138 = call i32 @unlink(i8* %85)
  br label %if.end139

if.end139:                                        ; preds = %if.then137, %if.then135
  store i32 0, i32* @history_lines_written_to_file, align 4
  br label %if.end140

if.end140:                                        ; preds = %if.end139, %if.end132
  %86 = load i32, i32* %rv, align 4
  %cmp141 = icmp eq i32 %86, 0
  br i1 %cmp141, label %land.lhs.true143, label %if.end147

land.lhs.true143:                                 ; preds = %if.end140
  %87 = load i32, i32* %exists, align 4
  %tobool144 = icmp ne i32 %87, 0
  br i1 %tobool144, label %if.then145, label %if.end147

if.then145:                                       ; preds = %land.lhs.true143
  %88 = load i8*, i8** %filename, align 4
  %st_uid = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 7
  %89 = load i32, i32* %st_uid, align 4
  %st_gid = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 8
  %90 = load i32, i32* %st_gid, align 8
  %call146 = call i32 @chown(i8* %88, i32 %89, i32 %90)
  store i32 %call146, i32* %r, align 4
  br label %if.end147

if.end147:                                        ; preds = %if.then145, %land.lhs.true143, %if.end140
  %91 = load i8*, i8** %filename, align 4
  call void @xfree(i8* %91)
  %92 = load i8*, i8** %tempname, align 4
  %tobool148 = icmp ne i8* %92, null
  br i1 %tobool148, label %if.then149, label %if.end150

if.then149:                                       ; preds = %if.end147
  %93 = load i8*, i8** %tempname, align 4
  call void @free(i8* %93)
  br label %if.end150

if.end150:                                        ; preds = %if.then149, %if.end147
  %94 = load i32, i32* %rv, align 4
  ret i32 %94
}

; Function Attrs: noinline nounwind
define internal i8* @history_tempfile(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %fn = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %linkbuf = alloca [4097 x i8], align 1
  %len = alloca i32, align 4
  %n = alloca i32, align 4
  %fs = alloca %struct.stat, align 8
  %pid = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  store i8* %0, i8** %fn, align 4
  %1 = load i8*, i8** %filename.addr, align 4
  %arraydecay = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 0
  %call = call i32 @readlink(i8* %1, i8* %arraydecay, i32 4096)
  store i32 %call, i32* %n, align 4
  %cmp = icmp sgt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %n, align 4
  %arrayidx = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 %2
  store i8 0, i8* %arrayidx, align 1
  %arraydecay1 = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 0
  store i8* %arraydecay1, i8** %fn, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %fn, align 4
  %call2 = call i32 @strlen(i8* %3)
  store i32 %call2, i32* %len, align 4
  %4 = load i32, i32* %len, align 4
  %add = add i32 %4, 11
  %call3 = call i8* @xmalloc(i32 %add)
  store i8* %call3, i8** %ret, align 4
  %5 = load i8*, i8** %ret, align 4
  %6 = load i8*, i8** %fn, align 4
  %call4 = call i8* @strcpy(i8* %5, i8* %6)
  %call5 = call i32 @getpid()
  store i32 %call5, i32* %pid, align 4
  %7 = load i8*, i8** %ret, align 4
  %8 = load i32, i32* %len, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 %8
  store i8 45, i8* %arrayidx6, align 1
  %9 = load i32, i32* %pid, align 4
  %div = sdiv i32 %9, 10000
  %rem = srem i32 %div, 10
  %add7 = add nsw i32 %rem, 48
  %conv = trunc i32 %add7 to i8
  %10 = load i8*, i8** %ret, align 4
  %11 = load i32, i32* %len, align 4
  %add8 = add i32 %11, 1
  %arrayidx9 = getelementptr inbounds i8, i8* %10, i32 %add8
  store i8 %conv, i8* %arrayidx9, align 1
  %12 = load i32, i32* %pid, align 4
  %div10 = sdiv i32 %12, 1000
  %rem11 = srem i32 %div10, 10
  %add12 = add nsw i32 %rem11, 48
  %conv13 = trunc i32 %add12 to i8
  %13 = load i8*, i8** %ret, align 4
  %14 = load i32, i32* %len, align 4
  %add14 = add i32 %14, 2
  %arrayidx15 = getelementptr inbounds i8, i8* %13, i32 %add14
  store i8 %conv13, i8* %arrayidx15, align 1
  %15 = load i32, i32* %pid, align 4
  %div16 = sdiv i32 %15, 100
  %rem17 = srem i32 %div16, 10
  %add18 = add nsw i32 %rem17, 48
  %conv19 = trunc i32 %add18 to i8
  %16 = load i8*, i8** %ret, align 4
  %17 = load i32, i32* %len, align 4
  %add20 = add i32 %17, 3
  %arrayidx21 = getelementptr inbounds i8, i8* %16, i32 %add20
  store i8 %conv19, i8* %arrayidx21, align 1
  %18 = load i32, i32* %pid, align 4
  %div22 = sdiv i32 %18, 10
  %rem23 = srem i32 %div22, 10
  %add24 = add nsw i32 %rem23, 48
  %conv25 = trunc i32 %add24 to i8
  %19 = load i8*, i8** %ret, align 4
  %20 = load i32, i32* %len, align 4
  %add26 = add i32 %20, 4
  %arrayidx27 = getelementptr inbounds i8, i8* %19, i32 %add26
  store i8 %conv25, i8* %arrayidx27, align 1
  %21 = load i32, i32* %pid, align 4
  %rem28 = srem i32 %21, 10
  %add29 = add nsw i32 %rem28, 48
  %conv30 = trunc i32 %add29 to i8
  %22 = load i8*, i8** %ret, align 4
  %23 = load i32, i32* %len, align 4
  %add31 = add i32 %23, 5
  %arrayidx32 = getelementptr inbounds i8, i8* %22, i32 %add31
  store i8 %conv30, i8* %arrayidx32, align 1
  %24 = load i8*, i8** %ret, align 4
  %25 = load i32, i32* %len, align 4
  %add.ptr = getelementptr inbounds i8, i8* %24, i32 %25
  %add.ptr33 = getelementptr inbounds i8, i8* %add.ptr, i32 6
  %call34 = call i8* @strcpy(i8* %add.ptr33, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  %26 = load i8*, i8** %ret, align 4
  ret i8* %26
}

declare i32 @write(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @histfile_restore(i8* %backup, i8* %orig) #0 {
entry:
  %retval = alloca i32, align 4
  %backup.addr = alloca i8*, align 4
  %orig.addr = alloca i8*, align 4
  %linkbuf = alloca [4097 x i8], align 1
  %n = alloca i32, align 4
  store i8* %backup, i8** %backup.addr, align 4
  store i8* %orig, i8** %orig.addr, align 4
  %0 = load i8*, i8** %orig.addr, align 4
  %arraydecay = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 0
  %call = call i32 @readlink(i8* %0, i8* %arraydecay, i32 4096)
  store i32 %call, i32* %n, align 4
  %cmp = icmp sgt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n, align 4
  %arrayidx = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 %1
  store i8 0, i8* %arrayidx, align 1
  %2 = load i8*, i8** %backup.addr, align 4
  %arraydecay1 = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 0
  %call2 = call i32 @rename(i8* %2, i8* %arraydecay1)
  store i32 %call2, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %backup.addr, align 4
  %4 = load i8*, i8** %orig.addr, align 4
  %call3 = call i32 @rename(i8* %3, i8* %4)
  store i32 %call3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i32 @unlink(i8*) #1

declare i32 @chown(i8*, i32, i32) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define i32 @append_history(i32 %nelements, i8* %filename) #0 {
entry:
  %nelements.addr = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  store i32 %nelements, i32* %nelements.addr, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %1 = load i32, i32* %nelements.addr, align 4
  %call = call i32 @history_do_write(i8* %0, i32 %1, i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @history_do_write(i8* %filename, i32 %nelements, i32 %overwrite) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %nelements.addr = alloca i32, align 4
  %overwrite.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %output = alloca i8*, align 4
  %tempname = alloca i8*, align 4
  %histname = alloca i8*, align 4
  %file = alloca i32, align 4
  %mode = alloca i32, align 4
  %rv = alloca i32, align 4
  %exists = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  %the_history = alloca %struct._hist_entry**, align 4
  %j = alloca i32, align 4
  %buffer_size = alloca i32, align 4
  %buffer = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %nelements, i32* %nelements.addr, align 4
  store i32 %overwrite, i32* %overwrite.addr, align 4
  %0 = load i32, i32* %overwrite.addr, align 4
  %tobool = icmp ne i32 %0, 0
  %cond = select i1 %tobool, i32 577, i32 1025
  store i32 %cond, i32* %mode, align 4
  %1 = load i8*, i8** %filename.addr, align 4
  %call = call i8* @history_filename(i8* %1)
  store i8* %call, i8** %histname, align 4
  %2 = load i8*, i8** %histname, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i8*, i8** %histname, align 4
  %call2 = call i32 @stat(i8* %3, %struct.stat* %finfo)
  %cmp = icmp eq i32 %call2, 0
  %conv = zext i1 %cmp to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond3 = phi i32 [ %conv, %cond.true ], [ 0, %cond.false ]
  store i32 %cond3, i32* %exists, align 4
  %4 = load i32, i32* %overwrite.addr, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %land.lhs.true, label %cond.false11

land.lhs.true:                                    ; preds = %cond.end
  %5 = load i32, i32* %exists, align 4
  %tobool5 = icmp ne i32 %5, 0
  br i1 %tobool5, label %land.lhs.true6, label %cond.false11

land.lhs.true6:                                   ; preds = %land.lhs.true
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %6 = load i32, i32* %st_mode, align 8
  %and = and i32 %6, 61440
  %cmp7 = icmp eq i32 %and, 32768
  br i1 %cmp7, label %cond.true9, label %cond.false11

cond.true9:                                       ; preds = %land.lhs.true6
  %7 = load i8*, i8** %histname, align 4
  %call10 = call i8* @history_tempfile(i8* %7)
  br label %cond.end12

cond.false11:                                     ; preds = %land.lhs.true6, %land.lhs.true, %cond.end
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true9
  %cond13 = phi i8* [ %call10, %cond.true9 ], [ null, %cond.false11 ]
  store i8* %cond13, i8** %tempname, align 4
  %8 = load i8*, i8** %tempname, align 4
  %tobool14 = icmp ne i8* %8, null
  br i1 %tobool14, label %cond.true15, label %cond.false16

cond.true15:                                      ; preds = %cond.end12
  %9 = load i8*, i8** %tempname, align 4
  br label %cond.end17

cond.false16:                                     ; preds = %cond.end12
  %10 = load i8*, i8** %histname, align 4
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false16, %cond.true15
  %cond18 = phi i8* [ %9, %cond.true15 ], [ %10, %cond.false16 ]
  store i8* %cond18, i8** %output, align 4
  %11 = load i8*, i8** %output, align 4
  %tobool19 = icmp ne i8* %11, null
  br i1 %tobool19, label %cond.true20, label %cond.false22

cond.true20:                                      ; preds = %cond.end17
  %12 = load i8*, i8** %output, align 4
  %13 = load i32, i32* %mode, align 4
  %call21 = call i32 (i8*, i32, ...) @open(i8* %12, i32 %13, i32 384)
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end17
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true20
  %cond24 = phi i32 [ %call21, %cond.true20 ], [ -1, %cond.false22 ]
  store i32 %cond24, i32* %file, align 4
  store i32 0, i32* %rv, align 4
  %14 = load i32, i32* %file, align 4
  %cmp25 = icmp eq i32 %14, -1
  br i1 %cmp25, label %if.then, label %if.end33

if.then:                                          ; preds = %cond.end23
  %call27 = call i32* @__errno_location()
  %15 = load i32, i32* %call27, align 4
  store i32 %15, i32* %rv, align 4
  %16 = load i8*, i8** %histname, align 4
  %tobool28 = icmp ne i8* %16, null
  br i1 %tobool28, label %if.then29, label %if.end

if.then29:                                        ; preds = %if.then
  %17 = load i8*, i8** %histname, align 4
  call void @free(i8* %17)
  br label %if.end

if.end:                                           ; preds = %if.then29, %if.then
  %18 = load i8*, i8** %tempname, align 4
  %tobool30 = icmp ne i8* %18, null
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end
  %19 = load i8*, i8** %tempname, align 4
  call void @free(i8* %19)
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.end
  %20 = load i32, i32* %rv, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

if.end33:                                         ; preds = %cond.end23
  %21 = load i32, i32* %nelements.addr, align 4
  %22 = load i32, i32* @history_length, align 4
  %cmp34 = icmp sgt i32 %21, %22
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end33
  %23 = load i32, i32* @history_length, align 4
  store i32 %23, i32* %nelements.addr, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.end33
  %call38 = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call38, %struct._hist_entry*** %the_history, align 4
  store i32 0, i32* %buffer_size, align 4
  %24 = load i32, i32* @history_length, align 4
  %25 = load i32, i32* %nelements.addr, align 4
  %sub = sub nsw i32 %24, %25
  store i32 %sub, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end37
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* @history_length, align 4
  %cmp39 = icmp slt i32 %26, %27
  br i1 %cmp39, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %28 = load i32, i32* @history_write_timestamps, align 4
  %tobool41 = icmp ne i32 %28, 0
  br i1 %tobool41, label %land.lhs.true42, label %if.end55

land.lhs.true42:                                  ; preds = %for.body
  %29 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %29, i32 %30
  %31 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %31, i32 0, i32 1
  %32 = load i8*, i8** %timestamp, align 4
  %tobool43 = icmp ne i8* %32, null
  br i1 %tobool43, label %land.lhs.true44, label %if.end55

land.lhs.true44:                                  ; preds = %land.lhs.true42
  %33 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %34 = load i32, i32* %i, align 4
  %arrayidx45 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %33, i32 %34
  %35 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx45, align 4
  %timestamp46 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %35, i32 0, i32 1
  %36 = load i8*, i8** %timestamp46, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %36, i32 0
  %37 = load i8, i8* %arrayidx47, align 1
  %conv48 = sext i8 %37 to i32
  %tobool49 = icmp ne i32 %conv48, 0
  br i1 %tobool49, label %if.then50, label %if.end55

if.then50:                                        ; preds = %land.lhs.true44
  %38 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %39 = load i32, i32* %i, align 4
  %arrayidx51 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %38, i32 %39
  %40 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx51, align 4
  %timestamp52 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %40, i32 0, i32 1
  %41 = load i8*, i8** %timestamp52, align 4
  %call53 = call i32 @strlen(i8* %41)
  %add = add i32 %call53, 1
  %42 = load i32, i32* %buffer_size, align 4
  %add54 = add i32 %42, %add
  store i32 %add54, i32* %buffer_size, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then50, %land.lhs.true44, %land.lhs.true42, %for.body
  %43 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %44 = load i32, i32* %i, align 4
  %arrayidx56 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %43, i32 %44
  %45 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx56, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %45, i32 0, i32 0
  %46 = load i8*, i8** %line, align 4
  %call57 = call i32 @strlen(i8* %46)
  %add58 = add i32 %call57, 1
  %47 = load i32, i32* %buffer_size, align 4
  %add59 = add i32 %47, %add58
  store i32 %add59, i32* %buffer_size, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end55
  %48 = load i32, i32* %i, align 4
  %inc = add nsw i32 %48, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %49 = load i32, i32* %buffer_size, align 4
  %call60 = call i8* @malloc(i32 %49)
  store i8* %call60, i8** %buffer, align 4
  %50 = load i8*, i8** %buffer, align 4
  %cmp61 = icmp eq i8* %50, null
  br i1 %cmp61, label %if.then63, label %if.end76

if.then63:                                        ; preds = %for.end
  %call64 = call i32* @__errno_location()
  %51 = load i32, i32* %call64, align 4
  store i32 %51, i32* %rv, align 4
  %52 = load i32, i32* %file, align 4
  %call65 = call i32 @close(i32 %52)
  %53 = load i8*, i8** %tempname, align 4
  %tobool66 = icmp ne i8* %53, null
  br i1 %tobool66, label %if.then67, label %if.end69

if.then67:                                        ; preds = %if.then63
  %54 = load i8*, i8** %tempname, align 4
  %call68 = call i32 @unlink(i8* %54)
  br label %if.end69

if.end69:                                         ; preds = %if.then67, %if.then63
  %55 = load i8*, i8** %histname, align 4
  %tobool70 = icmp ne i8* %55, null
  br i1 %tobool70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end69
  %56 = load i8*, i8** %histname, align 4
  call void @free(i8* %56)
  br label %if.end72

if.end72:                                         ; preds = %if.then71, %if.end69
  %57 = load i8*, i8** %tempname, align 4
  %tobool73 = icmp ne i8* %57, null
  br i1 %tobool73, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end72
  %58 = load i8*, i8** %tempname, align 4
  call void @free(i8* %58)
  br label %if.end75

if.end75:                                         ; preds = %if.then74, %if.end72
  %59 = load i32, i32* %rv, align 4
  store i32 %59, i32* %retval, align 4
  br label %return

if.end76:                                         ; preds = %for.end
  store i32 0, i32* %j, align 4
  %60 = load i32, i32* @history_length, align 4
  %61 = load i32, i32* %nelements.addr, align 4
  %sub77 = sub nsw i32 %60, %61
  store i32 %sub77, i32* %i, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc114, %if.end76
  %62 = load i32, i32* %i, align 4
  %63 = load i32, i32* @history_length, align 4
  %cmp79 = icmp slt i32 %62, %63
  br i1 %cmp79, label %for.body81, label %for.end116

for.body81:                                       ; preds = %for.cond78
  %64 = load i32, i32* @history_write_timestamps, align 4
  %tobool82 = icmp ne i32 %64, 0
  br i1 %tobool82, label %land.lhs.true83, label %if.end103

land.lhs.true83:                                  ; preds = %for.body81
  %65 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %66 = load i32, i32* %i, align 4
  %arrayidx84 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %65, i32 %66
  %67 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx84, align 4
  %timestamp85 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %67, i32 0, i32 1
  %68 = load i8*, i8** %timestamp85, align 4
  %tobool86 = icmp ne i8* %68, null
  br i1 %tobool86, label %land.lhs.true87, label %if.end103

land.lhs.true87:                                  ; preds = %land.lhs.true83
  %69 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %70 = load i32, i32* %i, align 4
  %arrayidx88 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %69, i32 %70
  %71 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx88, align 4
  %timestamp89 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %71, i32 0, i32 1
  %72 = load i8*, i8** %timestamp89, align 4
  %arrayidx90 = getelementptr inbounds i8, i8* %72, i32 0
  %73 = load i8, i8* %arrayidx90, align 1
  %conv91 = sext i8 %73 to i32
  %tobool92 = icmp ne i32 %conv91, 0
  br i1 %tobool92, label %if.then93, label %if.end103

if.then93:                                        ; preds = %land.lhs.true87
  %74 = load i8*, i8** %buffer, align 4
  %75 = load i32, i32* %j, align 4
  %add.ptr = getelementptr inbounds i8, i8* %74, i32 %75
  %76 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %77 = load i32, i32* %i, align 4
  %arrayidx94 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %76, i32 %77
  %78 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx94, align 4
  %timestamp95 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %78, i32 0, i32 1
  %79 = load i8*, i8** %timestamp95, align 4
  %call96 = call i8* @strcpy(i8* %add.ptr, i8* %79)
  %80 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %81 = load i32, i32* %i, align 4
  %arrayidx97 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %80, i32 %81
  %82 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx97, align 4
  %timestamp98 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %82, i32 0, i32 1
  %83 = load i8*, i8** %timestamp98, align 4
  %call99 = call i32 @strlen(i8* %83)
  %84 = load i32, i32* %j, align 4
  %add100 = add i32 %84, %call99
  store i32 %add100, i32* %j, align 4
  %85 = load i8*, i8** %buffer, align 4
  %86 = load i32, i32* %j, align 4
  %inc101 = add nsw i32 %86, 1
  store i32 %inc101, i32* %j, align 4
  %arrayidx102 = getelementptr inbounds i8, i8* %85, i32 %86
  store i8 10, i8* %arrayidx102, align 1
  br label %if.end103

if.end103:                                        ; preds = %if.then93, %land.lhs.true87, %land.lhs.true83, %for.body81
  %87 = load i8*, i8** %buffer, align 4
  %88 = load i32, i32* %j, align 4
  %add.ptr104 = getelementptr inbounds i8, i8* %87, i32 %88
  %89 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %90 = load i32, i32* %i, align 4
  %arrayidx105 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %89, i32 %90
  %91 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx105, align 4
  %line106 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %91, i32 0, i32 0
  %92 = load i8*, i8** %line106, align 4
  %call107 = call i8* @strcpy(i8* %add.ptr104, i8* %92)
  %93 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %94 = load i32, i32* %i, align 4
  %arrayidx108 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %93, i32 %94
  %95 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx108, align 4
  %line109 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %95, i32 0, i32 0
  %96 = load i8*, i8** %line109, align 4
  %call110 = call i32 @strlen(i8* %96)
  %97 = load i32, i32* %j, align 4
  %add111 = add i32 %97, %call110
  store i32 %add111, i32* %j, align 4
  %98 = load i8*, i8** %buffer, align 4
  %99 = load i32, i32* %j, align 4
  %inc112 = add nsw i32 %99, 1
  store i32 %inc112, i32* %j, align 4
  %arrayidx113 = getelementptr inbounds i8, i8* %98, i32 %99
  store i8 10, i8* %arrayidx113, align 1
  br label %for.inc114

for.inc114:                                       ; preds = %if.end103
  %100 = load i32, i32* %i, align 4
  %inc115 = add nsw i32 %100, 1
  store i32 %inc115, i32* %i, align 4
  br label %for.cond78

for.end116:                                       ; preds = %for.cond78
  %101 = load i32, i32* %file, align 4
  %102 = load i8*, i8** %buffer, align 4
  %103 = load i32, i32* %buffer_size, align 4
  %call117 = call i32 @write(i32 %101, i8* %102, i32 %103)
  %cmp118 = icmp slt i32 %call117, 0
  br i1 %cmp118, label %if.then120, label %if.end122

if.then120:                                       ; preds = %for.end116
  %call121 = call i32* @__errno_location()
  %104 = load i32, i32* %call121, align 4
  store i32 %104, i32* %rv, align 4
  br label %if.end122

if.end122:                                        ; preds = %if.then120, %for.end116
  %105 = load i8*, i8** %buffer, align 4
  call void @xfree(i8* %105)
  %106 = load i32, i32* %nelements.addr, align 4
  store i32 %106, i32* @history_lines_written_to_file, align 4
  %107 = load i32, i32* %file, align 4
  %call123 = call i32 @close(i32 %107)
  %cmp124 = icmp slt i32 %call123, 0
  br i1 %cmp124, label %land.lhs.true126, label %if.end131

land.lhs.true126:                                 ; preds = %if.end122
  %108 = load i32, i32* %rv, align 4
  %cmp127 = icmp eq i32 %108, 0
  br i1 %cmp127, label %if.then129, label %if.end131

if.then129:                                       ; preds = %land.lhs.true126
  %call130 = call i32* @__errno_location()
  %109 = load i32, i32* %call130, align 4
  store i32 %109, i32* %rv, align 4
  br label %if.end131

if.end131:                                        ; preds = %if.then129, %land.lhs.true126, %if.end122
  %110 = load i32, i32* %rv, align 4
  %cmp132 = icmp eq i32 %110, 0
  br i1 %cmp132, label %land.lhs.true134, label %if.end140

land.lhs.true134:                                 ; preds = %if.end131
  %111 = load i8*, i8** %histname, align 4
  %tobool135 = icmp ne i8* %111, null
  br i1 %tobool135, label %land.lhs.true136, label %if.end140

land.lhs.true136:                                 ; preds = %land.lhs.true134
  %112 = load i8*, i8** %tempname, align 4
  %tobool137 = icmp ne i8* %112, null
  br i1 %tobool137, label %if.then138, label %if.end140

if.then138:                                       ; preds = %land.lhs.true136
  %113 = load i8*, i8** %tempname, align 4
  %114 = load i8*, i8** %histname, align 4
  %call139 = call i32 @histfile_restore(i8* %113, i8* %114)
  store i32 %call139, i32* %rv, align 4
  br label %if.end140

if.end140:                                        ; preds = %if.then138, %land.lhs.true136, %land.lhs.true134, %if.end131
  %115 = load i32, i32* %rv, align 4
  %cmp141 = icmp ne i32 %115, 0
  br i1 %cmp141, label %if.then143, label %if.end148

if.then143:                                       ; preds = %if.end140
  %116 = load i8*, i8** %tempname, align 4
  %tobool144 = icmp ne i8* %116, null
  br i1 %tobool144, label %if.then145, label %if.end147

if.then145:                                       ; preds = %if.then143
  %117 = load i8*, i8** %tempname, align 4
  %call146 = call i32 @unlink(i8* %117)
  br label %if.end147

if.end147:                                        ; preds = %if.then145, %if.then143
  store i32 0, i32* @history_lines_written_to_file, align 4
  br label %if.end148

if.end148:                                        ; preds = %if.end147, %if.end140
  %118 = load i32, i32* %rv, align 4
  %cmp149 = icmp eq i32 %118, 0
  br i1 %cmp149, label %land.lhs.true151, label %if.end155

land.lhs.true151:                                 ; preds = %if.end148
  %119 = load i32, i32* %exists, align 4
  %tobool152 = icmp ne i32 %119, 0
  br i1 %tobool152, label %if.then153, label %if.end155

if.then153:                                       ; preds = %land.lhs.true151
  %120 = load i8*, i8** %histname, align 4
  %st_uid = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 7
  %121 = load i32, i32* %st_uid, align 4
  %st_gid = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 8
  %122 = load i32, i32* %st_gid, align 8
  %call154 = call i32 @chown(i8* %120, i32 %121, i32 %122)
  store i32 %call154, i32* %mode, align 4
  br label %if.end155

if.end155:                                        ; preds = %if.then153, %land.lhs.true151, %if.end148
  %123 = load i8*, i8** %histname, align 4
  %tobool156 = icmp ne i8* %123, null
  br i1 %tobool156, label %if.then157, label %if.end158

if.then157:                                       ; preds = %if.end155
  %124 = load i8*, i8** %histname, align 4
  call void @free(i8* %124)
  br label %if.end158

if.end158:                                        ; preds = %if.then157, %if.end155
  %125 = load i8*, i8** %tempname, align 4
  %tobool159 = icmp ne i8* %125, null
  br i1 %tobool159, label %if.then160, label %if.end161

if.then160:                                       ; preds = %if.end158
  %126 = load i8*, i8** %tempname, align 4
  call void @free(i8* %126)
  br label %if.end161

if.end161:                                        ; preds = %if.then160, %if.end158
  %127 = load i32, i32* %rv, align 4
  store i32 %127, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end161, %if.end75, %if.end32
  %128 = load i32, i32* %retval, align 4
  ret i32 %128
}

; Function Attrs: noinline nounwind
define i32 @write_history(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %1 = load i32, i32* @history_length, align 4
  %call = call i32 @history_do_write(i8* %0, i32 %1, i32 1)
  ret i32 %call
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

declare i8* @sh_get_env_value(i8*) #1

declare i32 @readlink(i8*, i8*, i32) #1

declare i32 @getpid() #1

declare i32 @rename(i8*, i8*) #1

declare i32 @stat(i8*, %struct.stat*) #1

declare %struct._hist_entry** @history_list() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
