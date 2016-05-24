.class public final Lcom/squareup/okhttp/CacheControl$Builder;
.super Ljava/lang/Object;
.source "CacheControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/CacheControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field maxAgeSeconds:I

.field maxStaleSeconds:I

.field minFreshSeconds:I

.field noCache:Z

.field noStore:Z

.field noTransform:Z

.field onlyIfCached:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput v0, p0, Lcom/squareup/okhttp/CacheControl$Builder;->maxAgeSeconds:I

    .line 240
    iput v0, p0, Lcom/squareup/okhttp/CacheControl$Builder;->maxStaleSeconds:I

    .line 241
    iput v0, p0, Lcom/squareup/okhttp/CacheControl$Builder;->minFreshSeconds:I

    return-void
.end method


# virtual methods
.method public build()Lcom/squareup/okhttp/CacheControl;
    .registers 3

    .prologue
    .line 327
    new-instance v0, Lcom/squareup/okhttp/CacheControl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/CacheControl;-><init>(Lcom/squareup/okhttp/CacheControl$Builder;Lcom/squareup/okhttp/CacheControl$1;)V

    return-object v0
.end method

.method public maxStale(ILjava/util/concurrent/TimeUnit;)Lcom/squareup/okhttp/CacheControl$Builder;
    .registers 8
    .param p1, "maxStale"    # I
    .param p2, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 284
    if-gez p1, :cond_1b

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "maxStale < 0: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 285
    :cond_1b
    int-to-long v2, p1

    invoke-virtual {p2, v2, v3}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v0

    .line 286
    .local v0, "maxStaleSecondsLong":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_2d

    const v2, 0x7fffffff

    :goto_2a
    iput v2, p0, Lcom/squareup/okhttp/CacheControl$Builder;->maxStaleSeconds:I

    .line 289
    return-object p0

    .line 286
    :cond_2d
    long-to-int v2, v0

    goto :goto_2a
.end method

.method public noCache()Lcom/squareup/okhttp/CacheControl$Builder;
    .registers 2

    .prologue
    .line 247
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/CacheControl$Builder;->noCache:Z

    .line 248
    return-object p0
.end method

.method public noStore()Lcom/squareup/okhttp/CacheControl$Builder;
    .registers 2

    .prologue
    .line 253
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/CacheControl$Builder;->noStore:Z

    .line 254
    return-object p0
.end method

.method public onlyIfCached()Lcom/squareup/okhttp/CacheControl$Builder;
    .registers 2

    .prologue
    .line 316
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/CacheControl$Builder;->onlyIfCached:Z

    .line 317
    return-object p0
.end method
