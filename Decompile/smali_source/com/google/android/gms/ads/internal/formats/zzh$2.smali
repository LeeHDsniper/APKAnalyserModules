.class Lcom/google/android/gms/ads/internal/formats/zzh$2;
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

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzh$2;->zzwk:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 5
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

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh$2;->zzwk:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/formats/zzh;->zze(Lcom/google/android/gms/ads/internal/formats/zzh;)Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    return-void
.end method
