.class public Lcom/google/android/gms/common/api/zzh;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/zzj;


# instance fields
.field private final zzZq:Lcom/google/android/gms/common/api/zzi;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/zzi;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    return-void
.end method


# virtual methods
.method public begin()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zzny()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/common/api/zzi;->zzaah:Ljava/util/Set;

    return-void
.end method

.method public connect()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zznz()V

    return-void
.end method

.method public disconnect()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzi$zze;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzi$zze;->cancel()V

    goto :goto_8

    :cond_18
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zznx()V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    const-string v0, "DISCONNECTED"

    return-object v0
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    return-void
.end method

.method public onConnectionSuspended(I)V
    .registers 2
    .param p1, "cause"    # I

    .prologue
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

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzh;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    return-object p1
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
