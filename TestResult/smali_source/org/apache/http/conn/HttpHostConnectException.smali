.class public Lorg/apache/http/conn/HttpHostConnectException;
.super Ljava/net/ConnectException;
.source "HttpHostConnectException.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2c5515199314e300L


# instance fields
.field private final host:Lorg/apache/http/HttpHost;


# direct methods
.method public varargs constructor <init>(Ljava/io/IOException;Lorg/apache/http/HttpHost;[Ljava/net/InetAddress;)V
    .registers 7
    .param p1, "cause"    # Ljava/io/IOException;
    .param p2, "host"    # Lorg/apache/http/HttpHost;
    .param p3, "remoteAddresses"    # [Ljava/net/InetAddress;

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Connect to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p2, :cond_65

    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v0

    :goto_11
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p3, :cond_68

    array-length v0, p3

    if-lez v0, :cond_68

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_31
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p1, :cond_6b

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6b

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " failed: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 74
    iput-object p2, p0, Lorg/apache/http/conn/HttpHostConnectException;->host:Lorg/apache/http/HttpHost;

    .line 75
    invoke-virtual {p0, p1}, Lorg/apache/http/conn/HttpHostConnectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 76
    return-void

    .line 68
    :cond_65
    const-string v0, "remote host"

    goto :goto_11

    :cond_68
    const-string v0, ""

    goto :goto_31

    :cond_6b
    const-string v0, " refused"

    goto :goto_54
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Ljava/net/ConnectException;)V
    .registers 4
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "cause"    # Ljava/net/ConnectException;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-direct {p0, p2, p1, v0}, Lorg/apache/http/conn/HttpHostConnectException;-><init>(Ljava/io/IOException;Lorg/apache/http/HttpHost;[Ljava/net/InetAddress;)V

    .line 57
    return-void
.end method


# virtual methods
.method public getHost()Lorg/apache/http/HttpHost;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/http/conn/HttpHostConnectException;->host:Lorg/apache/http/HttpHost;

    return-object v0
.end method
