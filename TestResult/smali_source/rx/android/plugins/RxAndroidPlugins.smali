.class public final Lrx/android/plugins/RxAndroidPlugins;
.super Ljava/lang/Object;
.source "RxAndroidPlugins.java"


# static fields
.field private static final INSTANCE:Lrx/android/plugins/RxAndroidPlugins;


# instance fields
.field private final schedulersHook:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lrx/android/plugins/RxAndroidSchedulersHook;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    new-instance v0, Lrx/android/plugins/RxAndroidPlugins;

    invoke-direct {v0}, Lrx/android/plugins/RxAndroidPlugins;-><init>()V

    sput-object v0, Lrx/android/plugins/RxAndroidPlugins;->INSTANCE:Lrx/android/plugins/RxAndroidPlugins;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lrx/android/plugins/RxAndroidPlugins;->schedulersHook:Ljava/util/concurrent/atomic/AtomicReference;

    .line 39
    return-void
.end method

.method public static getInstance()Lrx/android/plugins/RxAndroidPlugins;
    .registers 1

    .prologue
    .line 32
    sget-object v0, Lrx/android/plugins/RxAndroidPlugins;->INSTANCE:Lrx/android/plugins/RxAndroidPlugins;

    return-object v0
.end method

.method private static getPluginImplementationViaProperty(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "pluginClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "classSimpleName":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "rxandroid.plugin."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".implementation"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 93
    .local v3, "implementingClass":Ljava/lang/String;
    if-eqz v3, :cond_b2

    .line 95
    :try_start_23
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 97
    .local v1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1, p0}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_2e
    .catch Ljava/lang/ClassCastException; {:try_start_23 .. :try_end_2e} :catch_30
    .catch Ljava/lang/ClassNotFoundException; {:try_start_23 .. :try_end_2e} :catch_58
    .catch Ljava/lang/InstantiationException; {:try_start_23 .. :try_end_2e} :catch_76
    .catch Ljava/lang/IllegalAccessException; {:try_start_23 .. :try_end_2e} :catch_94

    move-result-object v4

    .line 119
    .end local v1    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_2f
    return-object v4

    .line 99
    :catch_30
    move-exception v2

    .line 100
    .local v2, "e":Ljava/lang/ClassCastException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " implementation is not an instance of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 105
    .end local v2    # "e":Ljava/lang/ClassCastException;
    :catch_58
    move-exception v2

    .line 106
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " implementation class not found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 109
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catch_76
    move-exception v2

    .line 110
    .local v2, "e":Ljava/lang/InstantiationException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " implementation not able to be instantiated: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 113
    .end local v2    # "e":Ljava/lang/InstantiationException;
    :catch_94
    move-exception v2

    .line 114
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " implementation not able to be accessed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 119
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :cond_b2
    const/4 v4, 0x0

    goto/16 :goto_2f
.end method


# virtual methods
.method public getSchedulersHook()Lrx/android/plugins/RxAndroidSchedulersHook;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 54
    iget-object v1, p0, Lrx/android/plugins/RxAndroidPlugins;->schedulersHook:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1c

    .line 56
    const-class v1, Lrx/android/plugins/RxAndroidSchedulersHook;

    invoke-static {v1}, Lrx/android/plugins/RxAndroidPlugins;->getPluginImplementationViaProperty(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/android/plugins/RxAndroidSchedulersHook;

    .line 58
    .local v0, "impl":Lrx/android/plugins/RxAndroidSchedulersHook;
    if-nez v0, :cond_25

    .line 60
    iget-object v1, p0, Lrx/android/plugins/RxAndroidPlugins;->schedulersHook:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Lrx/android/plugins/RxAndroidSchedulersHook;->getDefaultInstance()Lrx/android/plugins/RxAndroidSchedulersHook;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .end local v0    # "impl":Lrx/android/plugins/RxAndroidSchedulersHook;
    :cond_1c
    :goto_1c
    iget-object v1, p0, Lrx/android/plugins/RxAndroidPlugins;->schedulersHook:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/android/plugins/RxAndroidSchedulersHook;

    return-object v1

    .line 65
    .restart local v0    # "impl":Lrx/android/plugins/RxAndroidSchedulersHook;
    :cond_25
    iget-object v1, p0, Lrx/android/plugins/RxAndroidPlugins;->schedulersHook:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v3, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_1c
.end method
