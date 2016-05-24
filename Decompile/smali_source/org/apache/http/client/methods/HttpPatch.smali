.class public Lorg/apache/http/client/methods/HttpPatch;
.super Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
.source "HttpPatch.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field public static final METHOD_NAME:Ljava/lang/String; = "PATCH"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;-><init>()V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;-><init>()V

    .line 67
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/client/methods/HttpPatch;->setURI(Ljava/net/URI;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;-><init>()V

    .line 62
    invoke-virtual {p0, p1}, Lorg/apache/http/client/methods/HttpPatch;->setURI(Ljava/net/URI;)V

    .line 63
    return-void
.end method


# virtual methods
.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 72
    const-string v0, "PATCH"

    return-object v0
.end method
