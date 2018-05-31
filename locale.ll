; ModuleID = 'locale.c'
source_filename = "locale.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@default_locale = internal global i8* null, align 4
@.str.1 = private unnamed_addr constant [9 x i8] c"locale.c\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"bash\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"/usr/local/share/locale\00", align 1
@locale_mb_cur_max = common global i32 0, align 4
@.str.4 = private unnamed_addr constant [9 x i8] c"LC_CTYPE\00", align 1
@lc_all = internal global i8* null, align 4
@.str.5 = private unnamed_addr constant [11 x i8] c"LC_COLLATE\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"LC_MESSAGES\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"LC_NUMERIC\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"LC_TIME\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"TEXTDOMAIN\00", align 1
@default_domain = internal global i8* null, align 4
@default_dir = internal global i8* null, align 4
@.str.10 = private unnamed_addr constant [14 x i8] c"TEXTDOMAINDIR\00", align 1
@.str.11 = private unnamed_addr constant [45 x i8] c"setlocale: LC_ALL: cannot change locale (%s)\00", align 1
@.str.12 = private unnamed_addr constant [49 x i8] c"setlocale: LC_ALL: cannot change locale (%s): %s\00", align 1
@.str.13 = private unnamed_addr constant [41 x i8] c"setlocale: %s: cannot change locale (%s)\00", align 1
@.str.14 = private unnamed_addr constant [45 x i8] c"setlocale: %s: cannot change locale (%s): %s\00", align 1
@lang = internal global i8* null, align 4
@.str.15 = private unnamed_addr constant [7 x i8] c"LC_ALL\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"LANG\00", align 1
@.str.17 = private unnamed_addr constant [6 x i8] c"POSIX\00", align 1
@dump_translatable_strings = external global i32, align 4
@dump_po_strings = external global i32, align 4
@.str.18 = private unnamed_addr constant [4 x i8] c"\22\22\0A\00", align 1
@.str.19 = private unnamed_addr constant [31 x i8] c"#: %s:%d\0Amsgid %s%s\0Amsgstr \22\22\0A\00", align 1
@.str.20 = private unnamed_addr constant [6 x i8] c"\22%s\22\0A\00", align 1
@locale_utf8locale = common global i32 0, align 4
@sh_syntabsiz = external global i32, align 4
@sh_syntaxtab = external global [0 x i32], align 4
@.str.21 = private unnamed_addr constant [11 x i8] c"()<>;&| \09\0A\00", align 1

; Function Attrs: noinline nounwind
define void @set_default_locale() #0 {
entry:
  %call = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  store i8* %call, i8** @default_locale, align 4
  %0 = load i8*, i8** @default_locale, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @default_locale, align 4
  %call1 = call i32 @strlen(i8* %1)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 81)
  %2 = load i8*, i8** @default_locale, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %2)
  store i8* %call3, i8** @default_locale, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call4 = call i8* @libintl_bindtextdomain(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i32 0, i32 0))
  %call5 = call i8* @libintl_textdomain(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  %call6 = call i32 @__ctype_get_mb_cur_max()
  store i32 %call6, i32* @locale_mb_cur_max, align 4
  ret void
}

declare i8* @setlocale(i32, i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @libintl_bindtextdomain(i8*, i8*) #1

declare i8* @libintl_textdomain(i8*) #1

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: noinline nounwind
define void @set_default_locale_vars() #0 {
entry:
  %val = alloca i8*, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  store i8* %call, i8** %val, align 4
  %0 = load i8*, i8** %val, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @lc_all, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load i8*, i8** @lc_all, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true1
  %4 = load i8*, i8** @lc_all, align 4
  %call3 = call i8* @setlocale(i32 0, i8* %4)
  call void @locale_setblanks()
  %call4 = call i32 @__ctype_get_mb_cur_max()
  store i32 %call4, i32* @locale_mb_cur_max, align 4
  call void @u32reset()
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true1, %land.lhs.true, %entry
  %call5 = call i8* @get_string_value(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0))
  store i8* %call5, i8** %val, align 4
  %5 = load i8*, i8** %val, align 4
  %cmp6 = icmp eq i8* %5, null
  br i1 %cmp6, label %land.lhs.true8, label %if.end15

land.lhs.true8:                                   ; preds = %if.end
  %6 = load i8*, i8** @lc_all, align 4
  %tobool9 = icmp ne i8* %6, null
  br i1 %tobool9, label %land.lhs.true10, label %if.end15

land.lhs.true10:                                  ; preds = %land.lhs.true8
  %7 = load i8*, i8** @lc_all, align 4
  %8 = load i8, i8* %7, align 1
  %conv11 = sext i8 %8 to i32
  %tobool12 = icmp ne i32 %conv11, 0
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %land.lhs.true10
  %9 = load i8*, i8** @lc_all, align 4
  %call14 = call i8* @setlocale(i32 3, i8* %9)
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %land.lhs.true10, %land.lhs.true8, %if.end
  %call16 = call i8* @get_string_value(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0))
  store i8* %call16, i8** %val, align 4
  %10 = load i8*, i8** %val, align 4
  %cmp17 = icmp eq i8* %10, null
  br i1 %cmp17, label %land.lhs.true19, label %if.end26

land.lhs.true19:                                  ; preds = %if.end15
  %11 = load i8*, i8** @lc_all, align 4
  %tobool20 = icmp ne i8* %11, null
  br i1 %tobool20, label %land.lhs.true21, label %if.end26

land.lhs.true21:                                  ; preds = %land.lhs.true19
  %12 = load i8*, i8** @lc_all, align 4
  %13 = load i8, i8* %12, align 1
  %conv22 = sext i8 %13 to i32
  %tobool23 = icmp ne i32 %conv22, 0
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %land.lhs.true21
  %14 = load i8*, i8** @lc_all, align 4
  %call25 = call i8* @setlocale(i32 5, i8* %14)
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %land.lhs.true21, %land.lhs.true19, %if.end15
  %call27 = call i8* @get_string_value(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0))
  store i8* %call27, i8** %val, align 4
  %15 = load i8*, i8** %val, align 4
  %cmp28 = icmp eq i8* %15, null
  br i1 %cmp28, label %land.lhs.true30, label %if.end37

land.lhs.true30:                                  ; preds = %if.end26
  %16 = load i8*, i8** @lc_all, align 4
  %tobool31 = icmp ne i8* %16, null
  br i1 %tobool31, label %land.lhs.true32, label %if.end37

land.lhs.true32:                                  ; preds = %land.lhs.true30
  %17 = load i8*, i8** @lc_all, align 4
  %18 = load i8, i8* %17, align 1
  %conv33 = sext i8 %18 to i32
  %tobool34 = icmp ne i32 %conv33, 0
  br i1 %tobool34, label %if.then35, label %if.end37

if.then35:                                        ; preds = %land.lhs.true32
  %19 = load i8*, i8** @lc_all, align 4
  %call36 = call i8* @setlocale(i32 1, i8* %19)
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %land.lhs.true32, %land.lhs.true30, %if.end26
  %call38 = call i8* @get_string_value(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0))
  store i8* %call38, i8** %val, align 4
  %20 = load i8*, i8** %val, align 4
  %cmp39 = icmp eq i8* %20, null
  br i1 %cmp39, label %land.lhs.true41, label %if.end48

land.lhs.true41:                                  ; preds = %if.end37
  %21 = load i8*, i8** @lc_all, align 4
  %tobool42 = icmp ne i8* %21, null
  br i1 %tobool42, label %land.lhs.true43, label %if.end48

land.lhs.true43:                                  ; preds = %land.lhs.true41
  %22 = load i8*, i8** @lc_all, align 4
  %23 = load i8, i8* %22, align 1
  %conv44 = sext i8 %23 to i32
  %tobool45 = icmp ne i32 %conv44, 0
  br i1 %tobool45, label %if.then46, label %if.end48

if.then46:                                        ; preds = %land.lhs.true43
  %24 = load i8*, i8** @lc_all, align 4
  %call47 = call i8* @setlocale(i32 2, i8* %24)
  br label %if.end48

if.end48:                                         ; preds = %if.then46, %land.lhs.true43, %land.lhs.true41, %if.end37
  %call49 = call i8* @get_string_value(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i32 0, i32 0))
  store i8* %call49, i8** %val, align 4
  %25 = load i8*, i8** %val, align 4
  %tobool50 = icmp ne i8* %25, null
  br i1 %tobool50, label %land.lhs.true51, label %if.end68

land.lhs.true51:                                  ; preds = %if.end48
  %26 = load i8*, i8** %val, align 4
  %27 = load i8, i8* %26, align 1
  %conv52 = sext i8 %27 to i32
  %tobool53 = icmp ne i32 %conv52, 0
  br i1 %tobool53, label %if.then54, label %if.end68

if.then54:                                        ; preds = %land.lhs.true51
  br label %do.body

do.body:                                          ; preds = %if.then54
  %28 = load i8*, i8** @default_domain, align 4
  %tobool55 = icmp ne i8* %28, null
  br i1 %tobool55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %do.body
  %29 = load i8*, i8** @default_domain, align 4
  call void @sh_xfree(i8* %29, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 139)
  br label %if.end57

if.end57:                                         ; preds = %if.then56, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end57
  %30 = load i8*, i8** %val, align 4
  %call58 = call i32 @strlen(i8* %30)
  %add = add i32 1, %call58
  %call59 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 140)
  %31 = load i8*, i8** %val, align 4
  %call60 = call i8* @strcpy(i8* %call59, i8* %31)
  store i8* %call60, i8** @default_domain, align 4
  %32 = load i8*, i8** @default_dir, align 4
  %tobool61 = icmp ne i8* %32, null
  br i1 %tobool61, label %land.lhs.true62, label %if.end67

land.lhs.true62:                                  ; preds = %do.end
  %33 = load i8*, i8** @default_dir, align 4
  %34 = load i8, i8* %33, align 1
  %conv63 = sext i8 %34 to i32
  %tobool64 = icmp ne i32 %conv63, 0
  br i1 %tobool64, label %if.then65, label %if.end67

if.then65:                                        ; preds = %land.lhs.true62
  %35 = load i8*, i8** @default_domain, align 4
  %36 = load i8*, i8** @default_dir, align 4
  %call66 = call i8* @libintl_bindtextdomain(i8* %35, i8* %36)
  br label %if.end67

if.end67:                                         ; preds = %if.then65, %land.lhs.true62, %do.end
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %land.lhs.true51, %if.end48
  %call69 = call i8* @get_string_value(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0))
  store i8* %call69, i8** %val, align 4
  %37 = load i8*, i8** %val, align 4
  %tobool70 = icmp ne i8* %37, null
  br i1 %tobool70, label %land.lhs.true71, label %if.end91

land.lhs.true71:                                  ; preds = %if.end68
  %38 = load i8*, i8** %val, align 4
  %39 = load i8, i8* %38, align 1
  %conv72 = sext i8 %39 to i32
  %tobool73 = icmp ne i32 %conv72, 0
  br i1 %tobool73, label %if.then74, label %if.end91

if.then74:                                        ; preds = %land.lhs.true71
  br label %do.body75

do.body75:                                        ; preds = %if.then74
  %40 = load i8*, i8** @default_dir, align 4
  %tobool76 = icmp ne i8* %40, null
  br i1 %tobool76, label %if.then77, label %if.end78

if.then77:                                        ; preds = %do.body75
  %41 = load i8*, i8** @default_dir, align 4
  call void @sh_xfree(i8* %41, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 148)
  br label %if.end78

if.end78:                                         ; preds = %if.then77, %do.body75
  br label %do.end79

do.end79:                                         ; preds = %if.end78
  %42 = load i8*, i8** %val, align 4
  %call80 = call i32 @strlen(i8* %42)
  %add81 = add i32 1, %call80
  %call82 = call i8* @sh_xmalloc(i32 %add81, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 149)
  %43 = load i8*, i8** %val, align 4
  %call83 = call i8* @strcpy(i8* %call82, i8* %43)
  store i8* %call83, i8** @default_dir, align 4
  %44 = load i8*, i8** @default_domain, align 4
  %tobool84 = icmp ne i8* %44, null
  br i1 %tobool84, label %land.lhs.true85, label %if.end90

land.lhs.true85:                                  ; preds = %do.end79
  %45 = load i8*, i8** @default_domain, align 4
  %46 = load i8, i8* %45, align 1
  %conv86 = sext i8 %46 to i32
  %tobool87 = icmp ne i32 %conv86, 0
  br i1 %tobool87, label %if.then88, label %if.end90

if.then88:                                        ; preds = %land.lhs.true85
  %47 = load i8*, i8** @default_domain, align 4
  %48 = load i8*, i8** @default_dir, align 4
  %call89 = call i8* @libintl_bindtextdomain(i8* %47, i8* %48)
  br label %if.end90

if.end90:                                         ; preds = %if.then88, %land.lhs.true85, %do.end79
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %land.lhs.true71, %if.end68
  ret void
}

declare i8* @get_string_value(i8*) #1

; Function Attrs: noinline nounwind
define internal void @locale_setblanks() #0 {
entry:
  %x = alloca i32, align 4
  store i32 0, i32* %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %x, align 4
  %1 = load i32, i32* @sh_syntabsiz, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %x, align 4
  %conv = trunc i32 %2 to i8
  %conv1 = zext i8 %conv to i32
  %call = call i32 @isblank(i32 %conv1) #3
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %x, align 4
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %3
  %4 = load i32, i32* %arrayidx, align 4
  %or = or i32 %4, 8194
  store i32 %or, i32* %arrayidx, align 4
  br label %if.end13

if.else:                                          ; preds = %for.body
  %5 = load i32, i32* %x, align 4
  %tobool2 = icmp ne i32 %5, 0
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %6 = load i32, i32* %x, align 4
  %call3 = call i8* @mbschr(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.21, i32 0, i32 0), i32 %6)
  %cmp4 = icmp ne i8* %call3, null
  br i1 %cmp4, label %if.then6, label %if.else10

cond.false:                                       ; preds = %if.else
  br i1 false, label %if.then6, label %if.else10

if.then6:                                         ; preds = %cond.false, %cond.true
  %7 = load i32, i32* %x, align 4
  %arrayidx7 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %7
  %8 = load i32, i32* %arrayidx7, align 4
  %or8 = or i32 %8, 2
  store i32 %or8, i32* %arrayidx7, align 4
  %9 = load i32, i32* %x, align 4
  %arrayidx9 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %9
  %10 = load i32, i32* %arrayidx9, align 4
  %and = and i32 %10, -8193
  store i32 %and, i32* %arrayidx9, align 4
  br label %if.end

if.else10:                                        ; preds = %cond.false, %cond.true
  %11 = load i32, i32* %x, align 4
  %arrayidx11 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %11
  %12 = load i32, i32* %arrayidx11, align 4
  %and12 = and i32 %12, -8195
  store i32 %and12, i32* %arrayidx11, align 4
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then6
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end13
  %13 = load i32, i32* %x, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @u32reset() #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @set_locale_var(i8* %var, i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %var.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %r = alloca i32, align 4
  %x = alloca i8*, align 4
  store i8* %var, i8** %var.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** %x, align 4
  %call = call i32* @__errno_location()
  store i32 0, i32* %call, align 4
  %0 = load i8*, i8** %var.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 84
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %var.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 10
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  br label %do.body

do.body:                                          ; preds = %if.then
  %4 = load i8*, i8** @default_domain, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then6, label %if.end

if.then6:                                         ; preds = %do.body
  %5 = load i8*, i8** @default_domain, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 168)
  br label %if.end

if.end:                                           ; preds = %if.then6, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %6 = load i8*, i8** %value.addr, align 4
  %tobool7 = icmp ne i8* %6, null
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end
  %7 = load i8*, i8** %value.addr, align 4
  %call8 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call8
  %call9 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 169)
  %8 = load i8*, i8** %value.addr, align 4
  %call10 = call i8* @strcpy(i8* %call9, i8* %8)
  br label %cond.end

cond.false:                                       ; preds = %do.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call10, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** @default_domain, align 4
  %9 = load i8*, i8** @default_dir, align 4
  %tobool11 = icmp ne i8* %9, null
  br i1 %tobool11, label %land.lhs.true12, label %if.end17

land.lhs.true12:                                  ; preds = %cond.end
  %10 = load i8*, i8** @default_dir, align 4
  %11 = load i8, i8* %10, align 1
  %conv13 = sext i8 %11 to i32
  %tobool14 = icmp ne i32 %conv13, 0
  br i1 %tobool14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %land.lhs.true12
  %12 = load i8*, i8** @default_domain, align 4
  %13 = load i8*, i8** @default_dir, align 4
  %call16 = call i8* @libintl_bindtextdomain(i8* %12, i8* %13)
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %land.lhs.true12, %cond.end
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %14 = load i8*, i8** %var.addr, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %15 to i32
  %cmp20 = icmp eq i32 %conv19, 84
  br i1 %cmp20, label %if.then22, label %if.else44

if.then22:                                        ; preds = %if.else
  br label %do.body23

do.body23:                                        ; preds = %if.then22
  %16 = load i8*, i8** @default_dir, align 4
  %tobool24 = icmp ne i8* %16, null
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %do.body23
  %17 = load i8*, i8** @default_dir, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 176)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %do.body23
  br label %do.end27

do.end27:                                         ; preds = %if.end26
  %18 = load i8*, i8** %value.addr, align 4
  %tobool28 = icmp ne i8* %18, null
  br i1 %tobool28, label %cond.true29, label %cond.false34

cond.true29:                                      ; preds = %do.end27
  %19 = load i8*, i8** %value.addr, align 4
  %call30 = call i32 @strlen(i8* %19)
  %add31 = add i32 1, %call30
  %call32 = call i8* @sh_xmalloc(i32 %add31, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 177)
  %20 = load i8*, i8** %value.addr, align 4
  %call33 = call i8* @strcpy(i8* %call32, i8* %20)
  br label %cond.end35

cond.false34:                                     ; preds = %do.end27
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false34, %cond.true29
  %cond36 = phi i8* [ %call33, %cond.true29 ], [ null, %cond.false34 ]
  store i8* %cond36, i8** @default_dir, align 4
  %21 = load i8*, i8** @default_domain, align 4
  %tobool37 = icmp ne i8* %21, null
  br i1 %tobool37, label %land.lhs.true38, label %if.end43

land.lhs.true38:                                  ; preds = %cond.end35
  %22 = load i8*, i8** @default_domain, align 4
  %23 = load i8, i8* %22, align 1
  %conv39 = sext i8 %23 to i32
  %tobool40 = icmp ne i32 %conv39, 0
  br i1 %tobool40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %land.lhs.true38
  %24 = load i8*, i8** @default_domain, align 4
  %25 = load i8*, i8** @default_dir, align 4
  %call42 = call i8* @libintl_bindtextdomain(i8* %24, i8* %25)
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %land.lhs.true38, %cond.end35
  store i32 1, i32* %retval, align 4
  br label %return

if.else44:                                        ; preds = %if.else
  %26 = load i8*, i8** %var.addr, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %26, i32 3
  %27 = load i8, i8* %arrayidx45, align 1
  %conv46 = sext i8 %27 to i32
  %cmp47 = icmp eq i32 %conv46, 65
  br i1 %cmp47, label %if.then49, label %if.else90

if.then49:                                        ; preds = %if.else44
  br label %do.body50

do.body50:                                        ; preds = %if.then49
  %28 = load i8*, i8** @lc_all, align 4
  %tobool51 = icmp ne i8* %28, null
  br i1 %tobool51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %do.body50
  %29 = load i8*, i8** @lc_all, align 4
  call void @sh_xfree(i8* %29, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 187)
  br label %if.end53

if.end53:                                         ; preds = %if.then52, %do.body50
  br label %do.end54

do.end54:                                         ; preds = %if.end53
  %30 = load i8*, i8** %value.addr, align 4
  %tobool55 = icmp ne i8* %30, null
  br i1 %tobool55, label %if.then56, label %if.else61

if.then56:                                        ; preds = %do.end54
  %31 = load i8*, i8** %value.addr, align 4
  %call57 = call i32 @strlen(i8* %31)
  %add58 = add i32 1, %call57
  %call59 = call i8* @sh_xmalloc(i32 %add58, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 189)
  %32 = load i8*, i8** %value.addr, align 4
  %call60 = call i8* @strcpy(i8* %call59, i8* %32)
  store i8* %call60, i8** @lc_all, align 4
  br label %if.end64

if.else61:                                        ; preds = %do.end54
  %call62 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 192)
  store i8* %call62, i8** @lc_all, align 4
  %33 = load i8*, i8** @lc_all, align 4
  %arrayidx63 = getelementptr inbounds i8, i8* %33, i32 0
  store i8 0, i8* %arrayidx63, align 1
  br label %if.end64

if.end64:                                         ; preds = %if.else61, %if.then56
  %34 = load i8*, i8** @lc_all, align 4
  %35 = load i8, i8* %34, align 1
  %conv65 = sext i8 %35 to i32
  %tobool66 = icmp ne i32 %conv65, 0
  br i1 %tobool66, label %cond.true67, label %cond.false71

cond.true67:                                      ; preds = %if.end64
  %36 = load i8*, i8** @lc_all, align 4
  %call68 = call i8* @setlocale(i32 6, i8* %36)
  store i8* %call68, i8** %x, align 4
  %cmp69 = icmp ne i8* %call68, null
  %conv70 = zext i1 %cmp69 to i32
  br label %cond.end73

cond.false71:                                     ; preds = %if.end64
  %call72 = call i32 @reset_locale_vars()
  br label %cond.end73

cond.end73:                                       ; preds = %cond.false71, %cond.true67
  %cond74 = phi i32 [ %conv70, %cond.true67 ], [ %call72, %cond.false71 ]
  store i32 %cond74, i32* %r, align 4
  %37 = load i8*, i8** %x, align 4
  %cmp75 = icmp eq i8* %37, null
  br i1 %cmp75, label %if.then77, label %if.end88

if.then77:                                        ; preds = %cond.end73
  %call78 = call i32* @__errno_location()
  %38 = load i32, i32* %call78, align 4
  %cmp79 = icmp eq i32 %38, 0
  br i1 %cmp79, label %if.then81, label %if.else83

if.then81:                                        ; preds = %if.then77
  %call82 = call i8* @libintl_gettext(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.11, i32 0, i32 0))
  %39 = load i8*, i8** @lc_all, align 4
  call void (i8*, ...) @internal_warning(i8* %call82, i8* %39)
  br label %if.end87

if.else83:                                        ; preds = %if.then77
  %call84 = call i8* @libintl_gettext(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.12, i32 0, i32 0))
  %40 = load i8*, i8** @lc_all, align 4
  %call85 = call i32* @__errno_location()
  %41 = load i32, i32* %call85, align 4
  %call86 = call i8* @strerror(i32 %41)
  call void (i8*, ...) @internal_warning(i8* %call84, i8* %40, i8* %call86)
  br label %if.end87

if.end87:                                         ; preds = %if.else83, %if.then81
  br label %if.end88

if.end88:                                         ; preds = %if.end87, %cond.end73
  call void @locale_setblanks()
  %call89 = call i32 @__ctype_get_mb_cur_max()
  store i32 %call89, i32* @locale_mb_cur_max, align 4
  call void @u32reset()
  %42 = load i32, i32* %r, align 4
  store i32 %42, i32* %retval, align 4
  br label %return

if.else90:                                        ; preds = %if.else44
  %43 = load i8*, i8** %var.addr, align 4
  %arrayidx91 = getelementptr inbounds i8, i8* %43, i32 3
  %44 = load i8, i8* %arrayidx91, align 1
  %conv92 = sext i8 %44 to i32
  %cmp93 = icmp eq i32 %conv92, 67
  br i1 %cmp93, label %land.lhs.true95, label %if.else111

land.lhs.true95:                                  ; preds = %if.else90
  %45 = load i8*, i8** %var.addr, align 4
  %arrayidx96 = getelementptr inbounds i8, i8* %45, i32 4
  %46 = load i8, i8* %arrayidx96, align 1
  %conv97 = sext i8 %46 to i32
  %cmp98 = icmp eq i32 %conv97, 84
  br i1 %cmp98, label %if.then100, label %if.else111

if.then100:                                       ; preds = %land.lhs.true95
  %47 = load i8*, i8** @lc_all, align 4
  %cmp101 = icmp eq i8* %47, null
  br i1 %cmp101, label %if.then106, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then100
  %48 = load i8*, i8** @lc_all, align 4
  %49 = load i8, i8* %48, align 1
  %conv103 = sext i8 %49 to i32
  %cmp104 = icmp eq i32 %conv103, 0
  br i1 %cmp104, label %if.then106, label %if.end110

if.then106:                                       ; preds = %lor.lhs.false, %if.then100
  %call107 = call i8* @get_locale_var(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  %call108 = call i8* @setlocale(i32 0, i8* %call107)
  store i8* %call108, i8** %x, align 4
  call void @locale_setblanks()
  %call109 = call i32 @__ctype_get_mb_cur_max()
  store i32 %call109, i32* @locale_mb_cur_max, align 4
  call void @u32reset()
  br label %if.end110

if.end110:                                        ; preds = %if.then106, %lor.lhs.false
  br label %if.end199

if.else111:                                       ; preds = %land.lhs.true95, %if.else90
  %50 = load i8*, i8** %var.addr, align 4
  %arrayidx112 = getelementptr inbounds i8, i8* %50, i32 3
  %51 = load i8, i8* %arrayidx112, align 1
  %conv113 = sext i8 %51 to i32
  %cmp114 = icmp eq i32 %conv113, 67
  br i1 %cmp114, label %land.lhs.true116, label %if.else132

land.lhs.true116:                                 ; preds = %if.else111
  %52 = load i8*, i8** %var.addr, align 4
  %arrayidx117 = getelementptr inbounds i8, i8* %52, i32 4
  %53 = load i8, i8* %arrayidx117, align 1
  %conv118 = sext i8 %53 to i32
  %cmp119 = icmp eq i32 %conv118, 79
  br i1 %cmp119, label %if.then121, label %if.else132

if.then121:                                       ; preds = %land.lhs.true116
  %54 = load i8*, i8** @lc_all, align 4
  %cmp122 = icmp eq i8* %54, null
  br i1 %cmp122, label %if.then128, label %lor.lhs.false124

lor.lhs.false124:                                 ; preds = %if.then121
  %55 = load i8*, i8** @lc_all, align 4
  %56 = load i8, i8* %55, align 1
  %conv125 = sext i8 %56 to i32
  %cmp126 = icmp eq i32 %conv125, 0
  br i1 %cmp126, label %if.then128, label %if.end131

if.then128:                                       ; preds = %lor.lhs.false124, %if.then121
  %call129 = call i8* @get_locale_var(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0))
  %call130 = call i8* @setlocale(i32 3, i8* %call129)
  store i8* %call130, i8** %x, align 4
  br label %if.end131

if.end131:                                        ; preds = %if.then128, %lor.lhs.false124
  br label %if.end198

if.else132:                                       ; preds = %land.lhs.true116, %if.else111
  %57 = load i8*, i8** %var.addr, align 4
  %arrayidx133 = getelementptr inbounds i8, i8* %57, i32 3
  %58 = load i8, i8* %arrayidx133, align 1
  %conv134 = sext i8 %58 to i32
  %cmp135 = icmp eq i32 %conv134, 77
  br i1 %cmp135, label %land.lhs.true137, label %if.else153

land.lhs.true137:                                 ; preds = %if.else132
  %59 = load i8*, i8** %var.addr, align 4
  %arrayidx138 = getelementptr inbounds i8, i8* %59, i32 4
  %60 = load i8, i8* %arrayidx138, align 1
  %conv139 = sext i8 %60 to i32
  %cmp140 = icmp eq i32 %conv139, 69
  br i1 %cmp140, label %if.then142, label %if.else153

if.then142:                                       ; preds = %land.lhs.true137
  %61 = load i8*, i8** @lc_all, align 4
  %cmp143 = icmp eq i8* %61, null
  br i1 %cmp143, label %if.then149, label %lor.lhs.false145

lor.lhs.false145:                                 ; preds = %if.then142
  %62 = load i8*, i8** @lc_all, align 4
  %63 = load i8, i8* %62, align 1
  %conv146 = sext i8 %63 to i32
  %cmp147 = icmp eq i32 %conv146, 0
  br i1 %cmp147, label %if.then149, label %if.end152

if.then149:                                       ; preds = %lor.lhs.false145, %if.then142
  %call150 = call i8* @get_locale_var(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0))
  %call151 = call i8* @setlocale(i32 5, i8* %call150)
  store i8* %call151, i8** %x, align 4
  br label %if.end152

if.end152:                                        ; preds = %if.then149, %lor.lhs.false145
  br label %if.end197

if.else153:                                       ; preds = %land.lhs.true137, %if.else132
  %64 = load i8*, i8** %var.addr, align 4
  %arrayidx154 = getelementptr inbounds i8, i8* %64, i32 3
  %65 = load i8, i8* %arrayidx154, align 1
  %conv155 = sext i8 %65 to i32
  %cmp156 = icmp eq i32 %conv155, 78
  br i1 %cmp156, label %land.lhs.true158, label %if.else174

land.lhs.true158:                                 ; preds = %if.else153
  %66 = load i8*, i8** %var.addr, align 4
  %arrayidx159 = getelementptr inbounds i8, i8* %66, i32 4
  %67 = load i8, i8* %arrayidx159, align 1
  %conv160 = sext i8 %67 to i32
  %cmp161 = icmp eq i32 %conv160, 85
  br i1 %cmp161, label %if.then163, label %if.else174

if.then163:                                       ; preds = %land.lhs.true158
  %68 = load i8*, i8** @lc_all, align 4
  %cmp164 = icmp eq i8* %68, null
  br i1 %cmp164, label %if.then170, label %lor.lhs.false166

lor.lhs.false166:                                 ; preds = %if.then163
  %69 = load i8*, i8** @lc_all, align 4
  %70 = load i8, i8* %69, align 1
  %conv167 = sext i8 %70 to i32
  %cmp168 = icmp eq i32 %conv167, 0
  br i1 %cmp168, label %if.then170, label %if.end173

if.then170:                                       ; preds = %lor.lhs.false166, %if.then163
  %call171 = call i8* @get_locale_var(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0))
  %call172 = call i8* @setlocale(i32 1, i8* %call171)
  store i8* %call172, i8** %x, align 4
  br label %if.end173

if.end173:                                        ; preds = %if.then170, %lor.lhs.false166
  br label %if.end196

if.else174:                                       ; preds = %land.lhs.true158, %if.else153
  %71 = load i8*, i8** %var.addr, align 4
  %arrayidx175 = getelementptr inbounds i8, i8* %71, i32 3
  %72 = load i8, i8* %arrayidx175, align 1
  %conv176 = sext i8 %72 to i32
  %cmp177 = icmp eq i32 %conv176, 84
  br i1 %cmp177, label %land.lhs.true179, label %if.end195

land.lhs.true179:                                 ; preds = %if.else174
  %73 = load i8*, i8** %var.addr, align 4
  %arrayidx180 = getelementptr inbounds i8, i8* %73, i32 4
  %74 = load i8, i8* %arrayidx180, align 1
  %conv181 = sext i8 %74 to i32
  %cmp182 = icmp eq i32 %conv181, 73
  br i1 %cmp182, label %if.then184, label %if.end195

if.then184:                                       ; preds = %land.lhs.true179
  %75 = load i8*, i8** @lc_all, align 4
  %cmp185 = icmp eq i8* %75, null
  br i1 %cmp185, label %if.then191, label %lor.lhs.false187

lor.lhs.false187:                                 ; preds = %if.then184
  %76 = load i8*, i8** @lc_all, align 4
  %77 = load i8, i8* %76, align 1
  %conv188 = sext i8 %77 to i32
  %cmp189 = icmp eq i32 %conv188, 0
  br i1 %cmp189, label %if.then191, label %if.end194

if.then191:                                       ; preds = %lor.lhs.false187, %if.then184
  %call192 = call i8* @get_locale_var(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0))
  %call193 = call i8* @setlocale(i32 2, i8* %call192)
  store i8* %call193, i8** %x, align 4
  br label %if.end194

if.end194:                                        ; preds = %if.then191, %lor.lhs.false187
  br label %if.end195

if.end195:                                        ; preds = %if.end194, %land.lhs.true179, %if.else174
  br label %if.end196

if.end196:                                        ; preds = %if.end195, %if.end173
  br label %if.end197

if.end197:                                        ; preds = %if.end196, %if.end152
  br label %if.end198

if.end198:                                        ; preds = %if.end197, %if.end131
  br label %if.end199

if.end199:                                        ; preds = %if.end198, %if.end110
  br label %if.end200

if.end200:                                        ; preds = %if.end199
  br label %if.end201

if.end201:                                        ; preds = %if.end200
  br label %if.end202

if.end202:                                        ; preds = %if.end201
  %78 = load i8*, i8** %x, align 4
  %cmp203 = icmp eq i8* %78, null
  br i1 %cmp203, label %if.then205, label %if.end218

if.then205:                                       ; preds = %if.end202
  %call206 = call i32* @__errno_location()
  %79 = load i32, i32* %call206, align 4
  %cmp207 = icmp eq i32 %79, 0
  br i1 %cmp207, label %if.then209, label %if.else212

if.then209:                                       ; preds = %if.then205
  %call210 = call i8* @libintl_gettext(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.13, i32 0, i32 0))
  %80 = load i8*, i8** %var.addr, align 4
  %81 = load i8*, i8** %var.addr, align 4
  %call211 = call i8* @get_locale_var(i8* %81)
  call void (i8*, ...) @internal_warning(i8* %call210, i8* %80, i8* %call211)
  br label %if.end217

if.else212:                                       ; preds = %if.then205
  %call213 = call i8* @libintl_gettext(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.14, i32 0, i32 0))
  %82 = load i8*, i8** %var.addr, align 4
  %83 = load i8*, i8** %var.addr, align 4
  %call214 = call i8* @get_locale_var(i8* %83)
  %call215 = call i32* @__errno_location()
  %84 = load i32, i32* %call215, align 4
  %call216 = call i8* @strerror(i32 %84)
  call void (i8*, ...) @internal_warning(i8* %call213, i8* %82, i8* %call214, i8* %call216)
  br label %if.end217

if.end217:                                        ; preds = %if.else212, %if.then209
  br label %if.end218

if.end218:                                        ; preds = %if.end217, %if.end202
  %85 = load i8*, i8** %x, align 4
  %cmp219 = icmp ne i8* %85, null
  %conv220 = zext i1 %cmp219 to i32
  store i32 %conv220, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end218, %if.end88, %if.end43, %if.end17
  %86 = load i32, i32* %retval, align 4
  ret i32 %86
}

declare i32* @__errno_location() #1

; Function Attrs: noinline nounwind
define internal i32 @reset_locale_vars() #0 {
entry:
  %retval = alloca i32, align 4
  %t = alloca i8*, align 4
  %0 = load i8*, i8** @lang, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** @lang, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @maybe_make_export_env()
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i8*, i8** @lang, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %4 = load i8*, i8** @lang, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %4, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), %cond.false ]
  %call = call i8* @setlocale(i32 6, i8* %cond)
  %cmp3 = icmp eq i8* %call, null
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %cond.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %cond.end
  %call7 = call i8* @get_locale_var(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  %call8 = call i8* @setlocale(i32 0, i8* %call7)
  store i8* %call8, i8** %t, align 4
  %call9 = call i8* @get_locale_var(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0))
  %call10 = call i8* @setlocale(i32 3, i8* %call9)
  store i8* %call10, i8** %t, align 4
  %call11 = call i8* @get_locale_var(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0))
  %call12 = call i8* @setlocale(i32 5, i8* %call11)
  store i8* %call12, i8** %t, align 4
  %call13 = call i8* @get_locale_var(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0))
  %call14 = call i8* @setlocale(i32 1, i8* %call13)
  store i8* %call14, i8** %t, align 4
  %call15 = call i8* @get_locale_var(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0))
  %call16 = call i8* @setlocale(i32 2, i8* %call15)
  store i8* %call16, i8** %t, align 4
  call void @locale_setblanks()
  %call17 = call i32 @__ctype_get_mb_cur_max()
  store i32 %call17, i32* @locale_mb_cur_max, align 4
  call void @u32reset()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then5
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare void @internal_warning(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @strerror(i32) #1

; Function Attrs: noinline nounwind
define i8* @get_locale_var(i8* %var) #0 {
entry:
  %var.addr = alloca i8*, align 4
  %locale = alloca i8*, align 4
  store i8* %var, i8** %var.addr, align 4
  %0 = load i8*, i8** @lc_all, align 4
  store i8* %0, i8** %locale, align 4
  %1 = load i8*, i8** %locale, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i8*, i8** %locale, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load i8*, i8** %var.addr, align 4
  %call = call i8* @get_string_value(i8* %4)
  store i8* %call, i8** %locale, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %5 = load i8*, i8** %locale, align 4
  %cmp3 = icmp eq i8* %5, null
  br i1 %cmp3, label %if.then9, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %if.end
  %6 = load i8*, i8** %locale, align 4
  %7 = load i8, i8* %6, align 1
  %conv6 = sext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv6, 0
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %lor.lhs.false5, %if.end
  %8 = load i8*, i8** @lang, align 4
  store i8* %8, i8** %locale, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %lor.lhs.false5
  %9 = load i8*, i8** %locale, align 4
  %cmp11 = icmp eq i8* %9, null
  br i1 %cmp11, label %if.then17, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %if.end10
  %10 = load i8*, i8** %locale, align 4
  %11 = load i8, i8* %10, align 1
  %conv14 = sext i8 %11 to i32
  %cmp15 = icmp eq i32 %conv14, 0
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %lor.lhs.false13, %if.end10
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** %locale, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %lor.lhs.false13
  %12 = load i8*, i8** %locale, align 4
  ret i8* %12
}

; Function Attrs: noinline nounwind
define i32 @set_lang(i8* %var, i8* %value) #0 {
entry:
  %var.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  store i8* %var, i8** %var.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i8*, i8** @lang, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load i8*, i8** @lang, align 4
  call void @sh_xfree(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 274)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i8*, i8** %value.addr, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %do.end
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strlen(i8* %3)
  %add = add i32 1, %call
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 276)
  %4 = load i8*, i8** %value.addr, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %4)
  store i8* %call4, i8** @lang, align 4
  br label %if.end6

if.else:                                          ; preds = %do.end
  %call5 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 279)
  store i8* %call5, i8** @lang, align 4
  %5 = load i8*, i8** @lang, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  %6 = load i8*, i8** @lc_all, align 4
  %cmp = icmp eq i8* %6, null
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end6
  %7 = load i8*, i8** @lc_all, align 4
  %8 = load i8, i8* %7, align 1
  %conv = sext i8 %8 to i32
  %cmp7 = icmp eq i32 %conv, 0
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %if.end6
  %call9 = call i32 @reset_locale_vars()
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call9, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define void @set_default_lang() #0 {
entry:
  %v = alloca i8*, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.15, i32 0, i32 0))
  store i8* %call, i8** %v, align 4
  %0 = load i8*, i8** %v, align 4
  %call1 = call i32 @set_locale_var(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.15, i32 0, i32 0), i8* %0)
  %call2 = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0))
  store i8* %call2, i8** %v, align 4
  %1 = load i8*, i8** %v, align 4
  %call3 = call i32 @set_lang(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0), i8* %1)
  ret void
}

; Function Attrs: noinline nounwind
define i8* @localetrans(i8* %string, i32 %len, i32* %lenp) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %lenp.addr = alloca i32*, align 4
  %locale = alloca i8*, align 4
  %t = alloca i8*, align 4
  %translated = alloca i8*, align 4
  %tlen = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end4

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32*, i32** %lenp.addr, align 4
  %tobool = icmp ne i32* %3, null
  br i1 %tobool, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i32*, i32** %lenp.addr, align 4
  store i32 0, i32* %4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  store i8* null, i8** %retval, align 4
  br label %return

if.end4:                                          ; preds = %lor.lhs.false
  %call = call i8* @get_locale_var(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0))
  store i8* %call, i8** %locale, align 4
  %5 = load i8*, i8** %locale, align 4
  %cmp5 = icmp eq i8* %5, null
  br i1 %cmp5, label %if.then30, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %if.end4
  %6 = load i8*, i8** %locale, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx, align 1
  %conv8 = sext i8 %7 to i32
  %cmp9 = icmp eq i32 %conv8, 0
  br i1 %cmp9, label %if.then30, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false7
  %8 = load i8*, i8** %locale, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %9 to i32
  %cmp14 = icmp eq i32 %conv13, 67
  br i1 %cmp14, label %land.lhs.true, label %lor.lhs.false20

land.lhs.true:                                    ; preds = %lor.lhs.false11
  %10 = load i8*, i8** %locale, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %10, i32 1
  %11 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %11 to i32
  %cmp18 = icmp eq i32 %conv17, 0
  br i1 %cmp18, label %if.then30, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %land.lhs.true, %lor.lhs.false11
  %12 = load i8*, i8** %locale, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %13 to i32
  %14 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.17, i32 0, i32 0), align 1
  %conv23 = sext i8 %14 to i32
  %cmp24 = icmp eq i32 %conv22, %conv23
  br i1 %cmp24, label %land.lhs.true26, label %if.end36

land.lhs.true26:                                  ; preds = %lor.lhs.false20
  %15 = load i8*, i8** %locale, align 4
  %call27 = call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.17, i32 0, i32 0))
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.then30, label %if.end36

if.then30:                                        ; preds = %land.lhs.true26, %land.lhs.true, %lor.lhs.false7, %if.end4
  %16 = load i32, i32* %len.addr, align 4
  %add = add nsw i32 %16, 1
  %call31 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 390)
  store i8* %call31, i8** %t, align 4
  %17 = load i8*, i8** %t, align 4
  %18 = load i8*, i8** %string.addr, align 4
  %call32 = call i8* @strcpy(i8* %17, i8* %18)
  %19 = load i32*, i32** %lenp.addr, align 4
  %tobool33 = icmp ne i32* %19, null
  br i1 %tobool33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.then30
  %20 = load i32, i32* %len.addr, align 4
  %21 = load i32*, i32** %lenp.addr, align 4
  store i32 %20, i32* %21, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %if.then30
  %22 = load i8*, i8** %t, align 4
  store i8* %22, i8** %retval, align 4
  br label %return

if.end36:                                         ; preds = %land.lhs.true26, %lor.lhs.false20
  %23 = load i8*, i8** @default_domain, align 4
  %tobool37 = icmp ne i8* %23, null
  br i1 %tobool37, label %land.lhs.true38, label %if.else

land.lhs.true38:                                  ; preds = %if.end36
  %24 = load i8*, i8** @default_domain, align 4
  %25 = load i8, i8* %24, align 1
  %conv39 = sext i8 %25 to i32
  %tobool40 = icmp ne i32 %conv39, 0
  br i1 %tobool40, label %if.then41, label %if.else

if.then41:                                        ; preds = %land.lhs.true38
  %26 = load i8*, i8** @default_domain, align 4
  %27 = load i8*, i8** %string.addr, align 4
  %call42 = call i8* @libintl_dgettext(i8* %26, i8* %27)
  store i8* %call42, i8** %translated, align 4
  br label %if.end43

if.else:                                          ; preds = %land.lhs.true38, %if.end36
  %28 = load i8*, i8** %string.addr, align 4
  store i8* %28, i8** %translated, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.then41
  %29 = load i8*, i8** %translated, align 4
  %30 = load i8*, i8** %string.addr, align 4
  %cmp44 = icmp eq i8* %29, %30
  br i1 %cmp44, label %if.then46, label %if.else53

if.then46:                                        ; preds = %if.end43
  %31 = load i32, i32* %len.addr, align 4
  %add47 = add nsw i32 %31, 1
  %call48 = call i8* @sh_xmalloc(i32 %add47, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 405)
  store i8* %call48, i8** %t, align 4
  %32 = load i8*, i8** %t, align 4
  %33 = load i8*, i8** %string.addr, align 4
  %call49 = call i8* @strcpy(i8* %32, i8* %33)
  %34 = load i32*, i32** %lenp.addr, align 4
  %tobool50 = icmp ne i32* %34, null
  br i1 %tobool50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.then46
  %35 = load i32, i32* %len.addr, align 4
  %36 = load i32*, i32** %lenp.addr, align 4
  store i32 %35, i32* %36, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then51, %if.then46
  br label %if.end61

if.else53:                                        ; preds = %if.end43
  %37 = load i8*, i8** %translated, align 4
  %call54 = call i32 @strlen(i8* %37)
  store i32 %call54, i32* %tlen, align 4
  %38 = load i32, i32* %tlen, align 4
  %add55 = add nsw i32 %38, 1
  %call56 = call i8* @sh_xmalloc(i32 %add55, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 413)
  store i8* %call56, i8** %t, align 4
  %39 = load i8*, i8** %t, align 4
  %40 = load i8*, i8** %translated, align 4
  %call57 = call i8* @strcpy(i8* %39, i8* %40)
  %41 = load i32*, i32** %lenp.addr, align 4
  %tobool58 = icmp ne i32* %41, null
  br i1 %tobool58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.else53
  %42 = load i32, i32* %tlen, align 4
  %43 = load i32*, i32** %lenp.addr, align 4
  store i32 %42, i32* %43, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.else53
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.end52
  %44 = load i8*, i8** %t, align 4
  store i8* %44, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end61, %if.end35, %if.end
  %45 = load i8*, i8** %retval, align 4
  ret i8* %45
}

declare i32 @strcmp(i8*, i8*) #1

declare i8* @libintl_dgettext(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i8* @mk_msgstr(i8* %string, i32* %foundnlp) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %foundnlp.addr = alloca i32*, align 4
  %c = alloca i32, align 4
  %len = alloca i32, align 4
  %result = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32* %foundnlp, i32** %foundnlp.addr, align 4
  store i32 0, i32* %len, align 4
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %s, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i32, i32* %len, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %len, align 4
  %6 = load i8*, i8** %s, align 4
  %7 = load i8, i8* %6, align 1
  %conv2 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv2, 34
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %8 = load i8*, i8** %s, align 4
  %9 = load i8, i8* %8, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 92
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %for.body
  %10 = load i32, i32* %len, align 4
  %inc7 = add nsw i32 %10, 1
  store i32 %inc7, i32* %len, align 4
  br label %if.end12

if.else:                                          ; preds = %lor.lhs.false
  %11 = load i8*, i8** %s, align 4
  %12 = load i8, i8* %11, align 1
  %conv8 = sext i8 %12 to i32
  %cmp9 = icmp eq i32 %conv8, 10
  br i1 %cmp9, label %if.then11, label %if.end

if.then11:                                        ; preds = %if.else
  %13 = load i32, i32* %len, align 4
  %add = add nsw i32 %13, 5
  store i32 %add, i32* %len, align 4
  br label %if.end

if.end:                                           ; preds = %if.then11, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end12
  %14 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %15 = load i32, i32* %len, align 4
  %add13 = add nsw i32 %15, 3
  %call = call i8* @sh_xmalloc(i32 %add13, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 440)
  store i8* %call, i8** %result, align 4
  store i8* %call, i8** %r, align 4
  %16 = load i8*, i8** %r, align 4
  %incdec.ptr14 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr14, i8** %r, align 4
  store i8 34, i8* %16, align 1
  %17 = load i8*, i8** %string.addr, align 4
  store i8* %17, i8** %s, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc44, %for.end
  %18 = load i8*, i8** %s, align 4
  %tobool16 = icmp ne i8* %18, null
  br i1 %tobool16, label %land.rhs17, label %land.end20

land.rhs17:                                       ; preds = %for.cond15
  %19 = load i8*, i8** %s, align 4
  %20 = load i8, i8* %19, align 1
  %conv18 = sext i8 %20 to i32
  store i32 %conv18, i32* %c, align 4
  %tobool19 = icmp ne i32 %conv18, 0
  br label %land.end20

land.end20:                                       ; preds = %land.rhs17, %for.cond15
  %21 = phi i1 [ false, %for.cond15 ], [ %tobool19, %land.rhs17 ]
  br i1 %21, label %for.body21, label %for.end46

for.body21:                                       ; preds = %land.end20
  %22 = load i32, i32* %c, align 4
  %cmp22 = icmp eq i32 %22, 10
  br i1 %cmp22, label %if.then24, label %if.end33

if.then24:                                        ; preds = %for.body21
  %23 = load i8*, i8** %r, align 4
  %incdec.ptr25 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr25, i8** %r, align 4
  store i8 92, i8* %23, align 1
  %24 = load i8*, i8** %r, align 4
  %incdec.ptr26 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr26, i8** %r, align 4
  store i8 110, i8* %24, align 1
  %25 = load i8*, i8** %r, align 4
  %incdec.ptr27 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr27, i8** %r, align 4
  store i8 34, i8* %25, align 1
  %26 = load i8*, i8** %r, align 4
  %incdec.ptr28 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %incdec.ptr28, i8** %r, align 4
  store i8 10, i8* %26, align 1
  %27 = load i8*, i8** %r, align 4
  %incdec.ptr29 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr29, i8** %r, align 4
  store i8 34, i8* %27, align 1
  %28 = load i32*, i32** %foundnlp.addr, align 4
  %tobool30 = icmp ne i32* %28, null
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.then24
  %29 = load i32*, i32** %foundnlp.addr, align 4
  store i32 1, i32* %29, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.then24
  br label %for.inc44

if.end33:                                         ; preds = %for.body21
  %30 = load i32, i32* %c, align 4
  %cmp34 = icmp eq i32 %30, 34
  br i1 %cmp34, label %if.then39, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %if.end33
  %31 = load i32, i32* %c, align 4
  %cmp37 = icmp eq i32 %31, 92
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %lor.lhs.false36, %if.end33
  %32 = load i8*, i8** %r, align 4
  %incdec.ptr40 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %incdec.ptr40, i8** %r, align 4
  store i8 92, i8* %32, align 1
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %lor.lhs.false36
  %33 = load i32, i32* %c, align 4
  %conv42 = trunc i32 %33 to i8
  %34 = load i8*, i8** %r, align 4
  %incdec.ptr43 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr43, i8** %r, align 4
  store i8 %conv42, i8* %34, align 1
  br label %for.inc44

for.inc44:                                        ; preds = %if.end41, %if.end32
  %35 = load i8*, i8** %s, align 4
  %incdec.ptr45 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %incdec.ptr45, i8** %s, align 4
  br label %for.cond15

for.end46:                                        ; preds = %land.end20
  %36 = load i8*, i8** %r, align 4
  %incdec.ptr47 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %incdec.ptr47, i8** %r, align 4
  store i8 34, i8* %36, align 1
  %37 = load i8*, i8** %r, align 4
  %incdec.ptr48 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %incdec.ptr48, i8** %r, align 4
  store i8 0, i8* %37, align 1
  %38 = load i8*, i8** %result, align 4
  ret i8* %38
}

; Function Attrs: noinline nounwind
define i8* @localeexpand(i8* %string, i32 %start, i32 %end, i32 %lineno, i32* %lenp) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %lineno.addr = alloca i32, align 4
  %lenp.addr = alloca i32*, align 4
  %len = alloca i32, align 4
  %tlen = alloca i32, align 4
  %foundnl = alloca i32, align 4
  %temp = alloca i8*, align 4
  %t = alloca i8*, align 4
  %t2 = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i32, i32* %end.addr, align 4
  %1 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %0, %1
  %add = add nsw i32 %sub, 1
  %call = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 482)
  store i8* %call, i8** %temp, align 4
  store i32 0, i32* %tlen, align 4
  %2 = load i32, i32* %start.addr, align 4
  store i32 %2, i32* %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %3 = load i32, i32* %len, align 4
  %4 = load i32, i32* %end.addr, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %len, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %8 = load i8*, i8** %temp, align 4
  %9 = load i32, i32* %tlen, align 4
  %inc1 = add nsw i32 %9, 1
  store i32 %inc1, i32* %tlen, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 %7, i8* %arrayidx2, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %temp, align 4
  %11 = load i32, i32* %tlen, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i32 %11
  store i8 0, i8* %arrayidx3, align 1
  %12 = load i32, i32* @dump_translatable_strings, align 4
  %tobool = icmp ne i32 %12, 0
  br i1 %tobool, label %if.then, label %if.else14

if.then:                                          ; preds = %for.end
  %13 = load i32, i32* @dump_po_strings, align 4
  %tobool4 = icmp ne i32 %13, 0
  br i1 %tobool4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  store i32 0, i32* %foundnl, align 4
  %14 = load i8*, i8** %temp, align 4
  %call6 = call i8* @mk_msgstr(i8* %14, i32* %foundnl)
  store i8* %call6, i8** %t, align 4
  %15 = load i32, i32* %foundnl, align 4
  %tobool7 = icmp ne i32 %15, 0
  %cond = select i1 %tobool7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)
  store i8* %cond, i8** %t2, align 4
  %call8 = call i8* @yy_input_name()
  %16 = load i32, i32* %lineno.addr, align 4
  %17 = load i8*, i8** %t2, align 4
  %18 = load i8*, i8** %t, align 4
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.19, i32 0, i32 0), i8* %call8, i32 %16, i8* %17, i8* %18)
  %19 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %19, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 504)
  br label %if.end

if.else:                                          ; preds = %if.then
  %20 = load i8*, i8** %temp, align 4
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i32 0, i32 0), i8* %20)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  %21 = load i32*, i32** %lenp.addr, align 4
  %tobool11 = icmp ne i32* %21, null
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end
  %22 = load i32, i32* %tlen, align 4
  %23 = load i32*, i32** %lenp.addr, align 4
  store i32 %22, i32* %23, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end
  %24 = load i8*, i8** %temp, align 4
  store i8* %24, i8** %retval, align 4
  br label %return

if.else14:                                        ; preds = %for.end
  %25 = load i8*, i8** %temp, align 4
  %26 = load i8, i8* %25, align 1
  %tobool15 = icmp ne i8 %26, 0
  br i1 %tobool15, label %if.then16, label %if.else21

if.then16:                                        ; preds = %if.else14
  %27 = load i8*, i8** %temp, align 4
  %28 = load i32, i32* %tlen, align 4
  %call17 = call i8* @localetrans(i8* %27, i32 %28, i32* %len)
  store i8* %call17, i8** %t, align 4
  %29 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %29, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 516)
  %30 = load i32*, i32** %lenp.addr, align 4
  %tobool18 = icmp ne i32* %30, null
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.then16
  %31 = load i32, i32* %len, align 4
  %32 = load i32*, i32** %lenp.addr, align 4
  store i32 %31, i32* %32, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.then16
  %33 = load i8*, i8** %t, align 4
  store i8* %33, i8** %retval, align 4
  br label %return

if.else21:                                        ; preds = %if.else14
  %34 = load i32*, i32** %lenp.addr, align 4
  %tobool22 = icmp ne i32* %34, null
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.else21
  %35 = load i32*, i32** %lenp.addr, align 4
  store i32 0, i32* %35, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.else21
  %36 = load i8*, i8** %temp, align 4
  store i8* %36, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end24, %if.end20, %if.end13
  %37 = load i8*, i8** %retval, align 4
  ret i8* %37
}

declare i32 @printf(i8*, ...) #1

declare i8* @yy_input_name() #1

declare void @maybe_make_export_env() #1

; Function Attrs: nounwind readonly
declare i32 @isblank(i32) #2

declare i8* @mbschr(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
