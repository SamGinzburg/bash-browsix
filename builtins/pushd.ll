; ModuleID = 'pushd.c'
source_filename = "pushd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@directory_list_offset = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [19 x i8] c"no other directory\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"pushd\00", align 1
@pushd_directory_list = internal global i8** null, align 4
@.str.3 = private unnamed_addr constant [12 x i8] c"./pushd.def\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"%s: invalid argument\00", align 1
@.str.5 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"dirs\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"<no current directory>\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"%2d  %s\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"\0A%2d  %s\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"PWD\00", align 1
@.str.15 = private unnamed_addr constant [9 x i8] c"dirstack\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.17 = private unnamed_addr constant [22 x i8] c"directory stack empty\00", align 1
@.str.18 = private unnamed_addr constant [22 x i8] c"directory stack index\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"--\00", align 1
@directory_list_size = internal global i32 0, align 4

; Function Attrs: noinline nounwind
define i32 @pushd_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %orig_list = alloca %struct.word_list*, align 4
  %temp = alloca i8*, align 4
  %current_directory = alloca i8*, align 4
  %top = alloca i8*, align 4
  %j = alloca i32, align 4
  %flags = alloca i32, align 4
  %skipopt = alloca i32, align 4
  %num = alloca i64, align 8
  %direction = alloca i8, align 1
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** %orig_list, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 1
  %3 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool1 = icmp ne %struct.word_desc* %3, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %8 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv5 = sext i8 %8 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %land.lhs.true2
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word9, align 4
  %call = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true7
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true7, %land.lhs.true2, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool12 = icmp ne %struct.word_list* %12, null
  br i1 %tobool12, label %land.lhs.true13, label %if.else

land.lhs.true13:                                  ; preds = %do.end
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word14 = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 1
  %14 = load %struct.word_desc*, %struct.word_desc** %word14, align 4
  %tobool15 = icmp ne %struct.word_desc* %14, null
  br i1 %tobool15, label %land.lhs.true16, label %if.else

land.lhs.true16:                                  ; preds = %land.lhs.true13
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word17 = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 1
  %16 = load %struct.word_desc*, %struct.word_desc** %word17, align 4
  %word18 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word18, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %18 to i32
  %cmp21 = icmp eq i32 %conv20, 45
  br i1 %cmp21, label %land.lhs.true23, label %if.else

land.lhs.true23:                                  ; preds = %land.lhs.true16
  %19 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word24 = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 1
  %20 = load %struct.word_desc*, %struct.word_desc** %word24, align 4
  %word25 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word25, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %21, i32 2
  %22 = load i8, i8* %arrayidx26, align 1
  %tobool27 = icmp ne i8 %22, 0
  br i1 %tobool27, label %if.else, label %land.lhs.true28

land.lhs.true28:                                  ; preds = %land.lhs.true23
  %23 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word29 = getelementptr inbounds %struct.word_list, %struct.word_list* %23, i32 0, i32 1
  %24 = load %struct.word_desc*, %struct.word_desc** %word29, align 4
  %word30 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %24, i32 0, i32 0
  %25 = load i8*, i8** %word30, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %25, i32 1
  %26 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %26 to i32
  %cmp33 = icmp eq i32 %conv32, 45
  br i1 %cmp33, label %if.then35, label %if.else

if.then35:                                        ; preds = %land.lhs.true28
  %27 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %27, i32 0, i32 0
  %28 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %28, %struct.word_list** %list.addr, align 4
  store i32 1, i32* %skipopt, align 4
  br label %if.end36

if.else:                                          ; preds = %land.lhs.true28, %land.lhs.true23, %land.lhs.true16, %land.lhs.true13, %do.end
  store i32 0, i32* %skipopt, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.else, %if.then35
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp37 = icmp eq %struct.word_list* %29, null
  br i1 %cmp37, label %if.then39, label %if.end53

if.then39:                                        ; preds = %if.end36
  %30 = load i32, i32* @directory_list_offset, align 4
  %cmp40 = icmp eq i32 %30, 0
  br i1 %cmp40, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.then39
  %call43 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call43)
  store i32 1, i32* %retval, align 4
  br label %return

if.end44:                                         ; preds = %if.then39
  %call45 = call i8* @get_working_directory(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call45, i8** %current_directory, align 4
  %31 = load i8*, i8** %current_directory, align 4
  %cmp46 = icmp eq i8* %31, null
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end44
  store i32 1, i32* %retval, align 4
  br label %return

if.end49:                                         ; preds = %if.end44
  %32 = load i32, i32* @directory_list_offset, align 4
  %sub = sub nsw i32 %32, 1
  store i32 %sub, i32* %j, align 4
  %33 = load i8**, i8*** @pushd_directory_list, align 4
  %34 = load i32, i32* %j, align 4
  %arrayidx50 = getelementptr inbounds i8*, i8** %33, i32 %34
  %35 = load i8*, i8** %arrayidx50, align 4
  store i8* %35, i8** %temp, align 4
  %36 = load i8*, i8** %current_directory, align 4
  %37 = load i8**, i8*** @pushd_directory_list, align 4
  %38 = load i32, i32* %j, align 4
  %arrayidx51 = getelementptr inbounds i8*, i8** %37, i32 %38
  store i8* %36, i8** %arrayidx51, align 4
  %39 = load i8*, i8** %temp, align 4
  %call52 = call i32 @change_to_temp(i8* %39)
  store i32 %call52, i32* %j, align 4
  %40 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %40, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 211)
  %41 = load i32, i32* %j, align 4
  store i32 %41, i32* %retval, align 4
  br label %return

if.end53:                                         ; preds = %if.end36
  store i32 0, i32* %flags, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end53
  %42 = load i32, i32* %skipopt, align 4
  %cmp54 = icmp eq i32 %42, 0
  br i1 %cmp54, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %43 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool56 = icmp ne %struct.word_list* %43, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %44 = phi i1 [ false, %for.cond ], [ %tobool56, %land.rhs ]
  br i1 %44, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %45 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word57 = getelementptr inbounds %struct.word_list, %struct.word_list* %45, i32 0, i32 1
  %46 = load %struct.word_desc*, %struct.word_desc** %word57, align 4
  %word58 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %46, i32 0, i32 0
  %47 = load i8*, i8** %word58, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %47, i32 0
  %48 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %48 to i32
  %cmp61 = icmp eq i32 %conv60, 45
  br i1 %cmp61, label %land.lhs.true63, label %if.else76

land.lhs.true63:                                  ; preds = %for.body
  %49 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word64 = getelementptr inbounds %struct.word_list, %struct.word_list* %49, i32 0, i32 1
  %50 = load %struct.word_desc*, %struct.word_desc** %word64, align 4
  %word65 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %50, i32 0, i32 0
  %51 = load i8*, i8** %word65, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %51, i32 2
  %52 = load i8, i8* %arrayidx66, align 1
  %tobool67 = icmp ne i8 %52, 0
  br i1 %tobool67, label %if.else76, label %land.lhs.true68

land.lhs.true68:                                  ; preds = %land.lhs.true63
  %53 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word69 = getelementptr inbounds %struct.word_list, %struct.word_list* %53, i32 0, i32 1
  %54 = load %struct.word_desc*, %struct.word_desc** %word69, align 4
  %word70 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %54, i32 0, i32 0
  %55 = load i8*, i8** %word70, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %55, i32 1
  %56 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %56 to i32
  %cmp73 = icmp eq i32 %conv72, 110
  br i1 %cmp73, label %if.then75, label %if.else76

if.then75:                                        ; preds = %land.lhs.true68
  %57 = load i32, i32* %flags, align 4
  %or = or i32 %57, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end163

if.else76:                                        ; preds = %land.lhs.true68, %land.lhs.true63, %for.body
  %58 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word77 = getelementptr inbounds %struct.word_list, %struct.word_list* %58, i32 0, i32 1
  %59 = load %struct.word_desc*, %struct.word_desc** %word77, align 4
  %word78 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %59, i32 0, i32 0
  %60 = load i8*, i8** %word78, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %60, i32 0
  %61 = load i8, i8* %arrayidx79, align 1
  %conv80 = sext i8 %61 to i32
  %cmp81 = icmp eq i32 %conv80, 45
  br i1 %cmp81, label %land.lhs.true83, label %if.else97

land.lhs.true83:                                  ; preds = %if.else76
  %62 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word84 = getelementptr inbounds %struct.word_list, %struct.word_list* %62, i32 0, i32 1
  %63 = load %struct.word_desc*, %struct.word_desc** %word84, align 4
  %word85 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %63, i32 0, i32 0
  %64 = load i8*, i8** %word85, align 4
  %arrayidx86 = getelementptr inbounds i8, i8* %64, i32 2
  %65 = load i8, i8* %arrayidx86, align 1
  %tobool87 = icmp ne i8 %65, 0
  br i1 %tobool87, label %if.else97, label %land.lhs.true88

land.lhs.true88:                                  ; preds = %land.lhs.true83
  %66 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word89 = getelementptr inbounds %struct.word_list, %struct.word_list* %66, i32 0, i32 1
  %67 = load %struct.word_desc*, %struct.word_desc** %word89, align 4
  %word90 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %67, i32 0, i32 0
  %68 = load i8*, i8** %word90, align 4
  %arrayidx91 = getelementptr inbounds i8, i8* %68, i32 1
  %69 = load i8, i8* %arrayidx91, align 1
  %conv92 = sext i8 %69 to i32
  %cmp93 = icmp eq i32 %conv92, 45
  br i1 %cmp93, label %if.then95, label %if.else97

if.then95:                                        ; preds = %land.lhs.true88
  %70 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next96 = getelementptr inbounds %struct.word_list, %struct.word_list* %70, i32 0, i32 0
  %71 = load %struct.word_list*, %struct.word_list** %next96, align 4
  store %struct.word_list* %71, %struct.word_list** %list.addr, align 4
  br label %for.end

if.else97:                                        ; preds = %land.lhs.true88, %land.lhs.true83, %if.else76
  %72 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word98 = getelementptr inbounds %struct.word_list, %struct.word_list* %72, i32 0, i32 1
  %73 = load %struct.word_desc*, %struct.word_desc** %word98, align 4
  %word99 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %73, i32 0, i32 0
  %74 = load i8*, i8** %word99, align 4
  %arrayidx100 = getelementptr inbounds i8, i8* %74, i32 0
  %75 = load i8, i8* %arrayidx100, align 1
  %conv101 = sext i8 %75 to i32
  %cmp102 = icmp eq i32 %conv101, 45
  br i1 %cmp102, label %land.lhs.true104, label %if.else112

land.lhs.true104:                                 ; preds = %if.else97
  %76 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word105 = getelementptr inbounds %struct.word_list, %struct.word_list* %76, i32 0, i32 1
  %77 = load %struct.word_desc*, %struct.word_desc** %word105, align 4
  %word106 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %77, i32 0, i32 0
  %78 = load i8*, i8** %word106, align 4
  %arrayidx107 = getelementptr inbounds i8, i8* %78, i32 1
  %79 = load i8, i8* %arrayidx107, align 1
  %conv108 = sext i8 %79 to i32
  %cmp109 = icmp eq i32 %conv108, 0
  br i1 %cmp109, label %if.then111, label %if.else112

if.then111:                                       ; preds = %land.lhs.true104
  br label %for.end

if.else112:                                       ; preds = %land.lhs.true104, %if.else97
  %80 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word113 = getelementptr inbounds %struct.word_list, %struct.word_list* %80, i32 0, i32 1
  %81 = load %struct.word_desc*, %struct.word_desc** %word113, align 4
  %word114 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %81, i32 0, i32 0
  %82 = load i8*, i8** %word114, align 4
  %arrayidx115 = getelementptr inbounds i8, i8* %82, i32 0
  %83 = load i8, i8* %arrayidx115, align 1
  store i8 %83, i8* %direction, align 1
  %conv116 = sext i8 %83 to i32
  %cmp117 = icmp eq i32 %conv116, 43
  br i1 %cmp117, label %if.then122, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else112
  %84 = load i8, i8* %direction, align 1
  %conv119 = sext i8 %84 to i32
  %cmp120 = icmp eq i32 %conv119, 45
  br i1 %cmp120, label %if.then122, label %if.else150

if.then122:                                       ; preds = %lor.lhs.false, %if.else112
  %85 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word123 = getelementptr inbounds %struct.word_list, %struct.word_list* %85, i32 0, i32 1
  %86 = load %struct.word_desc*, %struct.word_desc** %word123, align 4
  %word124 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %86, i32 0, i32 0
  %87 = load i8*, i8** %word124, align 4
  %add.ptr = getelementptr inbounds i8, i8* %87, i32 1
  %call125 = call i32 @legal_number(i8* %add.ptr, i64* %num)
  %cmp126 = icmp eq i32 %call125, 0
  br i1 %cmp126, label %if.then128, label %if.end131

if.then128:                                       ; preds = %if.then122
  %88 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word129 = getelementptr inbounds %struct.word_list, %struct.word_list* %88, i32 0, i32 1
  %89 = load %struct.word_desc*, %struct.word_desc** %word129, align 4
  %word130 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %89, i32 0, i32 0
  %90 = load i8*, i8** %word130, align 4
  call void @sh_invalidnum(i8* %90)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end131:                                        ; preds = %if.then122
  %91 = load i8, i8* %direction, align 1
  %conv132 = sext i8 %91 to i32
  %cmp133 = icmp eq i32 %conv132, 45
  br i1 %cmp133, label %if.then135, label %if.end138

if.then135:                                       ; preds = %if.end131
  %92 = load i32, i32* @directory_list_offset, align 4
  %conv136 = sext i32 %92 to i64
  %93 = load i64, i64* %num, align 8
  %sub137 = sub nsw i64 %conv136, %93
  store i64 %sub137, i64* %num, align 8
  br label %if.end138

if.end138:                                        ; preds = %if.then135, %if.end131
  %94 = load i64, i64* %num, align 8
  %95 = load i32, i32* @directory_list_offset, align 4
  %conv139 = sext i32 %95 to i64
  %cmp140 = icmp sgt i64 %94, %conv139
  br i1 %cmp140, label %if.then145, label %lor.lhs.false142

lor.lhs.false142:                                 ; preds = %if.end138
  %96 = load i64, i64* %num, align 8
  %cmp143 = icmp slt i64 %96, 0
  br i1 %cmp143, label %if.then145, label %if.end148

if.then145:                                       ; preds = %lor.lhs.false142, %if.end138
  %97 = load i32, i32* @directory_list_offset, align 4
  %98 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word146 = getelementptr inbounds %struct.word_list, %struct.word_list* %98, i32 0, i32 1
  %99 = load %struct.word_desc*, %struct.word_desc** %word146, align 4
  %word147 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %99, i32 0, i32 0
  %100 = load i8*, i8** %word147, align 4
  call void @pushd_error(i32 %97, i8* %100)
  store i32 1, i32* %retval, align 4
  br label %return

if.end148:                                        ; preds = %lor.lhs.false142
  %101 = load i32, i32* %flags, align 4
  %or149 = or i32 %101, 2
  store i32 %or149, i32* %flags, align 4
  br label %if.end160

if.else150:                                       ; preds = %lor.lhs.false
  %102 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word151 = getelementptr inbounds %struct.word_list, %struct.word_list* %102, i32 0, i32 1
  %103 = load %struct.word_desc*, %struct.word_desc** %word151, align 4
  %word152 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %103, i32 0, i32 0
  %104 = load i8*, i8** %word152, align 4
  %105 = load i8, i8* %104, align 1
  %conv153 = sext i8 %105 to i32
  %cmp154 = icmp eq i32 %conv153, 45
  br i1 %cmp154, label %if.then156, label %if.else159

if.then156:                                       ; preds = %if.else150
  %106 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word157 = getelementptr inbounds %struct.word_list, %struct.word_list* %106, i32 0, i32 1
  %107 = load %struct.word_desc*, %struct.word_desc** %word157, align 4
  %word158 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %107, i32 0, i32 0
  %108 = load i8*, i8** %word158, align 4
  call void @sh_invalidopt(i8* %108)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.else159:                                       ; preds = %if.else150
  br label %for.end

if.end160:                                        ; preds = %if.end148
  br label %if.end161

if.end161:                                        ; preds = %if.end160
  br label %if.end162

if.end162:                                        ; preds = %if.end161
  br label %if.end163

if.end163:                                        ; preds = %if.end162, %if.then75
  br label %for.inc

for.inc:                                          ; preds = %if.end163
  %109 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next164 = getelementptr inbounds %struct.word_list, %struct.word_list* %109, i32 0, i32 0
  %110 = load %struct.word_list*, %struct.word_list** %next164, align 4
  store %struct.word_list* %110, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %if.else159, %if.then111, %if.then95, %land.end
  %111 = load i32, i32* %flags, align 4
  %and = and i32 %111, 2
  %tobool165 = icmp ne i32 %and, 0
  br i1 %tobool165, label %if.then166, label %if.end201

if.then166:                                       ; preds = %for.end
  %call167 = call i8* @get_working_directory(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call167, i8** %temp, align 4
  %112 = load i64, i64* %num, align 8
  %cmp168 = icmp eq i64 %112, 0
  br i1 %cmp168, label %if.then170, label %if.end175

if.then170:                                       ; preds = %if.then166
  %113 = load i32, i32* %flags, align 4
  %and171 = and i32 %113, 1
  %cmp172 = icmp eq i32 %and171, 0
  br i1 %cmp172, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then170
  %114 = load i8*, i8** %temp, align 4
  %call174 = call i32 @change_to_temp(i8* %114)
  br label %cond.end

cond.false:                                       ; preds = %if.then170
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call174, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %j, align 4
  %115 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %115, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 267)
  %116 = load i32, i32* %j, align 4
  store i32 %116, i32* %retval, align 4
  br label %return

if.end175:                                        ; preds = %if.then166
  br label %do.body176

do.body176:                                       ; preds = %do.cond, %if.end175
  %117 = load i8**, i8*** @pushd_directory_list, align 4
  %118 = load i32, i32* @directory_list_offset, align 4
  %sub177 = sub nsw i32 %118, 1
  %arrayidx178 = getelementptr inbounds i8*, i8** %117, i32 %sub177
  %119 = load i8*, i8** %arrayidx178, align 4
  store i8* %119, i8** %top, align 4
  %120 = load i32, i32* @directory_list_offset, align 4
  %sub179 = sub nsw i32 %120, 2
  store i32 %sub179, i32* %j, align 4
  br label %for.cond180

for.cond180:                                      ; preds = %for.inc186, %do.body176
  %121 = load i32, i32* %j, align 4
  %cmp181 = icmp sgt i32 %121, -1
  br i1 %cmp181, label %for.body183, label %for.end187

for.body183:                                      ; preds = %for.cond180
  %122 = load i8**, i8*** @pushd_directory_list, align 4
  %123 = load i32, i32* %j, align 4
  %arrayidx184 = getelementptr inbounds i8*, i8** %122, i32 %123
  %124 = load i8*, i8** %arrayidx184, align 4
  %125 = load i8**, i8*** @pushd_directory_list, align 4
  %126 = load i32, i32* %j, align 4
  %add = add nsw i32 %126, 1
  %arrayidx185 = getelementptr inbounds i8*, i8** %125, i32 %add
  store i8* %124, i8** %arrayidx185, align 4
  br label %for.inc186

for.inc186:                                       ; preds = %for.body183
  %127 = load i32, i32* %j, align 4
  %dec = add nsw i32 %127, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond180

for.end187:                                       ; preds = %for.cond180
  %128 = load i8*, i8** %temp, align 4
  %129 = load i8**, i8*** @pushd_directory_list, align 4
  %130 = load i32, i32* %j, align 4
  %add188 = add nsw i32 %130, 1
  %arrayidx189 = getelementptr inbounds i8*, i8** %129, i32 %add188
  store i8* %128, i8** %arrayidx189, align 4
  %131 = load i8*, i8** %top, align 4
  store i8* %131, i8** %temp, align 4
  %132 = load i64, i64* %num, align 8
  %dec190 = add nsw i64 %132, -1
  store i64 %dec190, i64* %num, align 8
  br label %do.cond

do.cond:                                          ; preds = %for.end187
  %133 = load i64, i64* %num, align 8
  %tobool191 = icmp ne i64 %133, 0
  br i1 %tobool191, label %do.body176, label %do.end192

do.end192:                                        ; preds = %do.cond
  %134 = load i32, i32* %flags, align 4
  %and193 = and i32 %134, 1
  %cmp194 = icmp eq i32 %and193, 0
  br i1 %cmp194, label %cond.true196, label %cond.false198

cond.true196:                                     ; preds = %do.end192
  %135 = load i8*, i8** %temp, align 4
  %call197 = call i32 @change_to_temp(i8* %135)
  br label %cond.end199

cond.false198:                                    ; preds = %do.end192
  br label %cond.end199

cond.end199:                                      ; preds = %cond.false198, %cond.true196
  %cond200 = phi i32 [ %call197, %cond.true196 ], [ 0, %cond.false198 ]
  store i32 %cond200, i32* %j, align 4
  %136 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %136, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 286)
  %137 = load i32, i32* %j, align 4
  store i32 %137, i32* %retval, align 4
  br label %return

if.end201:                                        ; preds = %for.end
  %138 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp202 = icmp eq %struct.word_list* %138, null
  br i1 %cmp202, label %if.then204, label %if.end205

if.then204:                                       ; preds = %if.end201
  store i32 0, i32* %retval, align 4
  br label %return

if.end205:                                        ; preds = %if.end201
  %call206 = call i8* @get_working_directory(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call206, i8** %current_directory, align 4
  %139 = load i8*, i8** %current_directory, align 4
  %cmp207 = icmp eq i8* %139, null
  br i1 %cmp207, label %if.then209, label %if.end210

if.then209:                                       ; preds = %if.end205
  store i32 1, i32* %retval, align 4
  br label %return

if.end210:                                        ; preds = %if.end205
  %140 = load i32, i32* %flags, align 4
  %and211 = and i32 %140, 1
  %cmp212 = icmp eq i32 %and211, 0
  br i1 %cmp212, label %cond.true214, label %cond.false221

cond.true214:                                     ; preds = %if.end210
  %141 = load i32, i32* %skipopt, align 4
  %tobool215 = icmp ne i32 %141, 0
  br i1 %tobool215, label %cond.true216, label %cond.false217

cond.true216:                                     ; preds = %cond.true214
  %142 = load %struct.word_list*, %struct.word_list** %orig_list, align 4
  br label %cond.end218

cond.false217:                                    ; preds = %cond.true214
  %143 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  br label %cond.end218

cond.end218:                                      ; preds = %cond.false217, %cond.true216
  %cond219 = phi %struct.word_list* [ %142, %cond.true216 ], [ %143, %cond.false217 ]
  %call220 = call i32 @cd_builtin(%struct.word_list* %cond219)
  br label %cond.end222

cond.false221:                                    ; preds = %if.end210
  br label %cond.end222

cond.end222:                                      ; preds = %cond.false221, %cond.end218
  %cond223 = phi i32 [ %call220, %cond.end218 ], [ 0, %cond.false221 ]
  store i32 %cond223, i32* %j, align 4
  %144 = load i32, i32* %j, align 4
  %cmp224 = icmp eq i32 %144, 0
  br i1 %cmp224, label %if.then226, label %if.else246

if.then226:                                       ; preds = %cond.end222
  %145 = load i32, i32* %flags, align 4
  %and227 = and i32 %145, 1
  %tobool228 = icmp ne i32 %and227, 0
  br i1 %tobool228, label %cond.true229, label %cond.false238

cond.true229:                                     ; preds = %if.then226
  %146 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word230 = getelementptr inbounds %struct.word_list, %struct.word_list* %146, i32 0, i32 1
  %147 = load %struct.word_desc*, %struct.word_desc** %word230, align 4
  %word231 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %147, i32 0, i32 0
  %148 = load i8*, i8** %word231, align 4
  %call232 = call i32 @strlen(i8* %148)
  %add233 = add i32 1, %call232
  %call234 = call i8* @sh_xmalloc(i32 %add233, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 302)
  %149 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word235 = getelementptr inbounds %struct.word_list, %struct.word_list* %149, i32 0, i32 1
  %150 = load %struct.word_desc*, %struct.word_desc** %word235, align 4
  %word236 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %150, i32 0, i32 0
  %151 = load i8*, i8** %word236, align 4
  %call237 = call i8* @strcpy(i8* %call234, i8* %151)
  br label %cond.end239

cond.false238:                                    ; preds = %if.then226
  %152 = load i8*, i8** %current_directory, align 4
  br label %cond.end239

cond.end239:                                      ; preds = %cond.false238, %cond.true229
  %cond240 = phi i8* [ %call237, %cond.true229 ], [ %152, %cond.false238 ]
  call void @add_dirstack_element(i8* %cond240)
  %call241 = call i32 @dirs_builtin(%struct.word_list* null)
  %153 = load i32, i32* %flags, align 4
  %and242 = and i32 %153, 1
  %tobool243 = icmp ne i32 %and242, 0
  br i1 %tobool243, label %if.then244, label %if.end245

if.then244:                                       ; preds = %cond.end239
  %154 = load i8*, i8** %current_directory, align 4
  call void @sh_xfree(i8* %154, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 305)
  br label %if.end245

if.end245:                                        ; preds = %if.then244, %cond.end239
  store i32 0, i32* %retval, align 4
  br label %return

if.else246:                                       ; preds = %cond.end222
  %155 = load i8*, i8** %current_directory, align 4
  call void @sh_xfree(i8* %155, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 310)
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else246, %if.end245, %if.then209, %if.then204, %cond.end199, %cond.end, %if.then156, %if.then145, %if.then128, %if.end49, %if.then48, %if.then42, %if.then
  %156 = load i32, i32* %retval, align 4
  ret i32 %156
}

declare i32 @strcmp(i8*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @get_working_directory(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @change_to_temp(i8* %temp) #0 {
entry:
  %temp.addr = alloca i8*, align 4
  %tt = alloca i32, align 4
  store i8* %temp, i8** %temp.addr, align 4
  %0 = load i8*, i8** %temp.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %temp.addr, align 4
  %call = call i32 @cd_to_string(i8* %1)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %tt, align 4
  %2 = load i32, i32* %tt, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %call1 = call i32 @dirs_builtin(%struct.word_list* null)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %3 = load i32, i32* %tt, align 4
  ret i32 %3
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @legal_number(i8*, i64*) #1

declare void @sh_invalidnum(i8*) #1

declare void @builtin_usage() #1

; Function Attrs: noinline nounwind
define internal void @pushd_error(i32 %offset, i8* %arg) #0 {
entry:
  %offset.addr = alloca i32, align 4
  %arg.addr = alloca i8*, align 4
  store i32 %offset, i32* %offset.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i32, i32* %offset.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.17, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call)
  br label %if.end

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %arg.addr, align 4
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.18, i32 0, i32 0))
  call void @sh_erange(i8* %1, i8* %call1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare void @sh_invalidopt(i8*) #1

declare i32 @cd_builtin(%struct.word_list*) #1

; Function Attrs: noinline nounwind
define internal void @add_dirstack_element(i8* %dir) #0 {
entry:
  %dir.addr = alloca i8*, align 4
  store i8* %dir, i8** %dir.addr, align 4
  %0 = load i32, i32* @directory_list_offset, align 4
  %1 = load i32, i32* @directory_list_size, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8**, i8*** @pushd_directory_list, align 4
  %3 = load i32, i32* @directory_list_size, align 4
  %add = add nsw i32 %3, 10
  store i32 %add, i32* @directory_list_size, align 4
  %call = call i8** @strvec_resize(i8** %2, i32 %add)
  store i8** %call, i8*** @pushd_directory_list, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i8*, i8** %dir.addr, align 4
  %5 = load i8**, i8*** @pushd_directory_list, align 4
  %6 = load i32, i32* @directory_list_offset, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* @directory_list_offset, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %5, i32 %6
  store i8* %4, i8** %arrayidx, align 4
  ret void
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @dirs_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %flags = alloca i32, align 4
  %desired_index = alloca i32, align 4
  %index_flag = alloca i32, align 4
  %vflag = alloca i32, align 4
  %i = alloca i64, align 8
  %temp = alloca i8*, align 4
  %w = alloca i8*, align 4
  %sign = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool1 = icmp ne %struct.word_desc* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv5 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %land.lhs.true2
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word9, align 4
  %call = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true7
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true7, %land.lhs.true2, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  store i32 0, i32* %index_flag, align 4
  store i32 0, i32* %vflag, align 4
  store i32 0, i32* %flags, align 4
  store i32 -1, i32* %desired_index, align 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.5, i32 0, i32 0), i8** %w, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool12 = icmp ne %struct.word_list* %11, null
  br i1 %tobool12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %13, i32 0, i32 0
  %14 = load i8*, i8** %word14, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %15 to i32
  %cmp17 = icmp eq i32 %conv16, 45
  br i1 %cmp17, label %land.lhs.true19, label %if.else

land.lhs.true19:                                  ; preds = %for.body
  %16 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word20 = getelementptr inbounds %struct.word_list, %struct.word_list* %16, i32 0, i32 1
  %17 = load %struct.word_desc*, %struct.word_desc** %word20, align 4
  %word21 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %17, i32 0, i32 0
  %18 = load i8*, i8** %word21, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %18, i32 2
  %19 = load i8, i8* %arrayidx22, align 1
  %tobool23 = icmp ne i8 %19, 0
  br i1 %tobool23, label %if.else, label %land.lhs.true24

land.lhs.true24:                                  ; preds = %land.lhs.true19
  %20 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word25 = getelementptr inbounds %struct.word_list, %struct.word_list* %20, i32 0, i32 1
  %21 = load %struct.word_desc*, %struct.word_desc** %word25, align 4
  %word26 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %21, i32 0, i32 0
  %22 = load i8*, i8** %word26, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %23 to i32
  %cmp29 = icmp eq i32 %conv28, 108
  br i1 %cmp29, label %if.then31, label %if.else

if.then31:                                        ; preds = %land.lhs.true24
  %24 = load i32, i32* %flags, align 4
  %or = or i32 %24, 4
  store i32 %or, i32* %flags, align 4
  br label %if.end149

if.else:                                          ; preds = %land.lhs.true24, %land.lhs.true19, %for.body
  %25 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word32 = getelementptr inbounds %struct.word_list, %struct.word_list* %25, i32 0, i32 1
  %26 = load %struct.word_desc*, %struct.word_desc** %word32, align 4
  %word33 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %26, i32 0, i32 0
  %27 = load i8*, i8** %word33, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %28 to i32
  %cmp36 = icmp eq i32 %conv35, 45
  br i1 %cmp36, label %land.lhs.true38, label %if.else52

land.lhs.true38:                                  ; preds = %if.else
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word39 = getelementptr inbounds %struct.word_list, %struct.word_list* %29, i32 0, i32 1
  %30 = load %struct.word_desc*, %struct.word_desc** %word39, align 4
  %word40 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %30, i32 0, i32 0
  %31 = load i8*, i8** %word40, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %31, i32 2
  %32 = load i8, i8* %arrayidx41, align 1
  %tobool42 = icmp ne i8 %32, 0
  br i1 %tobool42, label %if.else52, label %land.lhs.true43

land.lhs.true43:                                  ; preds = %land.lhs.true38
  %33 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word44 = getelementptr inbounds %struct.word_list, %struct.word_list* %33, i32 0, i32 1
  %34 = load %struct.word_desc*, %struct.word_desc** %word44, align 4
  %word45 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %34, i32 0, i32 0
  %35 = load i8*, i8** %word45, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %35, i32 1
  %36 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %36 to i32
  %cmp48 = icmp eq i32 %conv47, 99
  br i1 %cmp48, label %if.then50, label %if.else52

if.then50:                                        ; preds = %land.lhs.true43
  %37 = load i32, i32* %flags, align 4
  %or51 = or i32 %37, 8
  store i32 %or51, i32* %flags, align 4
  br label %if.end148

if.else52:                                        ; preds = %land.lhs.true43, %land.lhs.true38, %if.else
  %38 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word53 = getelementptr inbounds %struct.word_list, %struct.word_list* %38, i32 0, i32 1
  %39 = load %struct.word_desc*, %struct.word_desc** %word53, align 4
  %word54 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %39, i32 0, i32 0
  %40 = load i8*, i8** %word54, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %40, i32 0
  %41 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %41 to i32
  %cmp57 = icmp eq i32 %conv56, 45
  br i1 %cmp57, label %land.lhs.true59, label %if.else73

land.lhs.true59:                                  ; preds = %if.else52
  %42 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word60 = getelementptr inbounds %struct.word_list, %struct.word_list* %42, i32 0, i32 1
  %43 = load %struct.word_desc*, %struct.word_desc** %word60, align 4
  %word61 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %43, i32 0, i32 0
  %44 = load i8*, i8** %word61, align 4
  %arrayidx62 = getelementptr inbounds i8, i8* %44, i32 2
  %45 = load i8, i8* %arrayidx62, align 1
  %tobool63 = icmp ne i8 %45, 0
  br i1 %tobool63, label %if.else73, label %land.lhs.true64

land.lhs.true64:                                  ; preds = %land.lhs.true59
  %46 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word65 = getelementptr inbounds %struct.word_list, %struct.word_list* %46, i32 0, i32 1
  %47 = load %struct.word_desc*, %struct.word_desc** %word65, align 4
  %word66 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %47, i32 0, i32 0
  %48 = load i8*, i8** %word66, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %48, i32 1
  %49 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %49 to i32
  %cmp69 = icmp eq i32 %conv68, 118
  br i1 %cmp69, label %if.then71, label %if.else73

if.then71:                                        ; preds = %land.lhs.true64
  %50 = load i32, i32* %vflag, align 4
  %or72 = or i32 %50, 2
  store i32 %or72, i32* %vflag, align 4
  br label %if.end147

if.else73:                                        ; preds = %land.lhs.true64, %land.lhs.true59, %if.else52
  %51 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word74 = getelementptr inbounds %struct.word_list, %struct.word_list* %51, i32 0, i32 1
  %52 = load %struct.word_desc*, %struct.word_desc** %word74, align 4
  %word75 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %52, i32 0, i32 0
  %53 = load i8*, i8** %word75, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %53, i32 0
  %54 = load i8, i8* %arrayidx76, align 1
  %conv77 = sext i8 %54 to i32
  %cmp78 = icmp eq i32 %conv77, 45
  br i1 %cmp78, label %land.lhs.true80, label %if.else94

land.lhs.true80:                                  ; preds = %if.else73
  %55 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word81 = getelementptr inbounds %struct.word_list, %struct.word_list* %55, i32 0, i32 1
  %56 = load %struct.word_desc*, %struct.word_desc** %word81, align 4
  %word82 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %56, i32 0, i32 0
  %57 = load i8*, i8** %word82, align 4
  %arrayidx83 = getelementptr inbounds i8, i8* %57, i32 2
  %58 = load i8, i8* %arrayidx83, align 1
  %tobool84 = icmp ne i8 %58, 0
  br i1 %tobool84, label %if.else94, label %land.lhs.true85

land.lhs.true85:                                  ; preds = %land.lhs.true80
  %59 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word86 = getelementptr inbounds %struct.word_list, %struct.word_list* %59, i32 0, i32 1
  %60 = load %struct.word_desc*, %struct.word_desc** %word86, align 4
  %word87 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %60, i32 0, i32 0
  %61 = load i8*, i8** %word87, align 4
  %arrayidx88 = getelementptr inbounds i8, i8* %61, i32 1
  %62 = load i8, i8* %arrayidx88, align 1
  %conv89 = sext i8 %62 to i32
  %cmp90 = icmp eq i32 %conv89, 112
  br i1 %cmp90, label %if.then92, label %if.else94

if.then92:                                        ; preds = %land.lhs.true85
  %63 = load i32, i32* %vflag, align 4
  %or93 = or i32 %63, 1
  store i32 %or93, i32* %vflag, align 4
  br label %if.end146

if.else94:                                        ; preds = %land.lhs.true85, %land.lhs.true80, %if.else73
  %64 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word95 = getelementptr inbounds %struct.word_list, %struct.word_list* %64, i32 0, i32 1
  %65 = load %struct.word_desc*, %struct.word_desc** %word95, align 4
  %word96 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %65, i32 0, i32 0
  %66 = load i8*, i8** %word96, align 4
  %arrayidx97 = getelementptr inbounds i8, i8* %66, i32 0
  %67 = load i8, i8* %arrayidx97, align 1
  %conv98 = sext i8 %67 to i32
  %cmp99 = icmp eq i32 %conv98, 45
  br i1 %cmp99, label %land.lhs.true101, label %if.else114

land.lhs.true101:                                 ; preds = %if.else94
  %68 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word102 = getelementptr inbounds %struct.word_list, %struct.word_list* %68, i32 0, i32 1
  %69 = load %struct.word_desc*, %struct.word_desc** %word102, align 4
  %word103 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %69, i32 0, i32 0
  %70 = load i8*, i8** %word103, align 4
  %arrayidx104 = getelementptr inbounds i8, i8* %70, i32 2
  %71 = load i8, i8* %arrayidx104, align 1
  %tobool105 = icmp ne i8 %71, 0
  br i1 %tobool105, label %if.else114, label %land.lhs.true106

land.lhs.true106:                                 ; preds = %land.lhs.true101
  %72 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word107 = getelementptr inbounds %struct.word_list, %struct.word_list* %72, i32 0, i32 1
  %73 = load %struct.word_desc*, %struct.word_desc** %word107, align 4
  %word108 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %73, i32 0, i32 0
  %74 = load i8*, i8** %word108, align 4
  %arrayidx109 = getelementptr inbounds i8, i8* %74, i32 1
  %75 = load i8, i8* %arrayidx109, align 1
  %conv110 = sext i8 %75 to i32
  %cmp111 = icmp eq i32 %conv110, 45
  br i1 %cmp111, label %if.then113, label %if.else114

if.then113:                                       ; preds = %land.lhs.true106
  %76 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %76, i32 0, i32 0
  %77 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %77, %struct.word_list** %list.addr, align 4
  br label %for.end

if.else114:                                       ; preds = %land.lhs.true106, %land.lhs.true101, %if.else94
  %78 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word115 = getelementptr inbounds %struct.word_list, %struct.word_list* %78, i32 0, i32 1
  %79 = load %struct.word_desc*, %struct.word_desc** %word115, align 4
  %word116 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %79, i32 0, i32 0
  %80 = load i8*, i8** %word116, align 4
  %81 = load i8, i8* %80, align 1
  %conv117 = sext i8 %81 to i32
  %cmp118 = icmp eq i32 %conv117, 43
  br i1 %cmp118, label %if.then125, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else114
  %82 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word120 = getelementptr inbounds %struct.word_list, %struct.word_list* %82, i32 0, i32 1
  %83 = load %struct.word_desc*, %struct.word_desc** %word120, align 4
  %word121 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %83, i32 0, i32 0
  %84 = load i8*, i8** %word121, align 4
  %85 = load i8, i8* %84, align 1
  %conv122 = sext i8 %85 to i32
  %cmp123 = icmp eq i32 %conv122, 45
  br i1 %cmp123, label %if.then125, label %if.else141

if.then125:                                       ; preds = %lor.lhs.false, %if.else114
  %86 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word126 = getelementptr inbounds %struct.word_list, %struct.word_list* %86, i32 0, i32 1
  %87 = load %struct.word_desc*, %struct.word_desc** %word126, align 4
  %word127 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %87, i32 0, i32 0
  %88 = load i8*, i8** %word127, align 4
  %add.ptr = getelementptr inbounds i8, i8* %88, i32 1
  store i8* %add.ptr, i8** %w, align 4
  %call128 = call i32 @legal_number(i8* %add.ptr, i64* %i)
  %cmp129 = icmp eq i32 %call128, 0
  br i1 %cmp129, label %if.then131, label %if.end134

if.then131:                                       ; preds = %if.then125
  %89 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word132 = getelementptr inbounds %struct.word_list, %struct.word_list* %89, i32 0, i32 1
  %90 = load %struct.word_desc*, %struct.word_desc** %word132, align 4
  %word133 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %90, i32 0, i32 0
  %91 = load i8*, i8** %word133, align 4
  call void @sh_invalidnum(i8* %91)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end134:                                        ; preds = %if.then125
  %92 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word135 = getelementptr inbounds %struct.word_list, %struct.word_list* %92, i32 0, i32 1
  %93 = load %struct.word_desc*, %struct.word_desc** %word135, align 4
  %word136 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %93, i32 0, i32 0
  %94 = load i8*, i8** %word136, align 4
  %95 = load i8, i8* %94, align 1
  %conv137 = sext i8 %95 to i32
  %cmp138 = icmp eq i32 %conv137, 43
  %cond = select i1 %cmp138, i32 1, i32 -1
  store i32 %cond, i32* %sign, align 4
  %96 = load i64, i64* %i, align 8
  %97 = load i32, i32* %sign, align 4
  %call140 = call i32 @get_dirstack_index(i64 %96, i32 %97, i32* %index_flag)
  store i32 %call140, i32* %desired_index, align 4
  br label %if.end144

if.else141:                                       ; preds = %lor.lhs.false
  %98 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word142 = getelementptr inbounds %struct.word_list, %struct.word_list* %98, i32 0, i32 1
  %99 = load %struct.word_desc*, %struct.word_desc** %word142, align 4
  %word143 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %99, i32 0, i32 0
  %100 = load i8*, i8** %word143, align 4
  call void @sh_invalidopt(i8* %100)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end144:                                        ; preds = %if.end134
  br label %if.end145

if.end145:                                        ; preds = %if.end144
  br label %if.end146

if.end146:                                        ; preds = %if.end145, %if.then92
  br label %if.end147

if.end147:                                        ; preds = %if.end146, %if.then71
  br label %if.end148

if.end148:                                        ; preds = %if.end147, %if.then50
  br label %if.end149

if.end149:                                        ; preds = %if.end148, %if.then31
  br label %for.inc

for.inc:                                          ; preds = %if.end149
  %101 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next150 = getelementptr inbounds %struct.word_list, %struct.word_list* %101, i32 0, i32 0
  %102 = load %struct.word_list*, %struct.word_list** %next150, align 4
  store %struct.word_list* %102, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then113, %for.cond
  %103 = load i32, i32* %flags, align 4
  %and = and i32 %103, 8
  %tobool151 = icmp ne i32 %and, 0
  br i1 %tobool151, label %if.then152, label %if.end153

if.then152:                                       ; preds = %for.end
  call void @clear_directory_stack()
  store i32 0, i32* %retval, align 4
  br label %return

if.end153:                                        ; preds = %for.end
  %104 = load i32, i32* %index_flag, align 4
  %tobool154 = icmp ne i32 %104, 0
  br i1 %tobool154, label %land.lhs.true155, label %if.end162

land.lhs.true155:                                 ; preds = %if.end153
  %105 = load i32, i32* %desired_index, align 4
  %cmp156 = icmp slt i32 %105, 0
  br i1 %cmp156, label %if.then161, label %lor.lhs.false158

lor.lhs.false158:                                 ; preds = %land.lhs.true155
  %106 = load i32, i32* %desired_index, align 4
  %107 = load i32, i32* @directory_list_offset, align 4
  %cmp159 = icmp sgt i32 %106, %107
  br i1 %cmp159, label %if.then161, label %if.end162

if.then161:                                       ; preds = %lor.lhs.false158, %land.lhs.true155
  %108 = load i32, i32* @directory_list_offset, align 4
  %109 = load i8*, i8** %w, align 4
  call void @pushd_error(i32 %108, i8* %109)
  store i32 1, i32* %retval, align 4
  br label %return

if.end162:                                        ; preds = %lor.lhs.false158, %if.end153
  %110 = load i32, i32* %index_flag, align 4
  %cmp163 = icmp eq i32 %110, 0
  br i1 %cmp163, label %if.then171, label %lor.lhs.false165

lor.lhs.false165:                                 ; preds = %if.end162
  %111 = load i32, i32* %index_flag, align 4
  %cmp166 = icmp eq i32 %111, 1
  br i1 %cmp166, label %land.lhs.true168, label %if.end205

land.lhs.true168:                                 ; preds = %lor.lhs.false165
  %112 = load i32, i32* %desired_index, align 4
  %cmp169 = icmp eq i32 %112, 0
  br i1 %cmp169, label %if.then171, label %if.end205

if.then171:                                       ; preds = %land.lhs.true168, %if.end162
  %call172 = call i8* @get_working_directory(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0))
  store i8* %call172, i8** %temp, align 4
  %113 = load i8*, i8** %temp, align 4
  %cmp173 = icmp eq i8* %113, null
  br i1 %cmp173, label %if.then175, label %if.end181

if.then175:                                       ; preds = %if.then171
  %call176 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %call177 = call i32 @strlen(i8* %call176)
  %add = add i32 1, %call177
  %call178 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 480)
  %call179 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %call180 = call i8* @strcpy(i8* %call178, i8* %call179)
  store i8* %call180, i8** %temp, align 4
  br label %if.end181

if.end181:                                        ; preds = %if.then175, %if.then171
  %114 = load i32, i32* %vflag, align 4
  %and182 = and i32 %114, 2
  %tobool183 = icmp ne i32 %and182, 0
  br i1 %tobool183, label %if.then184, label %if.else190

if.then184:                                       ; preds = %if.end181
  %115 = load i32, i32* %flags, align 4
  %and185 = and i32 %115, 4
  %tobool186 = icmp ne i32 %and185, 0
  br i1 %tobool186, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then184
  %116 = load i8*, i8** %temp, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then184
  %117 = load i8*, i8** %temp, align 4
  %call187 = call i8* @polite_directory_format(i8* %117)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond188 = phi i8* [ %116, %cond.true ], [ %call187, %cond.false ]
  %call189 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i32 0, i8* %cond188)
  br label %if.end199

if.else190:                                       ; preds = %if.end181
  %118 = load i32, i32* %flags, align 4
  %and191 = and i32 %118, 4
  %tobool192 = icmp ne i32 %and191, 0
  br i1 %tobool192, label %cond.true193, label %cond.false194

cond.true193:                                     ; preds = %if.else190
  %119 = load i8*, i8** %temp, align 4
  br label %cond.end196

cond.false194:                                    ; preds = %if.else190
  %120 = load i8*, i8** %temp, align 4
  %call195 = call i8* @polite_directory_format(i8* %120)
  br label %cond.end196

cond.end196:                                      ; preds = %cond.false194, %cond.true193
  %cond197 = phi i8* [ %119, %cond.true193 ], [ %call195, %cond.false194 ]
  %call198 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* %cond197)
  br label %if.end199

if.end199:                                        ; preds = %cond.end196, %cond.end
  %121 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %121, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 485)
  %122 = load i32, i32* %index_flag, align 4
  %tobool200 = icmp ne i32 %122, 0
  br i1 %tobool200, label %if.then201, label %if.end204

if.then201:                                       ; preds = %if.end199
  %call202 = call i32 @putchar(i32 10)
  %call203 = call i32 @sh_chkwrite(i32 0)
  store i32 %call203, i32* %retval, align 4
  br label %return

if.end204:                                        ; preds = %if.end199
  br label %if.end205

if.end205:                                        ; preds = %if.end204, %land.lhs.true168, %lor.lhs.false165
  %123 = load i32, i32* %index_flag, align 4
  %tobool206 = icmp ne i32 %123, 0
  br i1 %tobool206, label %if.then207, label %if.else233

if.then207:                                       ; preds = %if.end205
  %124 = load i32, i32* %vflag, align 4
  %and208 = and i32 %124, 2
  %tobool209 = icmp ne i32 %and208, 0
  br i1 %tobool209, label %if.then210, label %if.else221

if.then210:                                       ; preds = %if.then207
  %125 = load i32, i32* @directory_list_offset, align 4
  %126 = load i32, i32* %desired_index, align 4
  %sub = sub nsw i32 %125, %126
  %127 = load i32, i32* %flags, align 4
  %and211 = and i32 %127, 4
  %tobool212 = icmp ne i32 %and211, 0
  br i1 %tobool212, label %cond.true213, label %cond.false215

cond.true213:                                     ; preds = %if.then210
  %128 = load i8**, i8*** @pushd_directory_list, align 4
  %129 = load i32, i32* %desired_index, align 4
  %arrayidx214 = getelementptr inbounds i8*, i8** %128, i32 %129
  %130 = load i8*, i8** %arrayidx214, align 4
  br label %cond.end218

cond.false215:                                    ; preds = %if.then210
  %131 = load i8**, i8*** @pushd_directory_list, align 4
  %132 = load i32, i32* %desired_index, align 4
  %arrayidx216 = getelementptr inbounds i8*, i8** %131, i32 %132
  %133 = load i8*, i8** %arrayidx216, align 4
  %call217 = call i8* @polite_directory_format(i8* %133)
  br label %cond.end218

cond.end218:                                      ; preds = %cond.false215, %cond.true213
  %cond219 = phi i8* [ %130, %cond.true213 ], [ %call217, %cond.false215 ]
  %call220 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i32 %sub, i8* %cond219)
  br label %if.end232

if.else221:                                       ; preds = %if.then207
  %134 = load i32, i32* %flags, align 4
  %and222 = and i32 %134, 4
  %tobool223 = icmp ne i32 %and222, 0
  br i1 %tobool223, label %cond.true224, label %cond.false226

cond.true224:                                     ; preds = %if.else221
  %135 = load i8**, i8*** @pushd_directory_list, align 4
  %136 = load i32, i32* %desired_index, align 4
  %arrayidx225 = getelementptr inbounds i8*, i8** %135, i32 %136
  %137 = load i8*, i8** %arrayidx225, align 4
  br label %cond.end229

cond.false226:                                    ; preds = %if.else221
  %138 = load i8**, i8*** @pushd_directory_list, align 4
  %139 = load i32, i32* %desired_index, align 4
  %arrayidx227 = getelementptr inbounds i8*, i8** %138, i32 %139
  %140 = load i8*, i8** %arrayidx227, align 4
  %call228 = call i8* @polite_directory_format(i8* %140)
  br label %cond.end229

cond.end229:                                      ; preds = %cond.false226, %cond.true224
  %cond230 = phi i8* [ %137, %cond.true224 ], [ %call228, %cond.false226 ]
  %call231 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* %cond230)
  br label %if.end232

if.end232:                                        ; preds = %cond.end229, %cond.end218
  br label %if.end275

if.else233:                                       ; preds = %if.end205
  %141 = load i32, i32* @directory_list_offset, align 4
  %sub234 = sub nsw i32 %141, 1
  %conv235 = sext i32 %sub234 to i64
  store i64 %conv235, i64* %i, align 8
  br label %for.cond236

for.cond236:                                      ; preds = %for.inc273, %if.else233
  %142 = load i64, i64* %i, align 8
  %cmp237 = icmp sge i64 %142, 0
  br i1 %cmp237, label %for.body239, label %for.end274

for.body239:                                      ; preds = %for.cond236
  %143 = load i32, i32* %vflag, align 4
  %cmp240 = icmp sge i32 %143, 2
  br i1 %cmp240, label %if.then242, label %if.else256

if.then242:                                       ; preds = %for.body239
  %144 = load i32, i32* @directory_list_offset, align 4
  %145 = load i64, i64* %i, align 8
  %conv243 = trunc i64 %145 to i32
  %sub244 = sub nsw i32 %144, %conv243
  %146 = load i32, i32* %flags, align 4
  %and245 = and i32 %146, 4
  %tobool246 = icmp ne i32 %and245, 0
  br i1 %tobool246, label %cond.true247, label %cond.false249

cond.true247:                                     ; preds = %if.then242
  %147 = load i8**, i8*** @pushd_directory_list, align 4
  %148 = load i64, i64* %i, align 8
  %idxprom = trunc i64 %148 to i32
  %arrayidx248 = getelementptr inbounds i8*, i8** %147, i32 %idxprom
  %149 = load i8*, i8** %arrayidx248, align 4
  br label %cond.end253

cond.false249:                                    ; preds = %if.then242
  %150 = load i8**, i8*** @pushd_directory_list, align 4
  %151 = load i64, i64* %i, align 8
  %idxprom250 = trunc i64 %151 to i32
  %arrayidx251 = getelementptr inbounds i8*, i8** %150, i32 %idxprom250
  %152 = load i8*, i8** %arrayidx251, align 4
  %call252 = call i8* @polite_directory_format(i8* %152)
  br label %cond.end253

cond.end253:                                      ; preds = %cond.false249, %cond.true247
  %cond254 = phi i8* [ %149, %cond.true247 ], [ %call252, %cond.false249 ]
  %call255 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i32 0, i32 0), i32 %sub244, i8* %cond254)
  br label %if.end272

if.else256:                                       ; preds = %for.body239
  %153 = load i32, i32* %vflag, align 4
  %and257 = and i32 %153, 1
  %tobool258 = icmp ne i32 %and257, 0
  %cond259 = select i1 %tobool258, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i32 0, i32 0)
  %154 = load i32, i32* %flags, align 4
  %and260 = and i32 %154, 4
  %tobool261 = icmp ne i32 %and260, 0
  br i1 %tobool261, label %cond.true262, label %cond.false265

cond.true262:                                     ; preds = %if.else256
  %155 = load i8**, i8*** @pushd_directory_list, align 4
  %156 = load i64, i64* %i, align 8
  %idxprom263 = trunc i64 %156 to i32
  %arrayidx264 = getelementptr inbounds i8*, i8** %155, i32 %idxprom263
  %157 = load i8*, i8** %arrayidx264, align 4
  br label %cond.end269

cond.false265:                                    ; preds = %if.else256
  %158 = load i8**, i8*** @pushd_directory_list, align 4
  %159 = load i64, i64* %i, align 8
  %idxprom266 = trunc i64 %159 to i32
  %arrayidx267 = getelementptr inbounds i8*, i8** %158, i32 %idxprom266
  %160 = load i8*, i8** %arrayidx267, align 4
  %call268 = call i8* @polite_directory_format(i8* %160)
  br label %cond.end269

cond.end269:                                      ; preds = %cond.false265, %cond.true262
  %cond270 = phi i8* [ %157, %cond.true262 ], [ %call268, %cond.false265 ]
  %call271 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %cond259, i8* %cond270)
  br label %if.end272

if.end272:                                        ; preds = %cond.end269, %cond.end253
  br label %for.inc273

for.inc273:                                       ; preds = %if.end272
  %161 = load i64, i64* %i, align 8
  %dec = add nsw i64 %161, -1
  store i64 %dec, i64* %i, align 8
  br label %for.cond236

for.end274:                                       ; preds = %for.cond236
  br label %if.end275

if.end275:                                        ; preds = %for.end274, %if.end232
  %call276 = call i32 @putchar(i32 10)
  %call277 = call i32 @sh_chkwrite(i32 0)
  store i32 %call277, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end275, %if.then201, %if.then161, %if.then152, %if.else141, %if.then131, %if.then
  %162 = load i32, i32* %retval, align 4
  ret i32 %162
}

; Function Attrs: noinline nounwind
define i32 @popd_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %i = alloca i32, align 4
  %which = alloca i64, align 8
  %flags = alloca i32, align 4
  %direction = alloca i8, align 1
  %which_word = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool1 = icmp ne %struct.word_desc* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv5 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %land.lhs.true2
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word9, align 4
  %call = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true7
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true7, %land.lhs.true2, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  store i8* null, i8** %which_word, align 4
  store i32 0, i32* %flags, align 4
  store i64 0, i64* %which, align 8
  store i8 43, i8* %direction, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool12 = icmp ne %struct.word_list* %11, null
  br i1 %tobool12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %13, i32 0, i32 0
  %14 = load i8*, i8** %word14, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %15 to i32
  %cmp17 = icmp eq i32 %conv16, 45
  br i1 %cmp17, label %land.lhs.true19, label %if.else

land.lhs.true19:                                  ; preds = %for.body
  %16 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word20 = getelementptr inbounds %struct.word_list, %struct.word_list* %16, i32 0, i32 1
  %17 = load %struct.word_desc*, %struct.word_desc** %word20, align 4
  %word21 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %17, i32 0, i32 0
  %18 = load i8*, i8** %word21, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %18, i32 2
  %19 = load i8, i8* %arrayidx22, align 1
  %tobool23 = icmp ne i8 %19, 0
  br i1 %tobool23, label %if.else, label %land.lhs.true24

land.lhs.true24:                                  ; preds = %land.lhs.true19
  %20 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word25 = getelementptr inbounds %struct.word_list, %struct.word_list* %20, i32 0, i32 1
  %21 = load %struct.word_desc*, %struct.word_desc** %word25, align 4
  %word26 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %21, i32 0, i32 0
  %22 = load i8*, i8** %word26, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %23 to i32
  %cmp29 = icmp eq i32 %conv28, 110
  br i1 %cmp29, label %if.then31, label %if.else

if.then31:                                        ; preds = %land.lhs.true24
  %24 = load i32, i32* %flags, align 4
  %or = or i32 %24, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end93

if.else:                                          ; preds = %land.lhs.true24, %land.lhs.true19, %for.body
  %25 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word32 = getelementptr inbounds %struct.word_list, %struct.word_list* %25, i32 0, i32 1
  %26 = load %struct.word_desc*, %struct.word_desc** %word32, align 4
  %word33 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %26, i32 0, i32 0
  %27 = load i8*, i8** %word33, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %28 to i32
  %cmp36 = icmp eq i32 %conv35, 45
  br i1 %cmp36, label %land.lhs.true38, label %if.else51

land.lhs.true38:                                  ; preds = %if.else
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word39 = getelementptr inbounds %struct.word_list, %struct.word_list* %29, i32 0, i32 1
  %30 = load %struct.word_desc*, %struct.word_desc** %word39, align 4
  %word40 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %30, i32 0, i32 0
  %31 = load i8*, i8** %word40, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %31, i32 2
  %32 = load i8, i8* %arrayidx41, align 1
  %tobool42 = icmp ne i8 %32, 0
  br i1 %tobool42, label %if.else51, label %land.lhs.true43

land.lhs.true43:                                  ; preds = %land.lhs.true38
  %33 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word44 = getelementptr inbounds %struct.word_list, %struct.word_list* %33, i32 0, i32 1
  %34 = load %struct.word_desc*, %struct.word_desc** %word44, align 4
  %word45 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %34, i32 0, i32 0
  %35 = load i8*, i8** %word45, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %35, i32 1
  %36 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %36 to i32
  %cmp48 = icmp eq i32 %conv47, 45
  br i1 %cmp48, label %if.then50, label %if.else51

if.then50:                                        ; preds = %land.lhs.true43
  %37 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %37, i32 0, i32 0
  %38 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %38, %struct.word_list** %list.addr, align 4
  br label %for.end

if.else51:                                        ; preds = %land.lhs.true43, %land.lhs.true38, %if.else
  %39 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word52 = getelementptr inbounds %struct.word_list, %struct.word_list* %39, i32 0, i32 1
  %40 = load %struct.word_desc*, %struct.word_desc** %word52, align 4
  %word53 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %40, i32 0, i32 0
  %41 = load i8*, i8** %word53, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %41, i32 0
  %42 = load i8, i8* %arrayidx54, align 1
  store i8 %42, i8* %direction, align 1
  %conv55 = sext i8 %42 to i32
  %cmp56 = icmp eq i32 %conv55, 43
  br i1 %cmp56, label %if.then61, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else51
  %43 = load i8, i8* %direction, align 1
  %conv58 = sext i8 %43 to i32
  %cmp59 = icmp eq i32 %conv58, 45
  br i1 %cmp59, label %if.then61, label %if.else73

if.then61:                                        ; preds = %lor.lhs.false, %if.else51
  %44 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word62 = getelementptr inbounds %struct.word_list, %struct.word_list* %44, i32 0, i32 1
  %45 = load %struct.word_desc*, %struct.word_desc** %word62, align 4
  %word63 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %45, i32 0, i32 0
  %46 = load i8*, i8** %word63, align 4
  %add.ptr = getelementptr inbounds i8, i8* %46, i32 1
  %call64 = call i32 @legal_number(i8* %add.ptr, i64* %which)
  %cmp65 = icmp eq i32 %call64, 0
  br i1 %cmp65, label %if.then67, label %if.end70

if.then67:                                        ; preds = %if.then61
  %47 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word68 = getelementptr inbounds %struct.word_list, %struct.word_list* %47, i32 0, i32 1
  %48 = load %struct.word_desc*, %struct.word_desc** %word68, align 4
  %word69 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %48, i32 0, i32 0
  %49 = load i8*, i8** %word69, align 4
  call void @sh_invalidnum(i8* %49)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end70:                                         ; preds = %if.then61
  %50 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word71 = getelementptr inbounds %struct.word_list, %struct.word_list* %50, i32 0, i32 1
  %51 = load %struct.word_desc*, %struct.word_desc** %word71, align 4
  %word72 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %51, i32 0, i32 0
  %52 = load i8*, i8** %word72, align 4
  store i8* %52, i8** %which_word, align 4
  br label %if.end91

if.else73:                                        ; preds = %lor.lhs.false
  %53 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word74 = getelementptr inbounds %struct.word_list, %struct.word_list* %53, i32 0, i32 1
  %54 = load %struct.word_desc*, %struct.word_desc** %word74, align 4
  %word75 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %54, i32 0, i32 0
  %55 = load i8*, i8** %word75, align 4
  %56 = load i8, i8* %55, align 1
  %conv76 = sext i8 %56 to i32
  %cmp77 = icmp eq i32 %conv76, 45
  br i1 %cmp77, label %if.then79, label %if.else82

if.then79:                                        ; preds = %if.else73
  %57 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word80 = getelementptr inbounds %struct.word_list, %struct.word_list* %57, i32 0, i32 1
  %58 = load %struct.word_desc*, %struct.word_desc** %word80, align 4
  %word81 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %58, i32 0, i32 0
  %59 = load i8*, i8** %word81, align 4
  call void @sh_invalidopt(i8* %59)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.else82:                                        ; preds = %if.else73
  %60 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word83 = getelementptr inbounds %struct.word_list, %struct.word_list* %60, i32 0, i32 1
  %61 = load %struct.word_desc*, %struct.word_desc** %word83, align 4
  %word84 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %61, i32 0, i32 0
  %62 = load i8*, i8** %word84, align 4
  %63 = load i8, i8* %62, align 1
  %tobool85 = icmp ne i8 %63, 0
  br i1 %tobool85, label %if.then86, label %if.else90

if.then86:                                        ; preds = %if.else82
  %call87 = call i8* @libintl_gettext(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0))
  %64 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word88 = getelementptr inbounds %struct.word_list, %struct.word_list* %64, i32 0, i32 1
  %65 = load %struct.word_desc*, %struct.word_desc** %word88, align 4
  %word89 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %65, i32 0, i32 0
  %66 = load i8*, i8** %word89, align 4
  call void (i8*, ...) @builtin_error(i8* %call87, i8* %66)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.else90:                                        ; preds = %if.else82
  br label %for.end

if.end91:                                         ; preds = %if.end70
  br label %if.end92

if.end92:                                         ; preds = %if.end91
  br label %if.end93

if.end93:                                         ; preds = %if.end92, %if.then31
  br label %for.inc

for.inc:                                          ; preds = %if.end93
  %67 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next94 = getelementptr inbounds %struct.word_list, %struct.word_list* %67, i32 0, i32 0
  %68 = load %struct.word_list*, %struct.word_list** %next94, align 4
  store %struct.word_list* %68, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %if.else90, %if.then50, %for.cond
  %69 = load i64, i64* %which, align 8
  %70 = load i32, i32* @directory_list_offset, align 4
  %conv95 = sext i32 %70 to i64
  %cmp96 = icmp sgt i64 %69, %conv95
  br i1 %cmp96, label %if.then108, label %lor.lhs.false98

lor.lhs.false98:                                  ; preds = %for.end
  %71 = load i64, i64* %which, align 8
  %72 = load i32, i32* @directory_list_offset, align 4
  %sub = sub nsw i32 0, %72
  %conv99 = sext i32 %sub to i64
  %cmp100 = icmp slt i64 %71, %conv99
  br i1 %cmp100, label %if.then108, label %lor.lhs.false102

lor.lhs.false102:                                 ; preds = %lor.lhs.false98
  %73 = load i32, i32* @directory_list_offset, align 4
  %cmp103 = icmp eq i32 %73, 0
  br i1 %cmp103, label %land.lhs.true105, label %if.end110

land.lhs.true105:                                 ; preds = %lor.lhs.false102
  %74 = load i64, i64* %which, align 8
  %cmp106 = icmp eq i64 %74, 0
  br i1 %cmp106, label %if.then108, label %if.end110

if.then108:                                       ; preds = %land.lhs.true105, %lor.lhs.false98, %for.end
  %75 = load i32, i32* @directory_list_offset, align 4
  %76 = load i8*, i8** %which_word, align 4
  %tobool109 = icmp ne i8* %76, null
  br i1 %tobool109, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then108
  %77 = load i8*, i8** %which_word, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then108
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %77, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.5, i32 0, i32 0), %cond.false ]
  call void @pushd_error(i32 %75, i8* %cond)
  store i32 1, i32* %retval, align 4
  br label %return

if.end110:                                        ; preds = %land.lhs.true105, %lor.lhs.false102
  %78 = load i8, i8* %direction, align 1
  %conv111 = sext i8 %78 to i32
  %cmp112 = icmp eq i32 %conv111, 43
  br i1 %cmp112, label %land.lhs.true114, label %lor.lhs.false117

land.lhs.true114:                                 ; preds = %if.end110
  %79 = load i64, i64* %which, align 8
  %cmp115 = icmp eq i64 %79, 0
  br i1 %cmp115, label %if.then125, label %lor.lhs.false117

lor.lhs.false117:                                 ; preds = %land.lhs.true114, %if.end110
  %80 = load i8, i8* %direction, align 1
  %conv118 = sext i8 %80 to i32
  %cmp119 = icmp eq i32 %conv118, 45
  br i1 %cmp119, label %land.lhs.true121, label %if.else140

land.lhs.true121:                                 ; preds = %lor.lhs.false117
  %81 = load i64, i64* %which, align 8
  %82 = load i32, i32* @directory_list_offset, align 4
  %conv122 = sext i32 %82 to i64
  %cmp123 = icmp eq i64 %81, %conv122
  br i1 %cmp123, label %if.then125, label %if.else140

if.then125:                                       ; preds = %land.lhs.true121, %land.lhs.true114
  %83 = load i32, i32* %flags, align 4
  %and = and i32 %83, 1
  %cmp126 = icmp eq i32 %and, 0
  br i1 %cmp126, label %cond.true128, label %cond.false132

cond.true128:                                     ; preds = %if.then125
  %84 = load i8**, i8*** @pushd_directory_list, align 4
  %85 = load i32, i32* @directory_list_offset, align 4
  %sub129 = sub nsw i32 %85, 1
  %arrayidx130 = getelementptr inbounds i8*, i8** %84, i32 %sub129
  %86 = load i8*, i8** %arrayidx130, align 4
  %call131 = call i32 @cd_to_string(i8* %86)
  br label %cond.end133

cond.false132:                                    ; preds = %if.then125
  br label %cond.end133

cond.end133:                                      ; preds = %cond.false132, %cond.true128
  %cond134 = phi i32 [ %call131, %cond.true128 ], [ 0, %cond.false132 ]
  store i32 %cond134, i32* %i, align 4
  %87 = load i32, i32* %i, align 4
  %cmp135 = icmp ne i32 %87, 0
  br i1 %cmp135, label %if.then137, label %if.end138

if.then137:                                       ; preds = %cond.end133
  %88 = load i32, i32* %i, align 4
  store i32 %88, i32* %retval, align 4
  br label %return

if.end138:                                        ; preds = %cond.end133
  %89 = load i8**, i8*** @pushd_directory_list, align 4
  %90 = load i32, i32* @directory_list_offset, align 4
  %dec = add nsw i32 %90, -1
  store i32 %dec, i32* @directory_list_offset, align 4
  %arrayidx139 = getelementptr inbounds i8*, i8** %89, i32 %dec
  %91 = load i8*, i8** %arrayidx139, align 4
  call void @sh_xfree(i8* %91, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 382)
  br label %if.end173

if.else140:                                       ; preds = %land.lhs.true121, %lor.lhs.false117
  %92 = load i8, i8* %direction, align 1
  %conv141 = sext i8 %92 to i32
  %cmp142 = icmp eq i32 %conv141, 43
  br i1 %cmp142, label %cond.true144, label %cond.false147

cond.true144:                                     ; preds = %if.else140
  %93 = load i32, i32* @directory_list_offset, align 4
  %conv145 = sext i32 %93 to i64
  %94 = load i64, i64* %which, align 8
  %sub146 = sub nsw i64 %conv145, %94
  br label %cond.end148

cond.false147:                                    ; preds = %if.else140
  %95 = load i64, i64* %which, align 8
  br label %cond.end148

cond.end148:                                      ; preds = %cond.false147, %cond.true144
  %cond149 = phi i64 [ %sub146, %cond.true144 ], [ %95, %cond.false147 ]
  %conv150 = trunc i64 %cond149 to i32
  store i32 %conv150, i32* %i, align 4
  %96 = load i32, i32* %i, align 4
  %cmp151 = icmp slt i32 %96, 0
  br i1 %cmp151, label %if.then156, label %lor.lhs.false153

lor.lhs.false153:                                 ; preds = %cond.end148
  %97 = load i32, i32* %i, align 4
  %98 = load i32, i32* @directory_list_offset, align 4
  %cmp154 = icmp sgt i32 %97, %98
  br i1 %cmp154, label %if.then156, label %if.end162

if.then156:                                       ; preds = %lor.lhs.false153, %cond.end148
  %99 = load i32, i32* @directory_list_offset, align 4
  %100 = load i8*, i8** %which_word, align 4
  %tobool157 = icmp ne i8* %100, null
  br i1 %tobool157, label %cond.true158, label %cond.false159

cond.true158:                                     ; preds = %if.then156
  %101 = load i8*, i8** %which_word, align 4
  br label %cond.end160

cond.false159:                                    ; preds = %if.then156
  br label %cond.end160

cond.end160:                                      ; preds = %cond.false159, %cond.true158
  %cond161 = phi i8* [ %101, %cond.true158 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.5, i32 0, i32 0), %cond.false159 ]
  call void @pushd_error(i32 %99, i8* %cond161)
  store i32 1, i32* %retval, align 4
  br label %return

if.end162:                                        ; preds = %lor.lhs.false153
  %102 = load i8**, i8*** @pushd_directory_list, align 4
  %103 = load i32, i32* %i, align 4
  %arrayidx163 = getelementptr inbounds i8*, i8** %102, i32 %103
  %104 = load i8*, i8** %arrayidx163, align 4
  call void @sh_xfree(i8* %104, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 395)
  %105 = load i32, i32* @directory_list_offset, align 4
  %dec164 = add nsw i32 %105, -1
  store i32 %dec164, i32* @directory_list_offset, align 4
  br label %for.cond165

for.cond165:                                      ; preds = %for.inc171, %if.end162
  %106 = load i32, i32* %i, align 4
  %107 = load i32, i32* @directory_list_offset, align 4
  %cmp166 = icmp slt i32 %106, %107
  br i1 %cmp166, label %for.body168, label %for.end172

for.body168:                                      ; preds = %for.cond165
  %108 = load i8**, i8*** @pushd_directory_list, align 4
  %109 = load i32, i32* %i, align 4
  %add = add nsw i32 %109, 1
  %arrayidx169 = getelementptr inbounds i8*, i8** %108, i32 %add
  %110 = load i8*, i8** %arrayidx169, align 4
  %111 = load i8**, i8*** @pushd_directory_list, align 4
  %112 = load i32, i32* %i, align 4
  %arrayidx170 = getelementptr inbounds i8*, i8** %111, i32 %112
  store i8* %110, i8** %arrayidx170, align 4
  br label %for.inc171

for.inc171:                                       ; preds = %for.body168
  %113 = load i32, i32* %i, align 4
  %inc = add nsw i32 %113, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond165

for.end172:                                       ; preds = %for.cond165
  br label %if.end173

if.end173:                                        ; preds = %for.end172, %if.end138
  %call174 = call i32 @dirs_builtin(%struct.word_list* null)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end173, %cond.end160, %if.then137, %cond.end, %if.then86, %if.then79, %if.then67, %if.then
  %114 = load i32, i32* %retval, align 4
  ret i32 %114
}

; Function Attrs: noinline nounwind
define internal i32 @cd_to_string(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %tlist = alloca %struct.word_list*, align 4
  %dir = alloca %struct.word_list*, align 4
  %result = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.word_desc* @make_word(i8* %0)
  %call1 = call %struct.word_list* @make_word_list(%struct.word_desc* %call, %struct.word_list* null)
  store %struct.word_list* %call1, %struct.word_list** %dir, align 4
  %call2 = call %struct.word_desc* @make_word(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0))
  %1 = load %struct.word_list*, %struct.word_list** %dir, align 4
  %call3 = call %struct.word_list* @make_word_list(%struct.word_desc* %call2, %struct.word_list* %1)
  store %struct.word_list* %call3, %struct.word_list** %tlist, align 4
  %2 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  %call4 = call i32 @cd_builtin(%struct.word_list* %2)
  store i32 %call4, i32* %result, align 4
  %3 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  call void @dispose_words(%struct.word_list* %3)
  %4 = load i32, i32* %result, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define internal i32 @get_dirstack_index(i64 %ind, i32 %sign, i32* %indexp) #0 {
entry:
  %retval = alloca i32, align 4
  %ind.addr = alloca i64, align 8
  %sign.addr = alloca i32, align 4
  %indexp.addr = alloca i32*, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i32 %sign, i32* %sign.addr, align 4
  store i32* %indexp, i32** %indexp.addr, align 4
  %0 = load i32*, i32** %indexp.addr, align 4
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %sign.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  %cond = select i1 %cmp, i32 1, i32 2
  %2 = load i32*, i32** %indexp.addr, align 4
  store i32 %cond, i32* %2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i64, i64* %ind.addr, align 8
  %cmp1 = icmp eq i64 %3, 0
  br i1 %cmp1, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %sign.addr, align 4
  %cmp2 = icmp sgt i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %land.lhs.true
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %if.end
  %5 = load i64, i64* %ind.addr, align 8
  %6 = load i32, i32* @directory_list_offset, align 4
  %conv = sext i32 %6 to i64
  %cmp4 = icmp eq i64 %5, %conv
  br i1 %cmp4, label %if.then6, label %if.else13

if.then6:                                         ; preds = %if.else
  %7 = load i32*, i32** %indexp.addr, align 4
  %tobool7 = icmp ne i32* %7, null
  br i1 %tobool7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.then6
  %8 = load i32, i32* %sign.addr, align 4
  %cmp9 = icmp sgt i32 %8, 0
  %cond11 = select i1 %cmp9, i32 2, i32 1
  %9 = load i32*, i32** %indexp.addr, align 4
  store i32 %cond11, i32* %9, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then8, %if.then6
  store i32 0, i32* %retval, align 4
  br label %return

if.else13:                                        ; preds = %if.else
  %10 = load i64, i64* %ind.addr, align 8
  %cmp14 = icmp sge i64 %10, 0
  br i1 %cmp14, label %land.lhs.true16, label %if.else26

land.lhs.true16:                                  ; preds = %if.else13
  %11 = load i64, i64* %ind.addr, align 8
  %12 = load i32, i32* @directory_list_offset, align 4
  %conv17 = sext i32 %12 to i64
  %cmp18 = icmp sle i64 %11, %conv17
  br i1 %cmp18, label %if.then20, label %if.else26

if.then20:                                        ; preds = %land.lhs.true16
  %13 = load i32, i32* %sign.addr, align 4
  %cmp21 = icmp sgt i32 %13, 0
  br i1 %cmp21, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then20
  %14 = load i32, i32* @directory_list_offset, align 4
  %conv23 = sext i32 %14 to i64
  %15 = load i64, i64* %ind.addr, align 8
  %sub = sub nsw i64 %conv23, %15
  br label %cond.end

cond.false:                                       ; preds = %if.then20
  %16 = load i64, i64* %ind.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond24 = phi i64 [ %sub, %cond.true ], [ %16, %cond.false ]
  %conv25 = trunc i64 %cond24 to i32
  store i32 %conv25, i32* %retval, align 4
  br label %return

if.else26:                                        ; preds = %land.lhs.true16, %if.else13
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else26, %cond.end, %if.end12, %if.then3
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind
define internal void @clear_directory_stack() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @directory_list_offset, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8**, i8*** @pushd_directory_list, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 535)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @directory_list_offset, align 4
  ret void
}

declare i32 @printf(i8*, ...) #1

declare i8* @polite_directory_format(i8*) #1

declare i32 @putchar(i32) #1

declare i32 @sh_chkwrite(i32) #1

; Function Attrs: noinline nounwind
define i8* @get_dirstack_from_string(i8* %string) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %ind = alloca i32, align 4
  %sign = alloca i32, align 4
  %index_flag = alloca i32, align 4
  %i = alloca i64, align 8
  store i8* %string, i8** %string.addr, align 4
  store i32 1, i32* %sign, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp eq i32 %conv2, 43
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp eq i32 %conv5, 45
  %cond = select i1 %cmp6, i32 -1, i32 1
  store i32 %cond, i32* %sign, align 4
  %6 = load i8*, i8** %string.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %string.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %7 = load i8*, i8** %string.addr, align 4
  %call = call i32 @legal_number(i8* %7, i64* %i)
  %cmp8 = icmp eq i32 %call, 0
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end
  store i32 0, i32* %index_flag, align 4
  %8 = load i64, i64* %i, align 8
  %9 = load i32, i32* %sign, align 4
  %call12 = call i32 @get_dirstack_index(i64 %8, i32 %9, i32* %index_flag)
  store i32 %call12, i32* %ind, align 4
  %10 = load i32, i32* %index_flag, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %if.end11
  %11 = load i32, i32* %ind, align 4
  %cmp13 = icmp slt i32 %11, 0
  br i1 %cmp13, label %if.then18, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %land.lhs.true
  %12 = load i32, i32* %ind, align 4
  %13 = load i32, i32* @directory_list_offset, align 4
  %cmp16 = icmp sgt i32 %12, %13
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %lor.lhs.false15, %land.lhs.true
  store i8* null, i8** %retval, align 4
  br label %return

if.end19:                                         ; preds = %lor.lhs.false15, %if.end11
  %14 = load i32, i32* %index_flag, align 4
  %cmp20 = icmp eq i32 %14, 0
  br i1 %cmp20, label %if.then28, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %if.end19
  %15 = load i32, i32* %index_flag, align 4
  %cmp23 = icmp eq i32 %15, 1
  br i1 %cmp23, label %land.lhs.true25, label %if.else

land.lhs.true25:                                  ; preds = %lor.lhs.false22
  %16 = load i32, i32* %ind, align 4
  %cmp26 = icmp eq i32 %16, 0
  br i1 %cmp26, label %if.then28, label %if.else

if.then28:                                        ; preds = %land.lhs.true25, %if.end19
  %call29 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0))
  store i8* %call29, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true25, %lor.lhs.false22
  %17 = load i8**, i8*** @pushd_directory_list, align 4
  %18 = load i32, i32* %ind, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %17, i32 %18
  %19 = load i8*, i8** %arrayidx, align 4
  store i8* %19, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then28, %if.then18, %if.then10
  %20 = load i8*, i8** %retval, align 4
  ret i8* %20
}

declare i8* @get_string_value(i8*) #1

; Function Attrs: noinline nounwind
define void @set_dirstack_element(i64 %ind, i32 %sign, i8* %value) #0 {
entry:
  %ind.addr = alloca i64, align 8
  %sign.addr = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i32 %sign, i32* %sign.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i64, i64* %ind.addr, align 8
  %1 = load i32, i32* %sign.addr, align 4
  %call = call i32 @get_dirstack_index(i64 %0, i32 %1, i32* null)
  store i32 %call, i32* %i, align 4
  %2 = load i64, i64* %ind.addr, align 8
  %cmp = icmp eq i64 %2, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %3, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* @directory_list_offset, align 4
  %cmp3 = icmp sgt i32 %4, %5
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %6 = load i8**, i8*** @pushd_directory_list, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx, align 4
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 656)
  %9 = load i8*, i8** %value.addr, align 4
  %call4 = call i32 @strlen(i8* %9)
  %add = add i32 1, %call4
  %call5 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 657)
  %10 = load i8*, i8** %value.addr, align 4
  %call6 = call i8* @strcpy(i8* %call5, i8* %10)
  %11 = load i8**, i8*** @pushd_directory_list, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %11, i32 %12
  store i8* %call6, i8** %arrayidx7, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define %struct.word_list* @get_directory_stack(i32 %flags) #0 {
entry:
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ret = alloca %struct.word_list*, align 4
  %d = alloca i8*, align 4
  %t = alloca i8*, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store %struct.word_list* null, %struct.word_list** %ret, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @directory_list_offset, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %flags.addr, align 4
  %and = and i32 %2, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %3 = load i8**, i8*** @pushd_directory_list, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  %call = call i8* @polite_directory_format(i8* %5)
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %6 = load i8**, i8*** @pushd_directory_list, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx1, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %8, %cond.false ]
  store i8* %cond, i8** %d, align 4
  %9 = load i8*, i8** %d, align 4
  %call2 = call %struct.word_desc* @make_word(i8* %9)
  %10 = load %struct.word_list*, %struct.word_list** %ret, align 4
  %call3 = call %struct.word_list* @make_word_list(%struct.word_desc* %call2, %struct.word_list* %10)
  store %struct.word_list* %call3, %struct.word_list** %ret, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call4 = call i8* @get_working_directory(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.15, i32 0, i32 0))
  store i8* %call4, i8** %d, align 4
  store i32 0, i32* %i, align 4
  %12 = load i8*, i8** %d, align 4
  %cmp5 = icmp eq i8* %12, null
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0), i8** %d, align 4
  br label %if.end10

if.else:                                          ; preds = %for.end
  %13 = load i8*, i8** %d, align 4
  %call6 = call i8* @polite_directory_format(i8* %13)
  store i8* %call6, i8** %t, align 4
  %14 = load i8*, i8** %t, align 4
  %15 = load i8*, i8** %d, align 4
  %cmp7 = icmp ne i8* %14, %15
  br i1 %cmp7, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else
  %16 = load i8*, i8** %d, align 4
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 687)
  %17 = load i8*, i8** %t, align 4
  store i8* %17, i8** %d, align 4
  br label %if.end

if.else9:                                         ; preds = %if.else
  store i32 1, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  br label %if.end10

if.end10:                                         ; preds = %if.end, %if.then
  %18 = load i8*, i8** %d, align 4
  %call11 = call %struct.word_desc* @make_word(i8* %18)
  %19 = load %struct.word_list*, %struct.word_list** %ret, align 4
  %call12 = call %struct.word_list* @make_word_list(%struct.word_desc* %call11, %struct.word_list* %19)
  store %struct.word_list* %call12, %struct.word_list** %ret, align 4
  %20 = load i32, i32* %i, align 4
  %tobool13 = icmp ne i32 %20, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end10
  %21 = load i8*, i8** %d, align 4
  call void @sh_xfree(i8* %21, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 695)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end10
  %22 = load %struct.word_list*, %struct.word_list** %ret, align 4
  ret %struct.word_list* %22
}

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.word_desc* @make_word(i8*) #1

declare void @sh_erange(i8*, i8*) #1

declare void @dispose_words(%struct.word_list*) #1

declare i8** @strvec_resize(i8**, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
