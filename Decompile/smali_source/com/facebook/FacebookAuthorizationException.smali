.class public Lcom/facebook/FacebookAuthorizationException;
.super Lcom/facebook/FacebookException;
.source "FacebookAuthorizationException.java"


# static fields
.field static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/facebook/FacebookException;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 41
    return-void
.end method
