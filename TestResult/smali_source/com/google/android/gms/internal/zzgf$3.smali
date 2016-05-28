.class Lcom/google/android/gms/internal/zzgf$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzdg;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgf;->zza(Lcom/google/android/gms/ads/internal/formats/zzh$zza;Lcom/google/android/gms/internal/zzbb;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzDb:Lcom/google/android/gms/internal/zzgf;

.field final synthetic zzDe:Lcom/google/android/gms/ads/internal/formats/zzf;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgf;Lcom/google/android/gms/ads/internal/formats/zzf;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgf$3;->zzDb:Lcom/google/android/gms/internal/zzgf;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgf$3;->zzDe:Lcom/google/android/gms/ads/internal/formats/zzf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzip;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "asset"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgf$3;->zzDb:Lcom/google/android/gms/internal/zzgf;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgf$3;->zzDe:Lcom/google/android/gms/ads/internal/formats/zzf;

    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/zzgf;->zza(Lcom/google/android/gms/internal/zzgf;Lcom/google/android/gms/internal/zzcr;Ljava/lang/String;)V

    return-void
.end method
