.class Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;
.super Ljava/lang/Object;
.source "BasicHttpClientConnectionManager.java"

# interfaces
.implements Lorg/apache/http/conn/ConnectionRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ConnectionRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;

.field final synthetic val$route:Lorg/apache/http/conn/routing/HttpRoute;

.field final synthetic val$state:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)V
    .registers 4

    .prologue
    .line 190
    iput-object p1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;

    iput-object p2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    iput-object p3, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;->val$state:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()Z
    .registers 2

    .prologue
    .line 194
    const/4 v0, 0x0

    return v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/HttpClientConnection;
    .registers 7
    .param p1, "timeout"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 198
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;

    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;->val$state:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->getConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/HttpClientConnection;

    move-result-object v0

    return-object v0
.end method
