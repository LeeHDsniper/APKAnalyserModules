.class public Lcom/facebook/internal/CacheableRequestBatch;
.super Lcom/facebook/RequestBatch;
.source "CacheableRequestBatch.java"


# instance fields
.field private cacheKey:Ljava/lang/String;

.field private forceRoundTrip:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/facebook/RequestBatch;-><init>()V

    .line 32
    return-void
.end method


# virtual methods
.method public final getCacheKeyOverride()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/facebook/internal/CacheableRequestBatch;->cacheKey:Ljava/lang/String;

    return-object v0
.end method

.method public final getForceRoundTrip()Z
    .registers 2

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/facebook/internal/CacheableRequestBatch;->forceRoundTrip:Z

    return v0
.end method
