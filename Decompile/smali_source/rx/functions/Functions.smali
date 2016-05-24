.class public final Lrx/functions/Functions;
.super Ljava/lang/Object;
.source "Functions.java"


# direct methods
.method public static fromFunc(Lrx/functions/Func2;)Lrx/functions/FuncN;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T0:",
            "Ljava/lang/Object;",
            "T1:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func2",
            "<-TT0;-TT1;+TR;>;)",
            "Lrx/functions/FuncN",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "f":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT0;-TT1;+TR;>;"
    new-instance v0, Lrx/functions/Functions$3;

    invoke-direct {v0, p0}, Lrx/functions/Functions$3;-><init>(Lrx/functions/Func2;)V

    return-object v0
.end method
