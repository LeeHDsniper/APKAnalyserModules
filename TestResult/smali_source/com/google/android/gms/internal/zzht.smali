.class public final Lcom/google/android/gms/internal/zzht;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# static fields
.field private static final zzHy:Ljava/util/concurrent/ExecutorService;

.field private static final zzHz:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/16 v0, 0xa

    const-string v1, "Default"

    invoke-static {v1}, Lcom/google/android/gms/internal/zzht;->zzav(Ljava/lang/String;)Ljava/util/concurrent/ThreadFactory;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzht;->zzHy:Ljava/util/concurrent/ExecutorService;

    const/4 v0, 0x5

    const-string v1, "Loader"

    invoke-static {v1}, Lcom/google/android/gms/internal/zzht;->zzav(Ljava/lang/String;)Ljava/util/concurrent/ThreadFactory;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzht;->zzHz:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public static zza(ILjava/lang/Runnable;)Lcom/google/android/gms/internal/zzih;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Runnable;",
            ")",
            "Lcom/google/android/gms/internal/zzih",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p0, v0, :cond_f

    sget-object v0, Lcom/google/android/gms/internal/zzht;->zzHz:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/android/gms/internal/zzht$1;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzht$1;-><init>(Ljava/lang/Runnable;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzht;->zza(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzih;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    sget-object v0, Lcom/google/android/gms/internal/zzht;->zzHy:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/android/gms/internal/zzht$2;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzht$2;-><init>(Ljava/lang/Runnable;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzht;->zza(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzih;

    move-result-object v0

    goto :goto_e
.end method

.method public static zza(Ljava/lang/Runnable;)Lcom/google/android/gms/internal/zzih;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Lcom/google/android/gms/internal/zzih",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/zzht;->zza(ILjava/lang/Runnable;)Lcom/google/android/gms/internal/zzih;

    move-result-object v0

    return-object v0
.end method

.method public static zza(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzih;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)",
            "Lcom/google/android/gms/internal/zzih",
            "<TT;>;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzht;->zzHy:Ljava/util/concurrent/ExecutorService;

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/zzht;->zza(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzih;

    move-result-object v0

    return-object v0
.end method

.method public static zza(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzih;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/ExecutorService;",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)",
            "Lcom/google/android/gms/internal/zzih",
            "<TT;>;"
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/internal/zzie;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzie;-><init>()V

    :try_start_5
    new-instance v0, Lcom/google/android/gms/internal/zzht$3;

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/zzht$3;-><init>(Lcom/google/android/gms/internal/zzie;Ljava/util/concurrent/Callable;)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_d
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_5 .. :try_end_d} :catch_e

    :goto_d
    return-object v1

    :catch_e
    move-exception v0

    const-string v2, "Thread execution is rejected."

    invoke-static {v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzie;->cancel(Z)Z

    goto :goto_d
.end method

.method private static zzav(Ljava/lang/String;)Ljava/util/concurrent/ThreadFactory;
    .registers 2

    new-instance v0, Lcom/google/android/gms/internal/zzht$4;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzht$4;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
