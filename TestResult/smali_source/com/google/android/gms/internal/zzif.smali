.class public Lcom/google/android/gms/internal/zzif;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzih;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzih",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final zzID:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final zzIF:Lcom/google/android/gms/internal/zzii;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzif;->zzID:Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/internal/zzii;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzii;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzif;->zzIF:Lcom/google/android/gms/internal/zzii;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzif;->zzIF:Lcom/google/android/gms/internal/zzii;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzii;->zzgK()V

    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .registers 3
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzif;, "Lcom/google/android/gms/internal/zzif<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzif;->zzID:Ljava/lang/Object;

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 5
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzif;, "Lcom/google/android/gms/internal/zzif<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/zzif;->zzID:Ljava/lang/Object;

    return-object v0
.end method

.method public isCancelled()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public isDone()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public zzc(Ljava/lang/Runnable;)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzif;->zzIF:Lcom/google/android/gms/internal/zzii;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzii;->zzc(Ljava/lang/Runnable;)V

    return-void
.end method
