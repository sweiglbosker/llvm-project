; RUN: opt -passes=slp-vectorizer -disable-output %s

target triple = "x86_64-unknown-linux-gnu"

define i32 @f() {
entry:
  %a = extractelement <2 x i32> zeroinitializer, i64 0
  %c = extractelement <4 x i32> zeroinitializer, i64 0
  %d = extractelement <2 x i32> undef, i64 0
  br label %loop

loop:
  %p0 = phi i32 [ %a, %entry ]
  %p1 = phi i32 [ %a, %entry ]
  %p2 = phi i32 [ %c, %entry ]
  %p3 = phi i32 [ %d, %entry ]
  ret i32 %p3
}
