.class public Lcom/facebook/FacebookOperationCanceledException;
.super Lcom/facebook/FacebookException;
.source "FacebookOperationCanceledException.java"


# static fields
.field static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/facebook/FacebookException;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 39
    return-void
.end method
