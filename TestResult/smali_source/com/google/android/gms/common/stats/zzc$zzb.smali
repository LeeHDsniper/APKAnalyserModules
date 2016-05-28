.class public final Lcom/google/android/gms/common/stats/zzc$zzb;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/stats/zzc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzb"
.end annotation


# static fields
.field public static zzafD:Lcom/google/android/gms/internal/zzkq;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzkq",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static zzafI:Lcom/google/android/gms/internal/zzkq;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzkq",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const-string v0, "gms:common:stats:wakeLocks:level"

    sget v1, Lcom/google/android/gms/common/stats/zzd;->LOG_LEVEL_OFF:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzkq;->zza(Ljava/lang/String;Ljava/lang/Integer;)Lcom/google/android/gms/internal/zzkq;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/stats/zzc$zzb;->zzafD:Lcom/google/android/gms/internal/zzkq;

    const-string v0, "gms:common:stats:wakelocks:time_out_duration"

    const-wide/32 v2, 0x927c0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzkq;->zza(Ljava/lang/String;Ljava/lang/Long;)Lcom/google/android/gms/internal/zzkq;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/stats/zzc$zzb;->zzafI:Lcom/google/android/gms/internal/zzkq;

    return-void
.end method
