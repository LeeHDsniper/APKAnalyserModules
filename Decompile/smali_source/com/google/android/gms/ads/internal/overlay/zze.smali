.class public Lcom/google/android/gms/ads/internal/overlay/zze;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V
    .registers 4

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gms/ads/internal/overlay/zze;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V

    return-void
.end method

.method public zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V
    .registers 7

    iget v0, p2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAX:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1e

    iget-object v0, p2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAQ:Lcom/google/android/gms/ads/internal/overlay/zzg;

    if-nez v0, :cond_1e

    iget-object v0, p2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAP:Lcom/google/android/gms/ads/internal/client/zza;

    if-eqz v0, :cond_12

    iget-object v0, p2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAP:Lcom/google/android/gms/ads/internal/client/zza;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/client/zza;->onAdClicked()V

    :cond_12
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbu()Lcom/google/android/gms/ads/internal/overlay/zza;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAO:Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;

    iget-object v2, p2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAW:Lcom/google/android/gms/ads/internal/overlay/zzn;

    invoke-virtual {v0, p1, v1, v2}, Lcom/google/android/gms/ads/internal/overlay/zza;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;Lcom/google/android/gms/ads/internal/overlay/zzn;)Z

    :goto_1d
    return-void

    :cond_1e
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.google.android.gms.ads.AdActivity"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.google.android.gms.ads.internal.overlay.useClientJar"

    iget-object v2, p2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-boolean v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIC:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "shouldCallOnOverlayOpened"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {v0, p2}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zza(Landroid/content/Intent;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    invoke-static {}, Lcom/google/android/gms/internal/zzlv;->isAtLeastL()Z

    move-result v1

    if-nez v1, :cond_44

    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_44
    instance-of v1, p1, Landroid/app/Activity;

    if-nez v1, :cond_4d

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_4d
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_1d
.end method
