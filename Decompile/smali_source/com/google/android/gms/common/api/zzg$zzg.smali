.class Lcom/google/android/gms/common/api/zzg$zzg;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zzg"
.end annotation


# instance fields
.field final synthetic zzZK:Lcom/google/android/gms/common/api/zzg;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/common/api/zzg;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/api/zzg$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg$zzg;-><init>(Lcom/google/android/gms/common/api/zzg;)V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/signin/zzd;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/common/api/zzg$zzb;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/zzg$zzb;-><init>(Lcom/google/android/gms/common/api/zzg;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/signin/zzd;->zza(Lcom/google/android/gms/common/internal/zzt;)V

    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 4
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzc(Lcom/google/android/gms/common/api/zzg;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_9
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0, p1}, Lcom/google/android/gms/common/api/zzg;->zzb(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzi(Lcom/google/android/gms/common/api/zzg;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzj(Lcom/google/android/gms/common/api/zzg;)V
    :try_end_1b
    .catchall {:try_start_9 .. :try_end_1b} :catchall_2b

    :goto_1b
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzc(Lcom/google/android/gms/common/api/zzg;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_25
    :try_start_25
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0, p1}, Lcom/google/android/gms/common/api/zzg;->zza(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)V
    :try_end_2a
    .catchall {:try_start_25 .. :try_end_2a} :catchall_2b

    goto :goto_1b

    :catchall_2b
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg$zzg;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v1}, Lcom/google/android/gms/common/api/zzg;->zzc(Lcom/google/android/gms/common/api/zzg;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public onConnectionSuspended(I)V
    .registers 2
    .param p1, "cause"    # I

    .prologue
    return-void
.end method
