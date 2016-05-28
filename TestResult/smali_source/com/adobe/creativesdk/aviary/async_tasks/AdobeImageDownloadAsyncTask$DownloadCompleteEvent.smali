.class public final Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;
.super Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;
.source "AdobeImageDownloadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DownloadCompleteEvent"
.end annotation


# instance fields
.field public final bitmap:Landroid/graphics/Bitmap;

.field public final imageInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;


# direct methods
.method protected constructor <init>(JLandroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V
    .registers 6
    .param p1, "id"    # J
    .param p3, "bitmap"    # Landroid/graphics/Bitmap;
    .param p4, "imageInfo"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;-><init>(J)V

    .line 59
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;->bitmap:Landroid/graphics/Bitmap;

    .line 60
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;->imageInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .line 61
    return-void
.end method


# virtual methods
.method public bridge synthetic getId()J
    .registers 3

    .prologue
    .line 53
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;->getId()J

    move-result-wide v0

    return-wide v0
.end method
