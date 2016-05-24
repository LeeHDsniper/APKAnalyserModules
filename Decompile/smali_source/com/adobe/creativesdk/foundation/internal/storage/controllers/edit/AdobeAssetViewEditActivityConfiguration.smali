.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;
.super Ljava/lang/Object;
.source "AdobeAssetViewEditActivityConfiguration.java"


# static fields
.field public static ADOBE_CLOUD_KEY:Ljava/lang/String;


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _configuration:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    const-string v0, "ADOBE_CLOUD"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;)V
    .registers 4
    .param p1, "mode"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->_configuration:Ljava/util/HashMap;

    .line 25
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->_configuration:Ljava/util/HashMap;

    const-string v1, "EDIT_ACTIVITY_OPERATION_MODE"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    return-void
.end method

.method public static getConfigurationFromBundle(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;
    .registers 5
    .param p0, "configurationBundle"    # Landroid/os/Bundle;

    .prologue
    .line 41
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;

    const-string v2, "EDIT_ACTIVITY_OPERATION_MODE"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;)V

    .line 42
    .local v1, "configuration":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->getEditActivityOperationMode()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;->ADOBE_ASSET_VIEW_EDIT_ACTIVITY_OPERATION_MODE_MULTI_SELECT_EDIT:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;

    if-ne v2, v3, :cond_1e

    .line 44
    const-string v2, "MULTI_SELECT_EDIT_TARGET_HREF"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->setMultiSelectEditTargetHref(Ljava/lang/String;)V

    .line 46
    :cond_1e
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 47
    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    if-eqz v0, :cond_33

    .line 48
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getMatchingCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 50
    :cond_33
    return-object v1
.end method


# virtual methods
.method public getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-object v0
.end method

.method public getEditActivityOperationMode()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;
    .registers 3

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->_configuration:Ljava/util/HashMap;

    const-string v1, "EDIT_ACTIVITY_OPERATION_MODE"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityOperationMode;

    return-object v0
.end method

.method public getSourceHref()Ljava/lang/String;
    .registers 3

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->_configuration:Ljava/util/HashMap;

    const-string v1, "MULTI_SELECT_EDIT_TARGET_HREF"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 2
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 61
    return-void
.end method

.method public setMultiSelectEditTargetHref(Ljava/lang/String;)V
    .registers 4
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration;->_configuration:Ljava/util/HashMap;

    const-string v1, "MULTI_SELECT_EDIT_TARGET_HREF"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    return-void
.end method
