.class Lorg/apache/http/impl/execchain/ResponseProxyHandler;
.super Ljava/lang/Object;
.source "ResponseProxyHandler.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final CLOSE_METHOD:Ljava/lang/reflect/Method;


# instance fields
.field private final connHolder:Lorg/apache/http/impl/execchain/ConnectionHolder;

.field private final original:Lorg/apache/http/HttpResponse;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 53
    :try_start_0
    const-class v1, Ljava/io/Closeable;

    const-string v2, "close"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->CLOSE_METHOD:Ljava/lang/reflect/Method;
    :try_end_d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_d} :catch_e

    .line 57
    return-void

    .line 54
    :catch_e
    move-exception v0

    .line 55
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/Error;

    invoke-direct {v1, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method constructor <init>(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)V
    .registers 6
    .param p1, "original"    # Lorg/apache/http/HttpResponse;
    .param p2, "connHolder"    # Lorg/apache/http/impl/execchain/ConnectionHolder;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->original:Lorg/apache/http/HttpResponse;

    .line 67
    iput-object p2, p0, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->connHolder:Lorg/apache/http/impl/execchain/ConnectionHolder;

    .line 68
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 69
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_1f

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v1

    if-eqz v1, :cond_1f

    if-eqz p2, :cond_1f

    .line 70
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->original:Lorg/apache/http/HttpResponse;

    new-instance v2, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;

    invoke-direct {v2, v0, p2}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;Lorg/apache/http/impl/execchain/ConnectionHolder;)V

    invoke-interface {v1, v2}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 72
    :cond_1f
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->connHolder:Lorg/apache/http/impl/execchain/ConnectionHolder;

    if-eqz v0, :cond_9

    .line 76
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->connHolder:Lorg/apache/http/impl/execchain/ConnectionHolder;

    invoke-virtual {v0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 78
    :cond_9
    return-void
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 82
    sget-object v2, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->CLOSE_METHOD:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v2}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 83
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->close()V

    .line 84
    const/4 v2, 0x0

    .line 87
    :goto_c
    return-object v2

    :cond_d
    :try_start_d
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ResponseProxyHandler;->original:Lorg/apache/http/HttpResponse;

    invoke-virtual {p2, v2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_d .. :try_end_12} :catch_14

    move-result-object v2

    goto :goto_c

    .line 88
    :catch_14
    move-exception v1

    .line 89
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 90
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_1c

    .line 91
    throw v0

    .line 93
    :cond_1c
    throw v1
.end method
