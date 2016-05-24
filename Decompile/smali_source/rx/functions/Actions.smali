.class public final Lrx/functions/Actions;
.super Ljava/lang/Object;
.source "Actions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/functions/Actions$EmptyAction;
    }
.end annotation


# static fields
.field private static final EMPTY_ACTION:Lrx/functions/Actions$EmptyAction;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 32
    new-instance v0, Lrx/functions/Actions$EmptyAction;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lrx/functions/Actions$EmptyAction;-><init>(Lrx/functions/Actions$1;)V

    sput-object v0, Lrx/functions/Actions;->EMPTY_ACTION:Lrx/functions/Actions$EmptyAction;

    return-void
.end method

.method public static final empty()Lrx/functions/Actions$EmptyAction;
    .registers 1
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
            ">()",
            "Lrx/functions/Actions$EmptyAction",
            "<TT0;TT1;TT2;TT3;TT4;TT5;TT6;TT7;TT8;TT9;>;"
        }
    .end annotation

    .prologue
    .line 28
    sget-object v0, Lrx/functions/Actions;->EMPTY_ACTION:Lrx/functions/Actions$EmptyAction;

    return-object v0
.end method
