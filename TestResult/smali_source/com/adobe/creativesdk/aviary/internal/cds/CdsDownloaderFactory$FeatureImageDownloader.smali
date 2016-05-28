.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$FeatureImageDownloader;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;
.source "CdsDownloaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FeatureImageDownloader"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 298
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;-><init>()V

    return-void
.end method


# virtual methods
.method protected getCacheDirName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 321
    const-string v0, "aviary-cds-featured-image-cache"

    return-object v0
.end method

.method protected getLocalPath(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)Ljava/lang/String;
    .registers 3
    .param p1, "content"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    .prologue
    .line 316
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getFeatureImageLocalPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getLocalPathColumnName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 306
    const-string v0, "content_featureImageLocalPath"

    return-object v0
.end method

.method protected getRemotePath(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)Ljava/lang/String;
    .registers 3
    .param p1, "content"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    .prologue
    .line 311
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getFeatureImageURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getRemoteUrlColumnName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 301
    const-string v0, "content_featureImageURL"

    return-object v0
.end method
