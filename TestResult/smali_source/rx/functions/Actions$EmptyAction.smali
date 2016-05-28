.class final Lrx/functions/Actions$EmptyAction;
.super Ljava/lang/Object;
.source "Actions.java"

# interfaces
.implements Lrx/functions/Action0;
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/functions/Actions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EmptyAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T0:",
        "Ljava/lang/Object;",
        "T1:",
        "Ljava/lang/Object;",
        "T2:",
        "Ljava/lang/Object;",
        "T3:",
        "Ljava/lang/Object;",
        "T4:",
        "Ljava/lang/Object;",
        "T5:",
        "Ljava/lang/Object;",
        "T6:",
        "Ljava/lang/Object;",
        "T7:",
        "Ljava/lang/Object;",
        "T8:",
        "Ljava/lang/Object;",
        "T9:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/functions/Action0;",
        "Lrx/functions/Action1",
        "<TT0;>;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 34
    .local p0, "this":Lrx/functions/Actions$EmptyAction;, "Lrx/functions/Actions$EmptyAction<TT0;TT1;TT2;TT3;TT4;TT5;TT6;TT7;TT8;TT9;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lrx/functions/Actions$1;)V
    .registers 2
    .param p1, "x0"    # Lrx/functions/Actions$1;

    .prologue
    .line 34
    .local p0, "this":Lrx/functions/Actions$EmptyAction;, "Lrx/functions/Actions$EmptyAction<TT0;TT1;TT2;TT3;TT4;TT5;TT6;TT7;TT8;TT9;>;"
    invoke-direct {p0}, Lrx/functions/Actions$EmptyAction;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 1

    .prologue
    .line 48
    .local p0, "this":Lrx/functions/Actions$EmptyAction;, "Lrx/functions/Actions$EmptyAction<TT0;TT1;TT2;TT3;TT4;TT5;TT6;TT7;TT8;TT9;>;"
    return-void
.end method

.method public call(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT0;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lrx/functions/Actions$EmptyAction;, "Lrx/functions/Actions$EmptyAction<TT0;TT1;TT2;TT3;TT4;TT5;TT6;TT7;TT8;TT9;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT0;"
    return-void
.end method
