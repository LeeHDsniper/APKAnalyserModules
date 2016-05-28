.class public abstract Lcom/google/android/gms/internal/zzhq;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private volatile zzHt:Ljava/lang/Thread;

.field private final zzx:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzhq$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzhq$1;-><init>(Lcom/google/android/gms/internal/zzhq;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhq;->zzx:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzhq;Ljava/lang/Thread;)Ljava/lang/Thread;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhq;->zzHt:Ljava/lang/Thread;

    return-object p1
.end method


# virtual methods
.method public final cancel()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhq;->onStop()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhq;->zzHt:Ljava/lang/Thread;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhq;->zzHt:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_c
    return-void
.end method

.method public abstract onStop()V
.end method

.method public abstract zzdG()V
.end method

.method public final zzgn()Ljava/util/concurrent/Future;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhq;->zzx:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzht;->zza(Ljava/lang/Runnable;)Lcom/google/android/gms/internal/zzih;

    move-result-object v0

    return-object v0
.end method

.method public final zzgo()V
    .registers 3

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhq;->zzx:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzht;->zza(ILjava/lang/Runnable;)Lcom/google/android/gms/internal/zzih;

    return-void
.end method
