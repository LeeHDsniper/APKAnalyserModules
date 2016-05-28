.class Lcom/google/android/gms/analytics/internal/zzt$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/internal/zzt;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzMU:Lcom/google/android/gms/analytics/internal/zzt;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzt;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzt$1;->zzMU:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_18

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzt$1;->zzMU:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzt;->zza(Lcom/google/android/gms/analytics/internal/zzt;)Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzof;->zzf(Ljava/lang/Runnable;)V

    :cond_17
    :goto_17
    return-void

    :cond_18
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzt$1;->zzMU:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzt;->zzbr()Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzt$1;->zzMU:Lcom/google/android/gms/analytics/internal/zzt;

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/analytics/internal/zzt;->zza(Lcom/google/android/gms/analytics/internal/zzt;J)J

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzt$1;->zzMU:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzt;->zzb(Lcom/google/android/gms/analytics/internal/zzt;)Z

    move-result v0

    if-nez v0, :cond_17

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzt$1;->zzMU:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzt;->run()V

    goto :goto_17
.end method
