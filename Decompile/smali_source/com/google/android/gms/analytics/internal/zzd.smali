.class public abstract Lcom/google/android/gms/analytics/internal/zzd;
.super Lcom/google/android/gms/analytics/internal/zzc;


# instance fields
.field private zzLA:Z

.field private zzLz:Z


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzc;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    return-void
.end method


# virtual methods
.method public isInitialized()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzd;->zzLz:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzd;->zzLA:Z

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public zza()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzd;->zzhB()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzd;->zzLz:Z

    return-void
.end method

.method protected abstract zzhB()V
.end method

.method protected zzio()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzd;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    return-void
.end method
