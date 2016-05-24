.class Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;
.super Ljava/lang/Object;
.source "AdobeCloudManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->refreshClouds(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

.field final synthetic val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

.field final synthetic val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    .prologue
    .line 456
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;->val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 456
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;->onCompletion(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onCompletion(Lorg/json/JSONObject;)V
    .registers 11
    .param p1, "requestResult"    # Lorg/json/JSONObject;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 459
    const/4 v4, 0x1

    .line 460
    .local v4, "hasAccessToPublicStorage":Z
    const/4 v5, 0x1

    .line 461
    .local v5, "profileUnChanged":Z
    const-string v6, "public_cloud"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_12

    .line 463
    const-string v6, "public_cloud"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    .line 466
    :cond_12
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPublicStorageServices()Z

    move-result v6

    if-ne v4, v6, :cond_78

    move v6, v7

    :goto_1d
    and-int/2addr v5, v6

    .line 468
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPublicStorageServices(Z)V

    .line 470
    const/4 v3, 0x1

    .line 471
    .local v3, "hasAccessToPrivateStorage":Z
    const-string v6, "private_cloud"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_34

    .line 473
    const-string v6, "private_cloud"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 476
    :cond_34
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPrivateStorageServices()Z

    move-result v6

    if-ne v3, v6, :cond_7a

    :goto_3e
    and-int/2addr v5, v7

    .line 477
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPrivateStorageServices(Z)V

    .line 479
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 483
    .local v0, "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    :try_start_4b
    invoke-static {p1, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;->getCloudsFromUserProfile(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z

    .line 484
    # getter for: Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->access$000()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v6

    # getter for: Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->access$100(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;->areValuesEqual(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v2

    .line 485
    .local v2, "endPointsUnChanged":Z
    and-int/2addr v5, v2

    .line 487
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_68

    if-nez v2, :cond_68

    .line 488
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v6, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->updateClouds(Ljava/util/ArrayList;)V
    :try_end_68
    .catch Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException; {:try_start_4b .. :try_end_68} :catch_7c

    .line 494
    .end local v2    # "endPointsUnChanged":Z
    :cond_68
    :goto_68
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;->val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    if-eqz v6, :cond_77

    .line 495
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;->val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    # getter for: Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->access$100(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 497
    :cond_77
    return-void

    .end local v0    # "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    .end local v3    # "hasAccessToPrivateStorage":Z
    :cond_78
    move v6, v8

    .line 466
    goto :goto_1d

    .restart local v3    # "hasAccessToPrivateStorage":Z
    :cond_7a
    move v7, v8

    .line 476
    goto :goto_3e

    .line 490
    .restart local v0    # "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    :catch_7c
    move-exception v1

    .line 491
    .local v1, "e":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v7, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v6, v7, v8, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    goto :goto_68
.end method
