.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

.field final synthetic val$callBackRequiredForHandler:Landroid/os/Handler;

.field final synthetic val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

.field final synthetic val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

.field final synthetic val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field final synthetic val$responseHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$responseHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$callBackRequiredForHandler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 320
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 321
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;-><init>()V

    .line 322
    .local v1, "netTask":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 323
    .local v0, "accessToken":Ljava/lang/String;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$responseHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v1, v3, v0, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;->init(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V

    .line 324
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->access$100(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 325
    .local v2, "requestFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;>;"
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v3, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->setFuture(Ljava/util/concurrent/Future;)V

    .line 326
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->setAccessTokenForRequest(Ljava/lang/String;)V

    .line 330
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v1    # "netTask":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;
    .end local v2    # "requestFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;>;"
    :goto_30
    return-void

    .line 328
    :cond_31
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;->val$callBackRequiredForHandler:Landroid/os/Handler;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_sendDisconnectError(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->access$200(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    goto :goto_30
.end method
