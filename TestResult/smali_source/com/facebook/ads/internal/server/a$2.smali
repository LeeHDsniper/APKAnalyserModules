.class Lcom/facebook/ads/internal/server/a$2;
.super Lcom/facebook/ads/internal/http/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/ads/internal/server/a;->b()Lcom/facebook/ads/internal/http/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/internal/server/a;


# direct methods
.method constructor <init>(Lcom/facebook/ads/internal/server/a;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    invoke-direct {p0}, Lcom/facebook/ads/internal/http/c;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 1

    return-void
.end method

.method public a(ILjava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    invoke-static {v0}, Lcom/facebook/ads/internal/server/a;->d(Lcom/facebook/ads/internal/server/a;)Lcom/facebook/ads/internal/dto/e;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/d;->b(Lcom/facebook/ads/internal/dto/e;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/server/a;Lcom/facebook/ads/internal/http/a;)Lcom/facebook/ads/internal/http/a;

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    invoke-static {v0, p2}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/server/a;Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/lang/Throwable;Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    invoke-static {v0}, Lcom/facebook/ads/internal/server/a;->d(Lcom/facebook/ads/internal/server/a;)Lcom/facebook/ads/internal/dto/e;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/d;->b(Lcom/facebook/ads/internal/dto/e;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/server/a;Lcom/facebook/ads/internal/http/a;)Lcom/facebook/ads/internal/http/a;

    :try_start_f
    iget-object v0, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    invoke-static {v0}, Lcom/facebook/ads/internal/server/a;->e(Lcom/facebook/ads/internal/server/a;)Lcom/facebook/ads/internal/server/b;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/facebook/ads/internal/server/b;->a(Ljava/lang/String;)Lcom/facebook/ads/internal/server/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/server/c;->a()Lcom/facebook/ads/internal/server/c$a;

    move-result-object v1

    sget-object v2, Lcom/facebook/ads/internal/server/c$a;->b:Lcom/facebook/ads/internal/server/c$a;

    if-ne v1, v2, :cond_38

    check-cast v0, Lcom/facebook/ads/internal/server/e;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/server/e;->c()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    sget-object v2, Lcom/facebook/ads/internal/AdErrorType;->ERROR_MESSAGE:Lcom/facebook/ads/internal/AdErrorType;

    if-nez v0, :cond_35

    :goto_2d
    invoke-virtual {v2, p2}, Lcom/facebook/ads/internal/AdErrorType;->getAdErrorWrapper(Ljava/lang/String;)Lcom/facebook/ads/internal/b;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/server/a;Lcom/facebook/ads/internal/b;)V
    :try_end_34
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_34} :catch_37

    :goto_34
    return-void

    :cond_35
    move-object p2, v0

    goto :goto_2d

    :catch_37
    move-exception v0

    :cond_38
    iget-object v0, p0, Lcom/facebook/ads/internal/server/a$2;->a:Lcom/facebook/ads/internal/server/a;

    new-instance v1, Lcom/facebook/ads/internal/b;

    sget-object v2, Lcom/facebook/ads/internal/AdErrorType;->NETWORK_ERROR:Lcom/facebook/ads/internal/AdErrorType;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/facebook/ads/internal/b;-><init>(Lcom/facebook/ads/internal/AdErrorType;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/server/a;Lcom/facebook/ads/internal/b;)V

    goto :goto_34
.end method
