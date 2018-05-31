; ModuleID = 'mktime.c'
source_filename = "mktime.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8* }

@__mon_yday = constant [2 x [13 x i16]] [[13 x i16] [i16 0, i16 31, i16 59, i16 90, i16 120, i16 151, i16 181, i16 212, i16 243, i16 273, i16 304, i16 334, i16 365], [13 x i16] [i16 0, i16 31, i16 60, i16 91, i16 121, i16 152, i16 182, i16 213, i16 244, i16 274, i16 305, i16 335, i16 366]], align 2
@localtime_offset = internal global i32 0, align 4

; Function Attrs: noinline nounwind
define i32 @mktime(%struct.tm* %tp) #0 {
entry:
  %tp.addr = alloca %struct.tm*, align 4
  store %struct.tm* %tp, %struct.tm** %tp.addr, align 4
  %0 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %call = call i32 @__mktime_internal(%struct.tm* %0, %struct.tm* (i32*, %struct.tm*)* @my_localtime_r, i32* @localtime_offset)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @__mktime_internal(%struct.tm* %tp, %struct.tm* (i32*, %struct.tm*)* %convert, i32* %offset) #0 {
entry:
  %retval = alloca i32, align 4
  %tp.addr = alloca %struct.tm*, align 4
  %convert.addr = alloca %struct.tm* (i32*, %struct.tm*)*, align 4
  %offset.addr = alloca i32*, align 4
  %t = alloca i32, align 4
  %dt = alloca i32, align 4
  %t0 = alloca i32, align 4
  %tm = alloca %struct.tm, align 4
  %remaining_probes = alloca i32, align 4
  %sec = alloca i32, align 4
  %min = alloca i32, align 4
  %hour = alloca i32, align 4
  %mday = alloca i32, align 4
  %mon = alloca i32, align 4
  %year_requested = alloca i32, align 4
  %isdst = alloca i32, align 4
  %mon_remainder = alloca i32, align 4
  %negative_mon_remainder = alloca i32, align 4
  %mon_years = alloca i32, align 4
  %year = alloca i32, align 4
  %yday = alloca i32, align 4
  %sec_requested = alloca i32, align 4
  %dst_diff = alloca i32, align 4
  %ot = alloca i32, align 4
  %otm = alloca %struct.tm, align 4
  %dyear = alloca double, align 8
  %dday = alloca double, align 8
  %dsec = alloca double, align 8
  store %struct.tm* %tp, %struct.tm** %tp.addr, align 4
  store %struct.tm* (i32*, %struct.tm*)* %convert, %struct.tm* (i32*, %struct.tm*)** %convert.addr, align 4
  store i32* %offset, i32** %offset.addr, align 4
  store i32 4, i32* %remaining_probes, align 4
  %0 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_sec = getelementptr inbounds %struct.tm, %struct.tm* %0, i32 0, i32 0
  %1 = load i32, i32* %tm_sec, align 4
  store i32 %1, i32* %sec, align 4
  %2 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_min = getelementptr inbounds %struct.tm, %struct.tm* %2, i32 0, i32 1
  %3 = load i32, i32* %tm_min, align 4
  store i32 %3, i32* %min, align 4
  %4 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_hour = getelementptr inbounds %struct.tm, %struct.tm* %4, i32 0, i32 2
  %5 = load i32, i32* %tm_hour, align 4
  store i32 %5, i32* %hour, align 4
  %6 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_mday = getelementptr inbounds %struct.tm, %struct.tm* %6, i32 0, i32 3
  %7 = load i32, i32* %tm_mday, align 4
  store i32 %7, i32* %mday, align 4
  %8 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_mon = getelementptr inbounds %struct.tm, %struct.tm* %8, i32 0, i32 4
  %9 = load i32, i32* %tm_mon, align 4
  store i32 %9, i32* %mon, align 4
  %10 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %10, i32 0, i32 5
  %11 = load i32, i32* %tm_year, align 4
  store i32 %11, i32* %year_requested, align 4
  %12 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_isdst = getelementptr inbounds %struct.tm, %struct.tm* %12, i32 0, i32 8
  %13 = load i32, i32* %tm_isdst, align 4
  store i32 %13, i32* %isdst, align 4
  %14 = load i32, i32* %mon, align 4
  %rem = srem i32 %14, 12
  store i32 %rem, i32* %mon_remainder, align 4
  %15 = load i32, i32* %mon_remainder, align 4
  %cmp = icmp slt i32 %15, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %negative_mon_remainder, align 4
  %16 = load i32, i32* %mon, align 4
  %div = sdiv i32 %16, 12
  %17 = load i32, i32* %negative_mon_remainder, align 4
  %sub = sub nsw i32 %div, %17
  store i32 %sub, i32* %mon_years, align 4
  %18 = load i32, i32* %year_requested, align 4
  %19 = load i32, i32* %mon_years, align 4
  %add = add nsw i32 %18, %19
  store i32 %add, i32* %year, align 4
  %20 = load i32, i32* %year, align 4
  %add1 = add nsw i32 %20, 1900
  %rem2 = srem i32 %add1, 4
  %cmp3 = icmp eq i32 %rem2, 0
  br i1 %cmp3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %21 = load i32, i32* %year, align 4
  %add5 = add nsw i32 %21, 1900
  %rem6 = srem i32 %add5, 100
  %cmp7 = icmp ne i32 %rem6, 0
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %22 = load i32, i32* %year, align 4
  %add9 = add nsw i32 %22, 1900
  %rem10 = srem i32 %add9, 400
  %cmp11 = icmp eq i32 %rem10, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %23 = phi i1 [ true, %land.rhs ], [ %cmp11, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %entry
  %24 = phi i1 [ false, %entry ], [ %23, %lor.end ]
  %land.ext = zext i1 %24 to i32
  %arrayidx = getelementptr inbounds [2 x [13 x i16]], [2 x [13 x i16]]* @__mon_yday, i32 0, i32 %land.ext
  %25 = load i32, i32* %mon_remainder, align 4
  %26 = load i32, i32* %negative_mon_remainder, align 4
  %mul = mul nsw i32 12, %26
  %add13 = add nsw i32 %25, %mul
  %arrayidx14 = getelementptr inbounds [13 x i16], [13 x i16]* %arrayidx, i32 0, i32 %add13
  %27 = load i16, i16* %arrayidx14, align 2
  %conv15 = zext i16 %27 to i32
  %28 = load i32, i32* %mday, align 4
  %add16 = add nsw i32 %conv15, %28
  %sub17 = sub nsw i32 %add16, 1
  store i32 %sub17, i32* %yday, align 4
  %29 = load i32, i32* %sec, align 4
  store i32 %29, i32* %sec_requested, align 4
  %30 = load i32, i32* %sec, align 4
  %cmp18 = icmp slt i32 %30, 0
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  store i32 0, i32* %sec, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.end
  %31 = load i32, i32* %sec, align 4
  %cmp20 = icmp slt i32 59, %31
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end
  store i32 59, i32* %sec, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %if.end
  %tm_year24 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 5
  store i32 70, i32* %tm_year24, align 4
  %tm_sec25 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 0
  store i32 0, i32* %tm_sec25, align 4
  %tm_min26 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 1
  store i32 0, i32* %tm_min26, align 4
  %tm_hour27 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 2
  store i32 0, i32* %tm_hour27, align 4
  %tm_yday = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 7
  store i32 0, i32* %tm_yday, align 4
  %32 = load i32, i32* %year, align 4
  %33 = load i32, i32* %yday, align 4
  %34 = load i32, i32* %hour, align 4
  %35 = load i32, i32* %min, align 4
  %36 = load i32, i32* %sec, align 4
  %call = call i32 @ydhms_tm_diff(i32 %32, i32 %33, i32 %34, i32 %35, i32 %36, %struct.tm* %tm)
  store i32 %call, i32* %t0, align 4
  %37 = load i32, i32* %t0, align 4
  %38 = load i32*, i32** %offset.addr, align 4
  %39 = load i32, i32* %38, align 4
  %add28 = add nsw i32 %37, %39
  store i32 %add28, i32* %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end23
  %40 = load i32, i32* %year, align 4
  %41 = load i32, i32* %yday, align 4
  %42 = load i32, i32* %hour, align 4
  %43 = load i32, i32* %min, align 4
  %44 = load i32, i32* %sec, align 4
  %45 = load %struct.tm* (i32*, %struct.tm*)*, %struct.tm* (i32*, %struct.tm*)** %convert.addr, align 4
  %call29 = call %struct.tm* %45(i32* %t, %struct.tm* %tm)
  %call30 = call i32 @ydhms_tm_diff(i32 %40, i32 %41, i32 %42, i32 %43, i32 %44, %struct.tm* %call29)
  store i32 %call30, i32* %dt, align 4
  %tobool = icmp ne i32 %call30, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %46 = load i32, i32* %remaining_probes, align 4
  %dec = add nsw i32 %46, -1
  store i32 %dec, i32* %remaining_probes, align 4
  %cmp31 = icmp eq i32 %dec, 0
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %for.body
  store i32 -1, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end34
  %47 = load i32, i32* %dt, align 4
  %48 = load i32, i32* %t, align 4
  %add35 = add nsw i32 %48, %47
  store i32 %add35, i32* %t, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %49 = load i32, i32* %isdst, align 4
  %cmp36 = icmp sle i32 0, %49
  br i1 %cmp36, label %land.lhs.true, label %if.end66

land.lhs.true:                                    ; preds = %for.end
  %tm_isdst38 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 8
  %50 = load i32, i32* %tm_isdst38, align 4
  %cmp39 = icmp sle i32 0, %50
  br i1 %cmp39, label %if.then41, label %if.end66

if.then41:                                        ; preds = %land.lhs.true
  %51 = load i32, i32* %isdst, align 4
  %cmp42 = icmp ne i32 %51, 0
  %conv43 = zext i1 %cmp42 to i32
  %tm_isdst44 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 8
  %52 = load i32, i32* %tm_isdst44, align 4
  %cmp45 = icmp ne i32 %52, 0
  %conv46 = zext i1 %cmp45 to i32
  %sub47 = sub nsw i32 %conv43, %conv46
  store i32 %sub47, i32* %dst_diff, align 4
  %53 = load i32, i32* %dst_diff, align 4
  %tobool48 = icmp ne i32 %53, 0
  br i1 %tobool48, label %if.then49, label %if.end65

if.then49:                                        ; preds = %if.then41
  %54 = load i32, i32* %t, align 4
  %55 = load i32, i32* %dst_diff, align 4
  %mul50 = mul nsw i32 7200, %55
  %sub51 = sub nsw i32 %54, %mul50
  store i32 %sub51, i32* %ot, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end64, %if.then49
  %56 = load i32, i32* %remaining_probes, align 4
  %dec52 = add nsw i32 %56, -1
  store i32 %dec52, i32* %remaining_probes, align 4
  %cmp53 = icmp ne i32 %dec52, 0
  br i1 %cmp53, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %57 = load i32, i32* %year, align 4
  %58 = load i32, i32* %yday, align 4
  %59 = load i32, i32* %hour, align 4
  %60 = load i32, i32* %min, align 4
  %61 = load i32, i32* %sec, align 4
  %62 = load %struct.tm* (i32*, %struct.tm*)*, %struct.tm* (i32*, %struct.tm*)** %convert.addr, align 4
  %call55 = call %struct.tm* %62(i32* %ot, %struct.tm* %otm)
  %call56 = call i32 @ydhms_tm_diff(i32 %57, i32 %58, i32 %59, i32 %60, i32 %61, %struct.tm* %call55)
  store i32 %call56, i32* %dt, align 4
  %tobool57 = icmp ne i32 %call56, 0
  br i1 %tobool57, label %if.end59, label %if.then58

if.then58:                                        ; preds = %while.body
  %63 = load i32, i32* %ot, align 4
  store i32 %63, i32* %t, align 4
  %64 = bitcast %struct.tm* %tm to i8*
  %65 = bitcast %struct.tm* %otm to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %64, i8* %65, i32 44, i32 4, i1 false)
  br label %while.end

if.end59:                                         ; preds = %while.body
  %66 = load i32, i32* %dt, align 4
  %67 = load i32, i32* %ot, align 4
  %add60 = add nsw i32 %67, %66
  store i32 %add60, i32* %ot, align 4
  %68 = load i32, i32* %t, align 4
  %cmp61 = icmp eq i32 %add60, %68
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end59
  br label %while.end

if.end64:                                         ; preds = %if.end59
  br label %while.cond

while.end:                                        ; preds = %if.then63, %if.then58, %while.cond
  br label %if.end65

if.end65:                                         ; preds = %while.end, %if.then41
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %land.lhs.true, %for.end
  %69 = load i32, i32* %t, align 4
  %70 = load i32, i32* %t0, align 4
  %sub67 = sub nsw i32 %69, %70
  %71 = load i32*, i32** %offset.addr, align 4
  store i32 %sub67, i32* %71, align 4
  %72 = load i32, i32* %sec_requested, align 4
  %tm_sec68 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 0
  %73 = load i32, i32* %tm_sec68, align 4
  %cmp69 = icmp ne i32 %72, %73
  br i1 %cmp69, label %if.then71, label %if.end84

if.then71:                                        ; preds = %if.end66
  %74 = load i32, i32* %sec_requested, align 4
  %75 = load i32, i32* %sec, align 4
  %sub72 = sub nsw i32 %74, %75
  %76 = load i32, i32* %sec, align 4
  %cmp73 = icmp eq i32 %76, 0
  br i1 %cmp73, label %land.rhs75, label %land.end79

land.rhs75:                                       ; preds = %if.then71
  %tm_sec76 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 0
  %77 = load i32, i32* %tm_sec76, align 4
  %cmp77 = icmp eq i32 %77, 60
  br label %land.end79

land.end79:                                       ; preds = %land.rhs75, %if.then71
  %78 = phi i1 [ false, %if.then71 ], [ %cmp77, %land.rhs75 ]
  %land.ext80 = zext i1 %78 to i32
  %add81 = add nsw i32 %sub72, %land.ext80
  %79 = load i32, i32* %t, align 4
  %add82 = add nsw i32 %79, %add81
  store i32 %add82, i32* %t, align 4
  %80 = load %struct.tm* (i32*, %struct.tm*)*, %struct.tm* (i32*, %struct.tm*)** %convert.addr, align 4
  %call83 = call %struct.tm* %80(i32* %t, %struct.tm* %tm)
  br label %if.end84

if.end84:                                         ; preds = %land.end79, %if.end66
  %81 = load i32, i32* %year_requested, align 4
  %conv85 = sitofp i32 %81 to double
  %82 = load i32, i32* %mon_years, align 4
  %conv86 = sitofp i32 %82 to double
  %add87 = fadd double %conv85, %conv86
  %tm_year88 = getelementptr inbounds %struct.tm, %struct.tm* %tm, i32 0, i32 5
  %83 = load i32, i32* %tm_year88, align 4
  %conv89 = sitofp i32 %83 to double
  %sub90 = fsub double %add87, %conv89
  store double %sub90, double* %dyear, align 8
  %84 = load double, double* %dyear, align 8
  %mul91 = fmul double 3.660000e+02, %84
  %85 = load i32, i32* %mday, align 4
  %conv92 = sitofp i32 %85 to double
  %add93 = fadd double %mul91, %conv92
  store double %add93, double* %dday, align 8
  %86 = load double, double* %dday, align 8
  %mul94 = fmul double 2.400000e+01, %86
  %87 = load i32, i32* %hour, align 4
  %conv95 = sitofp i32 %87 to double
  %add96 = fadd double %mul94, %conv95
  %mul97 = fmul double 6.000000e+01, %add96
  %88 = load i32, i32* %min, align 4
  %conv98 = sitofp i32 %88 to double
  %add99 = fadd double %mul97, %conv98
  %mul100 = fmul double 6.000000e+01, %add99
  %89 = load i32, i32* %sec_requested, align 4
  %conv101 = sitofp i32 %89 to double
  %add102 = fadd double %mul100, %conv101
  store double %add102, double* %dsec, align 8
  %90 = load double, double* %dsec, align 8
  %cmp103 = fcmp olt double %90, 0.000000e+00
  br i1 %cmp103, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end84
  %91 = load double, double* %dsec, align 8
  %sub105 = fsub double -0.000000e+00, %91
  br label %cond.end

cond.false:                                       ; preds = %if.end84
  %92 = load double, double* %dsec, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %sub105, %cond.true ], [ %92, %cond.false ]
  %cmp106 = fcmp olt double 0x41D5555555000000, %cond
  br i1 %cmp106, label %if.then108, label %if.end109

if.then108:                                       ; preds = %cond.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end109:                                        ; preds = %cond.end
  %93 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %94 = bitcast %struct.tm* %93 to i8*
  %95 = bitcast %struct.tm* %tm to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %94, i8* %95, i32 44, i32 4, i1 false)
  %96 = load i32, i32* %t, align 4
  store i32 %96, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end109, %if.then108, %if.then33
  %97 = load i32, i32* %retval, align 4
  ret i32 %97
}

; Function Attrs: noinline nounwind
define internal %struct.tm* @my_localtime_r(i32* %t, %struct.tm* %tp) #0 {
entry:
  %retval = alloca %struct.tm*, align 4
  %t.addr = alloca i32*, align 4
  %tp.addr = alloca %struct.tm*, align 4
  %l = alloca %struct.tm*, align 4
  store i32* %t, i32** %t.addr, align 4
  store %struct.tm* %tp, %struct.tm** %tp.addr, align 4
  %0 = load i32*, i32** %t.addr, align 4
  %call = call %struct.tm* @localtime(i32* %0)
  store %struct.tm* %call, %struct.tm** %l, align 4
  %1 = load %struct.tm*, %struct.tm** %l, align 4
  %tobool = icmp ne %struct.tm* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.tm* null, %struct.tm** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %3 = load %struct.tm*, %struct.tm** %l, align 4
  %4 = bitcast %struct.tm* %2 to i8*
  %5 = bitcast %struct.tm* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %4, i8* %5, i32 44, i32 4, i1 false)
  %6 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  store %struct.tm* %6, %struct.tm** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load %struct.tm*, %struct.tm** %retval, align 4
  ret %struct.tm* %7
}

; Function Attrs: noinline nounwind
define internal i32 @ydhms_tm_diff(i32 %year, i32 %yday, i32 %hour, i32 %min, i32 %sec, %struct.tm* %tp) #0 {
entry:
  %year.addr = alloca i32, align 4
  %yday.addr = alloca i32, align 4
  %hour.addr = alloca i32, align 4
  %min.addr = alloca i32, align 4
  %sec.addr = alloca i32, align 4
  %tp.addr = alloca %struct.tm*, align 4
  %a4 = alloca i32, align 4
  %b4 = alloca i32, align 4
  %a100 = alloca i32, align 4
  %b100 = alloca i32, align 4
  %a400 = alloca i32, align 4
  %b400 = alloca i32, align 4
  %intervening_leap_days = alloca i32, align 4
  %years = alloca i32, align 4
  %days = alloca i32, align 4
  store i32 %year, i32* %year.addr, align 4
  store i32 %yday, i32* %yday.addr, align 4
  store i32 %hour, i32* %hour.addr, align 4
  store i32 %min, i32* %min.addr, align 4
  store i32 %sec, i32* %sec.addr, align 4
  store %struct.tm* %tp, %struct.tm** %tp.addr, align 4
  %0 = load i32, i32* %year.addr, align 4
  %shr = ashr i32 %0, 2
  %add = add nsw i32 %shr, 475
  %1 = load i32, i32* %year.addr, align 4
  %and = and i32 %1, 3
  %tobool = icmp ne i32 %and, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %sub = sub nsw i32 %add, %lnot.ext
  store i32 %sub, i32* %a4, align 4
  %2 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %2, i32 0, i32 5
  %3 = load i32, i32* %tm_year, align 4
  %shr1 = ashr i32 %3, 2
  %add2 = add nsw i32 %shr1, 475
  %4 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_year3 = getelementptr inbounds %struct.tm, %struct.tm* %4, i32 0, i32 5
  %5 = load i32, i32* %tm_year3, align 4
  %and4 = and i32 %5, 3
  %tobool5 = icmp ne i32 %and4, 0
  %lnot6 = xor i1 %tobool5, true
  %lnot.ext7 = zext i1 %lnot6 to i32
  %sub8 = sub nsw i32 %add2, %lnot.ext7
  store i32 %sub8, i32* %b4, align 4
  %6 = load i32, i32* %a4, align 4
  %div = sdiv i32 %6, 25
  %7 = load i32, i32* %a4, align 4
  %rem = srem i32 %7, 25
  %cmp = icmp slt i32 %rem, 0
  %conv = zext i1 %cmp to i32
  %sub9 = sub nsw i32 %div, %conv
  store i32 %sub9, i32* %a100, align 4
  %8 = load i32, i32* %b4, align 4
  %div10 = sdiv i32 %8, 25
  %9 = load i32, i32* %b4, align 4
  %rem11 = srem i32 %9, 25
  %cmp12 = icmp slt i32 %rem11, 0
  %conv13 = zext i1 %cmp12 to i32
  %sub14 = sub nsw i32 %div10, %conv13
  store i32 %sub14, i32* %b100, align 4
  %10 = load i32, i32* %a100, align 4
  %shr15 = ashr i32 %10, 2
  store i32 %shr15, i32* %a400, align 4
  %11 = load i32, i32* %b100, align 4
  %shr16 = ashr i32 %11, 2
  store i32 %shr16, i32* %b400, align 4
  %12 = load i32, i32* %a4, align 4
  %13 = load i32, i32* %b4, align 4
  %sub17 = sub nsw i32 %12, %13
  %14 = load i32, i32* %a100, align 4
  %15 = load i32, i32* %b100, align 4
  %sub18 = sub nsw i32 %14, %15
  %sub19 = sub nsw i32 %sub17, %sub18
  %16 = load i32, i32* %a400, align 4
  %17 = load i32, i32* %b400, align 4
  %sub20 = sub nsw i32 %16, %17
  %add21 = add nsw i32 %sub19, %sub20
  store i32 %add21, i32* %intervening_leap_days, align 4
  %18 = load i32, i32* %year.addr, align 4
  %19 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_year22 = getelementptr inbounds %struct.tm, %struct.tm* %19, i32 0, i32 5
  %20 = load i32, i32* %tm_year22, align 4
  %sub23 = sub nsw i32 %18, %20
  store i32 %sub23, i32* %years, align 4
  %21 = load i32, i32* %years, align 4
  %mul = mul nsw i32 365, %21
  %22 = load i32, i32* %intervening_leap_days, align 4
  %add24 = add nsw i32 %mul, %22
  %23 = load i32, i32* %yday.addr, align 4
  %24 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_yday = getelementptr inbounds %struct.tm, %struct.tm* %24, i32 0, i32 7
  %25 = load i32, i32* %tm_yday, align 4
  %sub25 = sub nsw i32 %23, %25
  %add26 = add nsw i32 %add24, %sub25
  store i32 %add26, i32* %days, align 4
  %26 = load i32, i32* %days, align 4
  %mul27 = mul nsw i32 24, %26
  %27 = load i32, i32* %hour.addr, align 4
  %28 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_hour = getelementptr inbounds %struct.tm, %struct.tm* %28, i32 0, i32 2
  %29 = load i32, i32* %tm_hour, align 4
  %sub28 = sub nsw i32 %27, %29
  %add29 = add nsw i32 %mul27, %sub28
  %mul30 = mul nsw i32 60, %add29
  %30 = load i32, i32* %min.addr, align 4
  %31 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_min = getelementptr inbounds %struct.tm, %struct.tm* %31, i32 0, i32 1
  %32 = load i32, i32* %tm_min, align 4
  %sub31 = sub nsw i32 %30, %32
  %add32 = add nsw i32 %mul30, %sub31
  %mul33 = mul nsw i32 60, %add32
  %33 = load i32, i32* %sec.addr, align 4
  %34 = load %struct.tm*, %struct.tm** %tp.addr, align 4
  %tm_sec = getelementptr inbounds %struct.tm, %struct.tm* %34, i32 0, i32 0
  %35 = load i32, i32* %tm_sec, align 4
  %sub34 = sub nsw i32 %33, %35
  %add35 = add nsw i32 %mul33, %sub34
  ret i32 %add35
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

declare %struct.tm* @localtime(i32*) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
