.class Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;
.super Ljava/lang/Object;
.source "AdobeEntitlementSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getUserProfileForToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

.field final synthetic val$accessToken:Ljava/lang/String;

.field final synthetic val$cachedUserProfile:Lorg/json/JSONObject;

.field final synthetic val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

.field final synthetic val$finalUseFallbackDataOnFailure:Z

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;ZLcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Lorg/json/JSONObject;)V
    .registers 8
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    .prologue
    .line 472
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$accessToken:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$handler:Landroid/os/Handler;

    iput-boolean p5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$finalUseFallbackDataOnFailure:Z

    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    iput-object p7, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$cachedUserProfile:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 8
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 539
    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$finalUseFallbackDataOnFailure:Z

    if-eqz v1, :cond_14

    .line 541
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;->fallbackServicesData()Lorg/json/JSONObject;

    move-result-object v0

    .line 542
    .local v0, "fallbackData":Lorg/json/JSONObject;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$accessToken:Ljava/lang/String;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$handler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResponseToSuccessBlock(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;)V

    .line 550
    .end local v0    # "fallbackData":Lorg/json/JSONObject;
    :goto_13
    return-void

    .line 543
    :cond_14
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getStatusCode()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x194

    if-eq v1, v2, :cond_38

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getStatusCode()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x258

    if-eq v1, v2, :cond_38

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getStatusCode()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x190

    if-ne v1, v2, :cond_4a

    :cond_38
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$cachedUserProfile:Lorg/json/JSONObject;

    if-eqz v1, :cond_4a

    .line 545
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$cachedUserProfile:Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$accessToken:Ljava/lang/String;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$handler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResponseToSuccessBlock(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;)V

    goto :goto_13

    .line 548
    :cond_4a
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$handler:Landroid/os/Handler;

    invoke-virtual {v1, p1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResposeToErrorBlock(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V

    goto :goto_13
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 14
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    const/4 v1, 0x0

    .line 485
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v11

    .line 486
    .local v11, "statusCode":I
    const/4 v8, 0x0

    .line 488
    .local v8, "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    const/16 v0, 0xc8

    if-ne v11, v0, :cond_68

    .line 490
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v6

    .line 491
    .local v6, "body":Ljava/lang/String;
    const/4 v10, 0x0

    .line 493
    .local v10, "parsedData":Lorg/json/JSONObject;
    :try_start_f
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 495
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    :try_end_1a
    .catch Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException; {:try_start_f .. :try_end_1a} :catch_69

    .line 501
    :goto_1a
    if-nez v8, :cond_6f

    .line 505
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v2

    .line 506
    .local v2, "guid":Ljava/lang/String;
    if-eqz v2, :cond_5d

    .line 508
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "AdobeEntitlementSession"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "The userprofile fetched from entitlements service being cached = "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v10, :cond_6c

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3b
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v4

    .line 510
    .local v4, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "profile"

    const-string v5, "com.adobe.cc.entitlements"

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->addObject(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z

    .line 512
    .end local v4    # "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    :cond_5d
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$accessToken:Ljava/lang/String;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$handler:Landroid/os/Handler;

    invoke-virtual {v0, v10, v1, v3, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResponseToSuccessBlock(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;)V

    .line 525
    .end local v2    # "guid":Ljava/lang/String;
    .end local v6    # "body":Ljava/lang/String;
    .end local v10    # "parsedData":Lorg/json/JSONObject;
    :cond_68
    :goto_68
    return-void

    .line 497
    .restart local v6    # "body":Ljava/lang/String;
    .restart local v10    # "parsedData":Lorg/json/JSONObject;
    :catch_69
    move-exception v7

    .line 498
    .local v7, "e":Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;
    move-object v8, v7

    goto :goto_1a

    .line 508
    .end local v7    # "e":Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;
    .restart local v2    # "guid":Ljava/lang/String;
    :cond_6c
    const-string v0, ""

    goto :goto_3b

    .line 514
    .end local v2    # "guid":Ljava/lang/String;
    :cond_6f
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$finalUseFallbackDataOnFailure:Z

    if-eqz v0, :cond_83

    .line 516
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;->fallbackServicesData()Lorg/json/JSONObject;

    move-result-object v9

    .line 517
    .local v9, "fallbackData":Lorg/json/JSONObject;
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$accessToken:Ljava/lang/String;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$successBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$handler:Landroid/os/Handler;

    invoke-virtual {v0, v9, v1, v3, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResponseToSuccessBlock(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;)V

    goto :goto_68

    .line 521
    .end local v9    # "fallbackData":Lorg/json/JSONObject;
    :cond_83
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    invoke-virtual {v0, p1, v1, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->errorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    move-result-object v8

    .line 522
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;->val$handler:Landroid/os/Handler;

    invoke-virtual {v0, v8, v1, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResposeToErrorBlock(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V

    goto :goto_68
.end method
