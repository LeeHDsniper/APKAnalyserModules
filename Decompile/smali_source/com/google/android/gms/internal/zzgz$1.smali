.class Lcom/google/android/gms/internal/zzgz$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgz;->zzdG()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzGt:Lcom/google/android/gms/internal/zzei;

.field final synthetic zzGu:Lcom/google/android/gms/internal/zzgz;

.field final synthetic zzpd:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/internal/zzei;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgz$1;->zzGu:Lcom/google/android/gms/internal/zzgz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgz$1;->zzGt:Lcom/google/android/gms/internal/zzei;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgz$1;->zzpd:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgz$1;->zzGt:Lcom/google/android/gms/internal/zzei;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgz$1;->zzpd:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgz$1;->zzGu:Lcom/google/android/gms/internal/zzgz;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgz;->zza(Lcom/google/android/gms/internal/zzgz;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzei;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;)V
    :try_end_d
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_d} :catch_e

    :goto_d
    return-void

    :catch_e
    move-exception v0

    const-string v1, "Fail to load ad from adapter."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgz$1;->zzGu:Lcom/google/android/gms/internal/zzgz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgz$1;->zzGu:Lcom/google/android/gms/internal/zzgz;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgz;->zzb(Lcom/google/android/gms/internal/zzgz;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzgz;->zzb(Ljava/lang/String;I)V

    goto :goto_d
.end method
