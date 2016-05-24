.class final Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;
.super Landroid/os/AsyncTask;
.source "CdsDownloaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DownloaderAsync"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field listener:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;",
            ">;"
        }
    .end annotation
.end field

.field final packId:J


# direct methods
.method constructor <init>(Landroid/content/Context;JLcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "listener"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;

    .prologue
    .line 79
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->context:Landroid/content/Context;

    .line 81
    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->packId:J

    .line 82
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p4}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->listener:Ljava/lang/ref/SoftReference;

    .line 83
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 74
    check-cast p1, [Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->doInBackground([Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;)Ljava/lang/String;
    .registers 8
    .param p1, "params"    # [Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    .prologue
    .line 88
    const/4 v1, 0x0

    :try_start_1
    aget-object v1, p1, v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->context:Landroid/content/Context;

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->packId:J

    invoke-virtual {v1, v2, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;J)Ljava/lang/String;
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_a} :catch_c

    move-result-object v1

    .line 91
    :goto_b
    return-object v1

    .line 89
    :catch_c
    move-exception v0

    .line 90
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 91
    const/4 v1, 0x0

    goto :goto_b
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 74
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 6
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 99
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->listener:Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;

    .line 100
    .local v0, "ls":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;
    if-eqz v0, :cond_13

    .line 101
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->packId:J

    invoke-interface {v0, v2, v3, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;->onDownloadComplete(JLjava/lang/String;)V

    .line 105
    :goto_12
    return-void

    .line 103
    :cond_13
    const-string v1, "DownloaderAsync"

    const-string v2, "listener is null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method
