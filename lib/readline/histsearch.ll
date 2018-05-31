; ModuleID = 'histsearch.c'
source_filename = "histsearch.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._hist_entry = type { i8*, i8*, i8* }

@history_search_delimiter_chars = global i8* null, align 4
@history_offset = external global i32, align 4
@history_length = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @history_search(i8* %string, i32 %direction) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %direction.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %direction, i32* %direction.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i32, i32* %direction.addr, align 4
  %call = call i32 @history_search_internal(i8* %0, i32 %1, i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @history_search_internal(i8* %string, i32 %direction, i32 %anchored) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %direction.addr = alloca i32, align 4
  %anchored.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %reverse = alloca i32, align 4
  %line = alloca i8*, align 4
  %line_index = alloca i32, align 4
  %string_len = alloca i32, align 4
  %the_history = alloca %struct._hist_entry**, align 4
  %limit = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %direction, i32* %direction.addr, align 4
  store i32 %anchored, i32* %anchored.addr, align 4
  %0 = load i32, i32* @history_offset, align 4
  store i32 %0, i32* %i, align 4
  %1 = load i32, i32* %direction.addr, align 4
  %cmp = icmp slt i32 %1, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %reverse, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %cmp1 = icmp eq i8* %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv3 = sext i8 %4 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i32, i32* @history_length, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %lor.lhs.false6, label %if.then10

lor.lhs.false6:                                   ; preds = %if.end
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* @history_length, align 4
  %cmp7 = icmp sge i32 %6, %7
  br i1 %cmp7, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %lor.lhs.false6
  %8 = load i32, i32* %reverse, align 4
  %tobool9 = icmp ne i32 %8, 0
  br i1 %tobool9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %land.lhs.true, %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %land.lhs.true, %lor.lhs.false6
  %9 = load i32, i32* %reverse, align 4
  %tobool12 = icmp ne i32 %9, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.end17

land.lhs.true13:                                  ; preds = %if.end11
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* @history_length, align 4
  %cmp14 = icmp sge i32 %10, %11
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %land.lhs.true13
  %12 = load i32, i32* @history_length, align 4
  %sub = sub nsw i32 %12, 1
  store i32 %sub, i32* %i, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %land.lhs.true13, %if.end11
  %call = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call, %struct._hist_entry*** %the_history, align 4
  %13 = load i8*, i8** %string.addr, align 4
  %call18 = call i32 @strlen(i8* %13)
  store i32 %call18, i32* %string_len, align 4
  br label %while.body

while.body:                                       ; preds = %if.end17, %do.end, %do.end63, %do.end124
  %14 = load i32, i32* %reverse, align 4
  %tobool19 = icmp ne i32 %14, 0
  br i1 %tobool19, label %land.lhs.true20, label %lor.lhs.false23

land.lhs.true20:                                  ; preds = %while.body
  %15 = load i32, i32* %i, align 4
  %cmp21 = icmp slt i32 %15, 0
  br i1 %cmp21, label %if.then28, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %land.lhs.true20, %while.body
  %16 = load i32, i32* %reverse, align 4
  %tobool24 = icmp ne i32 %16, 0
  br i1 %tobool24, label %if.end29, label %land.lhs.true25

land.lhs.true25:                                  ; preds = %lor.lhs.false23
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* @history_length, align 4
  %cmp26 = icmp eq i32 %17, %18
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %land.lhs.true25, %land.lhs.true20
  store i32 -1, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %land.lhs.true25, %lor.lhs.false23
  %19 = load %struct._hist_entry**, %struct._hist_entry*** %the_history, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %19, i32 %20
  %21 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %line30 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %21, i32 0, i32 0
  %22 = load i8*, i8** %line30, align 4
  store i8* %22, i8** %line, align 4
  %23 = load i8*, i8** %line, align 4
  %call31 = call i32 @strlen(i8* %23)
  store i32 %call31, i32* %line_index, align 4
  %24 = load i32, i32* %string_len, align 4
  %25 = load i32, i32* %line_index, align 4
  %cmp32 = icmp sgt i32 %24, %25
  br i1 %cmp32, label %if.then34, label %if.end38

if.then34:                                        ; preds = %if.end29
  br label %do.body

do.body:                                          ; preds = %if.then34
  %26 = load i32, i32* %reverse, align 4
  %tobool35 = icmp ne i32 %26, 0
  br i1 %tobool35, label %if.then36, label %if.else

if.then36:                                        ; preds = %do.body
  %27 = load i32, i32* %i, align 4
  %dec = add nsw i32 %27, -1
  store i32 %dec, i32* %i, align 4
  br label %if.end37

if.else:                                          ; preds = %do.body
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.else, %if.then36
  br label %do.end

do.end:                                           ; preds = %if.end37
  br label %while.body

if.end38:                                         ; preds = %if.end29
  %29 = load i32, i32* %anchored.addr, align 4
  %cmp39 = icmp eq i32 %29, 1
  br i1 %cmp39, label %if.then41, label %if.end64

if.then41:                                        ; preds = %if.end38
  %30 = load i32, i32* %string_len, align 4
  %cmp42 = icmp eq i32 %30, 0
  br i1 %cmp42, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then41
  br i1 true, label %if.then54, label %if.end55

cond.false:                                       ; preds = %if.then41
  %31 = load i8*, i8** %string.addr, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %31, i32 0
  %32 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %32 to i32
  %33 = load i8*, i8** %line, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %33, i32 0
  %34 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %34 to i32
  %cmp48 = icmp eq i32 %conv45, %conv47
  br i1 %cmp48, label %land.lhs.true50, label %if.end55

land.lhs.true50:                                  ; preds = %cond.false
  %35 = load i8*, i8** %string.addr, align 4
  %36 = load i8*, i8** %line, align 4
  %37 = load i32, i32* %string_len, align 4
  %call51 = call i32 @strncmp(i8* %35, i8* %36, i32 %37)
  %cmp52 = icmp eq i32 %call51, 0
  br i1 %cmp52, label %if.then54, label %if.end55

if.then54:                                        ; preds = %land.lhs.true50, %cond.true
  %38 = load i32, i32* %i, align 4
  store i32 %38, i32* @history_offset, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end55:                                         ; preds = %land.lhs.true50, %cond.false, %cond.true
  br label %do.body56

do.body56:                                        ; preds = %if.end55
  %39 = load i32, i32* %reverse, align 4
  %tobool57 = icmp ne i32 %39, 0
  br i1 %tobool57, label %if.then58, label %if.else60

if.then58:                                        ; preds = %do.body56
  %40 = load i32, i32* %i, align 4
  %dec59 = add nsw i32 %40, -1
  store i32 %dec59, i32* %i, align 4
  br label %if.end62

if.else60:                                        ; preds = %do.body56
  %41 = load i32, i32* %i, align 4
  %inc61 = add nsw i32 %41, 1
  store i32 %inc61, i32* %i, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.else60, %if.then58
  br label %do.end63

do.end63:                                         ; preds = %if.end62
  br label %while.body

if.end64:                                         ; preds = %if.end38
  %42 = load i32, i32* %reverse, align 4
  %tobool65 = icmp ne i32 %42, 0
  br i1 %tobool65, label %if.then66, label %if.else90

if.then66:                                        ; preds = %if.end64
  %43 = load i32, i32* %string_len, align 4
  %44 = load i32, i32* %line_index, align 4
  %sub67 = sub nsw i32 %44, %43
  store i32 %sub67, i32* %line_index, align 4
  br label %while.cond68

while.cond68:                                     ; preds = %if.end88, %if.then66
  %45 = load i32, i32* %line_index, align 4
  %cmp69 = icmp sge i32 %45, 0
  br i1 %cmp69, label %while.body71, label %while.end

while.body71:                                     ; preds = %while.cond68
  %46 = load i32, i32* %string_len, align 4
  %cmp72 = icmp eq i32 %46, 0
  br i1 %cmp72, label %cond.true74, label %cond.false75

cond.true74:                                      ; preds = %while.body71
  br i1 true, label %if.then87, label %if.end88

cond.false75:                                     ; preds = %while.body71
  %47 = load i8*, i8** %string.addr, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %47, i32 0
  %48 = load i8, i8* %arrayidx76, align 1
  %conv77 = sext i8 %48 to i32
  %49 = load i8*, i8** %line, align 4
  %50 = load i32, i32* %line_index, align 4
  %add.ptr = getelementptr inbounds i8, i8* %49, i32 %50
  %arrayidx78 = getelementptr inbounds i8, i8* %add.ptr, i32 0
  %51 = load i8, i8* %arrayidx78, align 1
  %conv79 = sext i8 %51 to i32
  %cmp80 = icmp eq i32 %conv77, %conv79
  br i1 %cmp80, label %land.lhs.true82, label %if.end88

land.lhs.true82:                                  ; preds = %cond.false75
  %52 = load i8*, i8** %string.addr, align 4
  %53 = load i8*, i8** %line, align 4
  %54 = load i32, i32* %line_index, align 4
  %add.ptr83 = getelementptr inbounds i8, i8* %53, i32 %54
  %55 = load i32, i32* %string_len, align 4
  %call84 = call i32 @strncmp(i8* %52, i8* %add.ptr83, i32 %55)
  %cmp85 = icmp eq i32 %call84, 0
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %land.lhs.true82, %cond.true74
  %56 = load i32, i32* %i, align 4
  store i32 %56, i32* @history_offset, align 4
  %57 = load i32, i32* %line_index, align 4
  store i32 %57, i32* %retval, align 4
  br label %return

if.end88:                                         ; preds = %land.lhs.true82, %cond.false75, %cond.true74
  %58 = load i32, i32* %line_index, align 4
  %dec89 = add nsw i32 %58, -1
  store i32 %dec89, i32* %line_index, align 4
  br label %while.cond68

while.end:                                        ; preds = %while.cond68
  br label %if.end116

if.else90:                                        ; preds = %if.end64
  %59 = load i32, i32* %line_index, align 4
  %60 = load i32, i32* %string_len, align 4
  %sub91 = sub nsw i32 %59, %60
  %add = add nsw i32 %sub91, 1
  store i32 %add, i32* %limit, align 4
  store i32 0, i32* %line_index, align 4
  br label %while.cond92

while.cond92:                                     ; preds = %if.end113, %if.else90
  %61 = load i32, i32* %line_index, align 4
  %62 = load i32, i32* %limit, align 4
  %cmp93 = icmp slt i32 %61, %62
  br i1 %cmp93, label %while.body95, label %while.end115

while.body95:                                     ; preds = %while.cond92
  %63 = load i32, i32* %string_len, align 4
  %cmp96 = icmp eq i32 %63, 0
  br i1 %cmp96, label %cond.true98, label %cond.false99

cond.true98:                                      ; preds = %while.body95
  br i1 true, label %if.then112, label %if.end113

cond.false99:                                     ; preds = %while.body95
  %64 = load i8*, i8** %string.addr, align 4
  %arrayidx100 = getelementptr inbounds i8, i8* %64, i32 0
  %65 = load i8, i8* %arrayidx100, align 1
  %conv101 = sext i8 %65 to i32
  %66 = load i8*, i8** %line, align 4
  %67 = load i32, i32* %line_index, align 4
  %add.ptr102 = getelementptr inbounds i8, i8* %66, i32 %67
  %arrayidx103 = getelementptr inbounds i8, i8* %add.ptr102, i32 0
  %68 = load i8, i8* %arrayidx103, align 1
  %conv104 = sext i8 %68 to i32
  %cmp105 = icmp eq i32 %conv101, %conv104
  br i1 %cmp105, label %land.lhs.true107, label %if.end113

land.lhs.true107:                                 ; preds = %cond.false99
  %69 = load i8*, i8** %string.addr, align 4
  %70 = load i8*, i8** %line, align 4
  %71 = load i32, i32* %line_index, align 4
  %add.ptr108 = getelementptr inbounds i8, i8* %70, i32 %71
  %72 = load i32, i32* %string_len, align 4
  %call109 = call i32 @strncmp(i8* %69, i8* %add.ptr108, i32 %72)
  %cmp110 = icmp eq i32 %call109, 0
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %land.lhs.true107, %cond.true98
  %73 = load i32, i32* %i, align 4
  store i32 %73, i32* @history_offset, align 4
  %74 = load i32, i32* %line_index, align 4
  store i32 %74, i32* %retval, align 4
  br label %return

if.end113:                                        ; preds = %land.lhs.true107, %cond.false99, %cond.true98
  %75 = load i32, i32* %line_index, align 4
  %inc114 = add nsw i32 %75, 1
  store i32 %inc114, i32* %line_index, align 4
  br label %while.cond92

while.end115:                                     ; preds = %while.cond92
  br label %if.end116

if.end116:                                        ; preds = %while.end115, %while.end
  br label %do.body117

do.body117:                                       ; preds = %if.end116
  %76 = load i32, i32* %reverse, align 4
  %tobool118 = icmp ne i32 %76, 0
  br i1 %tobool118, label %if.then119, label %if.else121

if.then119:                                       ; preds = %do.body117
  %77 = load i32, i32* %i, align 4
  %dec120 = add nsw i32 %77, -1
  store i32 %dec120, i32* %i, align 4
  br label %if.end123

if.else121:                                       ; preds = %do.body117
  %78 = load i32, i32* %i, align 4
  %inc122 = add nsw i32 %78, 1
  store i32 %inc122, i32* %i, align 4
  br label %if.end123

if.end123:                                        ; preds = %if.else121, %if.then119
  br label %do.end124

do.end124:                                        ; preds = %if.end123
  br label %while.body

return:                                           ; preds = %if.then112, %if.then87, %if.then54, %if.then28, %if.then10, %if.then
  %79 = load i32, i32* %retval, align 4
  ret i32 %79
}

; Function Attrs: noinline nounwind
define i32 @history_search_prefix(i8* %string, i32 %direction) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %direction.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %direction, i32* %direction.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i32, i32* %direction.addr, align 4
  %call = call i32 @history_search_internal(i8* %0, i32 %1, i32 1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @history_search_pos(i8* %string, i32 %dir, i32 %pos) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %dir.addr = alloca i32, align 4
  %pos.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  %old = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %dir, i32* %dir.addr, align 4
  store i32 %pos, i32* %pos.addr, align 4
  %call = call i32 @where_history()
  store i32 %call, i32* %old, align 4
  %0 = load i32, i32* %pos.addr, align 4
  %call1 = call i32 @history_set_pos(i32 %0)
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i32, i32* %dir.addr, align 4
  %call2 = call i32 @history_search(i8* %1, i32 %2)
  %cmp = icmp eq i32 %call2, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %old, align 4
  %call3 = call i32 @history_set_pos(i32 %3)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call4 = call i32 @where_history()
  store i32 %call4, i32* %ret, align 4
  %4 = load i32, i32* %old, align 4
  %call5 = call i32 @history_set_pos(i32 %4)
  %5 = load i32, i32* %ret, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i32 @where_history() #1

declare i32 @history_set_pos(i32) #1

declare %struct._hist_entry** @history_list() #1

declare i32 @strlen(i8*) #1

declare i32 @strncmp(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
