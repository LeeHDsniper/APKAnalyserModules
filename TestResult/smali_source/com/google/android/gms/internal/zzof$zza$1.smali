.class Lcom/google/android/gms/internal/zzof$zza$1;
.super Ljava/util/concurrent/FutureTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzof$zza;->newTaskFor(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/RunnableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic zzaIk:Lcom/google/android/gms/internal/zzof$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzof$zza;Ljava/lang/Runnable;Ljava/lang/Object;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzof$zza$1;->zzaIk:Lcom/google/android/gms/internal/zzof$zza;

    invoke-direct {p0, p2, p3}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected setException(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/zzof$zza$1;->zzaIk:Lcom/google/android/gms/internal/zzof$zza;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzof$zza;->zzaIj:Lcom/google/android/gms/internal/zzof;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzof;->zzb(Lcom/google/android/gms/internal/zzof;)Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    :cond_11
    :goto_11
    invoke-super {p0, p1}, Ljava/util/concurrent/FutureTask;->setException(Ljava/lang/Throwable;)V

    return-void

    :cond_15
    const-string v0, "GAv4"

    const/4 v1, 0x6

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_11

    const-string v0, "GAv4"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MeasurementExecutor: job failed with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_11
.end method
