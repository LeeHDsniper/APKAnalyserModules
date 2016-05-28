.class Lcom/squareup/okhttp/Cache$1;
.super Ljava/lang/Object;
.source "Cache.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/InternalCache;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/Cache;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/Cache;)V
    .registers 2

    .prologue
    .line 110
    iput-object p1, p0, Lcom/squareup/okhttp/Cache$1;->this$0:Lcom/squareup/okhttp/Cache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;
    .registers 3
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$1;->this$0:Lcom/squareup/okhttp/Cache;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/Cache;->get(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/CacheRequest;
    .registers 3
    .param p1, "response"    # Lcom/squareup/okhttp/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$1;->this$0:Lcom/squareup/okhttp/Cache;

    # invokes: Lcom/squareup/okhttp/Cache;->put(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/CacheRequest;
    invoke-static {v0, p1}, Lcom/squareup/okhttp/Cache;->access$000(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/CacheRequest;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lcom/squareup/okhttp/Request;)V
    .registers 3
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$1;->this$0:Lcom/squareup/okhttp/Cache;

    # invokes: Lcom/squareup/okhttp/Cache;->remove(Lcom/squareup/okhttp/Request;)V
    invoke-static {v0, p1}, Lcom/squareup/okhttp/Cache;->access$100(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/Request;)V

    .line 119
    return-void
.end method

.method public trackConditionalCacheHit()V
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$1;->this$0:Lcom/squareup/okhttp/Cache;

    # invokes: Lcom/squareup/okhttp/Cache;->trackConditionalCacheHit()V
    invoke-static {v0}, Lcom/squareup/okhttp/Cache;->access$300(Lcom/squareup/okhttp/Cache;)V

    .line 125
    return-void
.end method

.method public trackResponse(Lcom/squareup/okhttp/internal/http/CacheStrategy;)V
    .registers 3
    .param p1, "cacheStrategy"    # Lcom/squareup/okhttp/internal/http/CacheStrategy;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$1;->this$0:Lcom/squareup/okhttp/Cache;

    # invokes: Lcom/squareup/okhttp/Cache;->trackResponse(Lcom/squareup/okhttp/internal/http/CacheStrategy;)V
    invoke-static {v0, p1}, Lcom/squareup/okhttp/Cache;->access$400(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/internal/http/CacheStrategy;)V

    .line 128
    return-void
.end method

.method public update(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)V
    .registers 4
    .param p1, "cached"    # Lcom/squareup/okhttp/Response;
    .param p2, "network"    # Lcom/squareup/okhttp/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$1;->this$0:Lcom/squareup/okhttp/Cache;

    # invokes: Lcom/squareup/okhttp/Cache;->update(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)V
    invoke-static {v0, p1, p2}, Lcom/squareup/okhttp/Cache;->access$200(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)V

    .line 122
    return-void
.end method
