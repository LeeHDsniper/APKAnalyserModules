.class Lcom/google/android/gms/internal/zzqe$zza;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzoj$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzqe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zza"
.end annotation


# instance fields
.field private final zzKq:Lcom/google/android/gms/analytics/Tracker;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/Tracker;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqe$zza;->zzKq:Lcom/google/android/gms/analytics/Tracker;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzoq;)V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqe$zza;->zzKq:Lcom/google/android/gms/analytics/Tracker;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzoq;->zzxT()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/Tracker;->setScreenName(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;

    invoke-direct {v0}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;-><init>()V

    const-string v1, "&a"

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzoq;->zzbp()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqe$zza;->zzKq:Lcom/google/android/gms/analytics/Tracker;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->build()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/Tracker;->send(Ljava/util/Map;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzoq;Landroid/app/Activity;)V
    .registers 3

    return-void
.end method
