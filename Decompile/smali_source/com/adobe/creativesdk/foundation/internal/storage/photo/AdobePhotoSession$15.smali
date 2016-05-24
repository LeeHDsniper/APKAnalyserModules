.class Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;
.super Ljava/lang/Object;
.source "AdobePhotoSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->listCatalogsOfType(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

.field final synthetic val$catalogs:Ljava/util/ArrayList;

.field final synthetic val$cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

.field final synthetic val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

.field final synthetic val$self:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

.field final synthetic val$type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 8
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    .prologue
    .line 864
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$catalogs:Ljava/util/ArrayList;

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$self:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iput-object p7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 16
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 867
    const/4 v3, 0x0

    .line 868
    .local v3, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v9

    .line 869
    .local v9, "statusCode":I
    const/16 v10, 0xc8

    if-ne v9, v10, :cond_a2

    .line 870
    const/4 v8, 0x0

    .line 872
    .local v8, "obj":Lorg/json/JSONObject;
    :try_start_a
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_11
    .catch Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException; {:try_start_a .. :try_end_11} :catch_41

    move-result-object v8

    .line 877
    :goto_12
    if-eqz v8, :cond_98

    .line 880
    :try_start_14
    const-string v10, "catalogs"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 883
    .local v0, "array":Lorg/json/JSONArray;
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-nez v10, :cond_44

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    sget-object v11, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;->AdobePhotoCatalogTypeLightroom:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    if-ne v10, v11, :cond_44

    .line 885
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    const-string v10, "lightroom"

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    sget-object v13, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;->AdobePhotoCatalogTypeLightroom:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    invoke-direct {v7, v10, v11, v12, v13}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;)V

    .line 886
    .local v7, "lightRoomCatalog":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$catalogs:Ljava/util/ArrayList;

    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_37
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_37} :catch_8b

    .line 922
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v7    # "lightRoomCatalog":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .end local v8    # "obj":Lorg/json/JSONObject;
    :cond_37
    :goto_37
    if-nez v3, :cond_a9

    .line 923
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$catalogs:Ljava/util/ArrayList;

    invoke-interface {v10, v11}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 926
    :goto_40
    return-void

    .line 873
    .restart local v8    # "obj":Lorg/json/JSONObject;
    :catch_41
    move-exception v2

    .line 874
    .local v2, "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    move-object v3, v2

    goto :goto_12

    .line 890
    .end local v2    # "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    .restart local v0    # "array":Lorg/json/JSONArray;
    :cond_44
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_45
    :try_start_45
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v4, v10, :cond_37

    .line 892
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 893
    .local v6, "jsonObj":Lorg/json/JSONObject;
    if-eqz v6, :cond_7b

    instance-of v10, v6, Lorg/json/JSONObject;

    if-eqz v10, :cond_7b

    .line 895
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    const/4 v10, 0x0

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-direct {v1, v10, v11, v12}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 897
    .local v1, "catalog":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$self:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getBaseURL()Ljava/net/URL;

    move-result-object v10

    invoke-virtual {v10}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->setHref(Ljava/lang/String;)V
    :try_end_6f
    .catch Lorg/json/JSONException; {:try_start_45 .. :try_end_6f} :catch_8b

    .line 898
    const/4 v5, 0x0

    .line 901
    .local v5, "isUpdated":Z
    :try_start_70
    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->updateFromDictionary(Lorg/json/JSONObject;)Z
    :try_end_73
    .catch Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException; {:try_start_70 .. :try_end_73} :catch_7e
    .catch Lorg/json/JSONException; {:try_start_70 .. :try_end_73} :catch_8b

    move-result v5

    .line 905
    :goto_74
    if-eqz v5, :cond_7b

    .line 907
    :try_start_76
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$catalogs:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 890
    .end local v1    # "catalog":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .end local v5    # "isUpdated":Z
    :cond_7b
    add-int/lit8 v4, v4, 0x1

    goto :goto_45

    .line 902
    .restart local v1    # "catalog":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .restart local v5    # "isUpdated":Z
    :catch_7e
    move-exception v2

    .line 903
    .restart local v2    # "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v11, "AdobePhotoSession.listCatalogsOfType"

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8a
    .catch Lorg/json/JSONException; {:try_start_76 .. :try_end_8a} :catch_8b

    goto :goto_74

    .line 912
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v1    # "catalog":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .end local v2    # "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    .end local v4    # "i":I
    .end local v5    # "isUpdated":Z
    .end local v6    # "jsonObj":Lorg/json/JSONObject;
    :catch_8b
    move-exception v2

    .line 913
    .local v2, "e":Lorg/json/JSONException;
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v11, "AdobePhotoSession.listCatalogsOfType"

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_37

    .line 916
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_98
    if-nez v8, :cond_37

    .line 917
    new-instance v3, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v3    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v10, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_MISSING_JSON_DATA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-direct {v3, v10}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;)V

    .restart local v3    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    goto :goto_37

    .line 920
    .end local v8    # "obj":Lorg/json/JSONObject;
    :cond_a2
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v10, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v3

    goto :goto_37

    .line 925
    :cond_a9
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v10, v3}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    goto :goto_40
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    const/4 v4, 0x0

    .line 930
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 931
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 932
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    if-eqz v1, :cond_16

    .line 933
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    .line 941
    :goto_10
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 942
    return-void

    .line 935
    :cond_16
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v2, v3, :cond_2a

    .line 936
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    goto :goto_10

    .line 938
    :cond_2a
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    goto :goto_10
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 947
    return-void
.end method
