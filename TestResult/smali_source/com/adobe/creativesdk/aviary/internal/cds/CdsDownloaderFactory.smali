.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;
.super Ljava/lang/Object;
.source "CdsDownloaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$ContentDownloader;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$FeatureImageDownloader;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$PreviewDownloader;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$MessageDownloader;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsync;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    }
.end annotation


# static fields
.field static final LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const-string v0, "CdsDownloaderFactory"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public static create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    .registers 3
    .param p0, "type"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    .prologue
    .line 657
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$ContentType:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2c

    .line 674
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 659
    :pswitch_d
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$PreviewDownloader;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$PreviewDownloader;-><init>()V

    goto :goto_c

    .line 662
    :pswitch_13
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$ContentDownloader;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$ContentDownloader;-><init>()V

    goto :goto_c

    .line 665
    :pswitch_19
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$MessageDownloader;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$MessageDownloader;-><init>()V

    goto :goto_c

    .line 668
    :pswitch_1f
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;-><init>()V

    goto :goto_c

    .line 671
    :pswitch_25
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$FeatureImageDownloader;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$FeatureImageDownloader;-><init>()V

    goto :goto_c

    .line 657
    nop

    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_d
        :pswitch_13
        :pswitch_19
        :pswitch_1f
        :pswitch_25
    .end packed-switch
.end method

.method static getCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-static {p0, p1}, Lit/sephiroth/android/library/disklrumulticache/DiskLruMultiCache;->getCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 44
    .local v0, "cacheDir":Ljava/io/File;
    if-eqz v0, :cond_1a

    .line 45
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 46
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->createNoMediaFile(Ljava/io/File;)V

    .line 55
    .end local v0    # "cacheDir":Ljava/io/File;
    :goto_f
    return-object v0

    .line 50
    .restart local v0    # "cacheDir":Ljava/io/File;
    :cond_10
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 51
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->createNoMediaFile(Ljava/io/File;)V

    goto :goto_f

    .line 55
    :cond_1a
    const/4 v0, 0x0

    goto :goto_f
.end method
