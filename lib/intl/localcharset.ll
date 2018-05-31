; ModuleID = 'localcharset.c'
source_filename = "localcharset.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"ASCII\00", align 1
@charset_aliases = internal global i8* null, align 4
@.str.2 = private unnamed_addr constant [19 x i8] c"/usr/local/libdata\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"charset.alias\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"%50s %50s\00", align 1

; Function Attrs: noinline nounwind
define i8* @locale_charset() #0 {
entry:
  %codeset = alloca i8*, align 4
  %aliases = alloca i8*, align 4
  %call = call i8* @nl_langinfo(i32 14)
  store i8* %call, i8** %codeset, align 4
  %0 = load i8*, i8** %codeset, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** %codeset, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i8* @get_charset_aliases()
  store i8* %call1, i8** %aliases, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i8*, i8** %aliases, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp2 = icmp ne i32 %conv, 0
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %codeset, align 4
  %4 = load i8*, i8** %aliases, align 4
  %call4 = call i32 @strcmp(i8* %3, i8* %4)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then14, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %5 = load i8*, i8** %aliases, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv7 = sext i8 %6 to i32
  %cmp8 = icmp eq i32 %conv7, 42
  br i1 %cmp8, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %lor.lhs.false
  %7 = load i8*, i8** %aliases, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %8 to i32
  %cmp12 = icmp eq i32 %conv11, 0
  br i1 %cmp12, label %if.then14, label %if.end17

if.then14:                                        ; preds = %land.lhs.true, %for.body
  %9 = load i8*, i8** %aliases, align 4
  %10 = load i8*, i8** %aliases, align 4
  %call15 = call i32 @strlen(i8* %10)
  %add.ptr = getelementptr inbounds i8, i8* %9, i32 %call15
  %add.ptr16 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  store i8* %add.ptr16, i8** %codeset, align 4
  br label %for.end

if.end17:                                         ; preds = %land.lhs.true, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %11 = load i8*, i8** %aliases, align 4
  %call18 = call i32 @strlen(i8* %11)
  %add = add i32 %call18, 1
  %12 = load i8*, i8** %aliases, align 4
  %add.ptr19 = getelementptr inbounds i8, i8* %12, i32 %add
  store i8* %add.ptr19, i8** %aliases, align 4
  %13 = load i8*, i8** %aliases, align 4
  %call20 = call i32 @strlen(i8* %13)
  %add21 = add i32 %call20, 1
  %14 = load i8*, i8** %aliases, align 4
  %add.ptr22 = getelementptr inbounds i8, i8* %14, i32 %add21
  store i8* %add.ptr22, i8** %aliases, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then14, %for.cond
  %15 = load i8*, i8** %codeset, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %16 to i32
  %cmp25 = icmp eq i32 %conv24, 0
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %for.end
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8** %codeset, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %for.end
  %17 = load i8*, i8** %codeset, align 4
  ret i8* %17
}

declare i8* @nl_langinfo(i32) #1

declare i32 @strcmp(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @get_charset_aliases() #0 {
entry:
  %cp = alloca i8*, align 4
  %fp = alloca %struct._IO_FILE*, align 4
  %dir = alloca i8*, align 4
  %base = alloca i8*, align 4
  %file_name = alloca i8*, align 4
  %dir_len = alloca i32, align 4
  %base_len = alloca i32, align 4
  %add_slash = alloca i32, align 4
  %c = alloca i32, align 4
  %buf1 = alloca [51 x i8], align 1
  %buf2 = alloca [51 x i8], align 1
  %res_ptr = alloca i8*, align 4
  %res_size = alloca i32, align 4
  %l1 = alloca i32, align 4
  %l2 = alloca i32, align 4
  %0 = load volatile i8*, i8** @charset_aliases, align 4
  store i8* %0, i8** %cp, align 4
  %1 = load i8*, i8** %cp, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end109

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_relocate(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call, i8** %dir, align 4
  store i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i8** %base, align 4
  %2 = load i8*, i8** %dir, align 4
  %call1 = call i32 @strlen(i8* %2)
  store i32 %call1, i32* %dir_len, align 4
  %3 = load i8*, i8** %base, align 4
  %call2 = call i32 @strlen(i8* %3)
  store i32 %call2, i32* %base_len, align 4
  %4 = load i32, i32* %dir_len, align 4
  %cmp3 = icmp ugt i32 %4, 0
  br i1 %cmp3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then
  %5 = load i8*, i8** %dir, align 4
  %6 = load i32, i32* %dir_len, align 4
  %sub = sub i32 %6, 1
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %sub
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %cmp4 = icmp eq i32 %conv, 47
  %lnot = xor i1 %cmp4, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %8 = phi i1 [ false, %if.then ], [ %lnot, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  store i32 %land.ext, i32* %add_slash, align 4
  %9 = load i32, i32* %dir_len, align 4
  %10 = load i32, i32* %add_slash, align 4
  %add = add i32 %9, %10
  %11 = load i32, i32* %base_len, align 4
  %add6 = add i32 %add, %11
  %add7 = add i32 %add6, 1
  %call8 = call i8* @malloc(i32 %add7)
  store i8* %call8, i8** %file_name, align 4
  %12 = load i8*, i8** %file_name, align 4
  %cmp9 = icmp ne i8* %12, null
  br i1 %cmp9, label %if.then11, label %if.end16

if.then11:                                        ; preds = %land.end
  %13 = load i8*, i8** %file_name, align 4
  %14 = load i8*, i8** %dir, align 4
  %15 = load i32, i32* %dir_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %13, i8* %14, i32 %15, i32 1, i1 false)
  %16 = load i32, i32* %add_slash, align 4
  %tobool = icmp ne i32 %16, 0
  br i1 %tobool, label %if.then12, label %if.end

if.then12:                                        ; preds = %if.then11
  %17 = load i8*, i8** %file_name, align 4
  %18 = load i32, i32* %dir_len, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %17, i32 %18
  store i8 47, i8* %arrayidx13, align 1
  br label %if.end

if.end:                                           ; preds = %if.then12, %if.then11
  %19 = load i8*, i8** %file_name, align 4
  %20 = load i32, i32* %dir_len, align 4
  %add.ptr = getelementptr inbounds i8, i8* %19, i32 %20
  %21 = load i32, i32* %add_slash, align 4
  %add.ptr14 = getelementptr inbounds i8, i8* %add.ptr, i32 %21
  %22 = load i8*, i8** %base, align 4
  %23 = load i32, i32* %base_len, align 4
  %add15 = add i32 %23, 1
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr14, i8* %22, i32 %add15, i32 1, i1 false)
  br label %if.end16

if.end16:                                         ; preds = %if.end, %land.end
  %24 = load i8*, i8** %file_name, align 4
  %cmp17 = icmp eq i8* %24, null
  br i1 %cmp17, label %if.then22, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end16
  %25 = load i8*, i8** %file_name, align 4
  %call19 = call %struct._IO_FILE* @fopen(i8* %25, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %call19, %struct._IO_FILE** %fp, align 4
  %cmp20 = icmp eq %struct._IO_FILE* %call19, null
  br i1 %cmp20, label %if.then22, label %if.else

if.then22:                                        ; preds = %lor.lhs.false, %if.end16
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** %cp, align 4
  br label %if.end104

if.else:                                          ; preds = %lor.lhs.false
  store i8* null, i8** %res_ptr, align 4
  store i32 0, i32* %res_size, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end82, %if.end50, %if.then36, %if.else
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call23 = call i32 @getc(%struct._IO_FILE* %26)
  store i32 %call23, i32* %c, align 4
  %27 = load i32, i32* %c, align 4
  %cmp24 = icmp eq i32 %27, -1
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %for.cond
  br label %for.end

if.end27:                                         ; preds = %for.cond
  %28 = load i32, i32* %c, align 4
  %cmp28 = icmp eq i32 %28, 10
  br i1 %cmp28, label %if.then36, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %if.end27
  %29 = load i32, i32* %c, align 4
  %cmp31 = icmp eq i32 %29, 32
  br i1 %cmp31, label %if.then36, label %lor.lhs.false33

lor.lhs.false33:                                  ; preds = %lor.lhs.false30
  %30 = load i32, i32* %c, align 4
  %cmp34 = icmp eq i32 %30, 9
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %lor.lhs.false33, %lor.lhs.false30, %if.end27
  br label %for.cond

if.end37:                                         ; preds = %lor.lhs.false33
  %31 = load i32, i32* %c, align 4
  %cmp38 = icmp eq i32 %31, 35
  br i1 %cmp38, label %if.then40, label %if.end51

if.then40:                                        ; preds = %if.end37
  br label %do.body

do.body:                                          ; preds = %lor.end, %if.then40
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call41 = call i32 @getc(%struct._IO_FILE* %32)
  store i32 %call41, i32* %c, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %33 = load i32, i32* %c, align 4
  %cmp42 = icmp eq i32 %33, -1
  br i1 %cmp42, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %do.cond
  %34 = load i32, i32* %c, align 4
  %cmp44 = icmp eq i32 %34, 10
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %do.cond
  %35 = phi i1 [ true, %do.cond ], [ %cmp44, %lor.rhs ]
  %lnot46 = xor i1 %35, true
  br i1 %lnot46, label %do.body, label %do.end

do.end:                                           ; preds = %lor.end
  %36 = load i32, i32* %c, align 4
  %cmp47 = icmp eq i32 %36, -1
  br i1 %cmp47, label %if.then49, label %if.end50

if.then49:                                        ; preds = %do.end
  br label %for.end

if.end50:                                         ; preds = %do.end
  br label %for.cond

if.end51:                                         ; preds = %if.end37
  %37 = load i32, i32* %c, align 4
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call52 = call i32 @ungetc(i32 %37, %struct._IO_FILE* %38)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %arraydecay = getelementptr inbounds [51 x i8], [51 x i8]* %buf1, i32 0, i32 0
  %arraydecay53 = getelementptr inbounds [51 x i8], [51 x i8]* %buf2, i32 0, i32 0
  %call54 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0), i8* %arraydecay, i8* %arraydecay53)
  %cmp55 = icmp slt i32 %call54, 2
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end51
  br label %for.end

if.end58:                                         ; preds = %if.end51
  %arraydecay59 = getelementptr inbounds [51 x i8], [51 x i8]* %buf1, i32 0, i32 0
  %call60 = call i32 @strlen(i8* %arraydecay59)
  store i32 %call60, i32* %l1, align 4
  %arraydecay61 = getelementptr inbounds [51 x i8], [51 x i8]* %buf2, i32 0, i32 0
  %call62 = call i32 @strlen(i8* %arraydecay61)
  store i32 %call62, i32* %l2, align 4
  %40 = load i32, i32* %res_size, align 4
  %cmp63 = icmp eq i32 %40, 0
  br i1 %cmp63, label %if.then65, label %if.else71

if.then65:                                        ; preds = %if.end58
  %41 = load i32, i32* %l1, align 4
  %add66 = add i32 %41, 1
  %42 = load i32, i32* %l2, align 4
  %add67 = add i32 %add66, %42
  %add68 = add i32 %add67, 1
  store i32 %add68, i32* %res_size, align 4
  %43 = load i32, i32* %res_size, align 4
  %add69 = add i32 %43, 1
  %call70 = call i8* @malloc(i32 %add69)
  store i8* %call70, i8** %res_ptr, align 4
  br label %if.end78

if.else71:                                        ; preds = %if.end58
  %44 = load i32, i32* %l1, align 4
  %add72 = add i32 %44, 1
  %45 = load i32, i32* %l2, align 4
  %add73 = add i32 %add72, %45
  %add74 = add i32 %add73, 1
  %46 = load i32, i32* %res_size, align 4
  %add75 = add i32 %46, %add74
  store i32 %add75, i32* %res_size, align 4
  %47 = load i8*, i8** %res_ptr, align 4
  %48 = load i32, i32* %res_size, align 4
  %add76 = add i32 %48, 1
  %call77 = call i8* @realloc(i8* %47, i32 %add76)
  store i8* %call77, i8** %res_ptr, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.else71, %if.then65
  %49 = load i8*, i8** %res_ptr, align 4
  %cmp79 = icmp eq i8* %49, null
  br i1 %cmp79, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end78
  store i32 0, i32* %res_size, align 4
  br label %for.end

if.end82:                                         ; preds = %if.end78
  %50 = load i8*, i8** %res_ptr, align 4
  %51 = load i32, i32* %res_size, align 4
  %add.ptr83 = getelementptr inbounds i8, i8* %50, i32 %51
  %52 = load i32, i32* %l2, align 4
  %add84 = add i32 %52, 1
  %idx.neg = sub i32 0, %add84
  %add.ptr85 = getelementptr inbounds i8, i8* %add.ptr83, i32 %idx.neg
  %53 = load i32, i32* %l1, align 4
  %add86 = add i32 %53, 1
  %idx.neg87 = sub i32 0, %add86
  %add.ptr88 = getelementptr inbounds i8, i8* %add.ptr85, i32 %idx.neg87
  %arraydecay89 = getelementptr inbounds [51 x i8], [51 x i8]* %buf1, i32 0, i32 0
  %call90 = call i8* @strcpy(i8* %add.ptr88, i8* %arraydecay89)
  %54 = load i8*, i8** %res_ptr, align 4
  %55 = load i32, i32* %res_size, align 4
  %add.ptr91 = getelementptr inbounds i8, i8* %54, i32 %55
  %56 = load i32, i32* %l2, align 4
  %add92 = add i32 %56, 1
  %idx.neg93 = sub i32 0, %add92
  %add.ptr94 = getelementptr inbounds i8, i8* %add.ptr91, i32 %idx.neg93
  %arraydecay95 = getelementptr inbounds [51 x i8], [51 x i8]* %buf2, i32 0, i32 0
  %call96 = call i8* @strcpy(i8* %add.ptr94, i8* %arraydecay95)
  br label %for.cond

for.end:                                          ; preds = %if.then81, %if.then57, %if.then49, %if.then26
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call97 = call i32 @fclose(%struct._IO_FILE* %57)
  %58 = load i32, i32* %res_size, align 4
  %cmp98 = icmp eq i32 %58, 0
  br i1 %cmp98, label %if.then100, label %if.else101

if.then100:                                       ; preds = %for.end
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** %cp, align 4
  br label %if.end103

if.else101:                                       ; preds = %for.end
  %59 = load i8*, i8** %res_ptr, align 4
  %60 = load i32, i32* %res_size, align 4
  %add.ptr102 = getelementptr inbounds i8, i8* %59, i32 %60
  store i8 0, i8* %add.ptr102, align 1
  %61 = load i8*, i8** %res_ptr, align 4
  store i8* %61, i8** %cp, align 4
  br label %if.end103

if.end103:                                        ; preds = %if.else101, %if.then100
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.then22
  %62 = load i8*, i8** %file_name, align 4
  %cmp105 = icmp ne i8* %62, null
  br i1 %cmp105, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end104
  %63 = load i8*, i8** %file_name, align 4
  call void @free(i8* %63)
  br label %if.end108

if.end108:                                        ; preds = %if.then107, %if.end104
  %64 = load i8*, i8** %cp, align 4
  store volatile i8* %64, i8** @charset_aliases, align 4
  br label %if.end109

if.end109:                                        ; preds = %if.end108, %entry
  %65 = load i8*, i8** %cp, align 4
  ret i8* %65
}

declare i8* @libintl_relocate(i8*) #1

declare i8* @malloc(i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @getc(%struct._IO_FILE*) #1

declare i32 @ungetc(i32, %struct._IO_FILE*) #1

declare i32 @fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @realloc(i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare void @free(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
