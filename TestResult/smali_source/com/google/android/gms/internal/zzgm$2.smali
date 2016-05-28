.class final Lcom/google/android/gms/internal/zzgm$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgm;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzbr;Lcom/google/android/gms/internal/zzgl;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic zzEP:Lcom/google/android/gms/internal/zzgo;

.field final synthetic zzEQ:Lcom/google/android/gms/internal/zzcc;

.field final synthetic zzER:Ljava/lang/String;

.field final synthetic zzEU:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

.field final synthetic zzEV:Lcom/google/android/gms/internal/zzbr;

.field final synthetic zzoC:Lcom/google/android/gms/internal/zzcd;

.field final synthetic zzrn:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgo;Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;Ljava/lang/String;Lcom/google/android/gms/internal/zzbr;)V
    .registers 8

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgm$2;->zzrn:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEU:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEP:Lcom/google/android/gms/internal/zzgo;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzgm$2;->zzoC:Lcom/google/android/gms/internal/zzcd;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEQ:Lcom/google/android/gms/internal/zzcc;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzgm$2;->zzER:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEV:Lcom/google/android/gms/internal/zzbr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    const/4 v7, 0x1

    const/4 v3, 0x0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzby()Lcom/google/android/gms/internal/zzir;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm$2;->zzrn:Landroid/content/Context;

    new-instance v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    invoke-direct {v2}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;-><init>()V

    const/4 v5, 0x0

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEU:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v6, v4, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move v4, v3

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzir;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzhl;->zzgi()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/webkit/WebView;->clearCache(Z)V

    :cond_28
    invoke-interface {v0, v7}, Lcom/google/android/gms/internal/zzip;->setWillNotDraw(Z)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEP:Lcom/google/android/gms/internal/zzgo;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzgo;->zze(Lcom/google/android/gms/internal/zzip;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm$2;->zzoC:Lcom/google/android/gms/internal/zzcd;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEQ:Lcom/google/android/gms/internal/zzcc;

    new-array v4, v7, [Ljava/lang/String;

    const-string v5, "rwc"

    aput-object v5, v4, v3

    invoke-virtual {v1, v2, v4}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm$2;->zzoC:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgm$2;->zzER:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgm$2;->zzoC:Lcom/google/android/gms/internal/zzcd;

    invoke-static {v2, v3, v1}, Lcom/google/android/gms/internal/zzgm;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;)Lcom/google/android/gms/internal/zziq$zza;

    move-result-object v1

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v2

    const-string v3, "/invalidRequest"

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEP:Lcom/google/android/gms/internal/zzgo;

    iget-object v4, v4, Lcom/google/android/gms/internal/zzgo;->zzFc:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v3, "/loadAdURL"

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEP:Lcom/google/android/gms/internal/zzgo;

    iget-object v4, v4, Lcom/google/android/gms/internal/zzgo;->zzFd:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v3, "/log"

    sget-object v4, Lcom/google/android/gms/internal/zzdf;->zzwP:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    invoke-virtual {v2, v1}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/internal/zziq$zza;)V

    const-string v1, "Loading the JS library."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm$2;->zzEV:Lcom/google/android/gms/internal/zzbr;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbr;->zzdb()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzip;->loadUrl(Ljava/lang/String;)V

    return-void
.end method
