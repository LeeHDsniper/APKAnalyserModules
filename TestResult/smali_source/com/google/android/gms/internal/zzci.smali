.class public final Lcom/google/android/gms/internal/zzci;
.super Lcom/google/android/gms/internal/zzch$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zztr:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzch$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzci;->zztr:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzcg;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzci;->zztr:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    new-instance v1, Lcom/google/android/gms/internal/zzcf;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzcf;-><init>(Lcom/google/android/gms/internal/zzcg;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;->onCustomRenderedAdLoaded(Lcom/google/android/gms/ads/doubleclick/CustomRenderedAd;)V

    return-void
.end method
