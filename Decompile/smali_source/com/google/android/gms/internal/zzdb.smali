.class public Lcom/google/android/gms/internal/zzdb;
.super Lcom/google/android/gms/internal/zzcw$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzwG:Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcw$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdb;->zzwG:Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzcr;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdb;->zzwG:Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener;

    new-instance v1, Lcom/google/android/gms/internal/zzcs;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzcs;-><init>(Lcom/google/android/gms/internal/zzcr;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener;->onCustomTemplateAdLoaded(Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd;)V

    return-void
.end method
