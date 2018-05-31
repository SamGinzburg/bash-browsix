; ModuleID = 'dcigettext.c'
source_filename = "dcigettext.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.binding = type { %struct.binding*, i8*, i32, i8*, [0 x i8] }
%struct.loaded_l10nfile = type { i8*, i32, i8*, %struct.loaded_l10nfile*, [1 x %struct.loaded_l10nfile*] }
%struct.loaded_domain = type { i8*, i32, i32, i32, i8*, i32, %struct.string_desc*, %struct.string_desc*, i32, %struct.sysdep_string_desc*, %struct.sysdep_string_desc*, i32, i32*, i32, i32, i8*, i8**, %struct.expression*, i32 }
%struct.string_desc = type { i32, i32 }
%struct.sysdep_string_desc = type { i32, i8* }
%struct.expression = type { i32, i32, %union.anon }
%union.anon = type { [3 x %struct.expression*] }

@libintl_nl_default_default_domain = constant [9 x i8] c"messages\00", align 1
@libintl_nl_current_default_domain = global i8* getelementptr inbounds ([9 x i8], [9 x i8]* @libintl_nl_default_default_domain, i32 0, i32 0), align 4
@libintl_nl_default_dirname = constant [24 x i8] c"/usr/local/share/locale\00", align 1
@enable_secure = internal global i32 0, align 4
@libintl_nl_domain_bindings = common global %struct.binding* null, align 4
@.str = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c".mo\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"POSIX\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"GETTEXT_LOG_UNTRANSLATED\00", align 1
@_nl_find_msg.freemem = internal global i8* null, align 4
@_nl_find_msg.freemem_size = internal global i32 0, align 4
@.str.5 = private unnamed_addr constant [11 x i8] c"LC_COLLATE\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"LC_CTYPE\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"LC_MONETARY\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"LC_NUMERIC\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"LC_TIME\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"LC_MESSAGES\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"LC_ALL\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"LC_XXX\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"LANGUAGE\00", align 1

; Function Attrs: noinline nounwind
define i8* @libintl_dcigettext(i8* %domainname, i8* %msgid1, i8* %msgid2, i32 %plural, i32 %n, i32 %category) #0 {
entry:
  %retval = alloca i8*, align 4
  %domainname.addr = alloca i8*, align 4
  %msgid1.addr = alloca i8*, align 4
  %msgid2.addr = alloca i8*, align 4
  %plural.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %category.addr = alloca i32, align 4
  %domain = alloca %struct.loaded_l10nfile*, align 4
  %binding = alloca %struct.binding*, align 4
  %categoryname = alloca i8*, align 4
  %categoryvalue = alloca i8*, align 4
  %dirname = alloca i8*, align 4
  %xdomainname = alloca i8*, align 4
  %single_locale = alloca i8*, align 4
  %retval1 = alloca i8*, align 4
  %retlen = alloca i32, align 4
  %saved_errno = alloca i32, align 4
  %domainname_len = alloca i32, align 4
  %compare = alloca i32, align 4
  %dirname_len = alloca i32, align 4
  %path_max = alloca i32, align 4
  %ret = alloca i8*, align 4
  %cp = alloca i8*, align 4
  %cnt = alloca i32, align 4
  %logfilename = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %msgid1, i8** %msgid1.addr, align 4
  store i8* %msgid2, i8** %msgid2.addr, align 4
  store i32 %plural, i32* %plural.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %category, i32* %category.addr, align 4
  %0 = load i8*, i8** %msgid1.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %domainname.addr, align 4
  %cmp2 = icmp eq i8* %1, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %2 = load i8*, i8** @libintl_nl_current_default_domain, align 4
  store i8* %2, i8** %domainname.addr, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %call = call i32* @__errno_location()
  %3 = load i32, i32* %call, align 4
  store i32 %3, i32* %saved_errno, align 4
  %4 = load i32, i32* @enable_secure, align 4
  %cmp5 = icmp eq i32 %4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  store i32 -1, i32* @enable_secure, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end4
  %5 = load %struct.binding*, %struct.binding** @libintl_nl_domain_bindings, align 4
  store %struct.binding* %5, %struct.binding** %binding, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load %struct.binding*, %struct.binding** %binding, align 4
  %cmp8 = icmp ne %struct.binding* %6, null
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %domainname.addr, align 4
  %8 = load %struct.binding*, %struct.binding** %binding, align 4
  %domainname9 = getelementptr inbounds %struct.binding, %struct.binding* %8, i32 0, i32 4
  %arraydecay = getelementptr inbounds [0 x i8], [0 x i8]* %domainname9, i32 0, i32 0
  %call10 = call i32 @strcmp(i8* %7, i8* %arraydecay)
  store i32 %call10, i32* %compare, align 4
  %9 = load i32, i32* %compare, align 4
  %cmp11 = icmp eq i32 %9, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.body
  br label %for.end

if.end13:                                         ; preds = %for.body
  %10 = load i32, i32* %compare, align 4
  %cmp14 = icmp slt i32 %10, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  store %struct.binding* null, %struct.binding** %binding, align 4
  br label %for.end

if.end16:                                         ; preds = %if.end13
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %11 = load %struct.binding*, %struct.binding** %binding, align 4
  %next = getelementptr inbounds %struct.binding, %struct.binding* %11, i32 0, i32 0
  %12 = load %struct.binding*, %struct.binding** %next, align 4
  store %struct.binding* %12, %struct.binding** %binding, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then15, %if.then12, %for.cond
  %13 = load %struct.binding*, %struct.binding** %binding, align 4
  %cmp17 = icmp eq %struct.binding* %13, null
  br i1 %cmp17, label %if.then18, label %if.else

if.then18:                                        ; preds = %for.end
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @libintl_nl_default_dirname, i32 0, i32 0), i8** %dirname, align 4
  br label %if.end51

if.else:                                          ; preds = %for.end
  %14 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname19 = getelementptr inbounds %struct.binding, %struct.binding* %14, i32 0, i32 1
  %15 = load i8*, i8** %dirname19, align 4
  %arrayidx = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %16 to i32
  %cmp20 = icmp eq i32 %conv, 47
  br i1 %cmp20, label %if.then22, label %if.else24

if.then22:                                        ; preds = %if.else
  %17 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname23 = getelementptr inbounds %struct.binding, %struct.binding* %17, i32 0, i32 1
  %18 = load i8*, i8** %dirname23, align 4
  store i8* %18, i8** %dirname, align 4
  br label %if.end50

if.else24:                                        ; preds = %if.else
  %19 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname25 = getelementptr inbounds %struct.binding, %struct.binding* %19, i32 0, i32 1
  %20 = load i8*, i8** %dirname25, align 4
  %call26 = call i32 @strlen(i8* %20)
  %add = add i32 %call26, 1
  store i32 %add, i32* %dirname_len, align 4
  store i32 4096, i32* %path_max, align 4
  %21 = load i32, i32* %path_max, align 4
  %add27 = add i32 %21, 2
  store i32 %add27, i32* %path_max, align 4
  br label %for.cond28

for.cond28:                                       ; preds = %if.end38, %if.else24
  %22 = load i32, i32* %path_max, align 4
  %23 = load i32, i32* %dirname_len, align 4
  %add29 = add i32 %22, %23
  %24 = alloca i8, i32 %add29, align 8
  store i8* %24, i8** %dirname, align 4
  %call30 = call i32* @__errno_location()
  store i32 0, i32* %call30, align 4
  %25 = load i8*, i8** %dirname, align 4
  %26 = load i32, i32* %path_max, align 4
  %call31 = call i8* @getcwd(i8* %25, i32 %26)
  store i8* %call31, i8** %ret, align 4
  %27 = load i8*, i8** %ret, align 4
  %cmp32 = icmp ne i8* %27, null
  br i1 %cmp32, label %if.then37, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.cond28
  %call34 = call i32* @__errno_location()
  %28 = load i32, i32* %call34, align 4
  %cmp35 = icmp ne i32 %28, 34
  br i1 %cmp35, label %if.then37, label %if.end38

if.then37:                                        ; preds = %lor.lhs.false, %for.cond28
  br label %for.end41

if.end38:                                         ; preds = %lor.lhs.false
  %29 = load i32, i32* %path_max, align 4
  %div = udiv i32 %29, 2
  %30 = load i32, i32* %path_max, align 4
  %add39 = add i32 %30, %div
  store i32 %add39, i32* %path_max, align 4
  %31 = load i32, i32* %path_max, align 4
  %add40 = add i32 %31, 32
  store i32 %add40, i32* %path_max, align 4
  br label %for.cond28

for.end41:                                        ; preds = %if.then37
  %32 = load i8*, i8** %ret, align 4
  %cmp42 = icmp eq i8* %32, null
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %for.end41
  br label %return_untranslated

if.end45:                                         ; preds = %for.end41
  %33 = load i8*, i8** %dirname, align 4
  %call46 = call i8* @strchr(i8* %33, i32 0)
  %call47 = call i8* @stpcpy(i8* %call46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %34 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname48 = getelementptr inbounds %struct.binding, %struct.binding* %34, i32 0, i32 1
  %35 = load i8*, i8** %dirname48, align 4
  %call49 = call i8* @stpcpy(i8* %call47, i8* %35)
  br label %if.end50

if.end50:                                         ; preds = %if.end45, %if.then22
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then18
  %36 = load i32, i32* %category.addr, align 4
  %call52 = call i8* @category_to_name(i32 %36)
  store i8* %call52, i8** %categoryname, align 4
  %37 = load i32, i32* %category.addr, align 4
  %38 = load i8*, i8** %categoryname, align 4
  %call53 = call i8* @guess_category_value(i32 %37, i8* %38)
  store i8* %call53, i8** %categoryvalue, align 4
  %39 = load i8*, i8** %domainname.addr, align 4
  %call54 = call i32 @strlen(i8* %39)
  store i32 %call54, i32* %domainname_len, align 4
  %40 = load i8*, i8** %categoryname, align 4
  %call55 = call i32 @strlen(i8* %40)
  %41 = load i32, i32* %domainname_len, align 4
  %add56 = add i32 %call55, %41
  %add57 = add i32 %add56, 5
  %42 = alloca i8, i32 %add57, align 8
  store i8* %42, i8** %xdomainname, align 4
  %43 = load i8*, i8** %xdomainname, align 4
  %44 = load i8*, i8** %categoryname, align 4
  %call58 = call i8* @stpcpy(i8* %43, i8* %44)
  %call59 = call i8* @stpcpy(i8* %call58, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %45 = load i8*, i8** %domainname.addr, align 4
  %46 = load i32, i32* %domainname_len, align 4
  %call60 = call i8* @mempcpy(i8* %call59, i8* %45, i32 %46)
  %call61 = call i8* @stpcpy(i8* %call60, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0))
  %47 = load i8*, i8** %categoryvalue, align 4
  %call62 = call i32 @strlen(i8* %47)
  %add63 = add i32 %call62, 1
  %48 = alloca i8, i32 %add63, align 8
  store i8* %48, i8** %single_locale, align 4
  br label %while.body

while.body:                                       ; preds = %if.end51, %if.then102, %if.end147
  br label %while.cond64

while.cond64:                                     ; preds = %while.body73, %while.body
  %49 = load i8*, i8** %categoryvalue, align 4
  %arrayidx65 = getelementptr inbounds i8, i8* %49, i32 0
  %50 = load i8, i8* %arrayidx65, align 1
  %conv66 = sext i8 %50 to i32
  %cmp67 = icmp ne i32 %conv66, 0
  br i1 %cmp67, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond64
  %51 = load i8*, i8** %categoryvalue, align 4
  %arrayidx69 = getelementptr inbounds i8, i8* %51, i32 0
  %52 = load i8, i8* %arrayidx69, align 1
  %conv70 = sext i8 %52 to i32
  %cmp71 = icmp eq i32 %conv70, 58
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond64
  %53 = phi i1 [ false, %while.cond64 ], [ %cmp71, %land.rhs ]
  br i1 %53, label %while.body73, label %while.end

while.body73:                                     ; preds = %land.end
  %54 = load i8*, i8** %categoryvalue, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %incdec.ptr, i8** %categoryvalue, align 4
  br label %while.cond64

while.end:                                        ; preds = %land.end
  %55 = load i8*, i8** %categoryvalue, align 4
  %arrayidx74 = getelementptr inbounds i8, i8* %55, i32 0
  %56 = load i8, i8* %arrayidx74, align 1
  %conv75 = sext i8 %56 to i32
  %cmp76 = icmp eq i32 %conv75, 0
  br i1 %cmp76, label %if.then78, label %if.else81

if.then78:                                        ; preds = %while.end
  %57 = load i8*, i8** %single_locale, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %57, i32 0
  store i8 67, i8* %arrayidx79, align 1
  %58 = load i8*, i8** %single_locale, align 4
  %arrayidx80 = getelementptr inbounds i8, i8* %58, i32 1
  store i8 0, i8* %arrayidx80, align 1
  br label %if.end104

if.else81:                                        ; preds = %while.end
  %59 = load i8*, i8** %single_locale, align 4
  store i8* %59, i8** %cp, align 4
  br label %while.cond82

while.cond82:                                     ; preds = %while.body93, %if.else81
  %60 = load i8*, i8** %categoryvalue, align 4
  %arrayidx83 = getelementptr inbounds i8, i8* %60, i32 0
  %61 = load i8, i8* %arrayidx83, align 1
  %conv84 = sext i8 %61 to i32
  %cmp85 = icmp ne i32 %conv84, 0
  br i1 %cmp85, label %land.rhs87, label %land.end92

land.rhs87:                                       ; preds = %while.cond82
  %62 = load i8*, i8** %categoryvalue, align 4
  %arrayidx88 = getelementptr inbounds i8, i8* %62, i32 0
  %63 = load i8, i8* %arrayidx88, align 1
  %conv89 = sext i8 %63 to i32
  %cmp90 = icmp ne i32 %conv89, 58
  br label %land.end92

land.end92:                                       ; preds = %land.rhs87, %while.cond82
  %64 = phi i1 [ false, %while.cond82 ], [ %cmp90, %land.rhs87 ]
  br i1 %64, label %while.body93, label %while.end96

while.body93:                                     ; preds = %land.end92
  %65 = load i8*, i8** %categoryvalue, align 4
  %incdec.ptr94 = getelementptr inbounds i8, i8* %65, i32 1
  store i8* %incdec.ptr94, i8** %categoryvalue, align 4
  %66 = load i8, i8* %65, align 1
  %67 = load i8*, i8** %cp, align 4
  %incdec.ptr95 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %incdec.ptr95, i8** %cp, align 4
  store i8 %66, i8* %67, align 1
  br label %while.cond82

while.end96:                                      ; preds = %land.end92
  %68 = load i8*, i8** %cp, align 4
  store i8 0, i8* %68, align 1
  %69 = load i32, i32* @enable_secure, align 4
  %cmp97 = icmp eq i32 %69, 1
  br i1 %cmp97, label %land.lhs.true, label %if.end103

land.lhs.true:                                    ; preds = %while.end96
  %70 = load i8*, i8** %single_locale, align 4
  %call99 = call i8* @strchr(i8* %70, i32 47)
  %cmp100 = icmp ne i8* %call99, null
  br i1 %cmp100, label %if.then102, label %if.end103

if.then102:                                       ; preds = %land.lhs.true
  br label %while.body

if.end103:                                        ; preds = %land.lhs.true, %while.end96
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.then78
  %71 = load i8*, i8** %single_locale, align 4
  %call105 = call i32 @strcmp(i8* %71, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %cmp106 = icmp eq i32 %call105, 0
  br i1 %cmp106, label %if.then112, label %lor.lhs.false108

lor.lhs.false108:                                 ; preds = %if.end104
  %72 = load i8*, i8** %single_locale, align 4
  %call109 = call i32 @strcmp(i8* %72, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  %cmp110 = icmp eq i32 %call109, 0
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %lor.lhs.false108, %if.end104
  br label %while.end148

if.end113:                                        ; preds = %lor.lhs.false108
  %73 = load i8*, i8** %dirname, align 4
  %74 = load i8*, i8** %single_locale, align 4
  %75 = load i8*, i8** %xdomainname, align 4
  %76 = load %struct.binding*, %struct.binding** %binding, align 4
  %call114 = call %struct.loaded_l10nfile* @_nl_find_domain(i8* %73, i8* %74, i8* %75, %struct.binding* %76)
  store %struct.loaded_l10nfile* %call114, %struct.loaded_l10nfile** %domain, align 4
  %77 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain, align 4
  %cmp115 = icmp ne %struct.loaded_l10nfile* %77, null
  br i1 %cmp115, label %if.then117, label %if.end147

if.then117:                                       ; preds = %if.end113
  %78 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain, align 4
  %79 = load %struct.binding*, %struct.binding** %binding, align 4
  %80 = load i8*, i8** %msgid1.addr, align 4
  %call118 = call i8* @_nl_find_msg(%struct.loaded_l10nfile* %78, %struct.binding* %79, i8* %80, i32* %retlen)
  store i8* %call118, i8** %retval1, align 4
  %81 = load i8*, i8** %retval1, align 4
  %cmp119 = icmp eq i8* %81, null
  br i1 %cmp119, label %if.then121, label %if.end138

if.then121:                                       ; preds = %if.then117
  store i32 0, i32* %cnt, align 4
  br label %for.cond122

for.cond122:                                      ; preds = %for.inc136, %if.then121
  %82 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain, align 4
  %successor = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %82, i32 0, i32 4
  %83 = load i32, i32* %cnt, align 4
  %arrayidx123 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor, i32 0, i32 %83
  %84 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx123, align 4
  %cmp124 = icmp ne %struct.loaded_l10nfile* %84, null
  br i1 %cmp124, label %for.body126, label %for.end137

for.body126:                                      ; preds = %for.cond122
  %85 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain, align 4
  %successor127 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %85, i32 0, i32 4
  %86 = load i32, i32* %cnt, align 4
  %arrayidx128 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor127, i32 0, i32 %86
  %87 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx128, align 4
  %88 = load %struct.binding*, %struct.binding** %binding, align 4
  %89 = load i8*, i8** %msgid1.addr, align 4
  %call129 = call i8* @_nl_find_msg(%struct.loaded_l10nfile* %87, %struct.binding* %88, i8* %89, i32* %retlen)
  store i8* %call129, i8** %retval1, align 4
  %90 = load i8*, i8** %retval1, align 4
  %cmp130 = icmp ne i8* %90, null
  br i1 %cmp130, label %if.then132, label %if.end135

if.then132:                                       ; preds = %for.body126
  %91 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain, align 4
  %successor133 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %91, i32 0, i32 4
  %92 = load i32, i32* %cnt, align 4
  %arrayidx134 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor133, i32 0, i32 %92
  %93 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx134, align 4
  store %struct.loaded_l10nfile* %93, %struct.loaded_l10nfile** %domain, align 4
  br label %for.end137

if.end135:                                        ; preds = %for.body126
  br label %for.inc136

for.inc136:                                       ; preds = %if.end135
  %94 = load i32, i32* %cnt, align 4
  %inc = add nsw i32 %94, 1
  store i32 %inc, i32* %cnt, align 4
  br label %for.cond122

for.end137:                                       ; preds = %if.then132, %for.cond122
  br label %if.end138

if.end138:                                        ; preds = %for.end137, %if.then117
  %95 = load i8*, i8** %retval1, align 4
  %cmp139 = icmp ne i8* %95, null
  br i1 %cmp139, label %if.then141, label %if.end146

if.then141:                                       ; preds = %if.end138
  %96 = load i32, i32* %saved_errno, align 4
  %call142 = call i32* @__errno_location()
  store i32 %96, i32* %call142, align 4
  %97 = load i32, i32* %plural.addr, align 4
  %tobool = icmp ne i32 %97, 0
  br i1 %tobool, label %if.then143, label %if.end145

if.then143:                                       ; preds = %if.then141
  %98 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain, align 4
  %99 = load i32, i32* %n.addr, align 4
  %100 = load i8*, i8** %retval1, align 4
  %101 = load i32, i32* %retlen, align 4
  %call144 = call i8* @plural_lookup(%struct.loaded_l10nfile* %98, i32 %99, i8* %100, i32 %101)
  store i8* %call144, i8** %retval1, align 4
  br label %if.end145

if.end145:                                        ; preds = %if.then143, %if.then141
  %102 = load i8*, i8** %retval1, align 4
  store i8* %102, i8** %retval, align 4
  br label %return

if.end146:                                        ; preds = %if.end138
  br label %if.end147

if.end147:                                        ; preds = %if.end146, %if.end113
  br label %while.body

while.end148:                                     ; preds = %if.then112
  br label %return_untranslated

return_untranslated:                              ; preds = %while.end148, %if.then44
  %103 = load i32, i32* @enable_secure, align 4
  %cmp149 = icmp eq i32 %103, 1
  br i1 %cmp149, label %if.end162, label %if.then151

if.then151:                                       ; preds = %return_untranslated
  %call152 = call i8* @getenv(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i32 0, i32 0))
  store i8* %call152, i8** %logfilename, align 4
  %104 = load i8*, i8** %logfilename, align 4
  %cmp153 = icmp ne i8* %104, null
  br i1 %cmp153, label %land.lhs.true155, label %if.end161

land.lhs.true155:                                 ; preds = %if.then151
  %105 = load i8*, i8** %logfilename, align 4
  %arrayidx156 = getelementptr inbounds i8, i8* %105, i32 0
  %106 = load i8, i8* %arrayidx156, align 1
  %conv157 = sext i8 %106 to i32
  %cmp158 = icmp ne i32 %conv157, 0
  br i1 %cmp158, label %if.then160, label %if.end161

if.then160:                                       ; preds = %land.lhs.true155
  %107 = load i8*, i8** %logfilename, align 4
  %108 = load i8*, i8** %domainname.addr, align 4
  %109 = load i8*, i8** %msgid1.addr, align 4
  %110 = load i8*, i8** %msgid2.addr, align 4
  %111 = load i32, i32* %plural.addr, align 4
  call void @_nl_log_untranslated(i8* %107, i8* %108, i8* %109, i8* %110, i32 %111)
  br label %if.end161

if.end161:                                        ; preds = %if.then160, %land.lhs.true155, %if.then151
  br label %if.end162

if.end162:                                        ; preds = %if.end161, %return_untranslated
  %112 = load i32, i32* %saved_errno, align 4
  %call163 = call i32* @__errno_location()
  store i32 %112, i32* %call163, align 4
  %113 = load i32, i32* %plural.addr, align 4
  %cmp164 = icmp eq i32 %113, 0
  br i1 %cmp164, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end162
  %114 = load i8*, i8** %msgid1.addr, align 4
  br label %cond.end170

cond.false:                                       ; preds = %if.end162
  %115 = load i32, i32* %n.addr, align 4
  %cmp166 = icmp eq i32 %115, 1
  br i1 %cmp166, label %cond.true168, label %cond.false169

cond.true168:                                     ; preds = %cond.false
  %116 = load i8*, i8** %msgid1.addr, align 4
  br label %cond.end

cond.false169:                                    ; preds = %cond.false
  %117 = load i8*, i8** %msgid2.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false169, %cond.true168
  %cond = phi i8* [ %116, %cond.true168 ], [ %117, %cond.false169 ]
  br label %cond.end170

cond.end170:                                      ; preds = %cond.end, %cond.true
  %cond171 = phi i8* [ %114, %cond.true ], [ %cond, %cond.end ]
  store i8* %cond171, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end170, %if.end145, %if.then
  %118 = load i8*, i8** %retval, align 4
  ret i8* %118
}

declare i32* @__errno_location() #1

declare i32 @strcmp(i8*, i8*) #1

declare i32 @strlen(i8*) #1

declare i8* @getcwd(i8*, i32) #1

declare i8* @stpcpy(i8*, i8*) #1

declare i8* @strchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @category_to_name(i32 %category) #0 {
entry:
  %category.addr = alloca i32, align 4
  %retval1 = alloca i8*, align 4
  store i32 %category, i32* %category.addr, align 4
  %0 = load i32, i32* %category.addr, align 4
  switch i32 %0, label %sw.default [
    i32 3, label %sw.bb
    i32 0, label %sw.bb2
    i32 4, label %sw.bb3
    i32 1, label %sw.bb4
    i32 2, label %sw.bb5
    i32 5, label %sw.bb6
    i32 6, label %sw.bb7
  ]

sw.bb:                                            ; preds = %entry
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8** %retval1, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0), i8** %retval1, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0), i8** %retval1, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0), i8** %retval1, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8** %retval1, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0), i8** %retval1, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8** %retval1, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i8** %retval1, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb7, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb
  %1 = load i8*, i8** %retval1, align 4
  ret i8* %1
}

; Function Attrs: noinline nounwind
define internal i8* @guess_category_value(i32 %category, i8* %categoryname) #0 {
entry:
  %category.addr = alloca i32, align 4
  %categoryname.addr = alloca i8*, align 4
  %language = alloca i8*, align 4
  %retval1 = alloca i8*, align 4
  store i32 %category, i32* %category.addr, align 4
  store i8* %categoryname, i8** %categoryname.addr, align 4
  %call = call i8* @getenv(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i32 0, i32 0))
  store i8* %call, i8** %language, align 4
  %0 = load i8*, i8** %language, align 4
  %cmp = icmp ne i8* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %language, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i8* null, i8** %language, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %3 = load i32, i32* %category.addr, align 4
  %4 = load i8*, i8** %categoryname.addr, align 4
  %call4 = call i8* @_nl_locale_name(i32 %3, i8* %4)
  store i8* %call4, i8** %retval1, align 4
  %5 = load i8*, i8** %language, align 4
  %cmp5 = icmp ne i8* %5, null
  br i1 %cmp5, label %land.lhs.true7, label %cond.false

land.lhs.true7:                                   ; preds = %if.end
  %6 = load i8*, i8** %retval1, align 4
  %call8 = call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %cmp9 = icmp ne i32 %call8, 0
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true7
  %7 = load i8*, i8** %language, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true7, %if.end
  %8 = load i8*, i8** %retval1, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %7, %cond.true ], [ %8, %cond.false ]
  ret i8* %cond
}

declare i8* @mempcpy(i8*, i8*, i32) #1

declare %struct.loaded_l10nfile* @_nl_find_domain(i8*, i8*, i8*, %struct.binding*) #1

; Function Attrs: noinline nounwind
define i8* @_nl_find_msg(%struct.loaded_l10nfile* %domain_file, %struct.binding* %domainbinding, i8* %msgid, i32* %lengthp) #0 {
entry:
  %retval = alloca i8*, align 4
  %domain_file.addr = alloca %struct.loaded_l10nfile*, align 4
  %domainbinding.addr = alloca %struct.binding*, align 4
  %msgid.addr = alloca i8*, align 4
  %lengthp.addr = alloca i32*, align 4
  %domain = alloca %struct.loaded_domain*, align 4
  %nstrings = alloca i32, align 4
  %act = alloca i32, align 4
  %result = alloca i8*, align 4
  %resultlen = alloca i32, align 4
  %len = alloca i32, align 4
  %hash_val = alloca i32, align 4
  %idx = alloca i32, align 4
  %incr = alloca i32, align 4
  %nstr = alloca i32, align 4
  %top = alloca i32, align 4
  %bottom = alloca i32, align 4
  %cmp_val = alloca i32, align 4
  %inbuf = alloca i8*, align 4
  %outbuf = alloca i8*, align 4
  %malloc_count = alloca i32, align 4
  %transmem_list = alloca i8*, align 4
  %newmem = alloca i8*, align 4
  %inptr = alloca i8*, align 4
  %inleft = alloca i32, align 4
  %outptr = alloca i8*, align 4
  %outleft = alloca i32, align 4
  store %struct.loaded_l10nfile* %domain_file, %struct.loaded_l10nfile** %domain_file.addr, align 4
  store %struct.binding* %domainbinding, %struct.binding** %domainbinding.addr, align 4
  store i8* %msgid, i8** %msgid.addr, align 4
  store i32* %lengthp, i32** %lengthp.addr, align 4
  %0 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %decided = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %0, i32 0, i32 1
  %1 = load i32, i32* %decided, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %3 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  call void @_nl_load_domain(%struct.loaded_l10nfile* %2, %struct.binding* %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %data = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %4, i32 0, i32 2
  %5 = load i8*, i8** %data, align 4
  %cmp1 = icmp eq i8* %5, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %6 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %data4 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %6, i32 0, i32 2
  %7 = load i8*, i8** %data4, align 4
  %8 = bitcast i8* %7 to %struct.loaded_domain*
  store %struct.loaded_domain* %8, %struct.loaded_domain** %domain, align 4
  %9 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %nstrings5 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %9, i32 0, i32 5
  %10 = load i32, i32* %nstrings5, align 4
  store i32 %10, i32* %nstrings, align 4
  %11 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %11, i32 0, i32 12
  %12 = load i32*, i32** %hash_tab, align 4
  %cmp6 = icmp ne i32* %12, null
  br i1 %cmp6, label %if.then7, label %if.else68

if.then7:                                         ; preds = %if.end3
  %13 = load i8*, i8** %msgid.addr, align 4
  %call = call i32 @strlen(i8* %13)
  store i32 %call, i32* %len, align 4
  %14 = load i8*, i8** %msgid.addr, align 4
  %call8 = call i32 @hash_string(i8* %14)
  store i32 %call8, i32* %hash_val, align 4
  %15 = load i32, i32* %hash_val, align 4
  %16 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %16, i32 0, i32 11
  %17 = load i32, i32* %hash_size, align 4
  %rem = urem i32 %15, %17
  store i32 %rem, i32* %idx, align 4
  %18 = load i32, i32* %hash_val, align 4
  %19 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size9 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %19, i32 0, i32 11
  %20 = load i32, i32* %hash_size9, align 4
  %sub = sub i32 %20, 2
  %rem10 = urem i32 %18, %sub
  %add = add i32 1, %rem10
  store i32 %add, i32* %incr, align 4
  br label %while.body

while.body:                                       ; preds = %if.then7, %if.end67
  %21 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap_hash_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %21, i32 0, i32 13
  %22 = load i32, i32* %must_swap_hash_tab, align 4
  %tobool = icmp ne i32 %22, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %23 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_tab11 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %23, i32 0, i32 12
  %24 = load i32*, i32** %hash_tab11, align 4
  %25 = load i32, i32* %idx, align 4
  %arrayidx = getelementptr inbounds i32, i32* %24, i32 %25
  %26 = load i32, i32* %arrayidx, align 4
  %call12 = call i32 @SWAP(i32 %26)
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %27 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_tab13 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %27, i32 0, i32 12
  %28 = load i32*, i32** %hash_tab13, align 4
  %29 = load i32, i32* %idx, align 4
  %arrayidx14 = getelementptr inbounds i32, i32* %28, i32 %29
  %30 = load i32, i32* %arrayidx14, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call12, %cond.true ], [ %30, %cond.false ]
  store i32 %cond, i32* %nstr, align 4
  %31 = load i32, i32* %nstr, align 4
  %cmp15 = icmp eq i32 %31, 0
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %cond.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end17:                                         ; preds = %cond.end
  %32 = load i32, i32* %nstr, align 4
  %dec = add i32 %32, -1
  store i32 %dec, i32* %nstr, align 4
  %33 = load i32, i32* %nstr, align 4
  %34 = load i32, i32* %nstrings, align 4
  %cmp18 = icmp ult i32 %33, %34
  br i1 %cmp18, label %cond.true19, label %cond.false46

cond.true19:                                      ; preds = %if.end17
  %35 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %35, i32 0, i32 3
  %36 = load i32, i32* %must_swap, align 4
  %tobool20 = icmp ne i32 %36, 0
  br i1 %tobool20, label %cond.true21, label %cond.false24

cond.true21:                                      ; preds = %cond.true19
  %37 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %37, i32 0, i32 6
  %38 = load %struct.string_desc*, %struct.string_desc** %orig_tab, align 4
  %39 = load i32, i32* %nstr, align 4
  %arrayidx22 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %38, i32 %39
  %length = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx22, i32 0, i32 0
  %40 = load i32, i32* %length, align 4
  %call23 = call i32 @SWAP(i32 %40)
  br label %cond.end28

cond.false24:                                     ; preds = %cond.true19
  %41 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_tab25 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %41, i32 0, i32 6
  %42 = load %struct.string_desc*, %struct.string_desc** %orig_tab25, align 4
  %43 = load i32, i32* %nstr, align 4
  %arrayidx26 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %42, i32 %43
  %length27 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx26, i32 0, i32 0
  %44 = load i32, i32* %length27, align 4
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false24, %cond.true21
  %cond29 = phi i32 [ %call23, %cond.true21 ], [ %44, %cond.false24 ]
  %45 = load i32, i32* %len, align 4
  %cmp30 = icmp uge i32 %cond29, %45
  br i1 %cmp30, label %land.lhs.true, label %if.end58

land.lhs.true:                                    ; preds = %cond.end28
  %46 = load i8*, i8** %msgid.addr, align 4
  %47 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %data31 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %47, i32 0, i32 0
  %48 = load i8*, i8** %data31, align 4
  %49 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap32 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %49, i32 0, i32 3
  %50 = load i32, i32* %must_swap32, align 4
  %tobool33 = icmp ne i32 %50, 0
  br i1 %tobool33, label %cond.true34, label %cond.false38

cond.true34:                                      ; preds = %land.lhs.true
  %51 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_tab35 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %51, i32 0, i32 6
  %52 = load %struct.string_desc*, %struct.string_desc** %orig_tab35, align 4
  %53 = load i32, i32* %nstr, align 4
  %arrayidx36 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %52, i32 %53
  %offset = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx36, i32 0, i32 1
  %54 = load i32, i32* %offset, align 4
  %call37 = call i32 @SWAP(i32 %54)
  br label %cond.end42

cond.false38:                                     ; preds = %land.lhs.true
  %55 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_tab39 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %55, i32 0, i32 6
  %56 = load %struct.string_desc*, %struct.string_desc** %orig_tab39, align 4
  %57 = load i32, i32* %nstr, align 4
  %arrayidx40 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %56, i32 %57
  %offset41 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx40, i32 0, i32 1
  %58 = load i32, i32* %offset41, align 4
  br label %cond.end42

cond.end42:                                       ; preds = %cond.false38, %cond.true34
  %cond43 = phi i32 [ %call37, %cond.true34 ], [ %58, %cond.false38 ]
  %add.ptr = getelementptr inbounds i8, i8* %48, i32 %cond43
  %call44 = call i32 @strcmp(i8* %46, i8* %add.ptr)
  %cmp45 = icmp eq i32 %call44, 0
  br i1 %cmp45, label %if.then57, label %if.end58

cond.false46:                                     ; preds = %if.end17
  %59 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_sysdep_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %59, i32 0, i32 9
  %60 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %orig_sysdep_tab, align 4
  %61 = load i32, i32* %nstr, align 4
  %62 = load i32, i32* %nstrings, align 4
  %sub47 = sub i32 %61, %62
  %arrayidx48 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %60, i32 %sub47
  %length49 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx48, i32 0, i32 0
  %63 = load i32, i32* %length49, align 4
  %64 = load i32, i32* %len, align 4
  %cmp50 = icmp ugt i32 %63, %64
  br i1 %cmp50, label %land.lhs.true51, label %if.end58

land.lhs.true51:                                  ; preds = %cond.false46
  %65 = load i8*, i8** %msgid.addr, align 4
  %66 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_sysdep_tab52 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %66, i32 0, i32 9
  %67 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %orig_sysdep_tab52, align 4
  %68 = load i32, i32* %nstr, align 4
  %69 = load i32, i32* %nstrings, align 4
  %sub53 = sub i32 %68, %69
  %arrayidx54 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %67, i32 %sub53
  %pointer = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx54, i32 0, i32 1
  %70 = load i8*, i8** %pointer, align 4
  %call55 = call i32 @strcmp(i8* %65, i8* %70)
  %cmp56 = icmp eq i32 %call55, 0
  br i1 %cmp56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %land.lhs.true51, %cond.end42
  %71 = load i32, i32* %nstr, align 4
  store i32 %71, i32* %act, align 4
  br label %found

if.end58:                                         ; preds = %land.lhs.true51, %cond.false46, %cond.end42, %cond.end28
  %72 = load i32, i32* %idx, align 4
  %73 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size59 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %73, i32 0, i32 11
  %74 = load i32, i32* %hash_size59, align 4
  %75 = load i32, i32* %incr, align 4
  %sub60 = sub i32 %74, %75
  %cmp61 = icmp uge i32 %72, %sub60
  br i1 %cmp61, label %if.then62, label %if.else

if.then62:                                        ; preds = %if.end58
  %76 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size63 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %76, i32 0, i32 11
  %77 = load i32, i32* %hash_size63, align 4
  %78 = load i32, i32* %incr, align 4
  %sub64 = sub i32 %77, %78
  %79 = load i32, i32* %idx, align 4
  %sub65 = sub i32 %79, %sub64
  store i32 %sub65, i32* %idx, align 4
  br label %if.end67

if.else:                                          ; preds = %if.end58
  %80 = load i32, i32* %incr, align 4
  %81 = load i32, i32* %idx, align 4
  %add66 = add i32 %81, %80
  store i32 %add66, i32* %idx, align 4
  br label %if.end67

if.end67:                                         ; preds = %if.else, %if.then62
  br label %while.body

if.else68:                                        ; preds = %if.end3
  store i32 0, i32* %bottom, align 4
  %82 = load i32, i32* %nstrings, align 4
  store i32 %82, i32* %top, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end96, %if.else68
  %83 = load i32, i32* %bottom, align 4
  %84 = load i32, i32* %top, align 4
  %cmp69 = icmp ult i32 %83, %84
  br i1 %cmp69, label %while.body70, label %while.end

while.body70:                                     ; preds = %while.cond
  %85 = load i32, i32* %bottom, align 4
  %86 = load i32, i32* %top, align 4
  %add71 = add i32 %85, %86
  %div = udiv i32 %add71, 2
  store i32 %div, i32* %act, align 4
  %87 = load i8*, i8** %msgid.addr, align 4
  %88 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %data72 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %88, i32 0, i32 0
  %89 = load i8*, i8** %data72, align 4
  %90 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap73 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %90, i32 0, i32 3
  %91 = load i32, i32* %must_swap73, align 4
  %tobool74 = icmp ne i32 %91, 0
  br i1 %tobool74, label %cond.true75, label %cond.false80

cond.true75:                                      ; preds = %while.body70
  %92 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_tab76 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %92, i32 0, i32 6
  %93 = load %struct.string_desc*, %struct.string_desc** %orig_tab76, align 4
  %94 = load i32, i32* %act, align 4
  %arrayidx77 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %93, i32 %94
  %offset78 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx77, i32 0, i32 1
  %95 = load i32, i32* %offset78, align 4
  %call79 = call i32 @SWAP(i32 %95)
  br label %cond.end84

cond.false80:                                     ; preds = %while.body70
  %96 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_tab81 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %96, i32 0, i32 6
  %97 = load %struct.string_desc*, %struct.string_desc** %orig_tab81, align 4
  %98 = load i32, i32* %act, align 4
  %arrayidx82 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %97, i32 %98
  %offset83 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx82, i32 0, i32 1
  %99 = load i32, i32* %offset83, align 4
  br label %cond.end84

cond.end84:                                       ; preds = %cond.false80, %cond.true75
  %cond85 = phi i32 [ %call79, %cond.true75 ], [ %99, %cond.false80 ]
  %add.ptr86 = getelementptr inbounds i8, i8* %89, i32 %cond85
  %call87 = call i32 @strcmp(i8* %87, i8* %add.ptr86)
  store i32 %call87, i32* %cmp_val, align 4
  %100 = load i32, i32* %cmp_val, align 4
  %cmp88 = icmp slt i32 %100, 0
  br i1 %cmp88, label %if.then89, label %if.else90

if.then89:                                        ; preds = %cond.end84
  %101 = load i32, i32* %act, align 4
  store i32 %101, i32* %top, align 4
  br label %if.end96

if.else90:                                        ; preds = %cond.end84
  %102 = load i32, i32* %cmp_val, align 4
  %cmp91 = icmp sgt i32 %102, 0
  br i1 %cmp91, label %if.then92, label %if.else94

if.then92:                                        ; preds = %if.else90
  %103 = load i32, i32* %act, align 4
  %add93 = add i32 %103, 1
  store i32 %add93, i32* %bottom, align 4
  br label %if.end95

if.else94:                                        ; preds = %if.else90
  br label %found

if.end95:                                         ; preds = %if.then92
  br label %if.end96

if.end96:                                         ; preds = %if.end95, %if.then89
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i8* null, i8** %retval, align 4
  br label %return

found:                                            ; preds = %if.else94, %if.then57
  %104 = load i32, i32* %act, align 4
  %105 = load i32, i32* %nstrings, align 4
  %cmp97 = icmp ult i32 %104, %105
  br i1 %cmp97, label %if.then98, label %if.else127

if.then98:                                        ; preds = %found
  %106 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %data99 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %106, i32 0, i32 0
  %107 = load i8*, i8** %data99, align 4
  %108 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap100 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %108, i32 0, i32 3
  %109 = load i32, i32* %must_swap100, align 4
  %tobool101 = icmp ne i32 %109, 0
  br i1 %tobool101, label %cond.true102, label %cond.false106

cond.true102:                                     ; preds = %if.then98
  %110 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %110, i32 0, i32 7
  %111 = load %struct.string_desc*, %struct.string_desc** %trans_tab, align 4
  %112 = load i32, i32* %act, align 4
  %arrayidx103 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %111, i32 %112
  %offset104 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx103, i32 0, i32 1
  %113 = load i32, i32* %offset104, align 4
  %call105 = call i32 @SWAP(i32 %113)
  br label %cond.end110

cond.false106:                                    ; preds = %if.then98
  %114 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_tab107 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %114, i32 0, i32 7
  %115 = load %struct.string_desc*, %struct.string_desc** %trans_tab107, align 4
  %116 = load i32, i32* %act, align 4
  %arrayidx108 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %115, i32 %116
  %offset109 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx108, i32 0, i32 1
  %117 = load i32, i32* %offset109, align 4
  br label %cond.end110

cond.end110:                                      ; preds = %cond.false106, %cond.true102
  %cond111 = phi i32 [ %call105, %cond.true102 ], [ %117, %cond.false106 ]
  %add.ptr112 = getelementptr inbounds i8, i8* %107, i32 %cond111
  store i8* %add.ptr112, i8** %result, align 4
  %118 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap113 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %118, i32 0, i32 3
  %119 = load i32, i32* %must_swap113, align 4
  %tobool114 = icmp ne i32 %119, 0
  br i1 %tobool114, label %cond.true115, label %cond.false120

cond.true115:                                     ; preds = %cond.end110
  %120 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_tab116 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %120, i32 0, i32 7
  %121 = load %struct.string_desc*, %struct.string_desc** %trans_tab116, align 4
  %122 = load i32, i32* %act, align 4
  %arrayidx117 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %121, i32 %122
  %length118 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx117, i32 0, i32 0
  %123 = load i32, i32* %length118, align 4
  %call119 = call i32 @SWAP(i32 %123)
  br label %cond.end124

cond.false120:                                    ; preds = %cond.end110
  %124 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_tab121 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %124, i32 0, i32 7
  %125 = load %struct.string_desc*, %struct.string_desc** %trans_tab121, align 4
  %126 = load i32, i32* %act, align 4
  %arrayidx122 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %125, i32 %126
  %length123 = getelementptr inbounds %struct.string_desc, %struct.string_desc* %arrayidx122, i32 0, i32 0
  %127 = load i32, i32* %length123, align 4
  br label %cond.end124

cond.end124:                                      ; preds = %cond.false120, %cond.true115
  %cond125 = phi i32 [ %call119, %cond.true115 ], [ %127, %cond.false120 ]
  %add126 = add i32 %cond125, 1
  store i32 %add126, i32* %resultlen, align 4
  br label %if.end135

if.else127:                                       ; preds = %found
  %128 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_sysdep_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %128, i32 0, i32 10
  %129 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %trans_sysdep_tab, align 4
  %130 = load i32, i32* %act, align 4
  %131 = load i32, i32* %nstrings, align 4
  %sub128 = sub i32 %130, %131
  %arrayidx129 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %129, i32 %sub128
  %pointer130 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx129, i32 0, i32 1
  %132 = load i8*, i8** %pointer130, align 4
  store i8* %132, i8** %result, align 4
  %133 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_sysdep_tab131 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %133, i32 0, i32 10
  %134 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %trans_sysdep_tab131, align 4
  %135 = load i32, i32* %act, align 4
  %136 = load i32, i32* %nstrings, align 4
  %sub132 = sub i32 %135, %136
  %arrayidx133 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %134, i32 %sub132
  %length134 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx133, i32 0, i32 0
  %137 = load i32, i32* %length134, align 4
  store i32 %137, i32* %resultlen, align 4
  br label %if.end135

if.end135:                                        ; preds = %if.else127, %cond.end124
  %138 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %codeset_cntr = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %138, i32 0, i32 14
  %139 = load i32, i32* %codeset_cntr, align 4
  %140 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %cmp136 = icmp ne %struct.binding* %140, null
  br i1 %cmp136, label %cond.true137, label %cond.false139

cond.true137:                                     ; preds = %if.end135
  %141 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %codeset_cntr138 = getelementptr inbounds %struct.binding, %struct.binding* %141, i32 0, i32 2
  %142 = load i32, i32* %codeset_cntr138, align 4
  br label %cond.end140

cond.false139:                                    ; preds = %if.end135
  br label %cond.end140

cond.end140:                                      ; preds = %cond.false139, %cond.true137
  %cond141 = phi i32 [ %142, %cond.true137 ], [ 0, %cond.false139 ]
  %cmp142 = icmp ne i32 %139, %cond141
  br i1 %cmp142, label %if.then143, label %if.end145

if.then143:                                       ; preds = %cond.end140
  %143 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  call void @_nl_free_domain_conv(%struct.loaded_domain* %143)
  %144 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %145 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %146 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %call144 = call i8* @_nl_init_domain_conv(%struct.loaded_l10nfile* %144, %struct.loaded_domain* %145, %struct.binding* %146)
  br label %if.end145

if.end145:                                        ; preds = %if.then143, %cond.end140
  %147 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %147, i32 0, i32 15
  %148 = load i8*, i8** %conv, align 4
  %cmp146 = icmp ne i8* %148, inttoptr (i32 -1 to i8*)
  br i1 %cmp146, label %if.then148, label %if.end217

if.then148:                                       ; preds = %if.end145
  %149 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %149, i32 0, i32 16
  %150 = load i8**, i8*** %conv_tab, align 4
  %cmp149 = icmp eq i8** %150, null
  br i1 %cmp149, label %land.lhs.true151, label %if.end159

land.lhs.true151:                                 ; preds = %if.then148
  %151 = load i32, i32* %nstrings, align 4
  %152 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %n_sysdep_strings = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %152, i32 0, i32 8
  %153 = load i32, i32* %n_sysdep_strings, align 4
  %add152 = add i32 %151, %153
  %call153 = call i8* @calloc(i32 %add152, i32 4)
  %154 = bitcast i8* %call153 to i8**
  %155 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv_tab154 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %155, i32 0, i32 16
  store i8** %154, i8*** %conv_tab154, align 4
  %cmp155 = icmp eq i8** %154, null
  br i1 %cmp155, label %if.then157, label %if.end159

if.then157:                                       ; preds = %land.lhs.true151
  %156 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv_tab158 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %156, i32 0, i32 16
  store i8** inttoptr (i32 -1 to i8**), i8*** %conv_tab158, align 4
  br label %if.end159

if.end159:                                        ; preds = %if.then157, %land.lhs.true151, %if.then148
  %157 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv_tab160 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %157, i32 0, i32 16
  %158 = load i8**, i8*** %conv_tab160, align 4
  %cmp161 = icmp eq i8** %158, inttoptr (i32 -1 to i8**)
  br i1 %cmp161, label %if.then163, label %if.end164

if.then163:                                       ; preds = %if.end159
  br label %converted

if.end164:                                        ; preds = %if.end159
  %159 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv_tab165 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %159, i32 0, i32 16
  %160 = load i8**, i8*** %conv_tab165, align 4
  %161 = load i32, i32* %act, align 4
  %arrayidx166 = getelementptr inbounds i8*, i8** %160, i32 %161
  %162 = load i8*, i8** %arrayidx166, align 4
  %cmp167 = icmp eq i8* %162, null
  br i1 %cmp167, label %if.then169, label %if.end211

if.then169:                                       ; preds = %if.end164
  store i8* null, i8** %transmem_list, align 4
  %163 = load i8*, i8** %result, align 4
  store i8* %163, i8** %inbuf, align 4
  %164 = load i8*, i8** @_nl_find_msg.freemem, align 4
  %add.ptr170 = getelementptr inbounds i8, i8* %164, i32 4
  store i8* %add.ptr170, i8** %outbuf, align 4
  store i32 0, i32* %malloc_count, align 4
  br label %while.body172

while.body172:                                    ; preds = %if.then169, %if.end199
  %165 = load i8*, i8** %inbuf, align 4
  store i8* %165, i8** %inptr, align 4
  %166 = load i32, i32* %resultlen, align 4
  store i32 %166, i32* %inleft, align 4
  %167 = load i8*, i8** %outbuf, align 4
  store i8* %167, i8** %outptr, align 4
  %168 = load i32, i32* @_nl_find_msg.freemem_size, align 4
  %cmp173 = icmp ult i32 %168, 4
  br i1 %cmp173, label %if.then175, label %if.end176

if.then175:                                       ; preds = %while.body172
  br label %resize_freemem

if.end176:                                        ; preds = %while.body172
  %169 = load i32, i32* @_nl_find_msg.freemem_size, align 4
  %sub177 = sub i32 %169, 4
  store i32 %sub177, i32* %outleft, align 4
  %170 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv178 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %170, i32 0, i32 15
  %171 = load i8*, i8** %conv178, align 4
  %call179 = call i32 @iconv(i8* %171, i8** %inptr, i32* %inleft, i8** %outptr, i32* %outleft)
  %cmp180 = icmp ne i32 %call179, -1
  br i1 %cmp180, label %if.then182, label %if.end183

if.then182:                                       ; preds = %if.end176
  %172 = load i8*, i8** %outptr, align 4
  store i8* %172, i8** %outbuf, align 4
  br label %while.end201

if.end183:                                        ; preds = %if.end176
  %call184 = call i32* @__errno_location()
  %173 = load i32, i32* %call184, align 4
  %cmp185 = icmp ne i32 %173, 7
  br i1 %cmp185, label %if.then187, label %if.end188

if.then187:                                       ; preds = %if.end183
  br label %converted

if.end188:                                        ; preds = %if.end183
  br label %resize_freemem

resize_freemem:                                   ; preds = %if.end188, %if.then175
  %174 = load i32, i32* %malloc_count, align 4
  %cmp189 = icmp sgt i32 %174, 0
  br i1 %cmp189, label %if.then191, label %if.else193

if.then191:                                       ; preds = %resize_freemem
  %175 = load i32, i32* %malloc_count, align 4
  %inc = add nsw i32 %175, 1
  store i32 %inc, i32* %malloc_count, align 4
  %176 = load i32, i32* %malloc_count, align 4
  %mul = mul nsw i32 %176, 4080
  store i32 %mul, i32* @_nl_find_msg.freemem_size, align 4
  %177 = load i8*, i8** %transmem_list, align 4
  %178 = load i32, i32* @_nl_find_msg.freemem_size, align 4
  %call192 = call i8* @realloc(i8* %177, i32 %178)
  store i8* %call192, i8** %newmem, align 4
  br label %if.end195

if.else193:                                       ; preds = %resize_freemem
  store i32 1, i32* %malloc_count, align 4
  store i32 4080, i32* @_nl_find_msg.freemem_size, align 4
  %179 = load i32, i32* @_nl_find_msg.freemem_size, align 4
  %call194 = call i8* @malloc(i32 %179)
  store i8* %call194, i8** %newmem, align 4
  br label %if.end195

if.end195:                                        ; preds = %if.else193, %if.then191
  %180 = load i8*, i8** %newmem, align 4
  %cmp196 = icmp eq i8* %180, null
  br i1 %cmp196, label %if.then198, label %if.end199

if.then198:                                       ; preds = %if.end195
  store i8* null, i8** @_nl_find_msg.freemem, align 4
  store i32 0, i32* @_nl_find_msg.freemem_size, align 4
  br label %converted

if.end199:                                        ; preds = %if.end195
  %181 = load i8*, i8** %newmem, align 4
  store i8* %181, i8** %transmem_list, align 4
  %182 = load i8*, i8** %newmem, align 4
  store i8* %182, i8** @_nl_find_msg.freemem, align 4
  %183 = load i8*, i8** @_nl_find_msg.freemem, align 4
  %add.ptr200 = getelementptr inbounds i8, i8* %183, i32 4
  store i8* %add.ptr200, i8** %outbuf, align 4
  br label %while.body172

while.end201:                                     ; preds = %if.then182
  %184 = load i8*, i8** %outbuf, align 4
  %185 = load i8*, i8** @_nl_find_msg.freemem, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %184 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %185 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub202 = sub i32 %sub.ptr.sub, 4
  %186 = load i8*, i8** @_nl_find_msg.freemem, align 4
  %187 = bitcast i8* %186 to i32*
  store i32 %sub202, i32* %187, align 4
  %188 = load i8*, i8** @_nl_find_msg.freemem, align 4
  %189 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv_tab203 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %189, i32 0, i32 16
  %190 = load i8**, i8*** %conv_tab203, align 4
  %191 = load i32, i32* %act, align 4
  %arrayidx204 = getelementptr inbounds i8*, i8** %190, i32 %191
  store i8* %188, i8** %arrayidx204, align 4
  %192 = load i8*, i8** %outbuf, align 4
  %193 = load i8*, i8** @_nl_find_msg.freemem, align 4
  %sub.ptr.lhs.cast205 = ptrtoint i8* %192 to i32
  %sub.ptr.rhs.cast206 = ptrtoint i8* %193 to i32
  %sub.ptr.sub207 = sub i32 %sub.ptr.lhs.cast205, %sub.ptr.rhs.cast206
  %194 = load i32, i32* @_nl_find_msg.freemem_size, align 4
  %sub208 = sub i32 %194, %sub.ptr.sub207
  store i32 %sub208, i32* @_nl_find_msg.freemem_size, align 4
  %195 = load i8*, i8** %outbuf, align 4
  store i8* %195, i8** @_nl_find_msg.freemem, align 4
  %196 = load i32, i32* @_nl_find_msg.freemem_size, align 4
  %and = and i32 %196, 3
  %197 = load i8*, i8** @_nl_find_msg.freemem, align 4
  %add.ptr209 = getelementptr inbounds i8, i8* %197, i32 %and
  store i8* %add.ptr209, i8** @_nl_find_msg.freemem, align 4
  %198 = load i32, i32* @_nl_find_msg.freemem_size, align 4
  %and210 = and i32 %198, -4
  store i32 %and210, i32* @_nl_find_msg.freemem_size, align 4
  br label %if.end211

if.end211:                                        ; preds = %while.end201, %if.end164
  %199 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv_tab212 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %199, i32 0, i32 16
  %200 = load i8**, i8*** %conv_tab212, align 4
  %201 = load i32, i32* %act, align 4
  %arrayidx213 = getelementptr inbounds i8*, i8** %200, i32 %201
  %202 = load i8*, i8** %arrayidx213, align 4
  %add.ptr214 = getelementptr inbounds i8, i8* %202, i32 4
  store i8* %add.ptr214, i8** %result, align 4
  %203 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %conv_tab215 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %203, i32 0, i32 16
  %204 = load i8**, i8*** %conv_tab215, align 4
  %205 = load i32, i32* %act, align 4
  %arrayidx216 = getelementptr inbounds i8*, i8** %204, i32 %205
  %206 = load i8*, i8** %arrayidx216, align 4
  %207 = bitcast i8* %206 to i32*
  %208 = load i32, i32* %207, align 4
  store i32 %208, i32* %resultlen, align 4
  br label %if.end217

if.end217:                                        ; preds = %if.end211, %if.end145
  br label %converted

converted:                                        ; preds = %if.end217, %if.then198, %if.then187, %if.then163
  %209 = load i32, i32* %resultlen, align 4
  %210 = load i32*, i32** %lengthp.addr, align 4
  store i32 %209, i32* %210, align 4
  %211 = load i8*, i8** %result, align 4
  store i8* %211, i8** %retval, align 4
  br label %return

return:                                           ; preds = %converted, %while.end, %if.then16, %if.then2
  %212 = load i8*, i8** %retval, align 4
  ret i8* %212
}

; Function Attrs: noinline nounwind
define internal i8* @plural_lookup(%struct.loaded_l10nfile* %domain, i32 %n, i8* %translation, i32 %translation_len) #0 {
entry:
  %retval = alloca i8*, align 4
  %domain.addr = alloca %struct.loaded_l10nfile*, align 4
  %n.addr = alloca i32, align 4
  %translation.addr = alloca i8*, align 4
  %translation_len.addr = alloca i32, align 4
  %domaindata = alloca %struct.loaded_domain*, align 4
  %index = alloca i32, align 4
  %p = alloca i8*, align 4
  store %struct.loaded_l10nfile* %domain, %struct.loaded_l10nfile** %domain.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %translation, i8** %translation.addr, align 4
  store i32 %translation_len, i32* %translation_len.addr, align 4
  %0 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain.addr, align 4
  %data = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %0, i32 0, i32 2
  %1 = load i8*, i8** %data, align 4
  %2 = bitcast i8* %1 to %struct.loaded_domain*
  store %struct.loaded_domain* %2, %struct.loaded_domain** %domaindata, align 4
  %3 = load %struct.loaded_domain*, %struct.loaded_domain** %domaindata, align 4
  %plural = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %3, i32 0, i32 17
  %4 = load %struct.expression*, %struct.expression** %plural, align 4
  %5 = load i32, i32* %n.addr, align 4
  %call = call i32 @plural_eval(%struct.expression* %4, i32 %5)
  store i32 %call, i32* %index, align 4
  %6 = load i32, i32* %index, align 4
  %7 = load %struct.loaded_domain*, %struct.loaded_domain** %domaindata, align 4
  %nplurals = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %7, i32 0, i32 18
  %8 = load i32, i32* %nplurals, align 4
  %cmp = icmp uge i32 %6, %8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %index, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load i8*, i8** %translation.addr, align 4
  store i8* %9, i8** %p, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end5, %if.end
  %10 = load i32, i32* %index, align 4
  %dec = add i32 %10, -1
  store i32 %dec, i32* %index, align 4
  %cmp1 = icmp ugt i32 %10, 0
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load i8*, i8** %p, align 4
  %call2 = call i8* @strchr(i8* %11, i32 0)
  store i8* %call2, i8** %p, align 4
  %12 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %13 = load i8*, i8** %p, align 4
  %14 = load i8*, i8** %translation.addr, align 4
  %15 = load i32, i32* %translation_len.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %14, i32 %15
  %cmp3 = icmp uge i8* %13, %add.ptr
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %while.body
  %16 = load i8*, i8** %translation.addr, align 4
  store i8* %16, i8** %retval, align 4
  br label %return

if.end5:                                          ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %17 = load i8*, i8** %p, align 4
  store i8* %17, i8** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then4
  %18 = load i8*, i8** %retval, align 4
  ret i8* %18
}

declare i8* @getenv(i8*) #1

declare void @_nl_log_untranslated(i8*, i8*, i8*, i8*, i32) #1

declare void @_nl_load_domain(%struct.loaded_l10nfile*, %struct.binding*) #1

; Function Attrs: noinline nounwind
define internal i32 @hash_string(i8* %str_param) #0 {
entry:
  %str_param.addr = alloca i8*, align 4
  %hval = alloca i32, align 4
  %g = alloca i32, align 4
  %str = alloca i8*, align 4
  store i8* %str_param, i8** %str_param.addr, align 4
  %0 = load i8*, i8** %str_param.addr, align 4
  store i8* %0, i8** %str, align 4
  store i32 0, i32* %hval, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i8*, i8** %str, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %hval, align 4
  %shl = shl i32 %3, 4
  store i32 %shl, i32* %hval, align 4
  %4 = load i8*, i8** %str, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %str, align 4
  %5 = load i8, i8* %4, align 1
  %conv2 = sext i8 %5 to i32
  %6 = load i32, i32* %hval, align 4
  %add = add i32 %6, %conv2
  store i32 %add, i32* %hval, align 4
  %7 = load i32, i32* %hval, align 4
  %and = and i32 %7, -268435456
  store i32 %and, i32* %g, align 4
  %8 = load i32, i32* %g, align 4
  %cmp3 = icmp ne i32 %8, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %9 = load i32, i32* %g, align 4
  %shr = lshr i32 %9, 24
  %10 = load i32, i32* %hval, align 4
  %xor = xor i32 %10, %shr
  store i32 %xor, i32* %hval, align 4
  %11 = load i32, i32* %g, align 4
  %12 = load i32, i32* %hval, align 4
  %xor5 = xor i32 %12, %11
  store i32 %xor5, i32* %hval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %13 = load i32, i32* %hval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind
define internal i32 @SWAP(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32, i32* %i.addr, align 4
  %shl = shl i32 %0, 24
  %1 = load i32, i32* %i.addr, align 4
  %and = and i32 %1, 65280
  %shl1 = shl i32 %and, 8
  %or = or i32 %shl, %shl1
  %2 = load i32, i32* %i.addr, align 4
  %shr = lshr i32 %2, 8
  %and2 = and i32 %shr, 65280
  %or3 = or i32 %or, %and2
  %3 = load i32, i32* %i.addr, align 4
  %shr4 = lshr i32 %3, 24
  %or5 = or i32 %or3, %shr4
  ret i32 %or5
}

declare void @_nl_free_domain_conv(%struct.loaded_domain*) #1

declare i8* @_nl_init_domain_conv(%struct.loaded_l10nfile*, %struct.loaded_domain*, %struct.binding*) #1

declare i8* @calloc(i32, i32) #1

declare i32 @iconv(i8*, i8**, i32*, i8**, i32*) #1

declare i8* @realloc(i8*, i32) #1

declare i8* @malloc(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @plural_eval(%struct.expression* %pexp, i32 %n) #0 {
entry:
  %retval = alloca i32, align 4
  %pexp.addr = alloca %struct.expression*, align 4
  %n.addr = alloca i32, align 4
  %arg = alloca i32, align 4
  %leftarg = alloca i32, align 4
  %rightarg = alloca i32, align 4
  %boolarg = alloca i32, align 4
  store %struct.expression* %pexp, %struct.expression** %pexp.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %nargs = getelementptr inbounds %struct.expression, %struct.expression* %0, i32 0, i32 0
  %1 = load i32, i32* %nargs, align 4
  switch i32 %1, label %sw.epilog75 [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb5
    i32 3, label %sw.bb65
  ]

sw.bb:                                            ; preds = %entry
  %2 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %operation = getelementptr inbounds %struct.expression, %struct.expression* %2, i32 0, i32 1
  %3 = load i32, i32* %operation, align 4
  switch i32 %3, label %sw.default [
    i32 0, label %sw.bb1
    i32 1, label %sw.bb2
  ]

sw.bb1:                                           ; preds = %sw.bb
  %4 = load i32, i32* %n.addr, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

sw.bb2:                                           ; preds = %sw.bb
  %5 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %val = getelementptr inbounds %struct.expression, %struct.expression* %5, i32 0, i32 2
  %num = bitcast %union.anon* %val to i32*
  %6 = load i32, i32* %num, align 4
  store i32 %6, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %sw.bb
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %sw.epilog75

sw.bb3:                                           ; preds = %entry
  %7 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %val4 = getelementptr inbounds %struct.expression, %struct.expression* %7, i32 0, i32 2
  %args = bitcast %union.anon* %val4 to [3 x %struct.expression*]*
  %arrayidx = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args, i32 0, i32 0
  %8 = load %struct.expression*, %struct.expression** %arrayidx, align 4
  %9 = load i32, i32* %n.addr, align 4
  %call = call i32 @plural_eval(%struct.expression* %8, i32 %9)
  store i32 %call, i32* %arg, align 4
  %10 = load i32, i32* %arg, align 4
  %tobool = icmp ne i32 %10, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* %retval, align 4
  br label %return

sw.bb5:                                           ; preds = %entry
  %11 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %val6 = getelementptr inbounds %struct.expression, %struct.expression* %11, i32 0, i32 2
  %args7 = bitcast %union.anon* %val6 to [3 x %struct.expression*]*
  %arrayidx8 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args7, i32 0, i32 0
  %12 = load %struct.expression*, %struct.expression** %arrayidx8, align 4
  %13 = load i32, i32* %n.addr, align 4
  %call9 = call i32 @plural_eval(%struct.expression* %12, i32 %13)
  store i32 %call9, i32* %leftarg, align 4
  %14 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %operation10 = getelementptr inbounds %struct.expression, %struct.expression* %14, i32 0, i32 1
  %15 = load i32, i32* %operation10, align 4
  %cmp = icmp eq i32 %15, 15
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb5
  %16 = load i32, i32* %leftarg, align 4
  %tobool11 = icmp ne i32 %16, 0
  br i1 %tobool11, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then
  %17 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %val12 = getelementptr inbounds %struct.expression, %struct.expression* %17, i32 0, i32 2
  %args13 = bitcast %union.anon* %val12 to [3 x %struct.expression*]*
  %arrayidx14 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args13, i32 0, i32 1
  %18 = load %struct.expression*, %struct.expression** %arrayidx14, align 4
  %19 = load i32, i32* %n.addr, align 4
  %call15 = call i32 @plural_eval(%struct.expression* %18, i32 %19)
  %tobool16 = icmp ne i32 %call15, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then
  %20 = phi i1 [ true, %if.then ], [ %tobool16, %lor.rhs ]
  %lor.ext = zext i1 %20 to i32
  store i32 %lor.ext, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %sw.bb5
  %21 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %operation17 = getelementptr inbounds %struct.expression, %struct.expression* %21, i32 0, i32 1
  %22 = load i32, i32* %operation17, align 4
  %cmp18 = icmp eq i32 %22, 14
  br i1 %cmp18, label %if.then19, label %if.else26

if.then19:                                        ; preds = %if.else
  %23 = load i32, i32* %leftarg, align 4
  %tobool20 = icmp ne i32 %23, 0
  br i1 %tobool20, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then19
  %24 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %val21 = getelementptr inbounds %struct.expression, %struct.expression* %24, i32 0, i32 2
  %args22 = bitcast %union.anon* %val21 to [3 x %struct.expression*]*
  %arrayidx23 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args22, i32 0, i32 1
  %25 = load %struct.expression*, %struct.expression** %arrayidx23, align 4
  %26 = load i32, i32* %n.addr, align 4
  %call24 = call i32 @plural_eval(%struct.expression* %25, i32 %26)
  %tobool25 = icmp ne i32 %call24, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then19
  %27 = phi i1 [ false, %if.then19 ], [ %tobool25, %land.rhs ]
  %land.ext = zext i1 %27 to i32
  store i32 %land.ext, i32* %retval, align 4
  br label %return

if.else26:                                        ; preds = %if.else
  %28 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %val27 = getelementptr inbounds %struct.expression, %struct.expression* %28, i32 0, i32 2
  %args28 = bitcast %union.anon* %val27 to [3 x %struct.expression*]*
  %arrayidx29 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args28, i32 0, i32 1
  %29 = load %struct.expression*, %struct.expression** %arrayidx29, align 4
  %30 = load i32, i32* %n.addr, align 4
  %call30 = call i32 @plural_eval(%struct.expression* %29, i32 %30)
  store i32 %call30, i32* %rightarg, align 4
  %31 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %operation31 = getelementptr inbounds %struct.expression, %struct.expression* %31, i32 0, i32 1
  %32 = load i32, i32* %operation31, align 4
  switch i32 %32, label %sw.default61 [
    i32 3, label %sw.bb32
    i32 4, label %sw.bb33
    i32 5, label %sw.bb37
    i32 6, label %sw.bb42
    i32 7, label %sw.bb43
    i32 8, label %sw.bb44
    i32 9, label %sw.bb46
    i32 10, label %sw.bb49
    i32 11, label %sw.bb52
    i32 12, label %sw.bb55
    i32 13, label %sw.bb58
  ]

sw.bb32:                                          ; preds = %if.else26
  %33 = load i32, i32* %leftarg, align 4
  %34 = load i32, i32* %rightarg, align 4
  %mul = mul i32 %33, %34
  store i32 %mul, i32* %retval, align 4
  br label %return

sw.bb33:                                          ; preds = %if.else26
  %35 = load i32, i32* %rightarg, align 4
  %cmp34 = icmp eq i32 %35, 0
  br i1 %cmp34, label %if.then35, label %if.end

if.then35:                                        ; preds = %sw.bb33
  %call36 = call i32 @raise(i32 8)
  br label %if.end

if.end:                                           ; preds = %if.then35, %sw.bb33
  %36 = load i32, i32* %leftarg, align 4
  %37 = load i32, i32* %rightarg, align 4
  %div = udiv i32 %36, %37
  store i32 %div, i32* %retval, align 4
  br label %return

sw.bb37:                                          ; preds = %if.else26
  %38 = load i32, i32* %rightarg, align 4
  %cmp38 = icmp eq i32 %38, 0
  br i1 %cmp38, label %if.then39, label %if.end41

if.then39:                                        ; preds = %sw.bb37
  %call40 = call i32 @raise(i32 8)
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %sw.bb37
  %39 = load i32, i32* %leftarg, align 4
  %40 = load i32, i32* %rightarg, align 4
  %rem = urem i32 %39, %40
  store i32 %rem, i32* %retval, align 4
  br label %return

sw.bb42:                                          ; preds = %if.else26
  %41 = load i32, i32* %leftarg, align 4
  %42 = load i32, i32* %rightarg, align 4
  %add = add i32 %41, %42
  store i32 %add, i32* %retval, align 4
  br label %return

sw.bb43:                                          ; preds = %if.else26
  %43 = load i32, i32* %leftarg, align 4
  %44 = load i32, i32* %rightarg, align 4
  %sub = sub i32 %43, %44
  store i32 %sub, i32* %retval, align 4
  br label %return

sw.bb44:                                          ; preds = %if.else26
  %45 = load i32, i32* %leftarg, align 4
  %46 = load i32, i32* %rightarg, align 4
  %cmp45 = icmp ult i32 %45, %46
  %conv = zext i1 %cmp45 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

sw.bb46:                                          ; preds = %if.else26
  %47 = load i32, i32* %leftarg, align 4
  %48 = load i32, i32* %rightarg, align 4
  %cmp47 = icmp ugt i32 %47, %48
  %conv48 = zext i1 %cmp47 to i32
  store i32 %conv48, i32* %retval, align 4
  br label %return

sw.bb49:                                          ; preds = %if.else26
  %49 = load i32, i32* %leftarg, align 4
  %50 = load i32, i32* %rightarg, align 4
  %cmp50 = icmp ule i32 %49, %50
  %conv51 = zext i1 %cmp50 to i32
  store i32 %conv51, i32* %retval, align 4
  br label %return

sw.bb52:                                          ; preds = %if.else26
  %51 = load i32, i32* %leftarg, align 4
  %52 = load i32, i32* %rightarg, align 4
  %cmp53 = icmp uge i32 %51, %52
  %conv54 = zext i1 %cmp53 to i32
  store i32 %conv54, i32* %retval, align 4
  br label %return

sw.bb55:                                          ; preds = %if.else26
  %53 = load i32, i32* %leftarg, align 4
  %54 = load i32, i32* %rightarg, align 4
  %cmp56 = icmp eq i32 %53, %54
  %conv57 = zext i1 %cmp56 to i32
  store i32 %conv57, i32* %retval, align 4
  br label %return

sw.bb58:                                          ; preds = %if.else26
  %55 = load i32, i32* %leftarg, align 4
  %56 = load i32, i32* %rightarg, align 4
  %cmp59 = icmp ne i32 %55, %56
  %conv60 = zext i1 %cmp59 to i32
  store i32 %conv60, i32* %retval, align 4
  br label %return

sw.default61:                                     ; preds = %if.else26
  br label %sw.epilog62

sw.epilog62:                                      ; preds = %sw.default61
  br label %if.end63

if.end63:                                         ; preds = %sw.epilog62
  br label %if.end64

if.end64:                                         ; preds = %if.end63
  br label %sw.epilog75

sw.bb65:                                          ; preds = %entry
  %57 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %val66 = getelementptr inbounds %struct.expression, %struct.expression* %57, i32 0, i32 2
  %args67 = bitcast %union.anon* %val66 to [3 x %struct.expression*]*
  %arrayidx68 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args67, i32 0, i32 0
  %58 = load %struct.expression*, %struct.expression** %arrayidx68, align 4
  %59 = load i32, i32* %n.addr, align 4
  %call69 = call i32 @plural_eval(%struct.expression* %58, i32 %59)
  store i32 %call69, i32* %boolarg, align 4
  %60 = load %struct.expression*, %struct.expression** %pexp.addr, align 4
  %val70 = getelementptr inbounds %struct.expression, %struct.expression* %60, i32 0, i32 2
  %args71 = bitcast %union.anon* %val70 to [3 x %struct.expression*]*
  %61 = load i32, i32* %boolarg, align 4
  %tobool72 = icmp ne i32 %61, 0
  %cond = select i1 %tobool72, i32 1, i32 2
  %arrayidx73 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args71, i32 0, i32 %cond
  %62 = load %struct.expression*, %struct.expression** %arrayidx73, align 4
  %63 = load i32, i32* %n.addr, align 4
  %call74 = call i32 @plural_eval(%struct.expression* %62, i32 %63)
  store i32 %call74, i32* %retval, align 4
  br label %return

sw.epilog75:                                      ; preds = %entry, %if.end64, %sw.epilog
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog75, %sw.bb65, %sw.bb58, %sw.bb55, %sw.bb52, %sw.bb49, %sw.bb46, %sw.bb44, %sw.bb43, %sw.bb42, %if.end41, %if.end, %sw.bb32, %land.end, %lor.end, %sw.bb3, %sw.bb2, %sw.bb1
  %64 = load i32, i32* %retval, align 4
  ret i32 %64
}

declare i32 @raise(i32) #1

declare i8* @_nl_locale_name(i32, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
