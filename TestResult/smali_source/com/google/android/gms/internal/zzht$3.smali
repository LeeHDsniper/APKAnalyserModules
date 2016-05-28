.class final Lcom/google/android/gms/internal/zzht$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzht;->zza(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzih;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic zzHB:Ljava/util/concurrent/Callable;

.field final synthetic zzrp:Lcom/google/android/gms/internal/zzie;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzie;Ljava/util/concurrent/Callable;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzht$3;->zzrp:Lcom/google/android/gms/internal/zzie;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzht$3;->zzHB:Ljava/util/concurrent/Callable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    const/4 v2, 0x1

    const/16 v0, 0xa

    :try_start_3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzht$3;->zzrp:Lcom/google/android/gms/internal/zzie;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzht$3;->zzHB:Ljava/util/concurrent/Callable;

    invoke-interface {v1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_11} :catch_12

    :goto_11
    return-void

    :catch_12
    move-exception v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v1

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzhl;->zzc(Ljava/lang/Throwable;Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzht$3;->zzrp:Lcom/google/android/gms/internal/zzie;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzie;->cancel(Z)Z

    goto :goto_11
.end method
