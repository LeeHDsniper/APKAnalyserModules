.class public Lcom/google/android/gms/common/api/zzf;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/zzj;


# instance fields
.field private final zzZq:Lcom/google/android/gms/common/api/zzi;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/zzi;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    return-void
.end method

.method private zza(Lcom/google/android/gms/common/api/zzi$zze;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            ">(",
            "Lcom/google/android/gms/common/api/zzi$zze",
            "<TA;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/api/zzi;->zzb(Lcom/google/android/gms/common/api/zzi$zze;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-interface {p1}, Lcom/google/android/gms/common/api/zzi$zze;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/Api$zzc;)Lcom/google/android/gms/common/api/Api$zzb;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$zzb;->isConnected()Z

    move-result v1

    if-nez v1, :cond_2e

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v1, v1, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {p1}, Lcom/google/android/gms/common/api/zzi$zze;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/api/zzi$zze;->zzx(Lcom/google/android/gms/common/api/Status;)V

    :goto_2d
    return-void

    :cond_2e
    invoke-interface {p1, v0}, Lcom/google/android/gms/common/api/zzi$zze;->zzb(Lcom/google/android/gms/common/api/Api$zzb;)V

    goto :goto_2d
.end method


# virtual methods
.method public begin()V
    .registers 4

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_21

    :try_start_a
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzi$zze;

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzf;->zza(Lcom/google/android/gms/common/api/zzi$zze;)V
    :try_end_17
    .catch Landroid/os/DeadObjectException; {:try_start_a .. :try_end_17} :catch_18

    goto :goto_0

    :catch_18
    move-exception v0

    const-string v1, "GoogleApiClientConnected"

    const-string v2, "Service died while flushing queue"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_21
    return-void
.end method

.method public connect()V
    .registers 1

    return-void
.end method

.method public disconnect()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zznx()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/zzi;->zzg(Lcom/google/android/gms/common/ConnectionResult;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzk;->zzoI()V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    const-string v0, "CONNECTED"

    return-object v0
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    return-void
.end method

.method public onConnectionSuspended(I)V
    .registers 7
    .param p1, "cause"    # I

    .prologue
    const/4 v0, 0x1

    if-ne p1, v0, :cond_8

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zznD()V

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaal:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzi$zze;

    new-instance v2, Lcom/google/android/gms/common/api/Status;

    const/16 v3, 0x8

    const-string v4, "The connection to Google Play services was lost"

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v2}, Lcom/google/android/gms/common/api/zzi$zze;->zzw(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_10

    :cond_29
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/zzi;->zzg(Lcom/google/android/gms/common/ConnectionResult;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/zzk;->zzbB(I)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzk;->zzoI()V

    const/4 v0, 0x2

    if-ne p1, v0, :cond_45

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->connect()V

    :cond_45
    return-void
.end method

.method public zza(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "R::",
            "Lcom/google/android/gms/common/api/Result;",
            "T:",
            "Lcom/google/android/gms/common/api/zzc$zza",
            "<TR;TA;>;>(TT;)TT;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/zzf;->zzb(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/ConnectionResult;",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;I)V"
        }
    .end annotation

    return-void
.end method

.method public zzb(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "T:",
            "Lcom/google/android/gms/common/api/zzc$zza",
            "<+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(TT;)TT;"
        }
    .end annotation

    :try_start_0
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzf;->zza(Lcom/google/android/gms/common/api/zzi$zze;)V
    :try_end_3
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_3} :catch_4

    :goto_3
    return-object p1

    :catch_4
    move-exception v0

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf;->zzZq:Lcom/google/android/gms/common/api/zzi;

    new-instance v1, Lcom/google/android/gms/common/api/zzf$1;

    invoke-direct {v1, p0, p0}, Lcom/google/android/gms/common/api/zzf$1;-><init>(Lcom/google/android/gms/common/api/zzf;Lcom/google/android/gms/common/api/zzj;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi$zzb;)V

    goto :goto_3
.end method
