.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;
.super Ljava/lang/Object;
.source "AdobeStorageSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getQuotaInformationOnCompletion(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

.field final synthetic val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

.field final synthetic val$handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;Landroid/os/Handler;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .prologue
    .line 795
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 10
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 798
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    .line 799
    .local v2, "statusCode":I
    const/16 v5, 0xc8

    if-ne v2, v5, :cond_42

    .line 800
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 802
    .local v1, "parsedData":Lorg/json/JSONObject;
    if-eqz v1, :cond_49

    .line 803
    const-string v5, "storage_used"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    .line 804
    .local v4, "used":Ljava/lang/Number;
    const-string v5, "storage_available"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 805
    .local v0, "available":Ljava/lang/Number;
    const-string v5, "storage_quota"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    .line 807
    .local v3, "total":Ljava/lang/Number;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

    if-eqz v5, :cond_42

    .line 808
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$handler:Landroid/os/Handler;

    if-eqz v5, :cond_43

    .line 809
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$handler:Landroid/os/Handler;

    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;

    invoke-direct {v6, p0, v4, v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 832
    .end local v0    # "available":Ljava/lang/Number;
    .end local v1    # "parsedData":Lorg/json/JSONObject;
    .end local v3    # "total":Ljava/lang/Number;
    .end local v4    # "used":Ljava/lang/Number;
    :cond_42
    :goto_42
    return-void

    .line 816
    .restart local v0    # "available":Ljava/lang/Number;
    .restart local v1    # "parsedData":Lorg/json/JSONObject;
    .restart local v3    # "total":Ljava/lang/Number;
    .restart local v4    # "used":Ljava/lang/Number;
    :cond_43
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

    invoke-interface {v5, v4, v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;->onCompletion(Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    goto :goto_42

    .line 819
    .end local v0    # "available":Ljava/lang/Number;
    .end local v3    # "total":Ljava/lang/Number;
    .end local v4    # "used":Ljava/lang/Number;
    :cond_49
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

    if-eqz v5, :cond_42

    .line 820
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$handler:Landroid/os/Handler;

    if-eqz v5, :cond_5c

    .line 821
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$handler:Landroid/os/Handler;

    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$2;

    invoke-direct {v6, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;)V

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_42

    .line 828
    :cond_5c
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    sget-object v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-direct {v6, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;)V

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;->onError(Ljava/lang/Object;)V

    goto :goto_42
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 5
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 836
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getStorageError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 837
    .local v0, "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

    if-eqz v1, :cond_18

    .line 838
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$handler:Landroid/os/Handler;

    if-eqz v1, :cond_19

    .line 839
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$handler:Landroid/os/Handler;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$3;

    invoke-direct {v2, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 850
    :cond_18
    :goto_18
    return-void

    .line 846
    :cond_19
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;->onError(Ljava/lang/Object;)V

    goto :goto_18
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 855
    return-void
.end method
