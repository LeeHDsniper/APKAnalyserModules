.class Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;
.super Ljava/lang/Object;
.source "AdobePhotoSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->listCollectionsInCatalog(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;Ljava/lang/String;ILcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

.field final synthetic val$catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

.field final synthetic val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

.field final synthetic val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    .prologue
    .line 1066
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 15
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 1069
    const/4 v4, 0x0

    .line 1070
    .local v4, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1071
    .local v2, "collections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;>;"
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v9

    .line 1072
    .local v9, "statusCode":I
    const/16 v10, 0xc8

    if-ne v9, v10, :cond_73

    .line 1074
    const/4 v8, 0x0

    .line 1076
    .local v8, "obj":Lorg/json/JSONObject;
    :try_start_f
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_16
    .catch Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException; {:try_start_f .. :try_end_16} :catch_5a

    move-result-object v8

    .line 1081
    :goto_17
    if-eqz v8, :cond_6b

    .line 1083
    :try_start_19
    const-string v10, "albums"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 1085
    .local v1, "collectionArray":Lorg/json/JSONArray;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_20
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v5, v10, :cond_6b

    .line 1086
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 1087
    .local v7, "jsonObj":Lorg/json/JSONObject;
    if-eqz v7, :cond_57

    instance-of v10, v7, Lorg/json/JSONObject;

    if-eqz v10, :cond_57

    .line 1088
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;-><init>()V

    .line 1089
    .local v0, "collection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v10

    invoke-virtual {v0, v10}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 1090
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getBaseURL()Ljava/net/URL;

    move-result-object v10

    invoke-virtual {v10}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->setBaseHref(Ljava/lang/String;)V
    :try_end_4b
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_4b} :catch_6a

    .line 1091
    const/4 v6, 0x0

    .line 1093
    .local v6, "isUpdated":Z
    :try_start_4c
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-virtual {v0, v7, v10}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->updateFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Z
    :try_end_51
    .catch Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException; {:try_start_4c .. :try_end_51} :catch_5d
    .catch Lorg/json/JSONException; {:try_start_4c .. :try_end_51} :catch_6a

    move-result v6

    .line 1097
    :goto_52
    if-eqz v6, :cond_57

    .line 1098
    :try_start_54
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1085
    .end local v0    # "collection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    .end local v6    # "isUpdated":Z
    :cond_57
    add-int/lit8 v5, v5, 0x1

    goto :goto_20

    .line 1077
    .end local v1    # "collectionArray":Lorg/json/JSONArray;
    .end local v5    # "i":I
    .end local v7    # "jsonObj":Lorg/json/JSONObject;
    :catch_5a
    move-exception v3

    .line 1078
    .local v3, "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    move-object v4, v3

    goto :goto_17

    .line 1094
    .end local v3    # "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    .restart local v0    # "collection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    .restart local v1    # "collectionArray":Lorg/json/JSONArray;
    .restart local v5    # "i":I
    .restart local v6    # "isUpdated":Z
    .restart local v7    # "jsonObj":Lorg/json/JSONObject;
    :catch_5d
    move-exception v3

    .line 1095
    .restart local v3    # "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v11, "AdobePhotoSession.listCollectionsInCatalog"

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_69
    .catch Lorg/json/JSONException; {:try_start_54 .. :try_end_69} :catch_6a

    goto :goto_52

    .line 1103
    .end local v0    # "collection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    .end local v1    # "collectionArray":Lorg/json/JSONArray;
    .end local v3    # "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    .end local v5    # "i":I
    .end local v6    # "isUpdated":Z
    .end local v7    # "jsonObj":Lorg/json/JSONObject;
    :catch_6a
    move-exception v10

    .line 1115
    .end local v8    # "obj":Lorg/json/JSONObject;
    :cond_6b
    :goto_6b
    if-nez v4, :cond_90

    .line 1116
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v10, v2}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 1119
    :goto_72
    return-void

    .line 1108
    :cond_73
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getType()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    move-result-object v10

    sget-object v11, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;->AdobePhotoCatalogTypeLightroom:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    if-ne v10, v11, :cond_89

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->isInSync()Z

    move-result v10

    if-nez v10, :cond_89

    const/16 v10, 0x194

    if-eq v9, v10, :cond_6b

    .line 1113
    :cond_89
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v10, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v4

    goto :goto_6b

    .line 1118
    :cond_90
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v10, v4}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    goto :goto_72
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    const/4 v4, 0x0

    .line 1123
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 1124
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 1125
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    if-eqz v1, :cond_16

    .line 1126
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    .line 1134
    :goto_10
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 1135
    return-void

    .line 1128
    :cond_16
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v2, v3, :cond_2a

    .line 1129
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    goto :goto_10

    .line 1131
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
    .line 1140
    return-void
.end method
