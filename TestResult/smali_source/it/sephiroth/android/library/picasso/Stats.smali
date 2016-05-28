.class Lit/sephiroth/android/library/picasso/Stats;
.super Ljava/lang/Object;
.source "Stats.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/Stats$StatsHandler;
    }
.end annotation


# instance fields
.field averageDownloadSize:J

.field averageOriginalBitmapSize:J

.field averageTransformedBitmapSize:J

.field final cache:Lit/sephiroth/android/library/picasso/Cache;

.field cacheHits:J

.field cacheMisses:J

.field downloadCount:I

.field final handler:Landroid/os/Handler;

.field originalBitmapCount:I

.field final statsThread:Landroid/os/HandlerThread;

.field totalDownloadSize:J

.field totalOriginalBitmapSize:J

.field totalTransformedBitmapSize:J

.field transformedBitmapCount:I


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/picasso/Cache;)V
    .registers 5
    .param p1, "cache"    # Lit/sephiroth/android/library/picasso/Cache;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Stats;->cache:Lit/sephiroth/android/library/picasso/Cache;

    .line 53
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "Picasso-Stats"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Stats;->statsThread:Landroid/os/HandlerThread;

    .line 54
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Stats;->statsThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 55
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Stats;->statsThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {v0}, Lit/sephiroth/android/library/picasso/Utils;->flushStackLocalLeaks(Landroid/os/Looper;)V

    .line 56
    new-instance v0, Lit/sephiroth/android/library/picasso/Stats$StatsHandler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Stats;->statsThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lit/sephiroth/android/library/picasso/Stats$StatsHandler;-><init>(Landroid/os/Looper;Lit/sephiroth/android/library/picasso/Stats;)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Stats;->handler:Landroid/os/Handler;

    .line 57
    return-void
.end method

.method private static getAverage(IJ)J
    .registers 6
    .param p0, "count"    # I
    .param p1, "totalSize"    # J

    .prologue
    .line 123
    int-to-long v0, p0

    div-long v0, p1, v0

    return-wide v0
.end method

.method private processBitmap(Landroid/graphics/Bitmap;I)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "what"    # I

    .prologue
    .line 118
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    move-result v0

    .line 119
    .local v0, "bitmapSize":I
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Stats;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Stats;->handler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, p2, v0, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 120
    return-void
.end method


# virtual methods
.method createSnapshot()Lit/sephiroth/android/library/picasso/StatsSnapshot;
    .registers 28

    .prologue
    .line 110
    new-instance v3, Lit/sephiroth/android/library/picasso/StatsSnapshot;

    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/picasso/Stats;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-interface {v2}, Lit/sephiroth/android/library/picasso/Cache;->maxSize()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/picasso/Stats;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-interface {v2}, Lit/sephiroth/android/library/picasso/Cache;->size()I

    move-result v5

    move-object/from16 v0, p0

    iget-wide v6, v0, Lit/sephiroth/android/library/picasso/Stats;->cacheHits:J

    move-object/from16 v0, p0

    iget-wide v8, v0, Lit/sephiroth/android/library/picasso/Stats;->cacheMisses:J

    move-object/from16 v0, p0

    iget-wide v10, v0, Lit/sephiroth/android/library/picasso/Stats;->totalDownloadSize:J

    move-object/from16 v0, p0

    iget-wide v12, v0, Lit/sephiroth/android/library/picasso/Stats;->totalOriginalBitmapSize:J

    move-object/from16 v0, p0

    iget-wide v14, v0, Lit/sephiroth/android/library/picasso/Stats;->totalTransformedBitmapSize:J

    move-object/from16 v0, p0

    iget-wide v0, v0, Lit/sephiroth/android/library/picasso/Stats;->averageDownloadSize:J

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lit/sephiroth/android/library/picasso/Stats;->averageOriginalBitmapSize:J

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lit/sephiroth/android/library/picasso/Stats;->averageTransformedBitmapSize:J

    move-wide/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lit/sephiroth/android/library/picasso/Stats;->downloadCount:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lit/sephiroth/android/library/picasso/Stats;->originalBitmapCount:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lit/sephiroth/android/library/picasso/Stats;->transformedBitmapCount:I

    move/from16 v24, v0

    .line 113
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v25

    invoke-direct/range {v3 .. v26}, Lit/sephiroth/android/library/picasso/StatsSnapshot;-><init>(IIJJJJJJJJIIIJ)V

    return-object v3
.end method

.method dispatchBitmapDecoded(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 60
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lit/sephiroth/android/library/picasso/Stats;->processBitmap(Landroid/graphics/Bitmap;I)V

    .line 61
    return-void
.end method

.method dispatchBitmapTransformed(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 64
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lit/sephiroth/android/library/picasso/Stats;->processBitmap(Landroid/graphics/Bitmap;I)V

    .line 65
    return-void
.end method

.method dispatchCacheHit()V
    .registers 3

    .prologue
    .line 72
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Stats;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 73
    return-void
.end method

.method dispatchCacheMiss()V
    .registers 3

    .prologue
    .line 76
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Stats;->handler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 77
    return-void
.end method

.method dispatchDownloadFinished(J)V
    .registers 8
    .param p1, "size"    # J

    .prologue
    .line 68
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Stats;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Stats;->handler:Landroid/os/Handler;

    const/4 v2, 0x4

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 69
    return-void
.end method

.method performBitmapDecoded(J)V
    .registers 8
    .param p1, "size"    # J

    .prologue
    .line 98
    iget v0, p0, Lit/sephiroth/android/library/picasso/Stats;->originalBitmapCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lit/sephiroth/android/library/picasso/Stats;->originalBitmapCount:I

    .line 99
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->totalOriginalBitmapSize:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->totalOriginalBitmapSize:J

    .line 100
    iget v0, p0, Lit/sephiroth/android/library/picasso/Stats;->originalBitmapCount:I

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/Stats;->totalOriginalBitmapSize:J

    invoke-static {v0, v2, v3}, Lit/sephiroth/android/library/picasso/Stats;->getAverage(IJ)J

    move-result-wide v0

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->averageOriginalBitmapSize:J

    .line 101
    return-void
.end method

.method performBitmapTransformed(J)V
    .registers 8
    .param p1, "size"    # J

    .prologue
    .line 104
    iget v0, p0, Lit/sephiroth/android/library/picasso/Stats;->transformedBitmapCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lit/sephiroth/android/library/picasso/Stats;->transformedBitmapCount:I

    .line 105
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->totalTransformedBitmapSize:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->totalTransformedBitmapSize:J

    .line 106
    iget v0, p0, Lit/sephiroth/android/library/picasso/Stats;->originalBitmapCount:I

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/Stats;->totalTransformedBitmapSize:J

    invoke-static {v0, v2, v3}, Lit/sephiroth/android/library/picasso/Stats;->getAverage(IJ)J

    move-result-wide v0

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->averageTransformedBitmapSize:J

    .line 107
    return-void
.end method

.method performCacheHit()V
    .registers 5

    .prologue
    .line 84
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->cacheHits:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->cacheHits:J

    .line 85
    return-void
.end method

.method performCacheMiss()V
    .registers 5

    .prologue
    .line 88
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->cacheMisses:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->cacheMisses:J

    .line 89
    return-void
.end method

.method performDownloadFinished(Ljava/lang/Long;)V
    .registers 6
    .param p1, "size"    # Ljava/lang/Long;

    .prologue
    .line 92
    iget v0, p0, Lit/sephiroth/android/library/picasso/Stats;->downloadCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lit/sephiroth/android/library/picasso/Stats;->downloadCount:I

    .line 93
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->totalDownloadSize:J

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->totalDownloadSize:J

    .line 94
    iget v0, p0, Lit/sephiroth/android/library/picasso/Stats;->downloadCount:I

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/Stats;->totalDownloadSize:J

    invoke-static {v0, v2, v3}, Lit/sephiroth/android/library/picasso/Stats;->getAverage(IJ)J

    move-result-wide v0

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/Stats;->averageDownloadSize:J

    .line 95
    return-void
.end method
