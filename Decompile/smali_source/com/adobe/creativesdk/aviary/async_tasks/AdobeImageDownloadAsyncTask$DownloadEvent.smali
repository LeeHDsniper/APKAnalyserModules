.class abstract Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;
.super Ljava/lang/Object;
.source "AdobeImageDownloadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "DownloadEvent"
.end annotation


# instance fields
.field final id:J


# direct methods
.method protected constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;->id:J

    .line 35
    return-void
.end method


# virtual methods
.method public getId()J
    .registers 3

    .prologue
    .line 30
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;->id:J

    return-wide v0
.end method
