.class public abstract Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
.super Ljava/lang/Object;
.source "CdsDownloaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Downloader"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final download(Landroid/content/Context;J)Ljava/lang/String;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 60
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;JZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract download(Landroid/content/Context;JZ)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation
.end method

.method public final downloadAsync(Landroid/content/Context;JLcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "listener"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;

    .prologue
    .line 66
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;-><init>(Landroid/content/Context;JLcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 67
    return-void
.end method
