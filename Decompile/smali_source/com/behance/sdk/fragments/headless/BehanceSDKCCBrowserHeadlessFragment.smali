.class public Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;
.super Landroid/support/v4/app/Fragment;
.source "BehanceSDKCCBrowserHeadlessFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private downloadErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private files:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private imageValidatorType:Ljava/lang/String;

.field private invalidFile:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private volatile isDownloadInProgress:Z

.field private listener:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;

.field private mSelectedAssetsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;",
            ">;"
        }
    .end annotation
.end field

.field private tempStorageFolder:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    const-class v0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 90
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->isDownloadInProgress:Z

    .line 91
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->setRetainInstance(Z)V

    .line 92
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadErrors:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->showMessage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;I)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;
    .param p1, "x1"    # I

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->checkForDownloadComplete(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;[BLjava/io/File;)V
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Ljava/io/File;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->saveDatatoFile([BLjava/io/File;)V

    return-void
.end method

.method static synthetic access$400(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;)Lcom/behance/sdk/factory/IBehanceSDKImageValidator;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getImageValidator()Lcom/behance/sdk/factory/IBehanceSDKImageValidator;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;Ljava/io/File;)Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getImageProperties(Ljava/io/File;)Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$700(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->invalidFile:Ljava/util/List;

    return-object v0
.end method

.method private checkForDownloadComplete(I)V
    .registers 7
    .param p1, "totalSize"    # I

    .prologue
    .line 273
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadErrors:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->invalidFile:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int v0, v1, v2

    .line 274
    .local v0, "total":I
    if-ne v0, p1, :cond_2f

    .line 275
    invoke-direct {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->moveFileToPicturesDirectory()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    .line 276
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->listener:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;

    if-eqz v1, :cond_2c

    .line 277
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->listener:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;

    iget-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadErrors:Ljava/util/List;

    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->invalidFile:Ljava/util/List;

    invoke-interface {v1, v2, v3, v4}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;->onDownloadComplete(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 279
    :cond_2c
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->isDownloadInProgress:Z

    .line 282
    :cond_2f
    return-void
.end method

.method private computeImageDimensions(Ljava/io/File;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)V
    .registers 7
    .param p1, "file"    # Ljava/io/File;
    .param p2, "properties"    # Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    .prologue
    .line 308
    if-eqz p1, :cond_2e

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 309
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 310
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 311
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 312
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {p2, v1}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->setWidth(I)V

    .line 313
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {p2, v1}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->setHeight(I)V

    .line 314
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {p2, v2, v3}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->setSize(J)V

    .line 317
    .end local v0    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_2e
    return-void
.end method

.method private downloadOriginalFile(ILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Ljava/io/File;)V
    .registers 6
    .param p1, "totalSize"    # I
    .param p2, "aFile"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p3, "targetFile"    # Ljava/io/File;

    .prologue
    .line 238
    new-instance v0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;

    invoke-direct {v0, p0, p3, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;-><init>(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;Ljava/io/File;I)V

    .line 266
    .local v0, "genericRequestCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<Ljava/lang/Boolean;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    invoke-virtual {p3}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {p2, v1, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->downloadAssetFile(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 268
    return-void
.end method

.method private downloadRendition(ILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Ljava/io/File;)V
    .registers 8
    .param p1, "totalSize"    # I
    .param p2, "aFile"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p3, "targetFile"    # Ljava/io/File;

    .prologue
    const/high16 v3, 0x45200000

    .line 193
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v0, v3, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    .line 194
    .local v0, "dimension":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getRenditionType(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    move-result-object v2

    .line 195
    .local v2, "renditionType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    new-instance v1, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$1;

    invoke-direct {v1, p0, p3, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$1;-><init>(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;Ljava/io/File;I)V

    .line 232
    .local v1, "genericRequestCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    invoke-virtual {p2, v2, v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 234
    return-void
.end method

.method private getImageProperties(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    .registers 12
    .param p1, "adobeAssetFile"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 331
    new-instance v3, Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    invoke-direct {v3}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;-><init>()V

    .line 332
    .local v3, "properties":Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getFileSize()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->setSize(J)V

    .line 333
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/behance/sdk/util/BehanceSDKUtils;->getFileExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 334
    .local v4, "type":Ljava/lang/String;
    invoke-virtual {v3, v4}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->setType(Ljava/lang/String;)V

    .line 335
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v2

    .line 336
    .local v2, "optionalMetaData":Lorg/json/JSONObject;
    if-eqz v2, :cond_3f

    .line 338
    const-string v6, "height"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3f

    const-string v6, "width"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3f

    .line 342
    :try_start_2d
    const-string v6, "height"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 343
    .local v1, "height":I
    const-string v6, "width"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 344
    .local v5, "width":I
    invoke-virtual {v3, v1}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->setHeight(I)V

    .line 345
    invoke-virtual {v3, v5}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->setWidth(I)V
    :try_end_3f
    .catch Lorg/json/JSONException; {:try_start_2d .. :try_end_3f} :catch_40

    .line 353
    .end local v1    # "height":I
    .end local v5    # "width":I
    :cond_3f
    :goto_3f
    return-object v3

    .line 347
    :catch_40
    move-exception v0

    .line 349
    .local v0, "e":Lorg/json/JSONException;
    sget-object v6, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception parsing image metadata of CC asset file "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    invoke-interface {v6, v7, v8}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3f
.end method

.method private getImageProperties(Ljava/io/File;)Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    .registers 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 321
    new-instance v0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    invoke-direct {v0}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;-><init>()V

    .line 322
    .local v0, "properties":Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/behance/sdk/util/BehanceSDKUtils;->getFileExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 323
    .local v1, "type":Ljava/lang/String;
    invoke-virtual {v0, v1}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->setType(Ljava/lang/String;)V

    .line 324
    invoke-direct {p0, p1, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->computeImageDimensions(Ljava/io/File;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)V

    .line 325
    return-object v0
.end method

.method private getImageValidator()Lcom/behance/sdk/factory/IBehanceSDKImageValidator;
    .registers 3

    .prologue
    .line 302
    invoke-static {}, Lcom/behance/sdk/factory/BehanceSDKImageValidatorFactory;->getInstance()Lcom/behance/sdk/factory/BehanceSDKImageValidatorFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->imageValidatorType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/factory/BehanceSDKImageValidatorFactory;->getImageValidator(Ljava/lang/String;)Lcom/behance/sdk/factory/IBehanceSDKImageValidator;

    move-result-object v0

    return-object v0
.end method

.method private getRenditionType(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .registers 3
    .param p1, "fileType"    # Ljava/lang/String;

    .prologue
    .line 359
    const-string v0, "image/gif"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 360
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    .line 366
    :goto_a
    return-object v0

    .line 361
    :cond_b
    const-string v0, "image/png"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 362
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    goto :goto_a

    .line 363
    :cond_16
    const-string v0, "image/jpeg"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 364
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    goto :goto_a

    .line 366
    :cond_21
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    goto :goto_a
.end method

.method private getStorageDirectoryForDownload()Ljava/io/File;
    .registers 5

    .prologue
    .line 385
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/CC"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 386
    .local v0, "temp":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 387
    invoke-static {v0}, Lcom/behance/sdk/util/BehanceSDKUtils;->deleteRecursive(Ljava/io/File;)V

    .line 389
    :cond_2f
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 390
    return-object v0
.end method

.method private moveFileToPicturesDirectory()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 286
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 287
    .local v2, "newFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    sget-object v4, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v4}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 288
    .local v3, "storageDir":Ljava/io/File;
    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_11
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 289
    .local v0, "file":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 290
    .local v1, "imageFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2f

    .line 291
    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 292
    :cond_2f
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 294
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "imageFile":Ljava/io/File;
    :cond_33
    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->tempStorageFolder:Ljava/io/File;

    invoke-static {v4}, Lcom/behance/sdk/util/BehanceSDKUtils;->deleteRecursive(Ljava/io/File;)V

    .line 295
    return-object v2
.end method

.method private processImage(ILcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;)V
    .registers 10
    .param p1, "totalSize"    # I
    .param p2, "selection"    # Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;

    .prologue
    const/16 v6, 0xa00

    .line 172
    invoke-direct {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getImageValidator()Lcom/behance/sdk/factory/IBehanceSDKImageValidator;

    move-result-object v2

    .line 173
    .local v2, "imageValidator":Lcom/behance/sdk/factory/IBehanceSDKImageValidator;
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;->getSelectedItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 174
    .local v0, "aFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    new-instance v1, Ljava/io/File;

    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->tempStorageFolder:Ljava/io/File;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 175
    .local v1, "imageFile":Ljava/io/File;
    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getImageProperties(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    move-result-object v3

    .line 176
    .local v3, "properties":Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    invoke-virtual {v3}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getHeight()I

    move-result v4

    if-gt v4, v6, :cond_25

    invoke-virtual {v3}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getWidth()I

    move-result v4

    if-le v4, v6, :cond_29

    .line 178
    :cond_25
    invoke-direct {p0, p1, v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadRendition(ILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Ljava/io/File;)V

    .line 189
    :goto_28
    return-void

    .line 180
    :cond_29
    if-eqz v2, :cond_35

    invoke-virtual {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-interface {v2, v4, v3}, Lcom/behance/sdk/factory/IBehanceSDKImageValidator;->validate(Landroid/content/Context;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 182
    :cond_35
    invoke-direct {p0, p1, v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadOriginalFile(ILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Ljava/io/File;)V

    goto :goto_28

    .line 186
    :cond_39
    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->invalidFile:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_28
.end method

.method private saveDatatoFile([BLjava/io/File;)V
    .registers 11
    .param p1, "data"    # [B
    .param p2, "imageFile"    # Ljava/io/File;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 373
    :try_start_2
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 374
    .local v2, "outputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v2, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 375
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_d} :catch_e

    .line 382
    .end local v2    # "outputStream":Ljava/io/FileOutputStream;
    :goto_d
    return-void

    .line 376
    :catch_e
    move-exception v1

    .line 377
    .local v1, "ex":Ljava/lang/Exception;
    sget v3, Lcom/behance/sdk/R$string;->bsdk_cc_asset_browser_file_download_error:I

    new-array v4, v7, [Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 378
    .local v0, "errorMessage":Ljava/lang/String;
    sget-object v3, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    new-array v4, v7, [Ljava/lang/Object;

    aput-object v1, v4, v6

    invoke-interface {v3, v0, v4}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 379
    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadErrors:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 380
    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->showMessage(Ljava/lang/String;)V

    goto :goto_d
.end method

.method private showMessage(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 396
    invoke-virtual {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 397
    return-void
.end method


# virtual methods
.method public declared-synchronized cancelDownload()V
    .registers 8

    .prologue
    const/16 v6, 0xa00

    .line 115
    monitor-enter p0

    :try_start_3
    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    if-eqz v4, :cond_82

    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_82

    .line 116
    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_15
    :goto_15
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_49

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;

    .line 117
    .local v3, "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    instance-of v5, v3, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;

    if-eqz v5, :cond_15

    .line 118
    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;

    .end local v3    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;->getSelectedItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 119
    .local v0, "aFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cancelDataRequest()V

    .line 120
    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getImageProperties(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    move-result-object v2

    .line 121
    .local v2, "properties":Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    invoke-virtual {v2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getHeight()I

    move-result v5

    if-gt v5, v6, :cond_3e

    invoke-virtual {v2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getWidth()I

    move-result v5

    if-le v5, v6, :cond_45

    .line 123
    :cond_3e
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cancelRenditionRequest()V
    :try_end_41
    .catchall {:try_start_3 .. :try_end_41} :catchall_42

    goto :goto_15

    .line 115
    .end local v0    # "aFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v2    # "properties":Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    :catchall_42
    move-exception v4

    monitor-exit p0

    throw v4

    .line 126
    .restart local v0    # "aFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .restart local v2    # "properties":Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    :cond_45
    :try_start_45
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cancelDataRequest()V

    goto :goto_15

    .line 130
    .end local v0    # "aFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v2    # "properties":Lcom/behance/sdk/factory/BehanceSDKImageProperties;
    :cond_49
    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    if-eqz v4, :cond_71

    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_71

    .line 131
    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_5b
    :goto_5b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_71

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 132
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_5b

    .line 133
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_5b

    .line 137
    .end local v1    # "file":Ljava/io/File;
    :cond_71
    iget-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->tempStorageFolder:Ljava/io/File;

    invoke-static {v4}, Lcom/behance/sdk/util/BehanceSDKUtils;->deleteRecursive(Ljava/io/File;)V

    .line 138
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    .line 139
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    .line 140
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadErrors:Ljava/util/List;

    .line 141
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->invalidFile:Ljava/util/List;

    .line 143
    :cond_82
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->isDownloadInProgress:Z
    :try_end_85
    .catchall {:try_start_45 .. :try_end_85} :catchall_42

    .line 144
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized downloadSelectedFiles(Landroid/content/Intent;)V
    .registers 7
    .param p1, "data"    # Landroid/content/Intent;

    .prologue
    .line 149
    monitor-enter p0

    const/4 v3, 0x1

    :try_start_2
    iput-boolean v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->isDownloadInProgress:Z

    .line 150
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;

    invoke-direct {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;-><init>(Landroid/content/Intent;)V

    .line 151
    .local v0, "mAssetBrowserResult":Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;->getSelectionAssetArray()Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    .line 152
    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    if-eqz v3, :cond_5b

    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5b

    .line 153
    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 154
    .local v2, "totalSize":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;

    .line 155
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadErrors:Ljava/util/List;

    .line 156
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->invalidFile:Ljava/util/List;

    .line 157
    invoke-direct {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getStorageDirectoryForDownload()Ljava/io/File;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->tempStorageFolder:Ljava/io/File;

    .line 159
    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->mSelectedAssetsList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_42
    :goto_42
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;

    .line 160
    .local v1, "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    instance-of v4, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;

    if-eqz v4, :cond_42

    .line 161
    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;

    .end local v1    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    invoke-direct {p0, v2, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->processImage(ILcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;)V
    :try_end_57
    .catchall {:try_start_2 .. :try_end_57} :catchall_58

    goto :goto_42

    .line 149
    .end local v0    # "mAssetBrowserResult":Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;
    .end local v2    # "totalSize":I
    :catchall_58
    move-exception v3

    monitor-exit p0

    throw v3

    .line 165
    .restart local v0    # "mAssetBrowserResult":Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;
    :cond_5b
    const/4 v3, 0x0

    :try_start_5c
    iput-boolean v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->isDownloadInProgress:Z
    :try_end_5e
    .catchall {:try_start_5c .. :try_end_5e} :catchall_58

    .line 168
    :cond_5e
    monitor-exit p0

    return-void
.end method

.method public isDownloadInProgress()Z
    .registers 2

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->isDownloadInProgress:Z

    return v0
.end method

.method public launchCCAssetBrowser(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
        }
    .end annotation

    .prologue
    .line 96
    const-string v4, "ARGS_IMAGE_VALIDATOR_TYPE"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->imageValidatorType:Ljava/lang/String;

    .line 98
    new-instance v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;-><init>()V

    .line 99
    .local v2, "browserConfiguration":Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;
    const-string v4, "ARGS_ASSET_BROWSER_OPTIONS"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    .line 100
    .local v1, "assetBrowserOptions":Ljava/io/Serializable;
    if-eqz v1, :cond_19

    .line 101
    check-cast v1, Ljava/util/EnumSet;

    .end local v1    # "assetBrowserOptions":Ljava/io/Serializable;
    iput-object v1, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->options:Ljava/util/EnumSet;

    .line 102
    :cond_19
    const-string v4, "ARGS_ALLOWED_MIME_TYPES"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    .line 103
    .local v0, "allowedMimeTypes":Ljava/io/Serializable;
    if-eqz v0, :cond_2b

    .line 104
    check-cast v0, Ljava/util/EnumSet;

    .end local v0    # "allowedMimeTypes":Ljava/io/Serializable;
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->ADOBE_ASSET_MIMETYPE_FILTERTYPE_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    invoke-static {v0, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;->createFromMimeTypes(Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;

    move-result-object v4

    iput-object v4, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->mimeTypeFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;

    .line 108
    :cond_2b
    invoke-static {}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->getSharedInstance()Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    move-result-object v3

    .line 109
    .local v3, "sharedAssetBrowserInstance":Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;
    const/16 v4, 0x263a

    invoke-virtual {v3, p1, v4, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->popupFileBrowser(Landroid/app/Activity;ILcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V

    .line 111
    return-void
.end method

.method public removeDownloadListener()V
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->listener:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;

    .line 88
    return-void
.end method

.method public setDownloadListener(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->listener:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;

    .line 84
    return-void
.end method
