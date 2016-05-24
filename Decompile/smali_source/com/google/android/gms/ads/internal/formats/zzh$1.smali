.class Lcom/google/android/gms/ads/internal/formats/zzh$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzdg;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/formats/zzh;->zzdy()Lcom/google/android/gms/internal/zzip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzwk:Lcom/google/android/gms/ads/internal/formats/zzh;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/formats/zzh;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzh$1;->zzwk:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 7
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

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh$1;->zzwk:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/formats/zzh;->zze(Lcom/google/android/gms/ads/internal/formats/zzh;)Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/ads/internal/formats/zzh$1$1;

    invoke-direct {v1, p0, p2}, Lcom/google/android/gms/ads/internal/formats/zzh$1$1;-><init>(Lcom/google/android/gms/ads/internal/formats/zzh$1;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/internal/zziq$zza;)V

    const-string v0, "overlayHtml"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh$1;->zzwk:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/formats/zzh;->zze(Lcom/google/android/gms/ads/internal/formats/zzh;)Lcom/google/android/gms/internal/zzip;

    move-result-object v1

    const-string v2, "text/html"

    const-string v3, "UTF-8"

    invoke-interface {v1, v0, v2, v3}, Lcom/google/android/gms/internal/zzip;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
