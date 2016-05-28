.class Lcom/google/android/gms/internal/zziq$zzc;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/internal/overlay/zzg;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zziq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzc"
.end annotation


# instance fields
.field private zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

.field private zzJj:Lcom/google/android/gms/internal/zzip;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/ads/internal/overlay/zzg;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zziq$zzc;->zzJj:Lcom/google/android/gms/internal/zzip;

    iput-object p2, p0, Lcom/google/android/gms/internal/zziq$zzc;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    return-void
.end method


# virtual methods
.method public zzaV()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$zzc;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;->zzaV()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$zzc;->zzJj:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgM()V

    return-void
.end method

.method public zzaW()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$zzc;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;->zzaW()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$zzc;->zzJj:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzeD()V

    return-void
.end method
