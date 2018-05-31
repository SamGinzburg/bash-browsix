; ModuleID = 'bindtextdom.c'
source_filename = "bindtextdom.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.binding = type { %struct.binding*, i8*, i32, i8*, [0 x i8] }

@libintl_nl_domain_bindings = external global %struct.binding*, align 4
@libintl_nl_default_dirname = external constant [0 x i8], align 1
@_nl_msg_cat_cntr = external global i32, align 4

; Function Attrs: noinline nounwind
define i8* @libintl_bindtextdomain(i8* %domainname, i8* %dirname) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %dirname.addr = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %dirname, i8** %dirname.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  call void @set_binding_values(i8* %0, i8** %dirname.addr, i8** null)
  %1 = load i8*, i8** %dirname.addr, align 4
  ret i8* %1
}

; Function Attrs: noinline nounwind
define internal void @set_binding_values(i8* %domainname, i8** %dirnamep, i8** %codesetp) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %dirnamep.addr = alloca i8**, align 4
  %codesetp.addr = alloca i8**, align 4
  %binding = alloca %struct.binding*, align 4
  %modified = alloca i32, align 4
  %compare = alloca i32, align 4
  %dirname = alloca i8*, align 4
  %result = alloca i8*, align 4
  %codeset = alloca i8*, align 4
  %result61 = alloca i8*, align 4
  %len = alloca i32, align 4
  %new_binding = alloca %struct.binding*, align 4
  %dirname115 = alloca i8*, align 4
  %result125 = alloca i8*, align 4
  %codeset140 = alloca i8*, align 4
  %result144 = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8** %dirnamep, i8*** %dirnamep.addr, align 4
  store i8** %codesetp, i8*** %codesetp.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %domainname.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end7

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8**, i8*** %dirnamep.addr, align 4
  %tobool = icmp ne i8** %3, null
  br i1 %tobool, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i8**, i8*** %dirnamep.addr, align 4
  store i8* null, i8** %4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %5 = load i8**, i8*** %codesetp.addr, align 4
  %tobool4 = icmp ne i8** %5, null
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %6 = load i8**, i8*** %codesetp.addr, align 4
  store i8* null, i8** %6, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  br label %if.end201

if.end7:                                          ; preds = %lor.lhs.false
  store i32 0, i32* %modified, align 4
  %7 = load %struct.binding*, %struct.binding** @libintl_nl_domain_bindings, align 4
  store %struct.binding* %7, %struct.binding** %binding, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %8 = load %struct.binding*, %struct.binding** %binding, align 4
  %cmp8 = icmp ne %struct.binding* %8, null
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %domainname.addr, align 4
  %10 = load %struct.binding*, %struct.binding** %binding, align 4
  %domainname10 = getelementptr inbounds %struct.binding, %struct.binding* %10, i32 0, i32 4
  %arraydecay = getelementptr inbounds [0 x i8], [0 x i8]* %domainname10, i32 0, i32 0
  %call = call i32 @strcmp(i8* %9, i8* %arraydecay)
  store i32 %call, i32* %compare, align 4
  %11 = load i32, i32* %compare, align 4
  %cmp11 = icmp eq i32 %11, 0
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %for.body
  br label %for.end

if.end14:                                         ; preds = %for.body
  %12 = load i32, i32* %compare, align 4
  %cmp15 = icmp slt i32 %12, 0
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end14
  store %struct.binding* null, %struct.binding** %binding, align 4
  br label %for.end

if.end18:                                         ; preds = %if.end14
  br label %for.inc

for.inc:                                          ; preds = %if.end18
  %13 = load %struct.binding*, %struct.binding** %binding, align 4
  %next = getelementptr inbounds %struct.binding, %struct.binding* %13, i32 0, i32 0
  %14 = load %struct.binding*, %struct.binding** %next, align 4
  store %struct.binding* %14, %struct.binding** %binding, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then17, %if.then13, %for.cond
  %15 = load %struct.binding*, %struct.binding** %binding, align 4
  %cmp19 = icmp ne %struct.binding* %15, null
  br i1 %cmp19, label %if.then21, label %if.else85

if.then21:                                        ; preds = %for.end
  %16 = load i8**, i8*** %dirnamep.addr, align 4
  %tobool22 = icmp ne i8** %16, null
  br i1 %tobool22, label %if.then23, label %if.end53

if.then23:                                        ; preds = %if.then21
  %17 = load i8**, i8*** %dirnamep.addr, align 4
  %18 = load i8*, i8** %17, align 4
  store i8* %18, i8** %dirname, align 4
  %19 = load i8*, i8** %dirname, align 4
  %cmp24 = icmp eq i8* %19, null
  br i1 %cmp24, label %if.then26, label %if.else

if.then26:                                        ; preds = %if.then23
  %20 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname27 = getelementptr inbounds %struct.binding, %struct.binding* %20, i32 0, i32 1
  %21 = load i8*, i8** %dirname27, align 4
  %22 = load i8**, i8*** %dirnamep.addr, align 4
  store i8* %21, i8** %22, align 4
  br label %if.end52

if.else:                                          ; preds = %if.then23
  %23 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname28 = getelementptr inbounds %struct.binding, %struct.binding* %23, i32 0, i32 1
  %24 = load i8*, i8** %dirname28, align 4
  store i8* %24, i8** %result, align 4
  %25 = load i8*, i8** %dirname, align 4
  %26 = load i8*, i8** %result, align 4
  %call29 = call i32 @strcmp(i8* %25, i8* %26)
  %cmp30 = icmp ne i32 %call29, 0
  br i1 %cmp30, label %if.then32, label %if.end51

if.then32:                                        ; preds = %if.else
  %27 = load i8*, i8** %dirname, align 4
  %call33 = call i32 @strcmp(i8* %27, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0))
  %cmp34 = icmp eq i32 %call33, 0
  br i1 %cmp34, label %if.then36, label %if.else37

if.then36:                                        ; preds = %if.then32
  store i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0), i8** %result, align 4
  br label %if.end39

if.else37:                                        ; preds = %if.then32
  %28 = load i8*, i8** %dirname, align 4
  %call38 = call i8* @strdup(i8* %28)
  store i8* %call38, i8** %result, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.else37, %if.then36
  %29 = load i8*, i8** %result, align 4
  %cmp40 = icmp ne i8* %29, null
  br i1 %cmp40, label %if.then42, label %if.end50

if.then42:                                        ; preds = %if.end39
  %30 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname43 = getelementptr inbounds %struct.binding, %struct.binding* %30, i32 0, i32 1
  %31 = load i8*, i8** %dirname43, align 4
  %cmp44 = icmp ne i8* %31, getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0)
  br i1 %cmp44, label %if.then46, label %if.end48

if.then46:                                        ; preds = %if.then42
  %32 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname47 = getelementptr inbounds %struct.binding, %struct.binding* %32, i32 0, i32 1
  %33 = load i8*, i8** %dirname47, align 4
  call void @free(i8* %33)
  br label %if.end48

if.end48:                                         ; preds = %if.then46, %if.then42
  %34 = load i8*, i8** %result, align 4
  %35 = load %struct.binding*, %struct.binding** %binding, align 4
  %dirname49 = getelementptr inbounds %struct.binding, %struct.binding* %35, i32 0, i32 1
  store i8* %34, i8** %dirname49, align 4
  store i32 1, i32* %modified, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.end48, %if.end39
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.else
  %36 = load i8*, i8** %result, align 4
  %37 = load i8**, i8*** %dirnamep.addr, align 4
  store i8* %36, i8** %37, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then26
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then21
  %38 = load i8**, i8*** %codesetp.addr, align 4
  %tobool54 = icmp ne i8** %38, null
  br i1 %tobool54, label %if.then55, label %if.end84

if.then55:                                        ; preds = %if.end53
  %39 = load i8**, i8*** %codesetp.addr, align 4
  %40 = load i8*, i8** %39, align 4
  store i8* %40, i8** %codeset, align 4
  %41 = load i8*, i8** %codeset, align 4
  %cmp56 = icmp eq i8* %41, null
  br i1 %cmp56, label %if.then58, label %if.else60

if.then58:                                        ; preds = %if.then55
  %42 = load %struct.binding*, %struct.binding** %binding, align 4
  %codeset59 = getelementptr inbounds %struct.binding, %struct.binding* %42, i32 0, i32 3
  %43 = load i8*, i8** %codeset59, align 4
  %44 = load i8**, i8*** %codesetp.addr, align 4
  store i8* %43, i8** %44, align 4
  br label %if.end83

if.else60:                                        ; preds = %if.then55
  %45 = load %struct.binding*, %struct.binding** %binding, align 4
  %codeset62 = getelementptr inbounds %struct.binding, %struct.binding* %45, i32 0, i32 3
  %46 = load i8*, i8** %codeset62, align 4
  store i8* %46, i8** %result61, align 4
  %47 = load i8*, i8** %result61, align 4
  %cmp63 = icmp eq i8* %47, null
  br i1 %cmp63, label %if.then69, label %lor.lhs.false65

lor.lhs.false65:                                  ; preds = %if.else60
  %48 = load i8*, i8** %codeset, align 4
  %49 = load i8*, i8** %result61, align 4
  %call66 = call i32 @strcmp(i8* %48, i8* %49)
  %cmp67 = icmp ne i32 %call66, 0
  br i1 %cmp67, label %if.then69, label %if.end82

if.then69:                                        ; preds = %lor.lhs.false65, %if.else60
  %50 = load i8*, i8** %codeset, align 4
  %call70 = call i8* @strdup(i8* %50)
  store i8* %call70, i8** %result61, align 4
  %51 = load i8*, i8** %result61, align 4
  %cmp71 = icmp ne i8* %51, null
  br i1 %cmp71, label %if.then73, label %if.end81

if.then73:                                        ; preds = %if.then69
  %52 = load %struct.binding*, %struct.binding** %binding, align 4
  %codeset74 = getelementptr inbounds %struct.binding, %struct.binding* %52, i32 0, i32 3
  %53 = load i8*, i8** %codeset74, align 4
  %cmp75 = icmp ne i8* %53, null
  br i1 %cmp75, label %if.then77, label %if.end79

if.then77:                                        ; preds = %if.then73
  %54 = load %struct.binding*, %struct.binding** %binding, align 4
  %codeset78 = getelementptr inbounds %struct.binding, %struct.binding* %54, i32 0, i32 3
  %55 = load i8*, i8** %codeset78, align 4
  call void @free(i8* %55)
  br label %if.end79

if.end79:                                         ; preds = %if.then77, %if.then73
  %56 = load i8*, i8** %result61, align 4
  %57 = load %struct.binding*, %struct.binding** %binding, align 4
  %codeset80 = getelementptr inbounds %struct.binding, %struct.binding* %57, i32 0, i32 3
  store i8* %56, i8** %codeset80, align 4
  %58 = load %struct.binding*, %struct.binding** %binding, align 4
  %codeset_cntr = getelementptr inbounds %struct.binding, %struct.binding* %58, i32 0, i32 2
  %59 = load i32, i32* %codeset_cntr, align 4
  %inc = add nsw i32 %59, 1
  store i32 %inc, i32* %codeset_cntr, align 4
  store i32 1, i32* %modified, align 4
  br label %if.end81

if.end81:                                         ; preds = %if.end79, %if.then69
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %lor.lhs.false65
  %60 = load i8*, i8** %result61, align 4
  %61 = load i8**, i8*** %codesetp.addr, align 4
  store i8* %60, i8** %61, align 4
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %if.then58
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %if.end53
  br label %if.end197

if.else85:                                        ; preds = %for.end
  %62 = load i8**, i8*** %dirnamep.addr, align 4
  %cmp86 = icmp eq i8** %62, null
  br i1 %cmp86, label %land.lhs.true, label %lor.lhs.false88

lor.lhs.false88:                                  ; preds = %if.else85
  %63 = load i8**, i8*** %dirnamep.addr, align 4
  %64 = load i8*, i8** %63, align 4
  %cmp89 = icmp eq i8* %64, null
  br i1 %cmp89, label %land.lhs.true, label %if.else103

land.lhs.true:                                    ; preds = %lor.lhs.false88, %if.else85
  %65 = load i8**, i8*** %codesetp.addr, align 4
  %cmp91 = icmp eq i8** %65, null
  br i1 %cmp91, label %if.then96, label %lor.lhs.false93

lor.lhs.false93:                                  ; preds = %land.lhs.true
  %66 = load i8**, i8*** %codesetp.addr, align 4
  %67 = load i8*, i8** %66, align 4
  %cmp94 = icmp eq i8* %67, null
  br i1 %cmp94, label %if.then96, label %if.else103

if.then96:                                        ; preds = %lor.lhs.false93, %land.lhs.true
  %68 = load i8**, i8*** %dirnamep.addr, align 4
  %tobool97 = icmp ne i8** %68, null
  br i1 %tobool97, label %if.then98, label %if.end99

if.then98:                                        ; preds = %if.then96
  %69 = load i8**, i8*** %dirnamep.addr, align 4
  store i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0), i8** %69, align 4
  br label %if.end99

if.end99:                                         ; preds = %if.then98, %if.then96
  %70 = load i8**, i8*** %codesetp.addr, align 4
  %tobool100 = icmp ne i8** %70, null
  br i1 %tobool100, label %if.then101, label %if.end102

if.then101:                                       ; preds = %if.end99
  %71 = load i8**, i8*** %codesetp.addr, align 4
  store i8* null, i8** %71, align 4
  br label %if.end102

if.end102:                                        ; preds = %if.then101, %if.end99
  br label %if.end196

if.else103:                                       ; preds = %lor.lhs.false93, %lor.lhs.false88
  %72 = load i8*, i8** %domainname.addr, align 4
  %call104 = call i32 @strlen(i8* %72)
  %add = add i32 %call104, 1
  store i32 %add, i32* %len, align 4
  %73 = load i32, i32* %len, align 4
  %add105 = add i32 16, %73
  %call106 = call i8* @malloc(i32 %add105)
  %74 = bitcast i8* %call106 to %struct.binding*
  store %struct.binding* %74, %struct.binding** %new_binding, align 4
  %75 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %cmp107 = icmp eq %struct.binding* %75, null
  br i1 %cmp107, label %if.then109, label %if.end110

if.then109:                                       ; preds = %if.else103
  br label %failed

if.end110:                                        ; preds = %if.else103
  %76 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %domainname111 = getelementptr inbounds %struct.binding, %struct.binding* %76, i32 0, i32 4
  %arraydecay112 = getelementptr inbounds [0 x i8], [0 x i8]* %domainname111, i32 0, i32 0
  %77 = load i8*, i8** %domainname.addr, align 4
  %78 = load i32, i32* %len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %arraydecay112, i8* %77, i32 %78, i32 1, i1 false)
  %79 = load i8**, i8*** %dirnamep.addr, align 4
  %tobool113 = icmp ne i8** %79, null
  br i1 %tobool113, label %if.then114, label %if.else134

if.then114:                                       ; preds = %if.end110
  %80 = load i8**, i8*** %dirnamep.addr, align 4
  %81 = load i8*, i8** %80, align 4
  store i8* %81, i8** %dirname115, align 4
  %82 = load i8*, i8** %dirname115, align 4
  %cmp116 = icmp eq i8* %82, null
  br i1 %cmp116, label %if.then118, label %if.else119

if.then118:                                       ; preds = %if.then114
  store i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0), i8** %dirname115, align 4
  br label %if.end132

if.else119:                                       ; preds = %if.then114
  %83 = load i8*, i8** %dirname115, align 4
  %call120 = call i32 @strcmp(i8* %83, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0))
  %cmp121 = icmp eq i32 %call120, 0
  br i1 %cmp121, label %if.then123, label %if.else124

if.then123:                                       ; preds = %if.else119
  store i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0), i8** %dirname115, align 4
  br label %if.end131

if.else124:                                       ; preds = %if.else119
  %84 = load i8*, i8** %dirname115, align 4
  %call126 = call i8* @strdup(i8* %84)
  store i8* %call126, i8** %result125, align 4
  %85 = load i8*, i8** %result125, align 4
  %cmp127 = icmp eq i8* %85, null
  br i1 %cmp127, label %if.then129, label %if.end130

if.then129:                                       ; preds = %if.else124
  br label %failed_dirname

if.end130:                                        ; preds = %if.else124
  %86 = load i8*, i8** %result125, align 4
  store i8* %86, i8** %dirname115, align 4
  br label %if.end131

if.end131:                                        ; preds = %if.end130, %if.then123
  br label %if.end132

if.end132:                                        ; preds = %if.end131, %if.then118
  %87 = load i8*, i8** %dirname115, align 4
  %88 = load i8**, i8*** %dirnamep.addr, align 4
  store i8* %87, i8** %88, align 4
  %89 = load i8*, i8** %dirname115, align 4
  %90 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %dirname133 = getelementptr inbounds %struct.binding, %struct.binding* %90, i32 0, i32 1
  store i8* %89, i8** %dirname133, align 4
  br label %if.end136

if.else134:                                       ; preds = %if.end110
  %91 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %dirname135 = getelementptr inbounds %struct.binding, %struct.binding* %91, i32 0, i32 1
  store i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0), i8** %dirname135, align 4
  br label %if.end136

if.end136:                                        ; preds = %if.else134, %if.end132
  %92 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %codeset_cntr137 = getelementptr inbounds %struct.binding, %struct.binding* %92, i32 0, i32 2
  store i32 0, i32* %codeset_cntr137, align 4
  %93 = load i8**, i8*** %codesetp.addr, align 4
  %tobool138 = icmp ne i8** %93, null
  br i1 %tobool138, label %if.then139, label %if.else154

if.then139:                                       ; preds = %if.end136
  %94 = load i8**, i8*** %codesetp.addr, align 4
  %95 = load i8*, i8** %94, align 4
  store i8* %95, i8** %codeset140, align 4
  %96 = load i8*, i8** %codeset140, align 4
  %cmp141 = icmp ne i8* %96, null
  br i1 %cmp141, label %if.then143, label %if.end152

if.then143:                                       ; preds = %if.then139
  %97 = load i8*, i8** %codeset140, align 4
  %call145 = call i8* @strdup(i8* %97)
  store i8* %call145, i8** %result144, align 4
  %98 = load i8*, i8** %result144, align 4
  %cmp146 = icmp eq i8* %98, null
  br i1 %cmp146, label %if.then148, label %if.end149

if.then148:                                       ; preds = %if.then143
  br label %failed_codeset

if.end149:                                        ; preds = %if.then143
  %99 = load i8*, i8** %result144, align 4
  store i8* %99, i8** %codeset140, align 4
  %100 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %codeset_cntr150 = getelementptr inbounds %struct.binding, %struct.binding* %100, i32 0, i32 2
  %101 = load i32, i32* %codeset_cntr150, align 4
  %inc151 = add nsw i32 %101, 1
  store i32 %inc151, i32* %codeset_cntr150, align 4
  br label %if.end152

if.end152:                                        ; preds = %if.end149, %if.then139
  %102 = load i8*, i8** %codeset140, align 4
  %103 = load i8**, i8*** %codesetp.addr, align 4
  store i8* %102, i8** %103, align 4
  %104 = load i8*, i8** %codeset140, align 4
  %105 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %codeset153 = getelementptr inbounds %struct.binding, %struct.binding* %105, i32 0, i32 3
  store i8* %104, i8** %codeset153, align 4
  br label %if.end156

if.else154:                                       ; preds = %if.end136
  %106 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %codeset155 = getelementptr inbounds %struct.binding, %struct.binding* %106, i32 0, i32 3
  store i8* null, i8** %codeset155, align 4
  br label %if.end156

if.end156:                                        ; preds = %if.else154, %if.end152
  %107 = load %struct.binding*, %struct.binding** @libintl_nl_domain_bindings, align 4
  %cmp157 = icmp eq %struct.binding* %107, null
  br i1 %cmp157, label %if.then165, label %lor.lhs.false159

lor.lhs.false159:                                 ; preds = %if.end156
  %108 = load i8*, i8** %domainname.addr, align 4
  %109 = load %struct.binding*, %struct.binding** @libintl_nl_domain_bindings, align 4
  %domainname160 = getelementptr inbounds %struct.binding, %struct.binding* %109, i32 0, i32 4
  %arraydecay161 = getelementptr inbounds [0 x i8], [0 x i8]* %domainname160, i32 0, i32 0
  %call162 = call i32 @strcmp(i8* %108, i8* %arraydecay161)
  %cmp163 = icmp slt i32 %call162, 0
  br i1 %cmp163, label %if.then165, label %if.else167

if.then165:                                       ; preds = %lor.lhs.false159, %if.end156
  %110 = load %struct.binding*, %struct.binding** @libintl_nl_domain_bindings, align 4
  %111 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %next166 = getelementptr inbounds %struct.binding, %struct.binding* %111, i32 0, i32 0
  store %struct.binding* %110, %struct.binding** %next166, align 4
  %112 = load %struct.binding*, %struct.binding** %new_binding, align 4
  store %struct.binding* %112, %struct.binding** @libintl_nl_domain_bindings, align 4
  br label %if.end181

if.else167:                                       ; preds = %lor.lhs.false159
  %113 = load %struct.binding*, %struct.binding** @libintl_nl_domain_bindings, align 4
  store %struct.binding* %113, %struct.binding** %binding, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else167
  %114 = load %struct.binding*, %struct.binding** %binding, align 4
  %next168 = getelementptr inbounds %struct.binding, %struct.binding* %114, i32 0, i32 0
  %115 = load %struct.binding*, %struct.binding** %next168, align 4
  %cmp169 = icmp ne %struct.binding* %115, null
  br i1 %cmp169, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %116 = load i8*, i8** %domainname.addr, align 4
  %117 = load %struct.binding*, %struct.binding** %binding, align 4
  %next171 = getelementptr inbounds %struct.binding, %struct.binding* %117, i32 0, i32 0
  %118 = load %struct.binding*, %struct.binding** %next171, align 4
  %domainname172 = getelementptr inbounds %struct.binding, %struct.binding* %118, i32 0, i32 4
  %arraydecay173 = getelementptr inbounds [0 x i8], [0 x i8]* %domainname172, i32 0, i32 0
  %call174 = call i32 @strcmp(i8* %116, i8* %arraydecay173)
  %cmp175 = icmp sgt i32 %call174, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %119 = phi i1 [ false, %while.cond ], [ %cmp175, %land.rhs ]
  br i1 %119, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %120 = load %struct.binding*, %struct.binding** %binding, align 4
  %next177 = getelementptr inbounds %struct.binding, %struct.binding* %120, i32 0, i32 0
  %121 = load %struct.binding*, %struct.binding** %next177, align 4
  store %struct.binding* %121, %struct.binding** %binding, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %122 = load %struct.binding*, %struct.binding** %binding, align 4
  %next178 = getelementptr inbounds %struct.binding, %struct.binding* %122, i32 0, i32 0
  %123 = load %struct.binding*, %struct.binding** %next178, align 4
  %124 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %next179 = getelementptr inbounds %struct.binding, %struct.binding* %124, i32 0, i32 0
  store %struct.binding* %123, %struct.binding** %next179, align 4
  %125 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %126 = load %struct.binding*, %struct.binding** %binding, align 4
  %next180 = getelementptr inbounds %struct.binding, %struct.binding* %126, i32 0, i32 0
  store %struct.binding* %125, %struct.binding** %next180, align 4
  br label %if.end181

if.end181:                                        ; preds = %while.end, %if.then165
  store i32 1, i32* %modified, align 4
  br i1 false, label %if.then182, label %if.end195

if.then182:                                       ; preds = %if.end181
  br label %failed_codeset

failed_codeset:                                   ; preds = %if.then182, %if.then148
  %127 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %dirname183 = getelementptr inbounds %struct.binding, %struct.binding* %127, i32 0, i32 1
  %128 = load i8*, i8** %dirname183, align 4
  %cmp184 = icmp ne i8* %128, getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_dirname, i32 0, i32 0)
  br i1 %cmp184, label %if.then186, label %if.end188

if.then186:                                       ; preds = %failed_codeset
  %129 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %dirname187 = getelementptr inbounds %struct.binding, %struct.binding* %129, i32 0, i32 1
  %130 = load i8*, i8** %dirname187, align 4
  call void @free(i8* %130)
  br label %if.end188

if.end188:                                        ; preds = %if.then186, %failed_codeset
  br label %failed_dirname

failed_dirname:                                   ; preds = %if.end188, %if.then129
  %131 = load %struct.binding*, %struct.binding** %new_binding, align 4
  %132 = bitcast %struct.binding* %131 to i8*
  call void @free(i8* %132)
  br label %failed

failed:                                           ; preds = %failed_dirname, %if.then109
  %133 = load i8**, i8*** %dirnamep.addr, align 4
  %tobool189 = icmp ne i8** %133, null
  br i1 %tobool189, label %if.then190, label %if.end191

if.then190:                                       ; preds = %failed
  %134 = load i8**, i8*** %dirnamep.addr, align 4
  store i8* null, i8** %134, align 4
  br label %if.end191

if.end191:                                        ; preds = %if.then190, %failed
  %135 = load i8**, i8*** %codesetp.addr, align 4
  %tobool192 = icmp ne i8** %135, null
  br i1 %tobool192, label %if.then193, label %if.end194

if.then193:                                       ; preds = %if.end191
  %136 = load i8**, i8*** %codesetp.addr, align 4
  store i8* null, i8** %136, align 4
  br label %if.end194

if.end194:                                        ; preds = %if.then193, %if.end191
  br label %if.end195

if.end195:                                        ; preds = %if.end194, %if.end181
  br label %if.end196

if.end196:                                        ; preds = %if.end195, %if.end102
  br label %if.end197

if.end197:                                        ; preds = %if.end196, %if.end84
  %137 = load i32, i32* %modified, align 4
  %tobool198 = icmp ne i32 %137, 0
  br i1 %tobool198, label %if.then199, label %if.end201

if.then199:                                       ; preds = %if.end197
  %138 = load i32, i32* @_nl_msg_cat_cntr, align 4
  %inc200 = add nsw i32 %138, 1
  store i32 %inc200, i32* @_nl_msg_cat_cntr, align 4
  br label %if.end201

if.end201:                                        ; preds = %if.end6, %if.then199, %if.end197
  ret void
}

; Function Attrs: noinline nounwind
define i8* @libintl_bind_textdomain_codeset(i8* %domainname, i8* %codeset) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %codeset.addr = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %codeset, i8** %codeset.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  call void @set_binding_values(i8* %0, i8** null, i8** %codeset.addr)
  %1 = load i8*, i8** %codeset.addr, align 4
  ret i8* %1
}

declare i32 @strcmp(i8*, i8*) #1

declare i8* @strdup(i8*) #1

declare void @free(i8*) #1

declare i32 @strlen(i8*) #1

declare i8* @malloc(i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
