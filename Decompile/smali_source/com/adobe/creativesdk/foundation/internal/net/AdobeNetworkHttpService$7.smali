.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_analyseResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Ljava/lang/Runnable;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

.field final synthetic val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

.field final synthetic val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field final synthetic val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 583
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 585
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    if-eqz v4, :cond_30

    .line 586
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    .line 588
    .local v2, "statusCode":I
    const/16 v4, 0x190

    if-ge v2, v4, :cond_3e

    .line 590
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->hasFileError()Z

    move-result v4

    if-eqz v4, :cond_36

    .line 592
    sget-object v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorFileDoesNotExist:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    .line 593
    .local v0, "errorCode":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 594
    .local v3, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getKeyForResponse()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    new-instance v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    invoke-direct {v1, v0, v3}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;Ljava/util/HashMap;)V

    .line 596
    .local v1, "netError":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    invoke-interface {v4, v1}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 622
    .end local v0    # "errorCode":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    .end local v1    # "netError":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .end local v2    # "statusCode":I
    .end local v3    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_30
    :goto_30
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->markFinished()V

    .line 623
    return-void

    .line 599
    .restart local v2    # "statusCode":I
    :cond_36
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;->onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    goto :goto_30

    .line 604
    :cond_3e
    sget-object v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorBadRequest:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    .line 606
    .restart local v0    # "errorCode":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    const/16 v4, 0x191

    if-ne v2, v4, :cond_5f

    .line 608
    sget-object v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorAuthenticationFailed:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    .line 615
    :cond_46
    :goto_46
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 616
    .restart local v3    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getKeyForResponse()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 617
    new-instance v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    invoke-direct {v1, v0, v3}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;Ljava/util/HashMap;)V

    .line 618
    .restart local v1    # "netError":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    invoke-interface {v4, v1}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    goto :goto_30

    .line 610
    .end local v1    # "netError":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .end local v3    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_5f
    const/16 v4, 0x258

    if-ne v2, v4, :cond_66

    .line 611
    sget-object v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorOffline:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    goto :goto_46

    .line 612
    :cond_66
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getNetworkException()Ljava/lang/Exception;

    move-result-object v4

    if-eqz v4, :cond_78

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getNetworkException()Ljava/lang/Exception;

    move-result-object v4

    instance-of v4, v4, Ljava/net/SocketTimeoutException;

    if-nez v4, :cond_82

    :cond_78
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;->val$response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getNetworkException()Ljava/lang/Exception;

    move-result-object v4

    instance-of v4, v4, Ljava/net/ConnectException;

    if-eqz v4, :cond_46

    .line 613
    :cond_82
    sget-object v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorTimeout:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    goto :goto_46
.end method
