.class Lcom/google/android/gms/ads/internal/formats/zzj$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/formats/zzj;->zzb(Lcom/google/android/gms/dynamic/zzd;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzwu:Lcom/google/android/gms/ads/internal/formats/zzh;

.field final synthetic zzwv:Lcom/google/android/gms/ads/internal/formats/zzj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/formats/zzj;Lcom/google/android/gms/ads/internal/formats/zzh;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzj$1;->zzwv:Lcom/google/android/gms/ads/internal/formats/zzj;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzj$1;->zzwu:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj$1;->zzwu:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzdy()Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    if-eqz v0, :cond_15

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj$1;->zzwv:Lcom/google/android/gms/ads/internal/formats/zzj;

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/formats/zzj;->zza(Lcom/google/android/gms/ads/internal/formats/zzj;)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    :cond_15
    return-void
.end method
