.class public Lorg/apache/http/client/ClientProtocolException;
.super Ljava/io/IOException;
.source "ClientProtocolException.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4dab15b84bc19159L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 57
    invoke-virtual {p0, p2}, Lorg/apache/http/client/ClientProtocolException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 52
    invoke-virtual {p0, p1}, Lorg/apache/http/client/ClientProtocolException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 53
    return-void
.end method
