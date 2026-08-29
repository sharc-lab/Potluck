; ModuleID = '/export/hdd/scratch/hchen799/Potluck_MICRO_Artifact/Potluck_Benchmark/conv_act/project_conv_act_p1_unroll_16/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>" = type { %"struct.ap_fixed_base<32, 10, true, AP_TRN, AP_WRAP, 0>" }
%"struct.ap_fixed_base<32, 10, true, AP_TRN, AP_WRAP, 0>" = type { %"struct.ssdm_int<32, true>" }
%"struct.ssdm_int<32, true>" = type { i32 }

; Function Attrs: noinline
define void @apatb_top_ir([5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" "maxi" %DRAM_image_input, [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" "maxi" %DRAM_conv_weight, %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" "maxi" %DRAM_conv_bias, [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* noalias nocapture nonnull "fpga.decayed.dim.hint"="64" "maxi" %DRAM_image_output) local_unnamed_addr #0 {
entry:
  %malloccall = call i8* @malloc(i64 6400)
  %DRAM_image_input_copy = bitcast i8* %malloccall to [64 x [5 x [5 x i32]]]*
  %malloccall1 = call i8* @malloc(i64 147456)
  %DRAM_conv_weight_copy = bitcast i8* %malloccall1 to [64 x [64 x [3 x [3 x i32]]]]*
  %DRAM_conv_bias_copy = alloca [64 x i32], align 512
  %malloccall2 = call i8* @malloc(i64 6400)
  %DRAM_image_output_copy = bitcast i8* %malloccall2 to [64 x [5 x [5 x i32]]]*
  %0 = bitcast [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %DRAM_image_input to [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]*
  %1 = bitcast [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %DRAM_conv_weight to [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]*
  %2 = bitcast %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"* %DRAM_conv_bias to [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]*
  %3 = bitcast [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %DRAM_image_output to [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]*
  call fastcc void @copy_in([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* nonnull %0, [64 x [5 x [5 x i32]]]* %DRAM_image_input_copy, [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* nonnull %1, [64 x [64 x [3 x [3 x i32]]]]* %DRAM_conv_weight_copy, [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* nonnull %2, [64 x i32]* nonnull align 512 %DRAM_conv_bias_copy, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* nonnull %3, [64 x [5 x [5 x i32]]]* %DRAM_image_output_copy)
  call void @apatb_top_hw([64 x [5 x [5 x i32]]]* %DRAM_image_input_copy, [64 x [64 x [3 x [3 x i32]]]]* %DRAM_conv_weight_copy, [64 x i32]* %DRAM_conv_bias_copy, [64 x [5 x [5 x i32]]]* %DRAM_image_output_copy)
  call void @copy_back([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %0, [64 x [5 x [5 x i32]]]* %DRAM_image_input_copy, [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %1, [64 x [64 x [3 x [3 x i32]]]]* %DRAM_conv_weight_copy, [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %2, [64 x i32]* %DRAM_conv_bias_copy, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %3, [64 x [5 x [5 x i32]]]* %DRAM_image_output_copy)
  call void @free(i8* %malloccall)
  call void @free(i8* %malloccall1)
  call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly "unpacked"="0", [64 x [5 x [5 x i32]]]* noalias "unpacked"="1", [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* noalias readonly "unpacked"="2", [64 x [64 x [3 x [3 x i32]]]]* noalias "unpacked"="3", [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="4", [64 x i32]* noalias nocapture align 512 "unpacked"="5.0", [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly "unpacked"="6", [64 x [5 x [5 x i32]]]* noalias "unpacked"="7") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.53"([64 x [5 x [5 x i32]]]* %1, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %0)
  call fastcc void @"onebyonecpy_hls.p0a64a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [64 x [3 x [3 x i32]]]]* %3, [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %2)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x i32]* align 512 %5, [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %4)
  call fastcc void @"onebyonecpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.53"([64 x [5 x [5 x i32]]]* %7, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %1 = icmp eq [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]], [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]], [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst.addr, [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src.addr, i64 5)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"], [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"], [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %3, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [64 x [3 x [3 x i32]]]]* noalias %dst, [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x [64 x [3 x [3 x i32]]]]* %dst, null
  %1 = icmp eq [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [64 x [3 x [3 x i32]]]]* nonnull %dst, [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [64 x [3 x [3 x i32]]]]* %dst, [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %src, null
  %1 = icmp eq [64 x [64 x [3 x [3 x i32]]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [64 x [64 x [3 x [3 x i32]]]], [64 x [64 x [3 x [3 x i32]]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]], [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [3 x [3 x i32]]]* %3, [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %src.addr, i64 64)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [3 x [3 x i32]]]* %dst, [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %1 = icmp eq [64 x [3 x [3 x i32]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [64 x [3 x [3 x i32]]], [64 x [3 x [3 x i32]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]], [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([3 x [3 x i32]]* %3, [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([3 x [3 x i32]]* %dst, [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %1 = icmp eq [3 x [3 x i32]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]], [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([3 x i32]* %3, [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([3 x i32]* %dst, [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [3 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"], [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [3 x i32], [3 x i32]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %4, i32* %3, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x i32]* noalias nocapture align 512 "unpacked"="0.0" %dst, [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x i32]* %dst, [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x i32]* nocapture "unpacked"="0.0" %dst, [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"], [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [64 x i32], [64 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias "unpacked"="0", [64 x [5 x [5 x i32]]]* noalias readonly "unpacked"="1", [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* noalias "unpacked"="2", [64 x [64 x [3 x [3 x i32]]]]* noalias readonly "unpacked"="3", [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="4", [64 x i32]* noalias nocapture readonly align 512 "unpacked"="5.0", [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias "unpacked"="6", [64 x [5 x [5 x i32]]]* noalias readonly "unpacked"="7") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %0, [64 x [5 x [5 x i32]]]* %1)
  call fastcc void @"onebyonecpy_hls.p0a64a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.79"([64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %2, [64 x [64 x [3 x [3 x i32]]]]* %3)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.36"([64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %4, [64 x i32]* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %6, [64 x [5 x [5 x i32]]]* %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.36"([64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="0" %dst, [64 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.39"([64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* nonnull %dst, [64 x i32]* %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.39"([64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* "unpacked"="0" %dst, [64 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [64 x i32], [64 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"], [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.53"([64 x [5 x [5 x i32]]]* noalias %dst, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x [5 x [5 x i32]]]* %dst, null
  %1 = icmp eq [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.56"([64 x [5 x [5 x i32]]]* nonnull %dst, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.56"([64 x [5 x [5 x i32]]]* %dst, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %1 = icmp eq [64 x [5 x [5 x i32]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [64 x [5 x [5 x i32]]], [64 x [5 x [5 x i32]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]], [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.59"([5 x [5 x i32]]* %3, [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %src.addr, i64 5)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.59"([5 x [5 x i32]]* %dst, [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %1 = icmp eq [5 x [5 x i32]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]], [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.62"([5 x i32]* %3, [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src.addr, i64 5)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.62"([5 x i32]* %dst, [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [5 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"], [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [5 x i32], [5 x i32]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %4, i32* %3, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias %dst, [64 x [5 x [5 x i32]]]* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %1 = icmp eq [64 x [5 x [5 x i32]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.69"([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* nonnull %dst, [64 x [5 x [5 x i32]]]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.69"([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %dst, [64 x [5 x [5 x i32]]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x [5 x [5 x i32]]]* %src, null
  %1 = icmp eq [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]], [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [64 x [5 x [5 x i32]]], [64 x [5 x [5 x i32]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.72"([5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst.addr, [5 x [5 x i32]]* %3, i64 5)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.72"([5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, [5 x [5 x i32]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5 x [5 x i32]]* %src, null
  %1 = icmp eq [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]], [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.75"([5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst.addr, [5 x i32]* %3, i64 5)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.75"([5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, [5 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5 x i32]* %src, null
  %1 = icmp eq [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [5 x i32], [5 x i32]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"], [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.79"([64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* noalias %dst, [64 x [64 x [3 x [3 x i32]]]]* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %dst, null
  %1 = icmp eq [64 x [64 x [3 x [3 x i32]]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.82"([64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* nonnull %dst, [64 x [64 x [3 x [3 x i32]]]]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.82"([64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %dst, [64 x [64 x [3 x [3 x i32]]]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x [64 x [3 x [3 x i32]]]]* %src, null
  %1 = icmp eq [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]], [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [64 x [64 x [3 x [3 x i32]]]], [64 x [64 x [3 x [3 x i32]]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.85"([64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %dst.addr, [64 x [3 x [3 x i32]]]* %3, i64 64)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.85"([64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %dst, [64 x [3 x [3 x i32]]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x [3 x [3 x i32]]]* %src, null
  %1 = icmp eq [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]], [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [64 x [3 x [3 x i32]]], [64 x [3 x [3 x i32]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.88"([3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst.addr, [3 x [3 x i32]]* %3, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.88"([3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, [3 x [3 x i32]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x [3 x i32]]* %src, null
  %1 = icmp eq [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]], [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.91"([3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst.addr, [3 x i32]* %3, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>.91"([3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, [3 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x i32]* %src, null
  %1 = icmp eq [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [3 x i32], [3 x i32]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"], [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_top_hw([64 x [5 x [5 x i32]]]*, [64 x [64 x [3 x [3 x i32]]]]*, [64 x i32]*, [64 x [5 x [5 x i32]]]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias "unpacked"="0", [64 x [5 x [5 x i32]]]* noalias readonly "unpacked"="1", [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* noalias "unpacked"="2", [64 x [64 x [3 x [3 x i32]]]]* noalias readonly "unpacked"="3", [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="4", [64 x i32]* noalias nocapture readonly align 512 "unpacked"="5.0", [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias "unpacked"="6", [64 x [5 x [5 x i32]]]* noalias readonly "unpacked"="7") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a64a5a5struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %6, [64 x [5 x [5 x i32]]]* %7)
  ret void
}

define void @top_hw_stub_wrapper([64 x [5 x [5 x i32]]]*, [64 x [64 x [3 x [3 x i32]]]]*, [64 x i32]*, [64 x [5 x [5 x i32]]]*) #5 {
entry:
  %malloccall = tail call i8* @malloc(i64 6400)
  %4 = bitcast i8* %malloccall to [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]*
  %malloccall1 = tail call i8* @malloc(i64 147456)
  %5 = bitcast i8* %malloccall1 to [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]*
  %6 = alloca [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]
  %malloccall2 = tail call i8* @malloc(i64 6400)
  %7 = bitcast i8* %malloccall2 to [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]*
  call void @copy_out([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %4, [64 x [5 x [5 x i32]]]* %0, [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %5, [64 x [64 x [3 x [3 x i32]]]]* %1, [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %6, [64 x i32]* %2, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %7, [64 x [5 x [5 x i32]]]* %3)
  %8 = bitcast [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %4 to [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]*
  %9 = bitcast [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %5 to [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]*
  %10 = bitcast [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %6 to %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"*
  %11 = bitcast [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %7 to [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]*
  call void @top_hw_stub([5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %8, [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %9, %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"* %10, [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* %11)
  call void @copy_in([64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %4, [64 x [5 x [5 x i32]]]* %0, [64 x [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]]* %5, [64 x [64 x [3 x [3 x i32]]]]* %1, [64 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]* %6, [64 x i32]* %2, [64 x [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* %7, [64 x [5 x [5 x i32]]]* %3)
  ret void
}

declare void @top_hw_stub([5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* noalias nocapture nonnull readonly, [64 x [3 x [3 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]]* noalias nocapture nonnull readonly, %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly, [5 x [5 x %"struct.ap_fixed<32, 10, AP_TRN, AP_WRAP, 0>"]]* noalias nocapture nonnull)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
