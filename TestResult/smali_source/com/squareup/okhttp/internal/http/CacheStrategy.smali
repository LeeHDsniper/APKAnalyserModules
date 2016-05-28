.class public final Lcom/squareup/okhttp/internal/http/CacheStrategy;
.super Ljava/lang/Object;
.source "CacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/http/CacheStrategy$1;,
        Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;
    }
.end annotation


# instance fields
.field public final cacheResponse:Lcom/squareup/okhttp/Response;

.field public final networkRequest:Lcom/squareup/okhttp/Request;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)V
    .registers 3
    .param p1, "networkRequest"    # Lcom/squareup/okhttp/Request;
    .param p2, "cacheResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy;->networkRequest:Lcom/squareup/okhttp/Request;

    .line 33
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 34
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/squareup/okhttp/Request;
    .param p2, "x1"    # Lcom/squareup/okhttp/Response;
    .param p3, "x2"    # Lcom/squareup/okhttp/internal/http/CacheStrategy$1;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)V

    return-void
.end method

.method public static isCacheable(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Request;)Z
    .registers 7
    .param p0, "response"    # Lcom/squareup/okhttp/Response;
    .param p1, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    const/4 v3, 0x0

    .line 43
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v2

    .line 44
    .local v2, "responseCode":I
    const/16 v4, 0xc8

    if-eq v2, v4, :cond_1e

    const/16 v4, 0xcb

    if-eq v2, v4, :cond_1e

    const/16 v4, 0x12c

    if-eq v2, v4, :cond_1e

    const/16 v4, 0x12d

    if-eq v2, v4, :cond_1e

    const/16 v4, 0x19a

    if-eq v2, v4, :cond_1e

    const/16 v4, 0x134

    if-eq v2, v4, :cond_1e

    .line 60
    :cond_1d
    :goto_1d
    return v3

    .line 54
    :cond_1e
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    .line 55
    .local v1, "responseCaching":Lcom/squareup/okhttp/CacheControl;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v0

    .line 56
    .local v0, "requestCaching":Lcom/squareup/okhttp/CacheControl;
    invoke-virtual {v1}, Lcom/squareup/okhttp/CacheControl;->noStore()Z

    move-result v4

    if-nez v4, :cond_1d

    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl;->noStore()Z

    move-result v4

    if-nez v4, :cond_1d

    .line 60
    const/4 v3, 0x1

    goto :goto_1d
.end method
