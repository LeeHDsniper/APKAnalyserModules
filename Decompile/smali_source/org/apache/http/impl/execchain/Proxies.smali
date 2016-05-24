.class Lorg/apache/http/impl/execchain/Proxies;
.super Ljava/lang/Object;
.source "Proxies.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static enhanceEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    .registers 7
    .param p0, "request"    # Lorg/apache/http/HttpEntityEnclosingRequest;

    .prologue
    .line 48
    invoke-interface {p0}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 49
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_2e

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isRepeatable()Z

    move-result v2

    if-nez v2, :cond_2e

    invoke-static {v0}, Lorg/apache/http/impl/execchain/Proxies;->isEnhanced(Lorg/apache/http/HttpEntity;)Z

    move-result v2

    if-nez v2, :cond_2e

    .line 50
    const-class v2, Lorg/apache/http/HttpEntity;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Lorg/apache/http/HttpEntity;

    aput-object v5, v3, v4

    new-instance v4, Lorg/apache/http/impl/execchain/RequestEntityExecHandler;

    invoke-direct {v4, v0}, Lorg/apache/http/impl/execchain/RequestEntityExecHandler;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-static {v2, v3, v4}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/HttpEntity;

    .line 54
    .local v1, "proxy":Lorg/apache/http/HttpEntity;
    invoke-interface {p0, v1}, Lorg/apache/http/HttpEntityEnclosingRequest;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 56
    .end local v1    # "proxy":Lorg/apache/http/HttpEntity;
    :cond_2e
    return-void
.end method

.method public static enhanceResponse(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .registers 6
    .param p0, "original"    # Lorg/apache/http/HttpResponse;
    .param p1, "connHolder"    # Lorg/apache/http/impl/execchain/ConnectionHolder;

    .prologue
    .line 87
    const-class v0, Lorg/apache/http/impl/execchain/ResponseProxyHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Lorg/apache/http/client/methods/CloseableHttpResponse;

    aput-object v3, v1, v2

    new-instance v2, Lorg/apache/http/impl/execchain/ResponseProxyHandler;

    invoke-direct {v2, p0, p1}, Lorg/apache/http/impl/execchain/ResponseProxyHandler;-><init>(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)V

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/methods/CloseableHttpResponse;

    return-object v0
.end method

.method static isEnhanced(Lorg/apache/http/HttpEntity;)Z
    .registers 3
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 59
    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/reflect/Proxy;->isProxyClass(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 60
    invoke-static {p0}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v0

    .line 61
    .local v0, "handler":Ljava/lang/reflect/InvocationHandler;
    instance-of v1, v0, Lorg/apache/http/impl/execchain/RequestEntityExecHandler;

    .line 63
    .end local v0    # "handler":Ljava/lang/reflect/InvocationHandler;
    :goto_12
    return v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method static isRepeatable(Lorg/apache/http/HttpRequest;)Z
    .registers 5
    .param p0, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    const/4 v2, 0x1

    .line 68
    instance-of v3, p0, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v3, :cond_1f

    .line 69
    check-cast p0, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p0    # "request":Lorg/apache/http/HttpRequest;
    invoke-interface {p0}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 70
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_1f

    .line 71
    invoke-static {v0}, Lorg/apache/http/impl/execchain/Proxies;->isEnhanced(Lorg/apache/http/HttpEntity;)Z

    move-result v3

    if-eqz v3, :cond_20

    .line 72
    invoke-static {v0}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v1

    check-cast v1, Lorg/apache/http/impl/execchain/RequestEntityExecHandler;

    .line 74
    .local v1, "handler":Lorg/apache/http/impl/execchain/RequestEntityExecHandler;
    invoke-virtual {v1}, Lorg/apache/http/impl/execchain/RequestEntityExecHandler;->isConsumed()Z

    move-result v3

    if-nez v3, :cond_20

    .line 81
    .end local v1    # "handler":Lorg/apache/http/impl/execchain/RequestEntityExecHandler;
    :cond_1f
    :goto_1f
    return v2

    .line 78
    :cond_20
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isRepeatable()Z

    move-result v2

    goto :goto_1f
.end method
