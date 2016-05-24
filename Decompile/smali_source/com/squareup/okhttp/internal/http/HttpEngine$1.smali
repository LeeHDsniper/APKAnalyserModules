.class final Lcom/squareup/okhttp/internal/http/HttpEngine$1;
.super Lcom/squareup/okhttp/ResponseBody;
.source "HttpEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/HttpEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/squareup/okhttp/ResponseBody;-><init>()V

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .prologue
    .line 97
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public source()Lokio/BufferedSource;
    .registers 2

    .prologue
    .line 100
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    return-object v0
.end method
