.class public abstract Lcom/google/android/gms/common/api/zzc$zza;
.super Lcom/google/android/gms/common/api/zza;

# interfaces
.implements Lcom/google/android/gms/common/api/zzc$zzb;
.implements Lcom/google/android/gms/common/api/zzi$zze;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R::",
        "Lcom/google/android/gms/common/api/Result;",
        "A::",
        "Lcom/google/android/gms/common/api/Api$zzb;",
        ">",
        "Lcom/google/android/gms/common/api/zza",
        "<TR;>;",
        "Lcom/google/android/gms/common/api/zzc$zzb",
        "<TR;>;",
        "Lcom/google/android/gms/common/api/zzi$zze",
        "<TA;>;"
    }
.end annotation


# instance fields
.field private final zzXW:Lcom/google/android/gms/common/api/Api$zzc;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<TA;>;"
        }
    .end annotation
.end field

.field private zzYO:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/google/android/gms/common/api/zzi$zzd;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/common/api/Api$zzc;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<TA;>;",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")V"
        }
    .end annotation

    const-string v0, "GoogleApiClient must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zza;-><init>(Landroid/os/Looper;)V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzc$zza;->zzYO:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzc;

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzc$zza;->zzXW:Lcom/google/android/gms/common/api/Api$zzc;

    return-void
.end method

.method private zza(Landroid/os/RemoteException;)V
    .registers 6

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x8

    invoke-virtual {p1}, Landroid/os/RemoteException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/zzc$zza;->zzx(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method


# virtual methods
.method protected abstract zza(Lcom/google/android/gms/common/api/Api$zzb;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public zza(Lcom/google/android/gms/common/api/zzi$zzd;)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzc$zza;->zzYO:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public final zzb(Lcom/google/android/gms/common/api/Api$zzb;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/zzc$zza;->zza(Lcom/google/android/gms/common/api/Api$zzb;)V
    :try_end_3
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_3} :catch_4
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_3} :catch_9

    :goto_3
    return-void

    :catch_4
    move-exception v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzc$zza;->zza(Landroid/os/RemoteException;)V

    throw v0

    :catch_9
    move-exception v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzc$zza;->zza(Landroid/os/RemoteException;)V

    goto :goto_3
.end method

.method protected zzmZ()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzc$zza;->zzYO:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzi$zzd;

    if-eqz v0, :cond_e

    invoke-interface {v0, p0}, Lcom/google/android/gms/common/api/zzi$zzd;->zzc(Lcom/google/android/gms/common/api/zzi$zze;)V

    :cond_e
    return-void
.end method

.method public synthetic zzn(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/common/api/Result;

    invoke-super {p0, p1}, Lcom/google/android/gms/common/api/zza;->zza(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method

.method public final zznd()Lcom/google/android/gms/common/api/Api$zzc;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<TA;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzc$zza;->zzXW:Lcom/google/android/gms/common/api/Api$zzc;

    return-object v0
.end method

.method public zzng()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public final zzx(Lcom/google/android/gms/common/api/Status;)V
    .registers 4

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    :goto_7
    const-string v1, "Failed result must not be success"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/zzc$zza;->zzb(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/zzc$zza;->zza(Lcom/google/android/gms/common/api/Result;)V

    return-void

    :cond_14
    const/4 v0, 0x0

    goto :goto_7
.end method
