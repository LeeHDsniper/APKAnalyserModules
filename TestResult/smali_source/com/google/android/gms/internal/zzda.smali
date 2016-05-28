.class public Lcom/google/android/gms/internal/zzda;
.super Lcom/google/android/gms/internal/zzcv$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzwF:Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomClickListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomClickListener;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcv$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzda;->zzwF:Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomClickListener;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzcr;Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzda;->zzwF:Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomClickListener;

    new-instance v1, Lcom/google/android/gms/internal/zzcs;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzcs;-><init>(Lcom/google/android/gms/internal/zzcr;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomClickListener;->onCustomClick(Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd;Ljava/lang/String;)V

    return-void
.end method
