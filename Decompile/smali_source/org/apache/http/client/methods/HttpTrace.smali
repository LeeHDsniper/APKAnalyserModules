.class public Lorg/apache/http/client/methods/HttpTrace;
.super Lorg/apache/http/client/methods/HttpRequestBase;
.source "HttpTrace.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field public static final METHOD_NAME:Ljava/lang/String; = "TRACE"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/apache/http/client/methods/HttpRequestBase;-><init>()V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/apache/http/client/methods/HttpRequestBase;-><init>()V

    .line 71
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/client/methods/HttpTrace;->setURI(Ljava/net/URI;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/apache/http/client/methods/HttpRequestBase;-><init>()V

    .line 63
    invoke-virtual {p0, p1}, Lorg/apache/http/client/methods/HttpTrace;->setURI(Ljava/net/URI;)V

    .line 64
    return-void
.end method


# virtual methods
.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    const-string v0, "TRACE"

    return-object v0
.end method
