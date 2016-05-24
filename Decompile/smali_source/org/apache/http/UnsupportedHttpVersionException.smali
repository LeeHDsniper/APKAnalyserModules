.class public Lorg/apache/http/UnsupportedHttpVersionException;
.super Lorg/apache/http/ProtocolException;
.source "UnsupportedHttpVersionException.java"


# static fields
.field private static final serialVersionUID:J = -0x12b6a664c6039857L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/http/ProtocolException;-><init>()V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 55
    return-void
.end method
