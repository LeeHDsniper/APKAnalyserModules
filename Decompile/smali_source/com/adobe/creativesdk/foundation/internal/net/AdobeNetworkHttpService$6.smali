.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForUploadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

.field final synthetic val$callBackRequiredForHandler:Landroid/os/Handler;

.field final synthetic val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

.field final synthetic val$path:Ljava/lang/String;

.field final synthetic val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

.field final synthetic val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field final synthetic val$responseHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    .registers 8
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 466
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$path:Ljava/lang/String;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$responseHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iput-object p7, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$callBackRequiredForHandler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    .line 468
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 469
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getAccessToken()Ljava/lang/String;

    move-result-object v2

    .line 470
    .local v2, "accessToken":Ljava/lang/String;
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;-><init>()V

    .line 471
    .local v0, "netTask":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$path:Ljava/lang/String;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$responseHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->init(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V

    .line 472
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->access$100(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v6

    .line 473
    .local v6, "requestFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->setAccessTokenForRequest(Ljava/lang/String;)V

    .line 474
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->setFuture(Ljava/util/concurrent/Future;)V

    .line 479
    .end local v0    # "netTask":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;
    .end local v2    # "accessToken":Ljava/lang/String;
    .end local v6    # "requestFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;>;"
    :goto_32
    return-void

    .line 476
    :cond_33
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;->val$callBackRequiredForHandler:Landroid/os/Handler;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_sendDisconnectError(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    invoke-static {v1, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->access$200(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    goto :goto_32
.end method
