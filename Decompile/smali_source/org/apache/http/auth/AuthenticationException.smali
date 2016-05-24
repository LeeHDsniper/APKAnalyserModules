.class public Lorg/apache/http/auth/AuthenticationException;
.super Lorg/apache/http/ProtocolException;
.source "AuthenticationException.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x5e4940059a6a21e8L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/http/ProtocolException;-><init>()V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 68
    return-void
.end method
