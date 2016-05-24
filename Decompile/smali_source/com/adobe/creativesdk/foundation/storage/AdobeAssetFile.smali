.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
.source "AdobeAssetFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$13;
    }
.end annotation


# static fields
.field public static final THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;


# instance fields
.field protected transient asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

.field protected currentVersion:I

.field protected transient dataRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

.field protected fileSize:J

.field protected md5Hash:Ljava/lang/String;

.field protected optionalMetadata:Lorg/json/JSONObject;

.field protected pendingRendRequestCancellation:Z

.field protected transient renditionRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field protected type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/high16 v1, 0x437a0000

    .line 94
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v0, v1, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 981
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;-><init>()V

    .line 982
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->pendingRendRequestCancellation:Z

    .line 983
    return-void
.end method

.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 8
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "parentCollection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;-><init>()V

    .line 945
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    .line 946
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->internalID:Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->GUID:Ljava/lang/String;

    .line 947
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->href:Ljava/net/URI;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    .line 948
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->etag:Ljava/lang/String;

    .line 949
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->name:Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->name:Ljava/lang/String;

    .line 950
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 952
    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->parentHref:Ljava/net/URI;

    .line 954
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->created:Ljava/lang/String;

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->creationDate:Ljava/util/Date;

    .line 955
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->modified:Ljava/lang/String;

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->modificationDate:Ljava/util/Date;

    .line 957
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    .line 958
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->pendingRendRequestCancellation:Z

    .line 959
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    if-eqz v1, :cond_82

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    const-string v2, "application/vnd.adobe.file+json"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 960
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "content-type"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 962
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    const-string v2, "application/vnd.adobe.file+json"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_76

    .line 964
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "AdobeAssetFile"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Ignoring additional information in type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 967
    :cond_76
    :try_start_76
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "content-type"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;
    :try_end_82
    .catch Lorg/json/JSONException; {:try_start_76 .. :try_end_82} :catch_a0

    .line 974
    :cond_82
    :goto_82
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getLength()Ljava/lang/Number;

    move-result-object v1

    if-eqz v1, :cond_93

    .line 975
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getLength()Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    int-to-long v2, v1

    iput-wide v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->fileSize:J

    .line 976
    :cond_93
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getMd5()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->md5Hash:Ljava/lang/String;

    .line 977
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->optionalMetadata:Lorg/json/JSONObject;

    .line 978
    return-void

    .line 968
    :catch_a0
    move-exception v0

    .line 970
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_82
.end method

.method static AdobeAssetFileFromInfo(Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 5
    .param p0, "assetInfo"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;

    .prologue
    .line 1001
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;-><init>()V

    .line 1003
    .local v0, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->GUID:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->GUID:Ljava/lang/String;

    .line 1004
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->href:Ljava/net/URI;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    .line 1005
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->parentHref:Ljava/net/URI;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->parentHref:Ljava/net/URI;

    .line 1006
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->etag:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->etag:Ljava/lang/String;

    .line 1007
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->name:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->name:Ljava/lang/String;

    .line 1008
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->creationDate:Ljava/util/Date;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->creationDate:Ljava/util/Date;

    .line 1009
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->modificationDate:Ljava/util/Date;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->modificationDate:Ljava/util/Date;

    .line 1010
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->type:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    .line 1011
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->md5Hash:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->md5Hash:Ljava/lang/String;

    .line 1012
    iget-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->fileSize:J

    iput-wide v2, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->fileSize:J

    .line 1013
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->currentVersion:I

    iput v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->currentVersion:I

    .line 1014
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->optionalMetadata:Lorg/json/JSONObject;

    move-object v1, v0

    .line 1015
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->hlsHref:Ljava/lang/String;

    iput-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    .line 1017
    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    .prologue
    .line 73
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getVideoMetadata(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p3, "x3"    # I
    .param p4, "x4"    # Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionFromServerWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p3, "x3"    # I

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheKey(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private cacheGUID()Ljava/lang/String;
    .registers 5

    .prologue
    .line 1022
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->resourceItem()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v2

    iget-object v1, v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->internalID:Ljava/lang/String;

    .line 1024
    .local v1, "guid":Ljava/lang/String;
    if-nez v1, :cond_19

    .line 1026
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    invoke-virtual {v2}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1027
    .local v0, "components":[Ljava/lang/String;
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v1, v0, v2

    .line 1030
    .end local v0    # "components":[Ljava/lang/String;
    :cond_19
    return-object v1
.end method

.method private cacheKey(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;
    .registers 8
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "dimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p3, "page"    # I

    .prologue
    .line 1035
    const-string v0, "%d_%d-%d-%d"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->getIntVal()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getRenditionFromServerWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 14
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "dim"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p3, "page"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;",
            "I",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<[B",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 674
    .local p4, "dataDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$13;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFileRenditionType:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_4c

    .line 684
    const-string v7, "image/jpeg"

    .line 688
    .local v7, "contentType":Ljava/lang/String;
    :goto_d
    iget v2, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    iget v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_40

    iget v8, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    .line 690
    .local v8, "longestSide":F
    :goto_17
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 755
    .local v0, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    move-result-object v1

    .line 757
    .local v1, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->pendingRendRequestCancellation:Z

    if-nez v2, :cond_45

    .line 758
    if-eqz v1, :cond_43

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->resourceItem()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v2

    float-to-int v3, v8

    move-object v4, v7

    move v5, p3

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getRendition(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;ILjava/lang/String;ILcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v2

    :goto_37
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->renditionRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 765
    :goto_39
    return-void

    .line 677
    .end local v0    # "completionHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;
    .end local v1    # "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    .end local v7    # "contentType":Ljava/lang/String;
    .end local v8    # "longestSide":F
    :pswitch_3a
    const-string v7, "image/png"

    .line 678
    .restart local v7    # "contentType":Ljava/lang/String;
    goto :goto_d

    .line 680
    .end local v7    # "contentType":Ljava/lang/String;
    :pswitch_3d
    const-string v7, "image/pdf"

    .line 681
    .restart local v7    # "contentType":Ljava/lang/String;
    goto :goto_d

    .line 688
    :cond_40
    iget v8, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    goto :goto_17

    .line 758
    .restart local v0    # "completionHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;
    .restart local v1    # "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    .restart local v8    # "longestSide":F
    :cond_43
    const/4 v2, 0x0

    goto :goto_37

    .line 761
    :cond_45
    invoke-interface {p4}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCancellation()V

    .line 762
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->pendingRendRequestCancellation:Z

    goto :goto_39

    .line 674
    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_3a
        :pswitch_3d
    .end packed-switch
.end method

.method private getRenditionWithTypeForData(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 22
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "dimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p3, "page"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;",
            "I",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<[B",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 567
    .local p4, "dataDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    const-string v15, "com.adobe.cc.storage"

    .line 573
    .local v15, "cacheName":Ljava/lang/String;
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    .line 575
    .local v7, "ocObj":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;
    :try_start_9
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;->handler:Landroid/os/Handler;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_10} :catch_5a

    .line 580
    :goto_10
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    move-object/from16 v2, p0

    move-object/from16 v3, p4

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;)V

    .line 617
    .local v1, "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v8

    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;

    move-result-object v9

    invoke-direct/range {p0 .. p3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheKey(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;

    move-result-object v10

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    .line 618
    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v11

    const-string v12, "com.adobe.cc.storage"

    iget-object v14, v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;->handler:Landroid/os/Handler;

    move-object v13, v1

    .line 617
    invoke-virtual/range {v8 .. v14}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getDataFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z

    move-result v2

    if-nez v2, :cond_59

    .line 621
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "AdobeAssetFile:GetRenditionFromCache"

    const-string v4, "Rendition request for %s ended in error."

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    aput-object v8, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    const/4 v2, 0x0

    move-object/from16 v0, p4

    invoke-interface {v0, v2}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onError(Ljava/lang/Object;)V

    .line 624
    :cond_59
    return-void

    .line 576
    .end local v1    # "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    :catch_5a
    move-exception v16

    .line 578
    .local v16, "e":Ljava/lang/Exception;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_10
.end method

.method private getVideoMetadata(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 629
    .local p1, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lorg/json/JSONObject;>;"
    .local p2, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 662
    .local v0, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    move-result-object v1

    .line 663
    .local v1, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    if-nez v1, :cond_c

    .line 667
    :goto_b
    return-void

    .line 666
    :cond_c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->resourceItem()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getVideoMetadata(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    goto :goto_b
.end method


# virtual methods
.method public cancelDataRequest()V
    .registers 3

    .prologue
    .line 355
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    move-result-object v0

    .line 356
    .local v0, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    if-nez v0, :cond_7

    .line 360
    :goto_6
    return-void

    .line 359
    :cond_7
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->dataRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->cancelRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;)V

    goto :goto_6
.end method

.method public cancelRenditionRequest()V
    .registers 2

    .prologue
    .line 342
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->renditionRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    if-eqz v0, :cond_a

    .line 345
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->renditionRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->cancel()V

    .line 349
    :goto_9
    return-void

    .line 348
    :cond_a
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->pendingRendRequestCancellation:Z

    goto :goto_9
.end method

.method public downloadAssetFile(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 4
    .param p1, "path"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<",
            "Ljava/lang/Boolean;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 772
    .local p2, "delegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<Ljava/lang/Boolean;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->downloadAssetFileForPage(Ljava/net/URI;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 774
    return-void
.end method

.method public downloadAssetFileForPage(Ljava/net/URI;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 8
    .param p1, "path"    # Ljava/net/URI;
    .param p2, "page"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "I",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<",
            "Ljava/lang/Boolean;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 787
    .local p3, "dataDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<Ljava/lang/Boolean;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$10;

    invoke-direct {v0, p0, p3, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$10;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;I)V

    .line 828
    .local v0, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    move-result-object v1

    .line 829
    .local v1, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    if-nez v1, :cond_c

    .line 833
    :goto_b
    return-void

    .line 832
    :cond_c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->resourceItem()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v2

    invoke-virtual {p1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getFile(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->dataRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    goto :goto_b
.end method

.method public getCurrentVersion()I
    .registers 2

    .prologue
    .line 126
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->currentVersion:I

    return v0
.end method

.method public getFileSize()J
    .registers 3

    .prologue
    .line 116
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->fileSize:J

    return-wide v0
.end method

.method public getMd5Hash()Ljava/lang/String;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->md5Hash:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionalMetadata()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->optionalMetadata:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 20
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "dimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p3, "page"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;",
            "I",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<[B",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 443
    .local p4, "dataDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    const-string v8, "com.adobe.cc.storage"

    .line 445
    .local v8, "cacheName":Ljava/lang/String;
    move-object v13, p0

    .line 447
    .local v13, "that":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v1

    const-string v2, "ccv"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->isEntitledToService(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v12

    .line 449
    .local v12, "isEntitledToCCV":Z
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    const-string v2, "application/vnd.adobe.ccv.videometadata"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_25

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    const-string v2, "video/"

    .line 450
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_69

    :cond_25
    move-object v10, p0

    .line 452
    check-cast v10, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    .line 453
    .local v10, "fileInternal":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;
    if-eqz v12, :cond_78

    .line 455
    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;

    invoke-direct {v6, p0, v13, v10}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;)V

    .line 533
    .local v6, "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    const/4 v7, 0x0

    .line 536
    .local v7, "handler":Landroid/os/Handler;
    :try_start_30
    new-instance v11, Landroid/os/Handler;

    invoke-direct {v11}, Landroid/os/Handler;-><init>()V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_35} :catch_6d

    .end local v7    # "handler":Landroid/os/Handler;
    .local v11, "handler":Landroid/os/Handler;
    move-object v7, v11

    .line 543
    .end local v11    # "handler":Landroid/os/Handler;
    .restart local v7    # "handler":Landroid/os/Handler;
    :goto_36
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v1

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;

    move-result-object v2

    const-string v3, "video-data"

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    .line 544
    invoke-static {v4}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v4

    const-string v5, "com.adobe.cc.storage"

    .line 543
    invoke-virtual/range {v1 .. v7}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getDataFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z

    move-result v1

    if-nez v1, :cond_69

    .line 547
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "AdobeAssetFile:GetRenditionFromCache"

    const-string v3, "Rendition request for %s ended in error."

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v14, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    aput-object v14, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 548
    const/4 v1, 0x0

    move-object/from16 v0, p4

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onError(Ljava/lang/Object;)V

    .line 559
    .end local v6    # "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    .end local v7    # "handler":Landroid/os/Handler;
    .end local v10    # "fileInternal":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;
    :cond_69
    :goto_69
    invoke-direct/range {p0 .. p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithTypeForData(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 562
    return-void

    .line 538
    .restart local v6    # "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    .restart local v7    # "handler":Landroid/os/Handler;
    .restart local v10    # "fileInternal":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;
    :catch_6d
    move-exception v9

    .line 540
    .local v9, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "GetRendition"

    const-string v3, "failure:handler creation failed"

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_36

    .line 555
    .end local v6    # "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    .end local v7    # "handler":Landroid/os/Handler;
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_78
    const/4 v1, 0x0

    iput-object v1, v10, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    goto :goto_69
.end method

.method public getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 5
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "dimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<[B",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 428
    .local p3, "dataDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 430
    return-void
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->type:Ljava/lang/String;

    return-object v0
.end method

.method protected resourceItem()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .registers 3

    .prologue
    .line 987
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    if-nez v0, :cond_25

    .line 989
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    .line 990
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->name:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->name:Ljava/lang/String;

    .line 991
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->etag:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    .line 992
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->GUID:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->internalID:Ljava/lang/String;

    .line 993
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->md5Hash:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->setMd5(Ljava/lang/String;)V

    .line 995
    :cond_25
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->asrItem:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    return-object v0
.end method
