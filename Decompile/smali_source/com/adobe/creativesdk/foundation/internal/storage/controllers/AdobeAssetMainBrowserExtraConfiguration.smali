.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;
.super Ljava/lang/Object;
.source "AdobeAssetMainBrowserExtraConfiguration.java"


# static fields
.field public static SHOULD_USE_DROP_DOWN_KEY:Ljava/lang/String;

.field public static START_WITH_COLLECTION_HREF_KEY:Ljava/lang/String;


# instance fields
.field private shouldUseDropDownActionBar:Z

.field private startWithCollectionHref:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    const-string v0, "START_WITH_COLLECTION_HREF_KEY"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->START_WITH_COLLECTION_HREF_KEY:Ljava/lang/String;

    .line 9
    const-string v0, "SHOULD_USE_DROP_DOWN"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->SHOULD_USE_DROP_DOWN_KEY:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "startWithCollectionHref"    # Ljava/lang/String;
    .param p2, "shouldUseDropDownActionBar"    # Z

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->shouldUseDropDownActionBar:Z

    .line 16
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->startWithCollectionHref:Ljava/lang/String;

    .line 17
    iput-boolean p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->shouldUseDropDownActionBar:Z

    .line 18
    return-void
.end method


# virtual methods
.method public startWithCollectionHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->startWithCollectionHref:Ljava/lang/String;

    return-object v0
.end method

.method public useDropDownActionBar()Z
    .registers 2

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->shouldUseDropDownActionBar:Z

    return v0
.end method
