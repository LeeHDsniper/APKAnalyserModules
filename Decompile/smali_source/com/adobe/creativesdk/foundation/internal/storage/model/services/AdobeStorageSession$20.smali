.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;
.super Ljava/lang/Object;
.source "AdobeStorageSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getFile(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;Landroid/os/Handler;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

.field final synthetic val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;

.field final synthetic val$path:Ljava/lang/String;

.field final synthetic val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .prologue
    .line 2117
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$path:Ljava/lang/String;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 9
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    const/16 v6, 0x130

    const/4 v5, 0x0

    .line 2121
    const/4 v0, 0x0

    .line 2122
    .local v0, "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    .line 2123
    .local v2, "status":I
    const/16 v3, 0xc8

    if-eq v2, v3, :cond_e

    if-ne v2, v6, :cond_ba

    .line 2124
    :cond_e
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getPath()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_23

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$path:Ljava/lang/String;

    if-nez v3, :cond_23

    .line 2125
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->setData([B)V

    .line 2126
    :cond_23
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v1

    .line 2127
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v1, :cond_a3

    .line 2128
    const-string v3, "etag"

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    .line 2129
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    const-string v3, "etag"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    .line 2130
    :cond_43
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getVersion()Ljava/lang/Number;

    move-result-object v3

    if-nez v3, :cond_6e

    const-string v3, "x-latest-version"

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6e

    .line 2131
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    const-string v3, "x-latest-version"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->setVersion(Ljava/lang/Number;)V

    .line 2132
    :cond_6e
    const-string v3, "content-md5"

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_89

    .line 2133
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    const-string v3, "content-md5"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->setMd5(Ljava/lang/String;)V

    .line 2134
    :cond_89
    const-string v3, "x-resource-id"

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a3

    .line 2135
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    const-string v3, "x-resource-id"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->internalID:Ljava/lang/String;

    .line 2138
    :cond_a3
    if-eq v2, v6, :cond_b2

    .line 2139
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getBytesReceived()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->setLength(Ljava/lang/Number;)V

    .line 2141
    :cond_b2
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;->onComplete(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;)V

    .line 2150
    .end local v1    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :goto_b9
    return-void

    .line 2145
    :cond_ba
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getAssetErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 2146
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;

    invoke-interface {v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;->onError(Ljava/lang/Object;)V

    goto :goto_b9
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 2159
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getStorageError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 2160
    .local v0, "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;->onError(Ljava/lang/Object;)V

    .line 2161
    return-void
.end method

.method public onProgress(D)V
    .registers 4
    .param p1, "progress"    # D

    .prologue
    .line 2154
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;

    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;->onProgress(D)V

    .line 2155
    return-void
.end method
