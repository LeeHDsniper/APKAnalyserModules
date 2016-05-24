.class public Lcom/google/android/gms/analytics/internal/zze;
.super Ljava/lang/Object;


# static fields
.field public static final VERSION:Ljava/lang/String;

.field public static final zzLB:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget v0, Lcom/google/android/gms/common/GoogleApiAvailability;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    div-int/lit16 v0, v0, 0x3e8

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "(\\d+)(\\d)(\\d\\d)"

    const-string v2, "$1.$2.$3"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/analytics/internal/zze;->VERSION:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ma"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/analytics/internal/zze;->VERSION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/analytics/internal/zze;->zzLB:Ljava/lang/String;

    return-void
.end method
