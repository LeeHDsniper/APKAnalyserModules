.class public final Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadStartEvent;
.super Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;
.source "AdobeImageDownloadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DownloadStartEvent"
.end annotation


# direct methods
.method protected constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;-><init>(J)V

    .line 41
    return-void
.end method


# virtual methods
.method public bridge synthetic getId()J
    .registers 3

    .prologue
    .line 38
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;->getId()J

    move-result-wide v0

    return-wide v0
.end method
