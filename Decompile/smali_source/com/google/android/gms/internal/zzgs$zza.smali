.class Lcom/google/android/gms/internal/zzgs$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zza"
.end annotation


# instance fields
.field public final zzFY:J

.field public final zzFZ:Lcom/google/android/gms/internal/zzgr;

.field final synthetic zzGa:Lcom/google/android/gms/internal/zzgs;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzgs;Lcom/google/android/gms/internal/zzgr;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgs$zza;->zzGa:Lcom/google/android/gms/internal/zzgs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbB()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzgs$zza;->zzFY:J

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgs$zza;->zzFZ:Lcom/google/android/gms/internal/zzgr;

    return-void
.end method


# virtual methods
.method public hasExpired()Z
    .registers 5

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzgs$zza;->zzFY:J

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuY:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    add-long/2addr v0, v2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbB()Lcom/google/android/gms/internal/zzlm;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_1d

    const/4 v0, 0x1

    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method
