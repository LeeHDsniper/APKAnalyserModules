.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;
.super Ljava/lang/Object;
.source "AdobeAssetMainBrowserConfiguration.java"


# static fields
.field public static ADOBE_CLOUD_KEY:Ljava/lang/String;

.field public static DATA_SOURCE_FILTER_ARRAY_KEY:Ljava/lang/String;

.field public static DATA_SOURCE_FILTER_TYPE_KEY:Ljava/lang/String;

.field public static DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY:Ljava/lang/String;

.field public static DESIGNLIBRARYITEMS_FILTER_TYPE_KEY:Ljava/lang/String;

.field public static MIME_TYPE_FILTER_ARRAY_KEY:Ljava/lang/String;

.field public static MIME_TYPE_FILTER_TYPE_KEY:Ljava/lang/String;


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private dataSourcesFilter:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation
.end field

.field private isDataSourceFilterInclusive:Z

.field private isMimeTypeFilterInclusive:Z

.field private mimeTypesFilter:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const-string v0, "MIME_TYPES_FILTER_ARRAY"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->MIME_TYPE_FILTER_ARRAY_KEY:Ljava/lang/String;

    .line 30
    const-string v0, "MIME_TYPES_FILTER_TYPE"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->MIME_TYPE_FILTER_TYPE_KEY:Ljava/lang/String;

    .line 31
    const-string v0, "DATA_SOURCE_FILTER_ARRAY"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_ARRAY_KEY:Ljava/lang/String;

    .line 32
    const-string v0, "DATA_SOURCE_FILTER_TYPE"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_TYPE_KEY:Ljava/lang/String;

    .line 33
    const-string v0, "ADOBE_CLOUD"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    .line 35
    const-string v0, "DESIGNLIBRARYITEMS_FILTER_ARRAY"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY:Ljava/lang/String;

    .line 36
    const-string v0, "DESIGNLIBRARYITEMS_FILTER_TYPE"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DESIGNLIBRARYITEMS_FILTER_TYPE_KEY:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/util/EnumSet;ZLjava/util/EnumSet;ZLcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 7
    .param p2, "dsi"    # Z
    .param p4, "mti"    # Z
    .param p5, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;Z",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;Z",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ")V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "ds":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    .local p3, "mtf":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->dataSourcesFilter:Ljava/util/EnumSet;

    .line 49
    iput-boolean p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->isDataSourceFilterInclusive:Z

    .line 50
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->mimeTypesFilter:Ljava/util/EnumSet;

    .line 51
    iput-boolean p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->isMimeTypeFilterInclusive:Z

    .line 52
    if-eqz p5, :cond_17

    .line 53
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v0

    invoke-virtual {v0, p5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getMatchingCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 55
    :cond_17
    return-void
.end method


# virtual methods
.method getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-object v0
.end method

.method public getDataSourcesFilter()Ljava/util/EnumSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->dataSourcesFilter:Ljava/util/EnumSet;

    return-object v0
.end method
