.class Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;
.super Ljava/lang/Object;
.source "BasicClientConnectionManager.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/conn/BasicClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/conn/BasicClientConnectionManager;

.field final synthetic val$route:Lorg/apache/http/conn/routing/HttpRoute;

.field final synthetic val$state:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/conn/BasicClientConnectionManager;Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)V
    .registers 4

    .prologue
    .line 134
    iput-object p1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/BasicClientConnectionManager;

    iput-object p2, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    iput-object p3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;->val$state:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abortRequest()V
    .registers 1

    .prologue
    .line 138
    return-void
.end method

.method public getConnection(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/conn/ManagedClientConnection;
    .registers 7
    .param p1, "timeout"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 142
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/BasicClientConnectionManager;

    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;->val$state:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->getConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ManagedClientConnection;

    move-result-object v0

    return-object v0
.end method
