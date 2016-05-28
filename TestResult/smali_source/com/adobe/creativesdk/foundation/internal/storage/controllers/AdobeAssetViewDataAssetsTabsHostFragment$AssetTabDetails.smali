.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;
.super Ljava/lang/Object;
.source "AdobeAssetViewDataAssetsTabsHostFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AssetTabDetails"
.end annotation


# instance fields
.field assetsTabName:Ljava/lang/String;

.field fragmentDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)V
    .registers 2

    .prologue
    .line 203
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$1;

    .prologue
    .line 203
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)V

    return-void
.end method
