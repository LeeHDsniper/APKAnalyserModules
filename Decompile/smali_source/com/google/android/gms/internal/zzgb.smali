.class public Lcom/google/android/gms/internal/zzgb;
.super Lcom/google/android/gms/internal/zzfw;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzfw;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V

    return-void
.end method


# virtual methods
.method protected zzfp()V
    .registers 1

    return-void
.end method

.method protected zzh(J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzfz$zza;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzgb$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzgb$1;-><init>(Lcom/google/android/gms/internal/zzgb;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzgb;->zzg(J)V

    return-void
.end method
