.class Lorg/apache/http/impl/conn/CPoolProxy;
.super Ljava/lang/Object;
.source "CPoolProxy.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final CLOSE_METHOD:Ljava/lang/reflect/Method;

.field private static final IS_OPEN_METHOD:Ljava/lang/reflect/Method;

.field private static final IS_STALE_METHOD:Ljava/lang/reflect/Method;

.field private static final SHUTDOWN_METHOD:Ljava/lang/reflect/Method;


# instance fields
.field private volatile poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 54
    :try_start_0
    const-class v1, Lorg/apache/http/HttpConnection;

    const-string v2, "close"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lorg/apache/http/impl/conn/CPoolProxy;->CLOSE_METHOD:Ljava/lang/reflect/Method;

    .line 55
    const-class v1, Lorg/apache/http/HttpConnection;

    const-string v2, "shutdown"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lorg/apache/http/impl/conn/CPoolProxy;->SHUTDOWN_METHOD:Ljava/lang/reflect/Method;

    .line 56
    const-class v1, Lorg/apache/http/HttpConnection;

    const-string v2, "isOpen"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lorg/apache/http/impl/conn/CPoolProxy;->IS_OPEN_METHOD:Ljava/lang/reflect/Method;

    .line 57
    const-class v1, Lorg/apache/http/HttpConnection;

    const-string v2, "isStale"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lorg/apache/http/impl/conn/CPoolProxy;->IS_STALE_METHOD:Ljava/lang/reflect/Method;
    :try_end_34
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_34} :catch_35

    .line 61
    return-void

    .line 58
    :catch_35
    move-exception v0

    .line 59
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/Error;

    invoke-direct {v1, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method constructor <init>(Lorg/apache/http/impl/conn/CPoolEntry;)V
    .registers 2
    .param p1, "entry"    # Lorg/apache/http/impl/conn/CPoolEntry;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/apache/http/impl/conn/CPoolProxy;->poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;

    .line 68
    return-void
.end method

.method public static detach(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;
    .registers 2
    .param p0, "proxy"    # Lorg/apache/http/HttpClientConnection;

    .prologue
    .line 176
    invoke-static {p0}, Lorg/apache/http/impl/conn/CPoolProxy;->getHandler(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolProxy;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPoolProxy;->detach()Lorg/apache/http/impl/conn/CPoolEntry;

    move-result-object v0

    return-object v0
.end method

.method private static getHandler(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolProxy;
    .registers 5
    .param p0, "proxy"    # Lorg/apache/http/HttpClientConnection;

    .prologue
    .line 160
    invoke-static {p0}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v0

    .line 161
    .local v0, "handler":Ljava/lang/reflect/InvocationHandler;
    const-class v1, Lorg/apache/http/impl/conn/CPoolProxy;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_25

    .line 162
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected proxy handler class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 164
    :cond_25
    const-class v1, Lorg/apache/http/impl/conn/CPoolProxy;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/impl/conn/CPoolProxy;

    return-object v1
.end method

.method public static getPoolEntry(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;
    .registers 3
    .param p0, "proxy"    # Lorg/apache/http/HttpClientConnection;

    .prologue
    .line 168
    invoke-static {p0}, Lorg/apache/http/impl/conn/CPoolProxy;->getHandler(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolProxy;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/CPoolProxy;->getPoolEntry()Lorg/apache/http/impl/conn/CPoolEntry;

    move-result-object v0

    .line 169
    .local v0, "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    if-nez v0, :cond_10

    .line 170
    new-instance v1, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v1}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v1

    .line 172
    :cond_10
    return-object v0
.end method

.method public static newProxy(Lorg/apache/http/impl/conn/CPoolEntry;)Lorg/apache/http/HttpClientConnection;
    .registers 5
    .param p0, "poolEntry"    # Lorg/apache/http/impl/conn/CPoolEntry;

    .prologue
    .line 152
    const-class v0, Lorg/apache/http/impl/conn/CPoolProxy;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Lorg/apache/http/conn/ManagedHttpClientConnection;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-class v3, Lorg/apache/http/protocol/HttpContext;

    aput-object v3, v1, v2

    new-instance v2, Lorg/apache/http/impl/conn/CPoolProxy;

    invoke-direct {v2, p0}, Lorg/apache/http/impl/conn/CPoolProxy;-><init>(Lorg/apache/http/impl/conn/CPoolEntry;)V

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpClientConnection;

    return-object v0
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
    .line 89
    iget-object v0, p0, Lorg/apache/http/impl/conn/CPoolProxy;->poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;

    .line 90
    .local v0, "local":Lorg/apache/http/impl/conn/CPoolEntry;
    if-eqz v0, :cond_7

    .line 91
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPoolEntry;->closeConnection()V

    .line 93
    :cond_7
    return-void
.end method

.method detach()Lorg/apache/http/impl/conn/CPoolEntry;
    .registers 3

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/http/impl/conn/CPoolProxy;->poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;

    .line 76
    .local v0, "local":Lorg/apache/http/impl/conn/CPoolEntry;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/CPoolProxy;->poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;

    .line 77
    return-object v0
.end method

.method getConnection()Lorg/apache/http/HttpClientConnection;
    .registers 3

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/http/impl/conn/CPoolProxy;->poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;

    .line 82
    .local v0, "local":Lorg/apache/http/impl/conn/CPoolEntry;
    if-nez v0, :cond_6

    .line 83
    const/4 v1, 0x0

    .line 85
    :goto_5
    return-object v1

    :cond_6
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/HttpClientConnection;

    goto :goto_5
.end method

.method getPoolEntry()Lorg/apache/http/impl/conn/CPoolEntry;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/conn/CPoolProxy;->poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;

    return-object v0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 122
    sget-object v4, Lorg/apache/http/impl/conn/CPoolProxy;->CLOSE_METHOD:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v4}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 123
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/CPoolProxy;->close()V

    .line 138
    :goto_c
    return-object v3

    .line 125
    :cond_d
    sget-object v4, Lorg/apache/http/impl/conn/CPoolProxy;->SHUTDOWN_METHOD:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v4}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 126
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/CPoolProxy;->shutdown()V

    goto :goto_c

    .line 128
    :cond_19
    sget-object v3, Lorg/apache/http/impl/conn/CPoolProxy;->IS_OPEN_METHOD:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v3}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 129
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/CPoolProxy;->isOpen()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_c

    .line 130
    :cond_2a
    sget-object v3, Lorg/apache/http/impl/conn/CPoolProxy;->IS_STALE_METHOD:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v3}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 131
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/CPoolProxy;->isStale()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_c

    .line 133
    :cond_3b
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/CPoolProxy;->getConnection()Lorg/apache/http/HttpClientConnection;

    move-result-object v1

    .line 134
    .local v1, "conn":Lorg/apache/http/HttpClientConnection;
    if-nez v1, :cond_47

    .line 135
    new-instance v3, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v3}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v3

    .line 138
    :cond_47
    :try_start_47
    invoke-virtual {p2, v1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_47 .. :try_end_4a} :catch_4c

    move-result-object v3

    goto :goto_c

    .line 139
    :catch_4c
    move-exception v2

    .line 140
    .local v2, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 141
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_54

    .line 142
    throw v0

    .line 144
    :cond_54
    throw v2
.end method

.method public isOpen()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 103
    iget-object v0, p0, Lorg/apache/http/impl/conn/CPoolProxy;->poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;

    .line 104
    .local v0, "local":Lorg/apache/http/impl/conn/CPoolEntry;
    if-eqz v0, :cond_c

    .line 105
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPoolEntry;->isClosed()Z

    move-result v2

    if-nez v2, :cond_c

    const/4 v1, 0x1

    .line 107
    :cond_c
    return v1
.end method

.method public isStale()Z
    .registers 3

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/CPoolProxy;->getConnection()Lorg/apache/http/HttpClientConnection;

    move-result-object v0

    .line 113
    .local v0, "conn":Lorg/apache/http/HttpClientConnection;
    if-eqz v0, :cond_b

    .line 114
    invoke-interface {v0}, Lorg/apache/http/HttpClientConnection;->isStale()Z

    move-result v1

    .line 116
    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x1

    goto :goto_a
.end method

.method public shutdown()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lorg/apache/http/impl/conn/CPoolProxy;->poolEntry:Lorg/apache/http/impl/conn/CPoolEntry;

    .line 97
    .local v0, "local":Lorg/apache/http/impl/conn/CPoolEntry;
    if-eqz v0, :cond_7

    .line 98
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPoolEntry;->shutdownConnection()V

    .line 100
    :cond_7
    return-void
.end method
