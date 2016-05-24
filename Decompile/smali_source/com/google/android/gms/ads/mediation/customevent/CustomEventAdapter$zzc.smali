.class Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/mediation/customevent/CustomEventNativeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zzc"
.end annotation


# instance fields
.field private final zzJJ:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

.field private final zzaS:Lcom/google/android/gms/ads/mediation/zzb;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;Lcom/google/android/gms/ads/mediation/zzb;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzJJ:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    iput-object p2, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzaS:Lcom/google/android/gms/ads/mediation/zzb;

    return-void
.end method


# virtual methods
.method public onAdClicked()V
    .registers 3

    const-string v0, "Custom event adapter called onAdClicked."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzaS:Lcom/google/android/gms/ads/mediation/zzb;

    iget-object v1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzJJ:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/mediation/zzb;->zzd(Lcom/google/android/gms/ads/mediation/zza;)V

    return-void
.end method

.method public onAdClosed()V
    .registers 3

    const-string v0, "Custom event adapter called onAdClosed."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzaS:Lcom/google/android/gms/ads/mediation/zzb;

    iget-object v1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzJJ:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/mediation/zzb;->zzb(Lcom/google/android/gms/ads/mediation/zza;)V

    return-void
.end method

.method public onAdFailedToLoad(I)V
    .registers 4
    .param p1, "errorCode"    # I

    .prologue
    const-string v0, "Custom event adapter called onAdFailedToLoad."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzaS:Lcom/google/android/gms/ads/mediation/zzb;

    iget-object v1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzJJ:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    invoke-interface {v0, v1, p1}, Lcom/google/android/gms/ads/mediation/zzb;->zza(Lcom/google/android/gms/ads/mediation/zza;I)V

    return-void
.end method

.method public onAdLeftApplication()V
    .registers 3

    const-string v0, "Custom event adapter called onAdLeftApplication."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzaS:Lcom/google/android/gms/ads/mediation/zzb;

    iget-object v1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzJJ:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/mediation/zzb;->zzc(Lcom/google/android/gms/ads/mediation/zza;)V

    return-void
.end method

.method public onAdLoaded(Lcom/google/android/gms/ads/mediation/NativeAdMapper;)V
    .registers 4
    .param p1, "ad"    # Lcom/google/android/gms/ads/mediation/NativeAdMapper;

    .prologue
    const-string v0, "Custom event adapter called onAdLoaded."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzaS:Lcom/google/android/gms/ads/mediation/zzb;

    iget-object v1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzJJ:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    invoke-interface {v0, v1, p1}, Lcom/google/android/gms/ads/mediation/zzb;->zza(Lcom/google/android/gms/ads/mediation/zza;Lcom/google/android/gms/ads/mediation/NativeAdMapper;)V

    return-void
.end method

.method public onAdOpened()V
    .registers 3

    const-string v0, "Custom event adapter called onAdOpened."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzaS:Lcom/google/android/gms/ads/mediation/zzb;

    iget-object v1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzJJ:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/mediation/zzb;->zza(Lcom/google/android/gms/ads/mediation/zza;)V

    return-void
.end method
