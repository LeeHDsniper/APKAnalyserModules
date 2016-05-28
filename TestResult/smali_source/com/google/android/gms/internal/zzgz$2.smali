.class Lcom/google/android/gms/internal/zzgz$2;
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

.field final synthetic zzGv:Lcom/google/android/gms/internal/zzhc;

.field final synthetic zzpd:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/internal/zzei;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzhc;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGu:Lcom/google/android/gms/internal/zzgz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGt:Lcom/google/android/gms/internal/zzei;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgz$2;->zzpd:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGv:Lcom/google/android/gms/internal/zzhc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGt:Lcom/google/android/gms/internal/zzei;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGu:Lcom/google/android/gms/internal/zzgz;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgz;->zzc(Lcom/google/android/gms/internal/zzgz;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgz$2;->zzpd:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGu:Lcom/google/android/gms/internal/zzgz;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzgz;->zzd(Lcom/google/android/gms/internal/zzgz;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGv:Lcom/google/android/gms/internal/zzhc;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGu:Lcom/google/android/gms/internal/zzgz;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzgz;->zza(Lcom/google/android/gms/internal/zzgz;)Ljava/lang/String;

    move-result-object v5

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzei;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Lcom/google/android/gms/ads/internal/reward/mediation/client/zza;Ljava/lang/String;)V
    :try_end_1f
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_1f} :catch_20

    :goto_1f
    return-void

    :catch_20
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fail to initialize adapter "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGu:Lcom/google/android/gms/internal/zzgz;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgz;->zzb(Lcom/google/android/gms/internal/zzgz;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGu:Lcom/google/android/gms/internal/zzgz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgz$2;->zzGu:Lcom/google/android/gms/internal/zzgz;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgz;->zzb(Lcom/google/android/gms/internal/zzgz;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzgz;->zzb(Ljava/lang/String;I)V

    goto :goto_1f
.end method
