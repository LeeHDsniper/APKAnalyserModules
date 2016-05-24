.class public Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "AdobeImageDownloadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;,
        Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;,
        Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadStartEvent;,
        Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Landroid/content/Context;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private error:Ljava/lang/String;

.field private mEnabled:Z

.field private final mId:J

.field private mImageOutputInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

.field private mMaxSize:I

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(JLandroid/net/Uri;I)V
    .registers 6
    .param p1, "id"    # J
    .param p3, "uri"    # Landroid/net/Uri;
    .param p4, "maxSize"    # I

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 82
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mUri:Landroid/net/Uri;

    .line 83
    iput p4, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mMaxSize:I

    .line 84
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mImageOutputInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mEnabled:Z

    .line 86
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mId:J

    .line 87
    return-void
.end method

.method public static getManagedMaxImageSize(Landroid/content/Context;)I
    .registers 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 163
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->isTablet(Landroid/content/Context;)Z

    move-result v2

    .line 164
    .local v2, "isTablet":Z
    if-eqz v2, :cond_55

    const-wide/high16 v4, 0x3fe8000000000000L

    .line 166
    .local v4, "multiplier":D
    :goto_8
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 167
    .local v3, "metrics":Landroid/util/DisplayMetrics;
    const-string v7, "AdbDownloadAsyncTask"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "screen size: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget v7, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v8, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    int-to-double v8, v7

    mul-double/2addr v8, v4

    double-to-int v6, v8

    .line 171
    .local v6, "screenSize":I
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->getRuntimeTotalMemory()D

    move-result-wide v0

    .line 173
    .local v0, "applicationMemory":D
    const-wide v8, 0x407f400000000000L

    cmpl-double v7, v0, v8

    if-ltz v7, :cond_58

    .line 174
    const/16 v7, 0x800

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 180
    :goto_54
    return v7

    .line 164
    .end local v0    # "applicationMemory":D
    .end local v3    # "metrics":Landroid/util/DisplayMetrics;
    .end local v4    # "multiplier":D
    .end local v6    # "screenSize":I
    :cond_55
    const-wide/high16 v4, 0x3ff0000000000000L

    goto :goto_8

    .line 175
    .restart local v0    # "applicationMemory":D
    .restart local v3    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v4    # "multiplier":D
    .restart local v6    # "screenSize":I
    :cond_58
    const-wide v8, 0x405fc00000000000L

    cmpl-double v7, v0, v8

    if-ltz v7, :cond_68

    .line 176
    const/16 v7, 0x5a0

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    goto :goto_54

    .line 177
    :cond_68
    const-wide/high16 v8, 0x4048000000000000L

    cmpl-double v7, v0, v8

    if-ltz v7, :cond_75

    .line 178
    const/16 v7, 0x3c0

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    goto :goto_54

    .line 180
    :cond_75
    const/16 v7, 0x2d0

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    goto :goto_54
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/content/Context;)Landroid/graphics/Bitmap;
    .registers 12
    .param p1, "params"    # [Landroid/content/Context;

    .prologue
    .line 104
    const-string v5, "AdbDownloadAsyncTask"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "doInBackground: current thread #"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    const/4 v5, 0x0

    aget-object v0, p1, v5

    .line 107
    .local v0, "context":Landroid/content/Context;
    const/4 v2, -0x1

    .line 109
    .local v2, "maxSize":I
    iget v5, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mMaxSize:I

    if-lez v5, :cond_2a

    .line 110
    iget v2, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mMaxSize:I

    .line 113
    :cond_2a
    if-gtz v2, :cond_30

    .line 114
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->getManagedMaxImageSize(Landroid/content/Context;)I

    move-result v2

    .line 118
    :cond_30
    :try_start_30
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mUri:Landroid/net/Uri;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mImageOutputInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    invoke-static {v0, v5, v2, v2, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->decode(Landroid/content/Context;Landroid/net/Uri;IILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 119
    .local v4, "result":Landroid/graphics/Bitmap;
    if-eqz v4, :cond_4d

    .line 120
    invoke-static {v4}, Landroid/support/v7/graphics/Palette;->from(Landroid/graphics/Bitmap;)Landroid/support/v7/graphics/Palette$Builder;

    move-result-object v5

    div-int/lit8 v6, v2, 0x2

    invoke-virtual {v5, v6}, Landroid/support/v7/graphics/Palette$Builder;->resizeBitmapSize(I)Landroid/support/v7/graphics/Palette$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v7/graphics/Palette$Builder;->generate()Landroid/support/v7/graphics/Palette;

    move-result-object v3

    .line 121
    .local v3, "palette":Landroid/support/v7/graphics/Palette;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mImageOutputInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    invoke-virtual {v5, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->setPalette(Landroid/support/v7/graphics/Palette;)V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_4d} :catch_4e

    .line 129
    .end local v3    # "palette":Landroid/support/v7/graphics/Palette;
    .end local v4    # "result":Landroid/graphics/Bitmap;
    :cond_4d
    :goto_4d
    return-object v4

    .line 124
    :catch_4e
    move-exception v1

    .line 125
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "AdbDownloadAsyncTask"

    const-string v6, "decode error"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 126
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->error:Ljava/lang/String;

    .line 129
    const/4 v4, 0x0

    goto :goto_4d
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 23
    check-cast p1, [Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->doInBackground([Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Landroid/graphics/Bitmap;)V
    .registers 8
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v5, 0x0

    .line 134
    const-string v0, "AdbDownloadAsyncTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "doPostExecute: current thread #"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mEnabled:Z

    if-eqz v0, :cond_37

    .line 137
    if-eqz p1, :cond_3c

    .line 138
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mId:J

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mImageOutputInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    invoke-direct {v1, v2, v3, p1, v4}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;-><init>(JLandroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 144
    :cond_37
    :goto_37
    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mUri:Landroid/net/Uri;

    .line 145
    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->error:Ljava/lang/String;

    .line 146
    return-void

    .line 140
    :cond_3c
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mId:J

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->error:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;-><init>(JLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    goto :goto_37
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 23
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->doPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 5

    .prologue
    .line 95
    const-string v0, "AdbDownloadAsyncTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "doPreExecute: current thread #"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mEnabled:Z

    if-eqz v0, :cond_32

    .line 98
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadStartEvent;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mId:J

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadStartEvent;-><init>(J)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 100
    :cond_32
    return-void
.end method

.method public setEnabled(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->mEnabled:Z

    .line 91
    return-void
.end method
