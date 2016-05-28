.class public Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;
.super Ljava/lang/Object;
.source "ServiceLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

.field final mMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final mServices:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 3
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 27
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;, "Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .line 29
    return-void
.end method

.method private createService(Ljava/lang/Class;Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
    .registers 8
    .param p2, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;, "Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader<TT;>;"
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 151
    new-array v1, v4, [Ljava/lang/Class;

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    aput-object v2, v1, v3

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 152
    .local v0, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    new-array v1, v4, [Ljava/lang/Object;

    aput-object p2, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;

    return-object v1
.end method

.method private get(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;, "Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader<TT;>;"
    const-string v2, "ServiceLoader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "get: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 137
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 139
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_28
    invoke-direct {p0, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->createService(Ljava/lang/Class;Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2b} :catch_2d

    move-result-object v2

    .line 146
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :goto_2c
    return-object v2

    .line 140
    .restart local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :catch_2d
    move-exception v1

    .line 141
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 146
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_31
    const/4 v2, 0x0

    goto :goto_2c

    .line 144
    :cond_33
    const-string v2, "ServiceLoader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not registered"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_31
.end method


# virtual methods
.method public dispose()V
    .registers 6

    .prologue
    .line 158
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;, "Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader<TT;>;"
    :try_start_0
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 160
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 161
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;

    .line 162
    .local v2, "service":Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;, "TT;"
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->internalDispose()V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1f} :catch_20
    .catchall {:try_start_0 .. :try_end_1f} :catchall_30

    goto :goto_a

    .line 164
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v2    # "service":Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;, "TT;"
    :catch_20
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/Exception;
    :try_start_21
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_30

    .line 167
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 169
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_29
    return-void

    .line 167
    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2a
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    goto :goto_29

    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catchall_30
    move-exception v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    throw v3
.end method

.method public getService(Ljava/lang/Class;)Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;, "Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader<TT;>;"
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "name":Ljava/lang/String;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 46
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;

    .local v2, "service":Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;, "TT;"
    move-object v3, v2

    .line 70
    :goto_15
    return-object v3

    .line 51
    .end local v2    # "service":Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;, "TT;"
    :cond_16
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    .line 52
    const-string v3, "ServiceLoader"

    const-string v4, "class not yet registered, register it..."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Ljava/lang/Class;)Ljava/lang/Class;

    .line 58
    :cond_28
    :try_start_28
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-direct {p0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->get(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2d} :catch_35

    move-result-object v2

    .line 64
    .restart local v2    # "service":Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;, "TT;"
    if-eqz v2, :cond_43

    .line 65
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;)Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;

    move-object v3, v2

    .line 66
    goto :goto_15

    .line 59
    .end local v2    # "service":Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;, "TT;"
    :catch_35
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 61
    new-instance v3, Ljava/lang/IllegalAccessException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 69
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "service":Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;, "TT;"
    :cond_43
    const-string v3, "ServiceLoader"

    const-string v4, "service is not registered!"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    const/4 v3, 0x0

    goto :goto_15
.end method

.method public register(Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;)Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;, "Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader<TT;>;"
    .local p1, "service":Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "name":Ljava/lang/String;
    const-string v1, "ServiceLoader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "register: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mServices:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;

    return-object v1
.end method

.method public register(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;, "Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader<TT;>;"
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->mMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method
