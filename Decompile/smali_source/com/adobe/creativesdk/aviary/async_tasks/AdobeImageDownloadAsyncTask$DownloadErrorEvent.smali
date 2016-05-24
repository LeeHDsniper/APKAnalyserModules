.class public final Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;
.super Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;
.source "AdobeImageDownloadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DownloadErrorEvent"
.end annotation


# instance fields
.field public final error:Ljava/lang/String;


# direct methods
.method protected constructor <init>(JLjava/lang/String;)V
    .registers 5
    .param p1, "id"    # J
    .param p3, "error"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;-><init>(J)V

    .line 49
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;->error:Ljava/lang/String;

    .line 50
    return-void
.end method


# virtual methods
.method public bridge synthetic getId()J
    .registers 3

    .prologue
    .line 44
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadEvent;->getId()J

    move-result-wide v0

    return-wide v0
.end method
