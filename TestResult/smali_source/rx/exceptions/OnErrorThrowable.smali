.class public final Lrx/exceptions/OnErrorThrowable;
.super Ljava/lang/RuntimeException;
.source "OnErrorThrowable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/exceptions/OnErrorThrowable$OnNextValue;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x7e77a2d646dfd3eL


# instance fields
.field private final hasValue:Z

.field private final value:Ljava/lang/Object;


# direct methods
.method public static addValueAsLastCause(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;
    .registers 4
    .param p0, "e"    # Ljava/lang/Throwable;
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 96
    invoke-static {p0}, Lrx/exceptions/Exceptions;->getFinalCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    .line 97
    .local v0, "lastCause":Ljava/lang/Throwable;
    if-eqz v0, :cond_13

    instance-of v1, v0, Lrx/exceptions/OnErrorThrowable$OnNextValue;

    if-eqz v1, :cond_13

    .line 99
    check-cast v0, Lrx/exceptions/OnErrorThrowable$OnNextValue;

    .end local v0    # "lastCause":Ljava/lang/Throwable;
    invoke-virtual {v0}, Lrx/exceptions/OnErrorThrowable$OnNextValue;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_13

    .line 105
    :goto_12
    return-object p0

    .line 104
    :cond_13
    new-instance v1, Lrx/exceptions/OnErrorThrowable$OnNextValue;

    invoke-direct {v1, p1}, Lrx/exceptions/OnErrorThrowable$OnNextValue;-><init>(Ljava/lang/Object;)V

    invoke-static {p0, v1}, Lrx/exceptions/Exceptions;->addCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_12
.end method
