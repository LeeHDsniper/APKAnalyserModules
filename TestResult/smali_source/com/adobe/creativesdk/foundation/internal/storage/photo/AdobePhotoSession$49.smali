.class Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;
.super Ljava/lang/Object;
.source "AdobePhotoSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->listAssetsInCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;ILcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

.field final synthetic val$collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;

.field final synthetic val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

.field final synthetic val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    .prologue
    .line 2733
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$completionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 18
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 2736
    const/4 v6, 0x0

    .line 2737
    .local v6, "exception":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v12

    .line 2738
    .local v12, "statusCode":I
    const/4 v11, 0x0

    .line 2739
    .local v11, "previousPage":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    const/4 v9, 0x0

    .line 2740
    .local v9, "nextPage":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 2741
    .local v4, "assets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    const/16 v13, 0xc8

    if-ne v12, v13, :cond_ef

    .line 2743
    const/4 v10, 0x0

    .line 2745
    .local v10, "parsedData":Lorg/json/JSONObject;
    :try_start_11
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_18
    .catch Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException; {:try_start_11 .. :try_end_18} :catch_df

    move-result-object v10

    .line 2750
    :goto_19
    if-eqz v10, :cond_e5

    .line 2753
    :try_start_1b
    const-string v13, "links"

    invoke-virtual {v10, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_8f

    .line 2754
    const-string v13, "links"

    invoke-virtual {v10, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 2755
    .local v8, "links":Lorg/json/JSONObject;
    if-eqz v8, :cond_8f

    .line 2756
    const-string v13, "prev"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_5d

    const-string v13, "prev"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    if-eqz v13, :cond_5d

    const-string v13, "prev"

    .line 2757
    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "href"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_5d

    .line 2758
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    const-string v14, "prev"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "href"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->parseNavigationLink(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    invoke-static {v13, v14}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    move-result-object v11

    .line 2761
    :cond_5d
    const-string v13, "next"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_8f

    const-string v13, "next"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    if-eqz v13, :cond_8f

    const-string v13, "next"

    .line 2762
    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "href"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_8f

    .line 2763
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    const-string v14, "next"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "href"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->parseNavigationLink(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    invoke-static {v13, v14}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    move-result-object v9

    .line 2768
    .end local v8    # "links":Lorg/json/JSONObject;
    :cond_8f
    const-string v13, "assets"

    invoke-virtual {v10, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_e5

    .line 2769
    const-string v13, "assets"

    invoke-virtual {v10, v13}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 2770
    .local v2, "assetArray":Lorg/json/JSONArray;
    if-eqz v2, :cond_e5

    .line 2771
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_a0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v7, v13, :cond_e5

    .line 2772
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 2773
    .local v3, "assetItem":Lorg/json/JSONObject;
    if-eqz v3, :cond_dc

    .line 2774
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;-><init>()V

    .line 2775
    .local v1, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v13

    invoke-virtual {v1, v13}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 2776
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getBaseURL()Ljava/net/URL;

    move-result-object v13

    invoke-virtual {v13}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->setBaseHref(Ljava/lang/String;)V

    .line 2777
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getCatalog()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    move-result-object v13

    invoke-virtual {v1, v3, v13}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->updateFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Z

    move-result v13

    if-eqz v13, :cond_dc

    .line 2778
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_dc
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_dc} :catch_102
    .catch Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException; {:try_start_1b .. :try_end_dc} :catch_e3

    .line 2771
    .end local v1    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    :cond_dc
    add-int/lit8 v7, v7, 0x1

    goto :goto_a0

    .line 2746
    .end local v2    # "assetArray":Lorg/json/JSONArray;
    .end local v3    # "assetItem":Lorg/json/JSONObject;
    .end local v7    # "i":I
    :catch_df
    move-exception v5

    .line 2747
    .local v5, "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    move-object v6, v5

    goto/16 :goto_19

    .line 2785
    .end local v5    # "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    :catch_e3
    move-exception v5

    .line 2786
    .local v5, "e":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    move-object v6, v5

    .line 2795
    .end local v5    # "e":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    .end local v10    # "parsedData":Lorg/json/JSONObject;
    :cond_e5
    :goto_e5
    if-nez v6, :cond_fa

    .line 2796
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$completionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;

    invoke-interface {v13, v4, v11, v9}, Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;->onCompletion(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)V

    .line 2799
    :goto_ee
    return-void

    .line 2793
    :cond_ef
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-object/from16 v0, p1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v13, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v6

    goto :goto_e5

    .line 2798
    :cond_fa
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v13, v6}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    goto :goto_ee

    .line 2783
    .restart local v10    # "parsedData":Lorg/json/JSONObject;
    :catch_102
    move-exception v13

    goto :goto_e5
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    const/4 v4, 0x0

    .line 2803
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 2804
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 2805
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    if-eqz v1, :cond_16

    .line 2806
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    .line 2814
    :goto_10
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 2815
    return-void

    .line 2808
    :cond_16
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v2, v3, :cond_2a

    .line 2809
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    goto :goto_10

    .line 2811
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
    .line 2820
    return-void
.end method
