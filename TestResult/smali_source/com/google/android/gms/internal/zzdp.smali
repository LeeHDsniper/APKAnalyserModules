.class public Lcom/google/android/gms/internal/zzdp;
.super Lcom/google/android/gms/internal/zzhq;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field final zzoL:Lcom/google/android/gms/internal/zzip;

.field final zzxr:Lcom/google/android/gms/internal/zzdr;

.field private final zzxs:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzdr;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhq;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdp;->zzoL:Lcom/google/android/gms/internal/zzip;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdp;->zzxr:Lcom/google/android/gms/internal/zzdr;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzdp;->zzxs:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbK()Lcom/google/android/gms/internal/zzdq;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzdq;->zza(Lcom/google/android/gms/internal/zzdp;)V

    return-void
.end method


# virtual methods
.method public onStop()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdp;->zzxr:Lcom/google/android/gms/internal/zzdr;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdr;->abort()V

    return-void
.end method

.method public zzdG()V
    .registers 4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzdp;->zzxr:Lcom/google/android/gms/internal/zzdr;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdp;->zzxs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzdr;->zzZ(Ljava/lang/String;)Z
    :try_end_7
    .catchall {:try_start_0 .. :try_end_7} :catchall_12

    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzdp$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzdp$1;-><init>(Lcom/google/android/gms/internal/zzdp;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_12
    move-exception v0

    sget-object v1, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzdp$1;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzdp$1;-><init>(Lcom/google/android/gms/internal/zzdp;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw v0
.end method
