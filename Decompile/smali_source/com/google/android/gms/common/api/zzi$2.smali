.class Lcom/google/android/gms/common/api/zzi$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaap:Lcom/google/android/gms/common/api/zzi;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/zzi;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_9
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zzb(Lcom/google/android/gms/common/api/zzi;)Lcom/google/android/gms/common/api/zzj;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/api/zzj;->onConnected(Landroid/os/Bundle;)V
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_1c

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_1c
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v1}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public onConnectionSuspended(I)V
    .registers 4
    .param p1, "cause"    # I

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_9
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zzb(Lcom/google/android/gms/common/api/zzi;)Lcom/google/android/gms/common/api/zzj;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/api/zzj;->onConnectionSuspended(I)V
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_1c

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_1c
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi$2;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v1}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
