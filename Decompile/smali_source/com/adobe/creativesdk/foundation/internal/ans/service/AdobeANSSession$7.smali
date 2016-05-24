.class Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;
.super Ljava/lang/Object;
.source "AdobeANSSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

.field final synthetic val$httpMethod:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

.field final synthetic val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    .prologue
    .line 634
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;->val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;->val$httpMethod:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "err"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 662
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;->val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 663
    return-void
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 6
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    const/4 v3, 0x0

    .line 639
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    .line 640
    .local v1, "statusCode":I
    const/16 v2, 0xc8

    if-eq v1, v2, :cond_d

    const/16 v2, 0xc9

    if-ne v1, v2, :cond_2b

    .line 642
    :cond_d
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 643
    .local v0, "parsedData":Lorg/json/JSONObject;
    if-eqz v0, :cond_1d

    .line 645
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;->val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;->onSuccess(Lorg/json/JSONObject;)V

    .line 657
    .end local v0    # "parsedData":Lorg/json/JSONObject;
    :cond_1c
    :goto_1c
    return-void

    .line 647
    .restart local v0    # "parsedData":Lorg/json/JSONObject;
    :cond_1d
    if-nez v0, :cond_1c

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;->val$httpMethod:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodDELETE:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne v2, v3, :cond_1c

    .line 649
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;->val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;->onSuccess(Lorg/json/JSONObject;)V

    goto :goto_1c

    .line 654
    .end local v0    # "parsedData":Lorg/json/JSONObject;
    :cond_2b
    # invokes: Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->getErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    invoke-static {p1, v3, v3}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    goto :goto_1c
.end method
