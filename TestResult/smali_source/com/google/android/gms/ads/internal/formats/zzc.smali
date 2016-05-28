.class public Lcom/google/android/gms/ads/internal/formats/zzc;
.super Lcom/google/android/gms/internal/zzcj$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final mUri:Landroid/net/Uri;

.field private final zzvJ:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/net/Uri;)V
    .registers 3

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcj$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzc;->zzvJ:Landroid/graphics/drawable/Drawable;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzc;->mUri:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public getUri()Landroid/net/Uri;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzc;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public zzdr()Lcom/google/android/gms/dynamic/zzd;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzc;->zzvJ:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    return-object v0
.end method
